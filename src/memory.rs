use crate::elf;

use std::str::FromStr;

// Stack size is 2MB by default
const STACK_SIZE: u64 = 2 * 1000 * 1000;

enum Flags {
    Writeable = 0x01,
    Executable = 0x04,
}

struct Range {
    from: u64,
    to: u64,
    flags: u32,
    data: Vec<u8>,
    name: String,
}

impl Range {
    pub fn contains(&self, address: u64) -> bool {
        self.from <= address && address <= self.to
    }

    pub fn read(&self, address: u64) -> &u8 {
        let offset = address - self.from;

        let name = &self.name;

        self.data.get(offset as usize).unwrap_or_else(|| {
            panic!("{}: Read failed", name);
        })
    }

    pub fn write(&mut self, address: u64, value: u8) {
        let name = &self.name;

        if !self.can_write() {
            panic!("{}: Trying to write to a non-writeable memory range!", name);
        }
        
        let offset = address - self.from;

        *self.data.get_mut(offset as usize).unwrap_or_else(|| {
            panic!("{}: Write out of bounds", name);
        }) = value;
    }

    pub fn can_exec(&self) -> bool {
        self.flags & Flags::Executable as u32 != 0
    }

    pub fn can_write(&self) -> bool {
        self.flags & Flags::Writeable as u32 != 0
    }

    pub fn name(&self) -> &str {
        self.name.as_str()
    }
}

pub struct Memory {
    ranges: Vec<Range>,
    pub stack_offset: Option<u64>,
}

impl Memory {
    pub fn new() -> Memory {
        Memory {
            ranges: vec![],
            stack_offset: None,
        }
    }

    pub fn read_range(&self, address: u64, length: u64) -> Vec<u8> {
        let mut data = vec![];

        for i in 0..length {
            data.push(self.read(address + i));
        }

        data
    }

    pub fn write_range(&mut self, address: u64, data: &[u8]) {
        for i in 0..data.len() {
            self.write(address + i as u64, data.get(i).unwrap().clone());
        }
    }

    fn get_range(&self, address: u64) -> Option<&Range> {
        self.ranges.iter().find(|range| range.contains(address))
    }

    fn get_range_mut(&mut self, address: u64) -> Option<&mut Range> {
        self.ranges.iter_mut().find(|range| range.contains(address))
    }

    pub fn read(&self, address: u64) -> u8 {
        let range = self
            .get_range(address)
            .unwrap_or_else(|| panic!("Bad read attempt: {:x}", address));

        *range.read(address)
    }

    pub fn write(&mut self, address: u64, value: u8) {
        let range = self
            .get_range_mut(address)
            .unwrap_or_else(|| panic!("Bad write attempt: {:x}", address));

        range.write(address, value);
    }

    pub fn exec_at(&self, address: u64) -> bool {
        let range = self
            .get_range(address)
            .unwrap_or_else(|| panic!("Bad executable check: {:x}", address));

        range.can_exec()
    }

    pub fn name_at(&self, address: u64) -> &str {
        let range = self
            .get_range(address)
            .unwrap_or_else(|| panic!("Bad executable check: {:x}", address));

        range.name()
    }

    pub fn reset(&mut self) {
        self.ranges.clear();
    }

    pub fn load_elf(&mut self, elf: &mut elf::ELF) {
        println!("Loading ELF...");
        let sections = elf.sections.clone();

        for section in &sections {
            // Skip non SHF_ALLOC sections
            if section.flags & 0x02 == 0 {
                continue;
            }

            let index = elf.sections.iter().position(|s| s == section).unwrap();
            let range = Range {
                from: section.virt_addr.into(),
                to: (section.virt_addr + section.size).into(),
                flags: (section.flags & 0x01) | (section.flags & 0x04),
                data: elf.extract_section(&section).unwrap(),
                name: elf.section_name(index).unwrap(),
            };

            self.stack_offset = Some(range.to);

            println!("{}:   \t{:08x} - {:08x}", range.name, range.from, range.to);

            self.ranges.push(range);
        }

        // Create a stack section
        let stack = Range {
            // TODO: This whole thing is a bad idea for placing the stack
            from: self.stack_offset.unwrap(),
            to: self.stack_offset.unwrap() + STACK_SIZE,
            flags: Flags::Writeable as u32,
            data: vec![0; STACK_SIZE as usize],
            name: String::from_str("Stack").unwrap(),
        };

        println!("Created stack at {:x}", stack.from);

        self.stack_offset = Some(self.stack_offset.unwrap() + 32);

        self.ranges.push(stack);

        // Load all programs
        let programs = elf.programs.clone();

        for program in &programs {
            let mut data = elf.extract_program(&program).unwrap();
            data.resize(program.mem_size as usize, 0);

            let range = Range {
                from: program.virt_addr.into(),
                to: (program.virt_addr + program.mem_size).into(),
                flags: Flags::Executable as u32,
                name: "unnamed".to_string(),
                data,
            };

            println!(
                "p-{}:   \t{:08x} - {:08x}",
                range.name, range.from, range.to
            );

            self.ranges.push(range);
        }
    }
}
