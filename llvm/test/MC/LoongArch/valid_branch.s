# RUN: llvm-mc %s -triple=loongarch64-unknown-linux-gnu -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ASM-AND-OBJ,CHECK-ASM %s
# RUN: llvm-mc %s -triple=loongarch64-unknown-linux-gnu -filetype=obj \
# RUN:     | llvm-objdump -d - | FileCheck -check-prefix=CHECK-ASM-AND-OBJ %s

## random operands
# CHECK-ASM-AND-OBJ: beqz $r9, 96
# CHECK-ASM: encoding: [0x20,0x61,0x00,0x40]
beqz $r9, 96

# CHECK-ASM-AND-OBJ: bnez $sp, 212
# CHECK-ASM: encoding: [0x60,0xd4,0x00,0x44]
bnez $sp, 212

# CHECK-ASM-AND-OBJ: bceqz $fcc6, 12
# CHECK-ASM: encoding: [0xc0,0x0c,0x00,0x48]
bceqz $fcc6, 12

# CHECK-ASM-AND-OBJ: bcnez $fcc6, 72
# CHECK-ASM: encoding: [0xc0,0x49,0x00,0x48]
bcnez $fcc6, 72

# CHECK-ASM-AND-OBJ: b 248
# CHECK-ASM: encoding: [0x00,0xf8,0x00,0x50]
b 248

# CHECK-ASM-AND-OBJ: bl 236
# CHECK-ASM: encoding: [0x00,0xec,0x00,0x54]
bl 236

# CHECK-ASM-AND-OBJ: beq $r10, $r7, 176
# CHECK-ASM: encoding: [0x47,0xb1,0x00,0x58]
beq $r10, $r7, 176

# CHECK-ASM-AND-OBJ: bne $r25, $ra, 136
# CHECK-ASM: encoding: [0x21,0x8b,0x00,0x5c]
bne $r25, $ra, 136

# CHECK-ASM-AND-OBJ: blt $r15, $r30, 168
# CHECK-ASM: encoding: [0xfe,0xa9,0x00,0x60]
blt $r15, $r30, 168

# CHECK-ASM-AND-OBJ: bge $r12, $r15, 148
# CHECK-ASM: encoding: [0x8f,0x95,0x00,0x64]
bge $r12, $r15, 148

# CHECK-ASM-AND-OBJ: bltu $r17, $r5, 4
# CHECK-ASM: encoding: [0x25,0x06,0x00,0x68]
bltu $r17, $r5, 4

# CHECK-ASM-AND-OBJ: bgeu $r6, $r23, 140
# CHECK-ASM: encoding: [0xd7,0x8c,0x00,0x6c]
bgeu $r6, $r23, 140


## immediate lower/upper boundary
### simm16 << 2
# CHECK-ASM-AND-OBJ: beq $r10, $r7, -131072
# CHECK-ASM: encoding: [0x47,0x01,0x00,0x5a]
beq $r10, $r7, -0x20000

# CHECK-ASM-AND-OBJ: beq $r10, $r7, 131068
# CHECK-ASM: encoding: [0x47,0xfd,0xff,0x59]
beq $r10, $r7, 0x1FFFC

# CHECK-ASM-AND-OBJ: bne $r10, $r7, -131072
# CHECK-ASM: encoding: [0x47,0x01,0x00,0x5e]
bne $r10, $r7, -0x20000

# CHECK-ASM-AND-OBJ: bne $r10, $r7, 131068
# CHECK-ASM: encoding: [0x47,0xfd,0xff,0x5d]
bne $r10, $r7, 0x1FFFC

# CHECK-ASM-AND-OBJ: blt $r10, $r7, -131072
# CHECK-ASM: encoding: [0x47,0x01,0x00,0x62]
blt $r10, $r7, -0x20000

# CHECK-ASM-AND-OBJ: blt $r10, $r7, 131068
# CHECK-ASM: encoding: [0x47,0xfd,0xff,0x61]
blt $r10, $r7, 0x1FFFC

# CHECK-ASM-AND-OBJ: bge $r10, $r7, -131072
# CHECK-ASM: encoding: [0x47,0x01,0x00,0x66]
bge $r10, $r7, -0x20000

# CHECK-ASM-AND-OBJ: bge $r10, $r7, 131068
# CHECK-ASM: encoding: [0x47,0xfd,0xff,0x65]
bge $r10, $r7, 0x1FFFC

# CHECK-ASM-AND-OBJ: bltu $r10, $r7, -131072
# CHECK-ASM: encoding: [0x47,0x01,0x00,0x6a]
bltu $r10, $r7, -0x20000

# CHECK-ASM-AND-OBJ: bltu $r10, $r7, 131068
# CHECK-ASM: encoding: [0x47,0xfd,0xff,0x69]
bltu $r10, $r7, 0x1FFFC

# CHECK-ASM-AND-OBJ: bgeu $r10, $r7, -131072
# CHECK-ASM: encoding: [0x47,0x01,0x00,0x6e]
bgeu $r10, $r7, -0x20000

# CHECK-ASM-AND-OBJ: bgeu $r10, $r7, 131068
# CHECK-ASM: encoding: [0x47,0xfd,0xff,0x6d]
bgeu $r10, $r7, 0x1FFFC

### simm21 << 2
# CHECK-ASM-AND-OBJ: beqz $r9, -4194304
# CHECK-ASM: encoding: [0x30,0x01,0x00,0x40]
beqz $r9, -0x400000

# CHECK-ASM-AND-OBJ: beqz $r9, 4194300
# CHECK-ASM: encoding: [0x2f,0xfd,0xff,0x43]
beqz $r9, 0x3FFFFC

# CHECK-ASM-AND-OBJ: bnez $r9, -4194304
# CHECK-ASM: encoding: [0x30,0x01,0x00,0x44]
bnez $r9, -0x400000

# CHECK-ASM-AND-OBJ: bnez $r9, 4194300
# CHECK-ASM: encoding: [0x2f,0xfd,0xff,0x47]
bnez $r9, 0x3FFFFC

# CHECK-ASM-AND-OBJ: bceqz $fcc6, -4194304
# CHECK-ASM: encoding: [0xd0,0x00,0x00,0x48]
bceqz $fcc6, -0x400000

# CHECK-ASM-AND-OBJ: bceqz $fcc6, 4194300
# CHECK-ASM: encoding: [0xcf,0xfc,0xff,0x4b]
bceqz $fcc6, 0x3FFFFC

# CHECK-ASM-AND-OBJ: bcnez $fcc6, -4194304
# CHECK-ASM: encoding: [0xd0,0x01,0x00,0x48]
bcnez $fcc6, -0x400000

# CHECK-ASM-AND-OBJ: bcnez $fcc6, 4194300
# CHECK-ASM: encoding: [0xcf,0xfd,0xff,0x4b]
bcnez $fcc6, 0x3FFFFC

### simm26 << 2
# CHECK-ASM-AND-OBJ: b -134217728
# CHECK-ASM: encoding: [0x00,0x02,0x00,0x50]
b -0x8000000

# CHECK-ASM-AND-OBJ: b 134217724
# CHECK-ASM: encoding: [0xff,0xfd,0xff,0x53]
b 0x7FFFFFC

# CHECK-ASM-AND-OBJ: bl -134217728
# CHECK-ASM: encoding: [0x00,0x02,0x00,0x54]
bl -0x8000000

# CHECK-ASM-AND-OBJ: bl 134217724
# CHECK-ASM: encoding: [0xff,0xfd,0xff,0x57]
bl 0x7FFFFFC

