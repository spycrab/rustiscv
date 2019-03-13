use nom::*;
use std::fs::File;
use std::io::SeekFrom;
use std::io::*;

const LIST_PROGRAMS: bool = false;
const LIST_SECTIONS: bool = false;

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Header {
    is_32bit: bool,
    is_le: bool,
    version: u8,
    obj_type: u16,
    arch: u16,
    pub entry_addr: u32,
    sh_offset: u32,
    sh_entry_size: u16,
    sh_entry_count: u16,
    sh_str_index: u16,
    ph_offset: u32,
    ph_entry_size: u16,
    ph_entry_count: u16,
}

named!(
    header<Header>,
    do_parse!(
        // Magic
        tag!("\x7f") >> tag!("ELF") >>
            bits: le_u8 >>
            endianness: le_u8 >>
            version: le_u8 >>
            _abi: le_u8 >>
	    _abi_version: le_u8 >>
	    _pad: take!(7) >>
	    obj_type: le_u16 >>
	    arch: le_u16 >>
	    _version_2: le_u32 >>

	// Offsets
	    entry_addr : le_u32 >>
	    ph_offset : le_u32 >>
	    sh_offset : le_u32 >>

	    _flags : le_u32 >>

	// Sizes
	    _size : le_u16 >>
	    ph_ent_size : le_u16 >>
	    ph_count : le_u16 >>
	    sh_ent_size : le_u16 >>
	    sh_count : le_u16 >>

	    sh_str_index : le_u16 >>
            (Header {
                is_32bit: bits == 1,
                is_le: endianness == 1,
	        version: version,
	        obj_type: obj_type,
	        arch: arch,
	        entry_addr: entry_addr,
	        sh_offset: sh_offset,
	        sh_entry_size: sh_ent_size,
	        sh_entry_count: sh_count,
	        ph_offset: ph_offset,
	        ph_entry_size: ph_ent_size,
	        ph_entry_count: ph_count,
			sh_str_index: sh_str_index
	    })
    )
);

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Program {
    pub virt_addr: u32,
    pub file_size: u32,
    pub mem_size: u32,

    prog_type: u32,
    flags: u32,
    offset: u32,
    phys_addr: u32,
    align: u32,
}

named!(
    program<Program>,
    do_parse!(
        prog_type: le_u32
            >> offset: le_u32
            >> virt_addr: le_u32
            >> phys_addr: le_u32
            >> file_size: le_u32
            >> mem_size: le_u32
            >> flags: le_u32
            >> align: le_u32
            >> (Program {
                prog_type: prog_type,
                flags: flags,
                offset: offset,
                virt_addr: virt_addr,
                phys_addr: phys_addr,
                file_size: file_size,
                mem_size: mem_size,
                align: align
            })
    )
);

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Section {
    pub section_type: u32,
    pub flags: u32,
    pub virt_addr: u32,
    pub offset: u32,
    pub size: u32,
    pub align: u32,

    name_offset: u32,
}

named!(
    section<Section>,
    do_parse!(
        name_offset: le_u32
            >> section_type: le_u32
            >> flags: le_u32
            >> virt_addr: le_u32
            >> offset: le_u32
            >> size: le_u32
            >> _link: le_u32
            >> _info: le_u32
            >> align: le_u32
            >> _size: le_u32
            >> (Section {
                name_offset: name_offset,
                section_type: section_type,
                flags: flags,
                virt_addr: virt_addr,
                offset: offset,
                size: size,
                align: align
            })
    )
);

pub struct ELF {
    file: File,
    pub header: Header,
    pub programs: Vec<Program>,
    pub sections: Vec<Section>,
}

impl ELF {
    pub fn parse(path: &str) -> Option<ELF> {
        let mut file = File::open(path).expect("Failed to open file");

        let mut header_data = [0; 52];
        file.read_exact(&mut header_data).expect("Error!");

        let header = header(&header_data).expect("Failed to parse ELF header!").1;

        // Do some sanity checks

        if !header.is_le {
            println!("ELF must be little endian!");
            return None;
        }

        if !header.is_32bit {
            println!("ELF must be 32-bit!");
            return None;
        }

        if header.version != 1 {
            println!("ELF must be version 1!");
            return None;
        }

        let mut elf: ELF = ELF {
            file,
            header,
            programs: vec![],
            sections: vec![],
        };

        // Parse program header
        elf.file
            .seek(SeekFrom::Start(elf.header.ph_offset.into()))
            .expect("Failed to seek program entries");

        for i in 0..elf.header.ph_entry_count {
            let mut program_data = [0; 32];
            elf.file.read_exact(&mut program_data).expect("Error!");

            let program = program(&program_data)
                .expect("Failed to parse program header!")
                .1;

            if LIST_PROGRAMS {
                println!();
                println!("Program {}:", i);
                println!("Type: {:x}", program.prog_type);
                println!("VirtAddr: {:x}", program.virt_addr);
                println!("File Size: {:x}", program.file_size);
                println!("Memory Size: {:x}", program.mem_size);
                println!("Alignment: {:x}", program.align);
                println!("Calc addr.: {:x}", program.offset % program.align);
                println!("=============\n");
            }

            elf.programs.push(program);
        }

        // Parse sections
        elf.file
            .seek(SeekFrom::Start(elf.header.sh_offset.into()))
            .expect("Failed to seek sector entries");

        for i in 0..elf.header.sh_entry_count {
            let mut section_data = [0; 40];
            elf.file.read_exact(&mut section_data).expect("Error!");

            let section = section(&section_data)
                .expect("Failed to parse section header!")
                .1;

            if LIST_SECTIONS {
                println!();
                println!("Section {}:", i);
                println!("Name Offset: {:x}", section.name_offset);
                println!("Type: {:x}", section.section_type);
                println!("Flags: {:x}", section.flags);
                println!("Size: {:x}", section.size);
                println!("VirtAddr: {:x}", section.virt_addr);
                println!("============\n");
            }

            elf.sections.push(section);
        }

        println!("ELF parsed successfully.");

        Some(elf)
    }

    pub fn section_name(&mut self, index: usize) -> Option<String> {
        let string_section = self
            .sections
            .get(self.header.sh_str_index as usize)?
            .clone();

        let data = self.extract_section(string_section)?;

        let name = &data[self.sections.get(index)?.name_offset as usize..];

        let null_offset = name.iter().position(|&x| x == 0).unwrap();

        String::from_utf8(name[0..null_offset].to_vec()).ok()
    }

    pub fn extract_program(&mut self, program: Program) -> Option<Vec<u8>> {
        let mut data: Vec<u8> = vec![];

        self.file
            .seek(SeekFrom::Start(program.offset.into()))
            .ok()?;

        data.resize(program.file_size as usize, 0);

        self.file.read(&mut data).ok()?;

        Some(data)
    }

    pub fn extract_section(&mut self, section: Section) -> Option<Vec<u8>> {
        let mut data: Vec<u8> = vec![];

        self.file
            .seek(SeekFrom::Start(section.offset.into()))
            .ok()?;

        data.resize(section.size as usize, 0);

        self.file.read(&mut data).ok()?;

        Some(data)
    }
}
