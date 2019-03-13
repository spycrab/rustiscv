use crate::elf;

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
        self.data.get(offset as usize).expect("Read failed")
    }

    pub fn write(&mut self, address: u64, value: u8) {
        if !self.can_write() {
            panic!("Trying to write to a non-writeable memory range!");
        }
        let offset = address - self.from;
        *self.data.get_mut(offset as usize).expect("Write failed") = value;
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
}

impl Memory {
    pub fn new() -> Memory {
        Memory { ranges: Vec::new() }
    }

    pub fn read_range(&self, address: u64, length: u64) -> Vec<u8> {
        let mut data = Vec::new();

        for i in 0..length {
            data.push(self.read(address + i));
        }

        data
    }

    pub fn write_range(&mut self, address: u64, data: Vec<u8>) {
        for i in 0..data.len() {
            self.write(
                address + i as u64,
                data.get(i).expect("Write failed").clone(),
            );
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
        // Load all sections
        let sections = elf.sections.clone();
        for section in sections.iter() {
            // Skip non SHF_ALLOC sections
            if section.flags & 0x02 == 0 {
                continue;
            }

            let index = elf.sections.iter().position(|s| s == section).unwrap();
            let range = Range {
                from: section.virt_addr.into(),
                to: (section.virt_addr + section.size).into(),
                flags: (section.flags & 0x01) | (section.flags & 0x04),
                data: elf.extract_section(section.clone()).unwrap(),
                name: elf.section_name(index).unwrap(),
            };

            println!("{}:   \t{:08x} - {:08x}", range.name, range.from, range.to);

            self.ranges.push(range);
        }

        // Load all programs
        let programs = elf.programs.clone();

        for program in programs.iter() {
            let mut data = elf.extract_program(program.clone()).unwrap();
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
