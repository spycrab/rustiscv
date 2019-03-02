use nom::*;
use std::fs::File;
use std::io::SeekFrom;
use std::io::*;

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Header {
    is_32bit: bool,
    is_le: bool,
    version: u8,
    obj_type: u16,
    arch: u16,
    entry_addr: u32,
    sh_offset: u32,
    sh_entry_size: u16,
    sh_entry_count: u16,
    ph_offset: u32,
    ph_entry_size: u16,
    ph_entry_count: u16,
}

enum SectionType {
    Null = 0x00,
    ProgramBits = 0x01,
    SymbolTable = 0x02,
    StringTable = 0x03,
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

	    _sh_str_index : le_u16 >>
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
	    })
    )
);

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Program {
    prog_type: u32,
    flags: u32,
    offset: u32,
    virt_addr: u32,
    phys_addr: u32,
    file_size: u32,
    mem_size: u32,
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
    name_offset: u32,
    section_type: u32,
    flags: u32,
    virt_addr: u32,
    offset: u32,
    size: u32,
    align: u32,
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

#[derive(Debug)]
pub struct ELF {
    file: File,
    header: Header,
    programs: Vec<Program>,
    pub sections: Vec<Section>,
}

impl ELF {
    pub fn parse(path: &str) -> Option<ELF> {
	let mut file = File::open(path).expect("Failed to open file");

	let mut header_data = [0; 52];
	file.read(&mut header_data).expect("Error!");

	let header = header(&header_data).expect("Failed to parse ELF header!").1;

	// Do some sanity checks

	if !header.is_le {
	    println!("ELF must be little endian!");
	    return Option::None;
	}

	if !header.is_32bit {
	    println!("ELF must be 32-bit!");
	    return Option::None;
	}

	if header.version != 1 {
	    println!("ELF must be version 1!");
	    return Option::None;
	}

	let mut elf: ELF = ELF {
	    file: file,
	    header: header,
	    programs: Vec::new(),
	    sections: std::vec::Vec::new(),
	};

	// Parse program header
	elf
	    .file
	    .seek(SeekFrom::Start(elf.header.ph_offset.into()))
	    .expect("Failed to seek program entries");

	for i in 0..elf.header.ph_entry_count {
	    let mut program_data = [0; 32];
	    elf.file.read(&mut program_data).expect("Error!");

	    let program = program(&program_data)
		.expect("Failed to parse program header!")
		.1;

	    println!("");
	    println!("Program {}:", i);
	    println!("Type: {:x}", program.prog_type);
	    println!("VirtAddr: {:x}", program.virt_addr);
	    println!("File Size: {:x}", program.file_size);
	    println!("Memory Size: {:x}", program.mem_size);
	    println!("Alignment: {:x}", program.align);
	    println!("Calc addr.: {:x}", program.offset % program.align);
	    println!("=============\n");

	    elf.programs.push(program);
	}

	// Parse sectors
	elf
	    .file
	    .seek(SeekFrom::Start(elf.header.sh_offset.into()))
	    .expect("Failed to seek sector entries");

	for i in 0..elf.header.sh_entry_count {
	    let mut section_data = [0; 40];
	    elf.file.read(&mut section_data).expect("Error!");
            
	    let section = section(&section_data)
		.expect("Failed to parse section header!")
		.1;

	    println!("");
	    println!("Section {}:", i);
            println!("Name Offset: {:x}", section.name_offset);
	    println!("Type: {:x}", section.section_type);
	    println!("Size: {:x}", section.size);
	    println!("VirtAddr: {:x}", section.virt_addr);
	    println!("============\n");

	    elf.sections.push(section);
	}

	println!("ELF parsed successfully.");

	return Option::Some(elf);
    }

    #[allow(dead_code)]
    pub fn get_section_name(&mut self, index: usize) -> Option<String> {
	let mut string_section: Option<Section> = Option::None;
	for s in self.sections.iter() {
	    if s.section_type == SectionType::StringTable as u32 {
		string_section = Option::Some(s.clone());
	    }
	}
        
	let data = self.extract_section(string_section.unwrap().clone())?;


        let end = self.sections.get(index+1);

        let mut end_offset : usize = 0;
        
        if end.is_some() {
            end_offset = end.unwrap().name_offset as usize;
        } else {
            end_offset = data.len();
        }
        
        return String::from_utf8(data[self.sections.get(index)?.name_offset as usize..end_offset].to_vec()).ok();
    }

    pub fn extract_section(&mut self, section: Section) -> Option<Vec<u8>> {
	let mut data: Vec<u8> = Vec::new();

	self.file.seek(SeekFrom::Start(section.offset.into())).ok()?;

	data.resize(section.size as usize, 0);

	self.file.read(&mut data).ok()?;

	return Option::Some(data);
    }
}
