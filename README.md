# Simple_RISCV_CPU

## Description

This single cycle RISC-V CPU is RV32, it only implement a part of RISC-V ISA integer instruction

## Single Cycle RISC-V CPU Architecture
![image](https://github.com/Benson890105/Simple_RISCV_CPU/blob/riscv1.0/image/RISC-V%20Processor%20Architecture.jpg)

It implements RISC-V Instruction as show below
| Category      | Instruction     | Example     | Meaning     |   Binary      |
| ---------- | :-----------:  | :-----------: | :-----------: |  :-----------: |
| R-Type     | add      | add x5, x6, x7      | x5 = x6 + x7     |  0000000_00111_00110_000_00101_0110011      |
| R-Type     | sub      | sub x28, x29, x30   | x28 = x29 - x30  |   0100000_11110_11101_000_11100_0110011     |
| R-Type     | and      | and x5, x6, x7      | x5 = x6 & x7     |  0000000_00111_00110_111_00101_0110011      |
| R-Type     | or       | or x5, x6, x8       | x5 = x6 or x8     |  0000000_01000_00110_110_00101_0110011      |
| R-Type     | xor      | xor x5, x6, x7      | x5 = x6 ^ x7     |  0000000_00111_00110_100_00101_0110011      |
| R-Type     | sll      | sll x5, x6, x7      | x5 = x6 << x7    |  0000000_00111_00110_001_00101_0110011      |
| R-Type     | srl      | srl x5, x6, x7      | x5 = x6 >> x7    |  0000000_00111_00110_101_00101_0110011      |
| R-Type     | slli     | slli x5, x6, 20     | x5 = x6 << 20    |  0000000_10100_00110_001_00101_0010011      |
| R-Type     | srli     | srli x5, x6, 20     | x5 = x6 >> 20    |  0000000_10100_00110_101_00101_0010011      |
| I-Type     | addi     | addi x5, x6, 20     | x5 = x6 + 20     |  000000010100_00110_000_00101_0010011      |
| I-Type     | lw       | lw x5, 40(x6)       | x5 = Memory[x6 + 40]     |  000000101000_00110_001_00101_0000011      |
| I-Type     | ori      | ori x5, x6, 20      | x5 = x6 or 20     |  000000010100_00110_110_00101_0010011      |
| I-Type     | xori     | xori x5, x6, 20     | x5 = x6 ^ 20     |  000000010100_00110_100_00101_0010011      |
| I-Type     | andi     | andi x5, x6, 20     | x5 = x6 & 20     |  000000010100_00110_111_00101_0010011      |
| I-Type     | jalr     | jalr x0, 0(x1)      | x1 = PC + 4; go to x0 + 4     |  000000000100_00000_000_00001_1100111      |
| S-Type     | sw       | sw x5, 40(x6)       | Memory[x6 + 40] = x5     |  0000001_00101_00110_010_01000_0100011      |
| B-Type     | beq     | beq x5, x6, 100      | if(x5==x6) go to PC + 100     |  0000011_00110_00101_000_00100_1100011      |
| B-Type     | bne     | bne x5, x6, 100      | if(x5!=x6) go to PC + 100     |  0000011_00110_00101_001_00100_1100011      |
| B-Type     | blt     | blt x5, x6, 100      | if(x5<x6) go to PC + 100      |  0000011_00110_00101_100_00100_1100011      |
| B-Type     | bge     | bqe x5, x6, 100      | if(x5>=x6) go to PC + 100     |  0000011_00110_00101_101_00100_1100011      |
| J-Type     | jal     | jal x1, -16          | x1 = PC + 4; go to PC-32     |  11111110000111111111_00001_1101111      |
