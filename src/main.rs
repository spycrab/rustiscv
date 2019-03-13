extern crate byteorder;
extern crate nom;
extern crate num_traits;

mod bin;
mod cpu;
mod elf;
mod instruction;
mod memory;

use cpu::CPU;
use elf::ELF;
use memory::Memory;

fn main() {
    println!("Rustisc V");

    let elf_path = std::env::args().nth(1).expect("Too few arguments");

    let mut elf = ELF::parse(&elf_path).expect("Failed to parse ELF!");

    let mut memory = Memory::new();

    memory.reset();
    memory.load_elf(&mut elf);

    let mut cpu = CPU::new(memory);

    cpu.set_pc(elf.header.entry_addr);

    loop {
        cpu.execute_instruction();
    }
}
