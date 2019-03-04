use crate::memory::Memory;

use std::num::Wrapping;

use byteorder::{LittleEndian, ReadBytesExt};
use num::{FromPrimitive, Num};

#[derive(Debug, Clone)]
enum Opcode {
    AUIPC = 0b0010111,
    ImmOps = 0b0010011,
    RegOps = 0b0110011,
    JAL = 0b1101111,
    JALR = 0b1100111,
    CondJumps = 0b1100011,
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

    value &= !(1 << length);

    for i in (length + 1)..=((std::mem::size_of::<T>() * 8) - 1) {
        value |= sign << i;
    }

    return T::from_usize(value).expect("sign_extend: Cast to T failed!");
}

fn to_opcode(value: u64) -> Option<Opcode> {
    use Opcode::*;
    let opcodes = [ImmOps, AUIPC, RegOps, JAL, JALR, CondJumps];

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

        if index > 31 {
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
        let opcode = to_opcode(opcode_value).expect(
            format!(
                "Unknown opcode {:07b} @ {:08x}",
                opcode_value as u64, self.pc
            )
            .as_str(),
        );
        let src1 = get_bits(instruction.into(), 15, 19);
        let src2 = get_bits(instruction.into(), 20, 24);
        let dst = get_bits(instruction.into(), 7, 11);

        println!("{:08x} {:?}", self.pc, opcode);

        match opcode {
            Opcode::AUIPC => {
                self.register_write(
                    dst,
                    self.pc
                        .wrapping_add(get_bits::<u32>(instruction.into(), 12, 31) << 11),
                );
            }
            Opcode::ImmOps => {
                let op = get_bits::<u32>(instruction.into(), 12, 14);
                let imm = get_bits::<u32>(instruction.into(), 12, 31);
                match op {
                    0b000 => {
                        println!("ADDI");
                        self.register_write(
                            dst,
                            self.register_read(src1)
                                .wrapping_add(sign_extend::<u32>(imm as usize, 10)),
                        );
                    }
                    0b001 => {
                        println!("SLLI");
                        self.register_write(
                            dst,
                            self.register_read(src1) << get_bits::<u32>(instruction.into(), 20, 24),
                        );
                    }
                    0b111 => {
                        println!("ANDI");
                        self.register_write(dst, self.register_read(src1) & imm);
                    }
                    _ => {
                        panic!(format!(
                            "Unknown subtype of immediate operation: {:03b}",
                            op
                        ));
                    }
                }
            }
            Opcode::RegOps => {
                let op = get_bits::<u32>(instruction.into(), 25, 31);
                match op {
                    0b0000000 => {
                        println!("ADD");
                        self.register_write(
                            dst,
                            self.register_read(src1)
                                .wrapping_add(self.register_read(src2)),
                        );
                    }
                    0b0100000 => {
                        println!("SUB");
                        self.register_write(
                            dst,
                            self.register_read(src1)
                                .wrapping_sub(self.register_read(src2)),
                        );
                    }
                    _ => {
                        panic!(format!("Unknown subtype of register operation: {:06b}", op));
                    }
                }
            }
            Opcode::JALR => {
                let imm =
                    sign_extend::<u32>(get_bits::<u32>(instruction.into(), 21, 31) as usize, 10);

                self.register_write(dst, self.pc + 4);
                self.pc = self.register_read(src1).wrapping_add(imm) & !1;
                return true;
            }
            Opcode::JAL => {
                self.register_write(dst, self.pc + 4);
                self.pc = self.pc.wrapping_add(sign_extend::<u32>(
                    get_bits::<u32>(instruction.into(), 21, 31).wrapping_mul(2) as usize,
                    10,
                ));
                return true;
            }
            Opcode::CondJumps => {
                let op = get_bits::<u32>(instruction.into(), 12, 14);
                let branch;
                match op {
                    0b001 => {
                        println!("BNE");
                        branch = self.register_read(src1) != self.register_read(src2);
                    }
                    0b110 => {
                        println!("BLTU");
                        branch = self.register_read(src1) < self.register_read(src2);
                    }
                    0b111 => {
                        println!("BGEU");
                        branch = self.register_read(src1) >= self.register_read(src2);
                    }
                    _ => {
                        panic!(format!("Unknown subtype of conditional jump: {:03b}", op));
                    }
                }

                if branch {
                    let offset = get_bits::<u32>(instruction.into(), 25, 31) << 5
                        | get_bits::<u32>(instruction.into(), 7, 11);
                    println!("Offset {:x}", offset);
                    println!("Ins: {:032b}", instruction);
                    self.register_write(dst, self.pc + 4);
                    // Something wrong here. Bad bit order?
                    // Ex. 00000010110000110111111001100011
                    // 8-11:  Bits 1-4
                    // 25-30: Bits 5-10
                    // 7:     Bit 11
                    // 31:    Bit 12
                    println!("ABOUT TO TAKE A WRONG TURN");
                    self.pc = self
                        .pc
                        .wrapping_add(sign_extend::<u32>(offset as usize, 11));
                    return true;
                }
            }
        }

        self.pc += 4;

        return true;
    }
}
