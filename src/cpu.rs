use crate::memory::Memory;

use std::num::Wrapping;

use byteorder::{LittleEndian, ReadBytesExt};
use num::{FromPrimitive, Num};

#[derive(Debug, Clone)]
enum Opcode {
    AUIPC = 0b0010111,
    ADDI = 0b0010011,
    ADD = 0b0110011,
}

fn get_bits<T: Num + FromPrimitive>(input: u64, from: usize, to: usize) -> T {
    if from > to || from == to || to > std::mem::size_of::<T>() * 8 {
        panic!("get_bits: Invalid parameters!");
    }

    let mut value: u64 = 0;

    for i in from..=to {
        value |= input & (1 << i);
    }

    value >>= from;

    return T::from_u64(value).expect("get_bits: Cast to T failed!");
}

fn sign_extend<T: Num + FromPrimitive>(input: usize, length: usize) -> T {
    if length > std::mem::size_of::<T>() * 8 {
        panic!("sign_extend: Invalid parameters!");
    }

    let mut value = input;
    let sign = (value & (1 << length)) >> length;

    value ^= value & (1 << length);
    value |= sign << (std::mem::size_of::<T>() * 8 - 1);

    return T::from_usize(value).expect("sign_extend: Cast to T failed!");
}

fn to_opcode(value: u64) -> Option<Opcode> {
    let opcodes = [Opcode::ADD, Opcode::ADDI, Opcode::AUIPC];

    let opcode = opcodes
        .iter()
        .filter(|&opcode| value == opcode.clone() as u64)
        .next();

    return Some(opcode?.clone());
}

pub struct CPU {
    x: [u32; 32],
    pc: u32,
    memory: Memory,
}

impl CPU {
    pub fn new(memory: Memory) -> CPU {
        return CPU {
            x: [0; 32],
            pc: 0,
            memory: memory,
        };
    }

    fn register_read(&self, index: u64) -> u32 {
        if index == 0 {
            return 0;
        }

        if index > 32 {
            panic!("Index out of range!");
        }

        return self.x[index as usize];
    }

    fn register_write(&mut self, index: u32, value: u32) {
        if index == 0 {
            return;
        }

        if index > 32 {
            panic!("Index out of range!");
        }

        self.x[index as usize] = value;
    }

    pub fn set_pc(&mut self, pc: u32) {
        self.pc = pc;
    }

    pub fn execute_instruction(&mut self) -> bool {
        let mut ins_u8: &[u8] = &[
            self.memory.read(self.pc.into()),
            self.memory.read((self.pc + 1).into()),
            self.memory.read((self.pc + 2).into()),
            self.memory.read((self.pc + 3).into()),
        ];

        let instruction: u32 = ins_u8.read_u32::<LittleEndian>().unwrap();

        let opcode_value = get_bits(instruction.into(), 0, 6);
        let opcode = to_opcode(opcode_value)
            .expect(format!("Unknown opcode {:07b}", opcode_value as u64).as_str());
        let src1 = get_bits(instruction.into(), 15, 19);
        let src2 = get_bits(instruction.into(), 20, 24);
        let dst = get_bits(instruction.into(), 7, 11);

        println!("{:?}", opcode);

        match opcode {
            Opcode::AUIPC => {
                self.register_write(
                    dst,
                    (Wrapping(self.pc)
                        + Wrapping(get_bits::<u32>(instruction.into(), 12, 31) << 11))
                    .0,
                );
            }
            Opcode::ADDI => {
                self.register_write(
                    dst,
                    (Wrapping(self.register_read(src1))
                        + Wrapping(sign_extend::<u32>(
                            get_bits::<u32>(instruction.into(), 12, 31) as usize,
                            12,
                        )))
                    .0,
                );
            }
            Opcode::ADD => {
                self.register_write(
                    dst,
                    (Wrapping(self.register_read(src1)) + Wrapping(self.register_read(src2))).0,
                );
            }
        }

        self.pc += 4;

        return true;
    }
}
