# Simple_RISCV_CPU

## Description

This single cycle RISC-V CPU is RV32, it only implement a part of RISC-V ISA integer instruction

## Single Cycle RISC-V CPU Architecture
![image](https://github.com/Benson890105/Simple_RISCV_CPU/blob/riscv1.0/image/RISC-V%20Processor%20Architecture.jpg)

It implements RISC-V Instruction as show below
| Category      | Instruction     | Example     | Meaning     |
| ---------- | :-----------:  | :-----------: | :-----------: |
| 第一行     | add      | add x5, x6, x7      | 第二列     |
| 第一行     | sub      | sub x28, x29, x30   | 第二列     |
| 第一行     | and      | and x5, x6, x7      | 第二列     |
| 第一行     | or       | or x5, x6, x8       | 第二列     |
| 第一行     | xor      | xor x5, x6, x7      | 第二列     |
| 第一行     | sll      | sll x5, x6, x7      | 第二列     |
| 第一行     | srl      | srl x5, x6, x7      | 第二列     |
| 第一行     | slli     | slli x5, x6, 20     | 第二列     |
| 第一行     | srli     | srli x5, x6, 20     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
| 第一行     | add     | 第二列     | 第二列     | 第二列     |
