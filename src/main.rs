extern crate byteorder;
extern crate nom;
extern crate num;

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

    let mut cpu = cpu::CPU::new(memory);

    cpu.set_pc(elf.header.entry_addr);

    loop {
        cpu.execute_instruction();
    }
}
