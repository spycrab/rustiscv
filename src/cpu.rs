use crate::memory::Memory;
use byteorder::{LittleEndian, ReadBytesExt};

fn get_bits(input: u64, from: u8, to: u8) -> Option<u64> {
    if from > to || from == to || to > 64 {
        return None;
    }

    let mut value: u64 = 0;

    for i in from..to {
        value |= input & (1 << i);
    }

    value >>= from;

    return Some(value);
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

    fn register_write(&mut self, index: u64, value: u32) {
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

        let opcode = get_bits(instruction.into(), 0, 6).unwrap();
        let src1 = get_bits(instruction.into(), 15, 19).unwrap();
        let src2 = get_bits(instruction.into(), 20, 24).unwrap();
        let dst = get_bits(instruction.into(), 7, 11).unwrap();

        match opcode {
            0b0110011 => {
                // ADD
                self.register_write(
                    self.register_read(dst).into(),
                    self.register_read(src1) + self.register_read(src2),
                );
            }
            _ => {
                println!("Unknown opcode 0x{:02x}", opcode);
                return false;
            }
        }

        return true;
    }
}
