use crate::bin::*;

use std::fmt;

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum Opcode {
    // Real opcodes
    LUI = 0b0110111,
    AUIPC = 0b0010111,
    JAL = 0b1101111,
    JALR = 0b1100111,

    ImmOps = 0b0010011,
    RegOps = 0b0110011,
    StoreOps = 0b0100011,
    CondJumps = 0b1100011,
    LoadOps = 0b0000011,

    // Logical opcodes
    ADDI,
    SLLI,
    ANDI,

    ADD,
    SUB,

    BNE,
    BGEU,
    BLTU,
    BLT,

    SB,
    SH,
    SW,

    LB,
    LH,
    LW,
}

impl Opcode {
    fn to(instruction: u32) -> Opcode {
        let value: u32 = get_bits(instruction.into(), 0, 6);

        use Opcode::*;
        let opcodes = [
            ImmOps, LUI, AUIPC, RegOps, JAL, JALR, CondJumps, LoadOps, StoreOps,
        ];

        let opcode = opcodes
            .iter()
            .filter(|&opcode| value == opcode.clone() as u32)
            .next()
            .expect(&format!("Unknown opcode {:07b}", value as u32))
            .clone();

        if opcode == ImmOps {
            let op = get_bits(instruction.into(), 12, 14);

            return match op {
                0b000 => ADDI,
                0b001 => SLLI,
                0b111 => ANDI,
                _ => {
                    panic!("Unknown subtype of immediate operation: {:03b}", op);
                }
            };
        }

        if opcode == RegOps {
            let op = get_bits(instruction.into(), 25, 31);

            return match op {
                0b0000000 => ADD,
                0b0100000 => SUB,
                _ => {
                    panic!("Unknown subtype of register operation: {:06b}", op);
                }
            };
        }

        if opcode == CondJumps {
            let op = get_bits(instruction.into(), 12, 14);
            return match op {
                0b001 => BNE,
                0b110 => BLTU,
                0b100 => BLT,
                0b111 => BGEU,
                _ => {
                    panic!("Unknown subtype of conditional jump: {:03b}", op);
                }
            };
        }

        if opcode == StoreOps {
            let op = get_bits(instruction.into(), 12, 14);

            return match op {
                0b000 => SB,
                0b001 => SH,
                0b010 => SW,

                _ => {
                    panic!("Unknown subtype of store operation: {:03b}", op);
                }
            };
        }

        if opcode == LoadOps {
            let op = get_bits(instruction.into(), 12, 14);

            return match op {
                0b000 => LB,
                0b001 => LH,
                0b010 => LW,
                _ => {
                    panic!("Unknown subtype of store operation: {:03b}", op);
                }
            };
        }

        opcode
    }
}

pub struct Instruction {
    opcode: Opcode,
    src1: Option<u32>,
    src2: Option<u32>,
    dst: Option<u32>,
    imm: Option<u32>,
}

impl Instruction {
    fn immediate_range(opcode: Opcode) -> Option<Vec<(usize, usize)>> {
        use Opcode::*;
        return match opcode {
            ADDI | SLLI | ANDI => Some(vec![(20, 31)]),
            JALR => Some(vec![(20, 31)]),
            JAL => Some(vec![(21, 30), (20, 20), (12, 19), (31, 31)]),
            LUI | AUIPC => Some(vec![(12, 31)]),
            BLT | BGEU | BLTU | BNE => Some(vec![(8, 11), (25, 30), (7, 7), (31, 31)]),
            SW | SH | SB | LW | LH | LB => Some(vec![(7, 11), (25, 31)]),
            _ => None,
        };
    }

    fn has_dst(_opcode: Opcode) -> bool {
        true
    }

    fn has_src1(opcode: Opcode) -> bool {
        match opcode {
            Opcode::AUIPC | Opcode::LUI => false,
            _ => true,
        }
    }

    fn has_src2(opcode: Opcode) -> bool {
        match opcode {
            Opcode::ADD | Opcode::SUB => true,
            Opcode::BGEU | Opcode::BLT | Opcode::BLTU | Opcode::BNE => true,
            Opcode::SB | Opcode::SH | Opcode::SW => true,
            _ => false,
        }
    }

    pub fn new(instruction: u32) -> Instruction {
        let opcode = Opcode::to(instruction);

        let src1 = get_bits(instruction.into(), 15, 19);
        let src2 = get_bits(instruction.into(), 20, 24);

        let dst = get_bits(instruction.into(), 7, 11);

        let imm_opts = Instruction::immediate_range(opcode);

        let imm = imm_opts.map(|ranges| {
            let mut imm: u32 = 0;
            let mut shift = 0;

            for range in ranges {
                let value = get_bits::<u32>(instruction.into(), range.0, range.1);

                imm |= value << shift;
                shift += range.1 - range.0 + 1;
            }

            imm
        });

        Instruction {
            opcode: opcode.clone(),
            src1: match Instruction::has_src1(opcode) {
                true => Some(src1),
                false => None,
            },
            src2: match Instruction::has_src2(opcode) {
                true => Some(src2),
                false => None,
            },
            dst: match Instruction::has_dst(opcode) {
                true => Some(dst),
                false => None,
            },
            imm: imm,
        }
    }

    pub fn opcode(&self) -> Opcode {
        self.opcode
    }

    pub fn imm(&self) -> u32 {
        self.imm
            .expect("Requested immediate value where none exists!")
    }

    pub fn dst(&self) -> u32 {
        self.dst
            .expect("Requested destination register where none exists!")
    }

    pub fn src1(&self) -> u32 {
        self.src1
            .expect("Requested source register 1 where none exists!")
    }

    pub fn src2(&self) -> u32 {
        self.src2
            .expect("Requested source register 2 where none exists!")
    }
}

impl fmt::Display for Instruction {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:?} ", self.opcode)?;

        if let Some(dst) = self.dst {
            write!(f, "x{}", dst)?;
        }

        if let Some(src1) = self.src1 {
            write!(f, ", x{}", src1)?;
        }

        if let Some(src2) = self.src2 {
            write!(f, ", x{}", src2)?;
        }

        if let Some(imm) = self.imm {
            write!(f, ", 0x{}", imm)?;
        }

        Ok(())
    }
}
