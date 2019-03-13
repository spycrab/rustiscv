use crate::bin::*;

#[derive(Debug, Clone, PartialEq)]
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
    ADDI = -1,
    SLLI = -2,
    ANDI = -3,

    ADD = -4,
    SUB = -5,

    BNE = -6,
    BGEU = -7,
    BLTU = -8,
    BLT = -9,

    SB = -10,
    SH = -11,
    SW = -12,

    LB = -13,
    LH = -14,
    LW = -15,
}

impl Opcode {
    fn to(instruction: &u32) -> Opcode {
        let value: u32 = get_bits(instruction.clone().into(), 0, 6);

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
            let op = get_bits::<u32>(instruction.clone().into(), 12, 14);

            return match op {
                0b000 => ADDI,
                0b001 => SLLI,
                0b111 => ANDI,
                _ => {
                    panic!(format!(
                        "Unknown subtype of immediate operation: {:03b}",
                        op
                    ));
                }
            };
        }

        if opcode == RegOps {
            let op = get_bits::<u32>(instruction.clone().into(), 25, 31);

            return match op {
                0b0000000 => ADD,
                0b0100000 => SUB,
                _ => {
                    panic!(format!("Unknown subtype of register operation: {:06b}", op));
                }
            };
        }

        if opcode == CondJumps {
            let op = get_bits::<u32>(instruction.clone().into(), 12, 14);
            return match op {
                0b001 => BNE,
                0b110 => BLTU,
                0b100 => BLT,
                0b111 => BGEU,
                _ => {
                    panic!(format!("Unknown subtype of conditional jump: {:03b}", op));
                }
            };
        }

        if opcode == StoreOps {
            let op = get_bits::<u32>(instruction.clone().into(), 12, 14);

            return match op {
                0b000 => SB,
                0b001 => SH,
                0b010 => SW,

                _ => {
                    panic!(format!("Unknown subtype of store operation: {:03b}", op));
                }
            };
        }

        if opcode == LoadOps {
            let op = get_bits::<u32>(instruction.clone().into(), 12, 14);

            return match op {
                0b000 => LB,
                0b001 => LH,
                0b010 => LW,
                _ => {
                    panic!(format!("Unknown subtype of store operation: {:03b}", op));
                }
            };
        }

        return opcode;
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
    fn immediate_range(opcode: &Opcode) -> Option<Vec<(usize, usize)>> {
        use Opcode::*;
        return match opcode {
            ADDI | Opcode::SLLI | Opcode::ANDI => Some([(20, 31)].to_vec()),
            JALR => Some([(20, 31)].to_vec()),
            JAL => Some([(21, 30), (20, 20), (12, 19), (31, 31)].to_vec()),
            LUI | AUIPC => Some([(12, 31)].to_vec()),
            BLT | BGEU | BLTU | BNE => Some([(8, 11), (25, 30), (7, 7), (31, 31)].to_vec()),
            SW | SH | SB | LW | LH | LB => Some([(7, 11), (25, 31)].to_vec()),
            _ => None,
        };
    }

    fn has_dst(_opcode: &Opcode) -> bool {
        return true;
    }

    fn has_src1(opcode: &Opcode) -> bool {
        return match opcode {
            Opcode::AUIPC | Opcode::LUI => false,
            _ => true,
        };
    }

    fn has_src2(opcode: &Opcode) -> bool {
        return match opcode {
            Opcode::ADD | Opcode::SUB => true,
            Opcode::BGEU | Opcode::BLT | Opcode::BLTU | Opcode::BNE => true,
            Opcode::SB | Opcode::SH | Opcode::SW => true,
            _ => false,
        };
    }

    pub fn new(instruction: u32) -> Instruction {
        let opcode = Opcode::to(&instruction);

        let src1 = get_bits::<u32>(instruction.into(), 15, 19);
        let src2 = get_bits::<u32>(instruction.into(), 20, 24);

        let dst = get_bits::<u32>(instruction.into(), 7, 11);

        let imm_opts = Instruction::immediate_range(&opcode);

        let mut imm_value: Option<u32> = None;

        if imm_opts.is_some() {
            let ranges = imm_opts.unwrap();

            let mut imm: u32 = 0;
            let mut shift = 0;

            for range in ranges {
                let value = get_bits::<u32>(instruction.into(), range.0, range.1);

                imm |= value << shift;
                shift += range.1 - range.0 + 1;
            }

            imm_value = Some(imm);
        }

        return Instruction {
            opcode: opcode.clone(),
            src1: if Instruction::has_src1(&opcode) {
                Some(src1)
            } else {
                None
            },
            src2: if Instruction::has_src2(&opcode) {
                Some(src2)
            } else {
                None
            },
            dst: if Instruction::has_dst(&opcode) {
                Some(dst)
            } else {
                None
            },
            imm: imm_value,
        };
    }

    pub fn to_string(&self) -> String {
        let mut string = format!("{:?} ", self.opcode);

        if self.dst.is_some() {
            string.push_str(format!("x{}", self.dst.unwrap()).as_str());
        }

        if self.src1.is_some() {
            string.push_str(format!(", x{}", self.src1.unwrap()).as_str());
        }

        if self.src2.is_some() {
            string.push_str(format!(", x{}", self.src2.unwrap()).as_str());
        }

        if self.imm.is_some() {
            string.push_str(format!(", 0x{}", self.imm.unwrap()).as_str());
        }

        return string;
    }

    pub fn opcode(&self) -> Opcode {
        return self.opcode.clone();
    }

    pub fn imm(&self) -> u32 {
        return self
            .imm
            .expect("Requested immediate value where none exists!")
            .clone();
    }

    pub fn dst(&self) -> u32 {
        return self
            .dst
            .expect("Requested destination register where none exists!")
            .clone();
    }

    pub fn src1(&self) -> u32 {
        return self
            .src1
            .expect("Requested source register 1 where none exists!")
            .clone();
    }

    pub fn src2(&self) -> u32 {
        return self
            .src2
            .expect("Requested source register 2 where none exists!")
            .clone();
    }
}
