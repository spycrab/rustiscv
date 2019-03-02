use crate::elf;

enum MemoryFlags {
    Writeable = 0x01,
    Executable = 0x04,
}

struct MemoryRange {
    from: u64,
    to: u64,
    flags: u32,
    data: Vec<u8>,
    name: String,
}

impl MemoryRange {
    pub fn contains(&self, address: u64) -> bool {
        return address >= self.from && address <= self.to;
    }

    pub fn read(&self, address: u64) -> &u8 {
        let offset = address - self.from;
        return self.data.get(offset as usize).expect("Read failed");
    }

    pub fn write(&mut self, address: u64, value: u8) {
        if !self.can_write() {
            panic!("Trying to write to a non-writeable memory range!");
        }
        let offset = address - self.from;
        *self.data.get_mut(offset as usize).expect("Write failed") = value;
    }

    pub fn can_exec(&self) -> bool {
        return self.flags & MemoryFlags::Executable as u32 != 0;
    }

    pub fn can_write(&self) -> bool {
        return self.flags & MemoryFlags::Writeable as u32 != 0;
    }

    pub fn get_name(&self) -> &str {
        return self.name.as_str();
    }
}

pub struct Memory {
    ranges: Vec<MemoryRange>,
}

impl Memory {
    pub fn new() -> Memory {
        return Memory { ranges: Vec::new() };
    }

    pub fn read(&self, address: u64) -> u8 {
        let range = self
            .ranges
            .iter()
            .filter(|&range| range.contains(address))
            .next()
            .expect("Bad memory access!");
        return range.read(address).clone();
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
            let range = MemoryRange {
                from: section.virt_addr.into(),
                to: (section.virt_addr + section.size).into(),
                flags: section.flags & 0x01 | section.flags & 0x04,
                data: elf.extract_section(section.clone()).unwrap(),
                name: elf.get_section_name(index).unwrap(),
            };

            println!("{}:   \t{:08x} - {:08x}", range.name, range.from, range.to);

            self.ranges.push(range);
        }

        // Load all programs
        for program in elf.programs.iter() {}
    }
}
