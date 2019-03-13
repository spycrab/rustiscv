use crate::bin::*;
use crate::instruction::*;
use crate::memory::Memory;

use byteorder::{LittleEndian, ReadBytesExt, WriteBytesExt};
use std::io::Cursor;

pub struct CPU {
    x: [u32; 32],
    pc: u32,
    memory: Memory,
}

impl CPU {
    pub fn new(memory: Memory) -> CPU {
        CPU {
            x: [0; 32],
            pc: 0,
            memory,
        }
    }

    fn register_read(&self, index: u32) -> u32 {
        if index == 0 {
            return 0;
        }

        if index > 31 {
            panic!("Index out of range!");
        }

        self.x[index as usize]
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
        if !self.memory.exec_at(self.pc.into()) {
            panic!("Program jumped to non-executable memory!");
        }
        let ins_u8 = self.memory.read_range(self.pc.into(), 4);
        let ins_u32 = ins_u8.as_slice().read_u32::<LittleEndian>().unwrap();

        let ins = Instruction::new(ins_u32);

        println!(
            "{} {:08x} {}",
            self.memory.name_at(self.pc.into()),
            self.pc,
            ins.to_string()
        );

        match ins.opcode() {
            Opcode::AUIPC => {
                self.register_write(ins.dst(), self.pc.wrapping_add(ins.imm() << 12));
                println!(
                    "AUIPC: x{} = {:x} + {:x}",
                    ins.dst(),
                    ins.imm() << 12,
                    self.pc
                );
            }
            Opcode::LUI => {
                self.register_write(ins.dst(), ins.imm() << 12);
            }
            Opcode::ADDI => {
                let imm = ins.imm();

                self.register_write(
                    ins.dst(),
                    self.register_read(ins.src1())
                        .wrapping_add(sign_extend::<u32>(imm as usize, 11)),
                );
            }
            Opcode::SLLI => {
                let imm = ins.imm();
                self.register_write(ins.dst(), self.register_read(ins.src1()) << imm);
            }
            Opcode::ANDI => {
                let imm = ins.imm();
                self.register_write(ins.dst(), self.register_read(ins.src1()) & imm);
            }
            Opcode::LW => {
                let offset = sign_extend::<u32>(ins.imm() as usize, 11);
                let range = self.memory.read_range(
                    u64::from(offset).wrapping_add(self.register_read(ins.src1()).into()),
                    4,
                );
                self.register_write(
                    ins.dst(),
                    range.as_slice().read_u32::<LittleEndian>().unwrap(),
                );
            }
            Opcode::SB => {
                let offset = sign_extend(ins.imm() as usize, 11);
                let value = self.register_read(ins.src2()) as u8;

                self.memory.write(
                    self.register_read(ins.src1()).wrapping_add(offset).into(),
                    value,
                );
            }
            Opcode::SW => {
                let offset = sign_extend(ins.imm() as usize, 11);
                let value = self.register_read(ins.src2());
                let mut buf = Cursor::new(vec![]);

                buf.write_u32::<LittleEndian>(value).unwrap();

                self.memory.write_range(
                    self.register_read(ins.src1()).wrapping_add(offset).into(),
                    &buf.get_mut().clone(),
                );
            }
            Opcode::ADD => {
                println!(
                    "x{} = x{} + x{} = {:x} + {:x} = {:x}",
                    ins.dst(),
                    ins.src1(),
                    ins.src2(),
                    self.register_read(ins.src1()),
                    self.register_read(ins.src2()),
                    self.register_read(ins.src1())
                        .wrapping_add(self.register_read(ins.src2()))
                );
                self.register_write(
                    ins.dst(),
                    self.register_read(ins.src1())
                        .wrapping_add(self.register_read(ins.src2())),
                );
            }
            Opcode::SUB => {
                println!(
                    "x{} = x{} - x{} = {:x} - {:x} = {:x}",
                    ins.dst(),
                    ins.src1(),
                    ins.src2(),
                    self.register_read(ins.src1()),
                    self.register_read(ins.src2()),
                    self.register_read(ins.src1())
                        .wrapping_sub(self.register_read(ins.src2()))
                );
                self.register_write(
                    ins.dst(),
                    self.register_read(ins.src1())
                        .wrapping_sub(self.register_read(ins.src2())),
                );
            }
            Opcode::JALR => {
                let mut imm = sign_extend::<u32>(ins.imm() as usize, 11);

                // TODO: This shouldn't be needed.
                imm = ((imm as i32) >> 5) as u32;

                println!("IMM: {:x}", imm);
                println!("x{}: {:x}", ins.src1(), self.register_read(ins.src1()));

                self.register_write(ins.dst(), self.pc + 4);
                self.pc = self.register_read(ins.src1()).wrapping_add(imm) & !1;

                return true;
            }
            Opcode::JAL => {
                self.register_write(ins.dst(), self.pc + 4);
                self.pc = self
                    .pc
                    .wrapping_add(sign_extend::<u32>(ins.imm().wrapping_mul(2) as usize, 10));
                return true;
            }
            Opcode::BNE => {
                let branch = self.register_read(ins.src1()) != self.register_read(ins.src2());

                if branch {
                    let offset = ins.imm();
                    self.register_write(ins.dst(), self.pc + 4);

                    self.pc = self
                        .pc
                        .wrapping_add(sign_extend::<u32>(offset as usize, 11).wrapping_mul(2));
                    return true;
                }
            }
            Opcode::BLT => {
                let branch = (self.register_read(ins.src1()) as i32)
                    < (self.register_read(ins.src2()) as i32);

                if branch {
                    let offset = ins.imm();
                    self.register_write(ins.dst(), self.pc + 4);

                    self.pc = self
                        .pc
                        .wrapping_add(sign_extend::<u32>(offset as usize, 11).wrapping_mul(2));
                    return true;
                }
            }
            Opcode::BLTU => {
                let branch = self.register_read(ins.src1()) < self.register_read(ins.src2());

                if branch {
                    let offset = ins.imm();
                    self.register_write(ins.dst(), self.pc + 4);

                    self.pc = self
                        .pc
                        .wrapping_add(sign_extend::<u32>(offset as usize, 11).wrapping_mul(2));
                    return true;
                }
            }
            Opcode::BGEU => {
                let branch = self.register_read(ins.src1()) >= self.register_read(ins.src2());

                if branch {
                    let offset = ins.imm();
                    self.register_write(ins.dst(), self.pc + 4);

                    self.pc = self
                        .pc
                        .wrapping_add(sign_extend::<u32>(offset as usize, 11).wrapping_mul(2));
                    return true;
                }
            }
            _ => {
                panic!("Unimplemented!");
            }
        }

        self.pc += 4;

        true
    }
}
