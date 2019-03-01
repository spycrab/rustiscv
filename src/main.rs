// extern crate byteorder;
extern crate nom;

mod elf;

fn get_bits(input: u64, from: u8, to: u8) -> Option<u64> {
    if from > to || from == to || to > 63 {
        return Option::None;
    }

    let mut value: u64 = 0;

    for i in from..to {
        value |= input & (1 << i);
    }

    value >>= from;

    return Option::Some(value);
}

fn execute_instruction(instruction: u32) -> bool {
    let opcode = get_bits(instruction.into(), 0, 6).unwrap();
    let _src1 = get_bits(instruction.into(), 1, 3).unwrap();

    match opcode {
        0x00 => {}
        _ => {
            println!("Unknown opcode 0x{:02x}", opcode);
            return false;
        }
    }

    return true;
}

fn main() {
    println!("Rustisc V");

    let elf_path = std::env::args().nth(1).expect("Too few arguments");

    let _elf = elf::ELF::parse(&elf_path).expect("Failed to parse ELF!");

    execute_instruction(0);
}
