// extern crate byteorder;
extern crate nom;

mod cpu;
mod elf;
mod memory;

fn main() {
    println!("Rustisc V");

    let elf_path = std::env::args().nth(1).expect("Too few arguments");

    let mut elf = elf::ELF::parse(&elf_path).expect("Failed to parse ELF!");

    let mut memory = memory::Memory::new();

    memory.reset();
    memory.load_elf(&mut elf);
    memory.read(0x10000);

    cpu::execute_instruction(0);
}
