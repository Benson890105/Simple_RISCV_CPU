# Simple_RISCV_CPU

## Description

This single cycle RISC-V CPU is RV32, it only implement a part of RISC-V ISA integer instruction

## Single Cycle RISC-V CPU Architecture
![image](https://github.com/Benson890105/Simple_RISCV_CPU/blob/riscv1.0/image/RISC-V%20Processor%20Architecture.jpg)

It implements RISC-V Instruction as show below
| Category      | Instruction     | Example     | Meaning     |
| ---------- | :-----------:  | :-----------: | :-----------: |
| R-Type     | add      | add x5, x6, x7      | x5 = x6 + x7     |
| R-Type     | sub      | sub x28, x29, x30   | x28 = x29 - x30  |
| R-Type     | and      | and x5, x6, x7      | x5 = x6 & x7     |
| R-Type     | or       | or x5, x6, x8       | x5 = x6 | x8     |
| R-Type     | xor      | xor x5, x6, x7      | x5 = x6 ^ x7     |
| R-Type     | sll      | sll x5, x6, x7      | x5 = x6 << x7    |
| R-Type     | srl      | srl x5, x6, x7      | x5 = x6 >> x7    |
| R-Type     | slli     | slli x5, x6, 20     | x5 = x6 << 20    |
| R-Type     | srli     | srli x5, x6, 20     | x5 = x6 >> 20    |
| I-Type     | addi     | addi x5, x6, 20     | x5 = x6 + 20     |
| I-Type     | lw       | lw x5, 40(x6)       | x5 = Memory[x6 + 40]     |
| I-Type     | ori      | ori x5, x6, 20     | x5 = x6 | 20     |
| I-Type     | xori     | xori x5, x6, 20     | 第二列     |
| I-Type     | andi     | andi x5, x6, 20     | 第二列     |
| I-Type     | jalr     | jalr x0, 0(x1)     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
