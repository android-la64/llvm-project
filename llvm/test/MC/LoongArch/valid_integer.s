# RUN: llvm-mc %s -triple=loongarch64-unknown-linux-gnu -show-encoding | FileCheck %s
# CHECK: clo.w $ra, $sp
# CHECK: encoding: [0x61,0x10,0x00,0x00]
clo.w $ra, $sp

# CHECK: clz.w $r7, $r10
# CHECK: encoding: [0x47,0x15,0x00,0x00]
clz.w $r7, $r10

# CHECK: cto.w $tp, $r6
# CHECK: encoding: [0xc2,0x18,0x00,0x00]
cto.w $tp, $r6

# CHECK: ctz.w $r5, $r22
# CHECK: encoding: [0xc5,0x1e,0x00,0x00]
ctz.w $r5, $r22

# CHECK: clo.d $r29, $ra
# CHECK: encoding: [0x3d,0x20,0x00,0x00]
clo.d $r29, $ra

# CHECK: clz.d $r26, $r26
# CHECK: encoding: [0x5a,0x27,0x00,0x00]
clz.d $r26, $r26

# CHECK: cto.d $r18, $r20
# CHECK: encoding: [0x92,0x2a,0x00,0x00]
cto.d $r18, $r20

# CHECK: ctz.d $r17, $r10
# CHECK: encoding: [0x51,0x2d,0x00,0x00]
ctz.d $r17, $r10

# CHECK: revb.2h $r20, $r11
# CHECK: encoding: [0x74,0x31,0x00,0x00]
revb.2h $r20, $r11

# CHECK: revb.4h $r13, $r19
# CHECK: encoding: [0x6d,0x36,0x00,0x00]
revb.4h $r13, $r19

# CHECK: revb.2w $r28, $r27
# CHECK: encoding: [0x7c,0x3b,0x00,0x00]
revb.2w $r28, $r27

# CHECK: revb.d $zero, $r23
# CHECK: encoding: [0xe0,0x3e,0x00,0x00]
revb.d $zero, $r23

# CHECK: revh.2w $r28, $r10
# CHECK: encoding: [0x5c,0x41,0x00,0x00]
revh.2w $r28, $r10

# CHECK: revh.d $r9, $r7
# CHECK: encoding: [0xe9,0x44,0x00,0x00]
revh.d $r9, $r7

# CHECK: bitrev.4b $r21, $r27
# CHECK: encoding: [0x75,0x4b,0x00,0x00]
bitrev.4b $r21, $r27

# CHECK: bitrev.8b $r13, $r25
# CHECK: encoding: [0x2d,0x4f,0x00,0x00]
bitrev.8b $r13, $r25

# CHECK: bitrev.w $r25, $r5
# CHECK: encoding: [0xb9,0x50,0x00,0x00]
bitrev.w $r25, $r5

# CHECK: bitrev.d $r19, $r23
# CHECK: encoding: [0xf3,0x56,0x00,0x00]
bitrev.d $r19, $r23

# CHECK: ext.w.h $r23, $r23
# CHECK: encoding: [0xf7,0x5a,0x00,0x00]
ext.w.h $r23, $r23

# CHECK: ext.w.b $r20, $r18
# CHECK: encoding: [0x54,0x5e,0x00,0x00]
ext.w.b $r20, $r18

# CHECK: rdtimel.w $r24, $r4
# CHECK: encoding: [0x98,0x60,0x00,0x00]
rdtimel.w $r24, $r4

# CHECK: rdtimeh.w $r11, $r5
# CHECK: encoding: [0xab,0x64,0x00,0x00]
rdtimeh.w $r11, $r5

# CHECK: rdtime.d $tp, $ra
# CHECK: encoding: [0x22,0x68,0x00,0x00]
rdtime.d $tp, $ra

# CHECK: cpucfg $sp, $ra
# CHECK: encoding: [0x23,0x6c,0x00,0x00]
cpucfg $sp, $ra

# CHECK: asrtle.d $r21, $r19
# CHECK: encoding: [0xa0,0x4e,0x01,0x00]
asrtle.d $r21, $r19

# CHECK: asrtgt.d $ra, $r19
# CHECK: encoding: [0x20,0xcc,0x01,0x00]
asrtgt.d $ra, $r19

# CHECK: alsl.w $tp, $r17, $tp, 4
# CHECK: encoding: [0x22,0x8a,0x05,0x00]
alsl.w $tp, $r17, $tp, 4

# CHECK: bytepick.w $r29, $zero, $r16, 0
# CHECK: encoding: [0x1d,0x40,0x08,0x00]
bytepick.w $r29, $zero, $r16, 0

# CHECK: bytepick.d $r15, $r17, $r20, 4
# CHECK: encoding: [0x2f,0x52,0x0e,0x00]
bytepick.d $r15, $r17, $r20, 4

# CHECK: add.w $r9, $ra, $r31
# CHECK: encoding: [0x29,0x7c,0x10,0x00]
add.w $r9, $ra, $r31

# CHECK: add.d $tp, $r18, $r27
# CHECK: encoding: [0x42,0xee,0x10,0x00]
add.d $tp, $r18, $r27

# CHECK: sub.w $r21, $r25, $r19
# CHECK: encoding: [0x35,0x4f,0x11,0x00]
sub.w $r21, $r25, $r19

# CHECK: sub.d $r7, $r12, $r7
# CHECK: encoding: [0x87,0x9d,0x11,0x00]
sub.d $r7, $r12, $r7

# CHECK: slt $r29, $r26, $tp
# CHECK: encoding: [0x5d,0x0b,0x12,0x00]
slt $r29, $r26, $tp

# CHECK: sltu $r11, $r21, $r29
# CHECK: encoding: [0xab,0xf6,0x12,0x00]
sltu $r11, $r21, $r29

# CHECK: maskeqz $r20, $r11, $r18
# CHECK: encoding: [0x74,0x49,0x13,0x00]
maskeqz $r20, $r11, $r18

# CHECK: masknez $r20, $r13, $r26
# CHECK: encoding: [0xb4,0xe9,0x13,0x00]
masknez $r20, $r13, $r26

# CHECK: nor $r5, $r18, $r5
# CHECK: encoding: [0x45,0x16,0x14,0x00]
nor $r5, $r18, $r5

# CHECK: and $r19, $r31, $ra
# CHECK: encoding: [0xf3,0x87,0x14,0x00]
and $r19, $r31, $ra

# CHECK: or $r17, $r16, $r30
# CHECK: encoding: [0x11,0x7a,0x15,0x00]
or $r17, $r16, $r30

# CHECK: xor $r15, $r19, $r8
# CHECK: encoding: [0x6f,0xa2,0x15,0x00]
xor $r15, $r19, $r8

# CHECK: orn $tp, $sp, $r25
# CHECK: encoding: [0x62,0x64,0x16,0x00]
orn $tp, $sp, $r25

# CHECK: andn $r28, $r25, $r5
# CHECK: encoding: [0x3c,0x97,0x16,0x00]
andn $r28, $r25, $r5

# CHECK: sll.w $r24, $r27, $r23
# CHECK: encoding: [0x78,0x5f,0x17,0x00]
sll.w $r24, $r27, $r23

# CHECK: srl.w $r31, $r17, $r7
# CHECK: encoding: [0x3f,0x9e,0x17,0x00]
srl.w $r31, $r17, $r7

# CHECK: sra.w $r12, $r28, $r10
# CHECK: encoding: [0x8c,0x2b,0x18,0x00]
sra.w $r12, $r28, $r10

# CHECK: sll.d $r20, $r15, $sp
# CHECK: encoding: [0xf4,0x8d,0x18,0x00]
sll.d $r20, $r15, $sp

# CHECK: srl.d $r14, $r25, $zero
# CHECK: encoding: [0x2e,0x03,0x19,0x00]
srl.d $r14, $r25, $zero

# CHECK: sra.d $r7, $r22, $r31
# CHECK: encoding: [0xc7,0xfe,0x19,0x00]
sra.d $r7, $r22, $r31

# CHECK: rotr.w $ra, $r26, $r18
# CHECK: encoding: [0x41,0x4b,0x1b,0x00]
rotr.w $ra, $r26, $r18

# CHECK: rotr.d $r31, $sp, $ra
# CHECK: encoding: [0x7f,0x84,0x1b,0x00]
rotr.d $r31, $sp, $ra

# CHECK: mul.w $r4, $r18, $sp
# CHECK: encoding: [0x44,0x0e,0x1c,0x00]
mul.w $r4, $r18, $sp

# CHECK: mulh.w $r27, $r23, $zero
# CHECK: encoding: [0xfb,0x82,0x1c,0x00]
mulh.w $r27, $r23, $zero

# CHECK: mulh.wu $r10, $r17, $r24
# CHECK: encoding: [0x2a,0x62,0x1d,0x00]
mulh.wu $r10, $r17, $r24

# CHECK: mul.d $ra, $r14, $r24
# CHECK: encoding: [0xc1,0xe1,0x1d,0x00]
mul.d $ra, $r14, $r24

# CHECK: mulh.d $r28, $ra, $r27
# CHECK: encoding: [0x3c,0x6c,0x1e,0x00]
mulh.d $r28, $ra, $r27

# CHECK: mulh.du $r13, $r27, $r29
# CHECK: encoding: [0x6d,0xf7,0x1e,0x00]
mulh.du $r13, $r27, $r29

# CHECK: mulw.d.w $r27, $r6, $r17
# CHECK: encoding: [0xdb,0x44,0x1f,0x00]
mulw.d.w $r27, $r6, $r17

# CHECK: mulw.d.wu $r17, $r22, $r30
# CHECK: encoding: [0xd1,0xfa,0x1f,0x00]
mulw.d.wu $r17, $r22, $r30

# CHECK: div.w $r30, $r13, $r25
# CHECK: encoding: [0xbe,0x65,0x20,0x00]
div.w $r30, $r13, $r25

# CHECK: mod.w $ra, $r26, $r10
# CHECK: encoding: [0x41,0xab,0x20,0x00]
mod.w $ra, $r26, $r10

# CHECK: div.wu $r19, $r23, $zero
# CHECK: encoding: [0xf3,0x02,0x21,0x00]
div.wu $r19, $r23, $zero

# CHECK: mod.wu $r27, $r9, $r17
# CHECK: encoding: [0x3b,0xc5,0x21,0x00]
mod.wu $r27, $r9, $r17

# CHECK: div.d $r23, $r6, $r21
# CHECK: encoding: [0xd7,0x54,0x22,0x00]
div.d $r23, $r6, $r21

# CHECK: mod.d $r16, $sp, $r15
# CHECK: encoding: [0x70,0xbc,0x22,0x00]
mod.d $r16, $sp, $r15

# CHECK: div.du $r31, $r24, $r14
# CHECK: encoding: [0x1f,0x3b,0x23,0x00]
div.du $r31, $r24, $r14

# CHECK: mod.du $r25, $r23, $r24
# CHECK: encoding: [0xf9,0xe2,0x23,0x00]
mod.du $r25, $r23, $r24

# CHECK: crc.w.b.w $r24, $r7, $tp
# CHECK: encoding: [0xf8,0x08,0x24,0x00]
crc.w.b.w $r24, $r7, $tp

# CHECK: crc.w.h.w $r31, $r10, $r18
# CHECK: encoding: [0x5f,0xc9,0x24,0x00]
crc.w.h.w $r31, $r10, $r18

# CHECK: crc.w.w.w $r28, $r6, $r10
# CHECK: encoding: [0xdc,0x28,0x25,0x00]
crc.w.w.w $r28, $r6, $r10

# CHECK: crc.w.d.w $r28, $r11, $r31
# CHECK: encoding: [0x7c,0xfd,0x25,0x00]
crc.w.d.w $r28, $r11, $r31

# CHECK: crcc.w.b.w $r15, $r18, $sp
# CHECK: encoding: [0x4f,0x0e,0x26,0x00]
crcc.w.b.w $r15, $r18, $sp

# CHECK: crcc.w.h.w $r21, $r29, $r18
# CHECK: encoding: [0xb5,0xcb,0x26,0x00]
crcc.w.h.w $r21, $r29, $r18

# CHECK: crcc.w.w.w $r17, $r14, $r13
# CHECK: encoding: [0xd1,0x35,0x27,0x00]
crcc.w.w.w $r17, $r14, $r13

# CHECK: crcc.w.d.w $r30, $r21, $r27
# CHECK: encoding: [0xbe,0xee,0x27,0x00]
crcc.w.d.w $r30, $r21, $r27

# CHECK: break 23
# CHECK: encoding: [0x17,0x00,0x2a,0x00]
break 23

# CHECK: syscall 2
# CHECK: encoding: [0x02,0x00,0x2b,0x00]
syscall 2

# CHECK: alsl.d $r17, $r11, $r5, 3
# CHECK: encoding: [0x71,0x15,0x2d,0x00]
alsl.d $r17, $r11, $r5, 3

# CHECK: slli.w $r26, $r18, 0
# CHECK: encoding: [0x5a,0x82,0x40,0x00]
slli.w $r26, $r18, 0

# CHECK: slli.d $r10, $r31, 39
# CHECK: encoding: [0xea,0x9f,0x41,0x00]
slli.d $r10, $r31, 39

# CHECK: srli.w $r10, $r14, 30
# CHECK: encoding: [0xca,0xf9,0x44,0x00]
srli.w $r10, $r14, 30

# CHECK: srli.d $r31, $r22, 38
# CHECK: encoding: [0xdf,0x9a,0x45,0x00]
srli.d $r31, $r22, 38

# CHECK: srai.w $r8, $r17, 24
# CHECK: encoding: [0x28,0xe2,0x48,0x00]
srai.w $r8, $r17, 24

# CHECK: srai.d $r9, $r21, 27
# CHECK: encoding: [0xa9,0x6e,0x49,0x00]
srai.d $r9, $r21, 27

# CHECK: rotri.w $r23, $r20, 23
# CHECK: encoding: [0x97,0xde,0x4c,0x00]
rotri.w $r23, $r20, 23

# CHECK: rotri.d $r29, $zero, 7
# CHECK: encoding: [0x1d,0x1c,0x4d,0x00]
rotri.d $r29, $zero, 7

# CHECK: bstrins.w $r8, $r11, 7, 2
# CHECK: encoding: [0x68,0x09,0x67,0x00]
bstrins.w $r8, $r11, 7, 2

# CHECK: bstrins.d $r8, $r11, 7, 2
# CHECK: encoding: [0x68,0x09,0x87,0x00]
bstrins.d $r8, $r11, 7, 2

# CHECK: bstrpick.w $ra, $r9, 10, 4
# CHECK: encoding: [0x21,0x91,0x6a,0x00]
bstrpick.w $ra, $r9, 10, 4

# CHECK: bstrpick.d $r31, $r27, 39, 22
# CHECK: encoding: [0x7f,0x5b,0xe7,0x00]
bstrpick.d $r31, $r27, 39, 22

# CHECK: cpucfg $sp, $r8
# CHECK: encoding: [0x03,0x6d,0x00,0x00]
cpucfg $sp, $r8

# CHECK: alsl.wu $r19, $r8, $r25, 1
# CHECK: encoding: [0x13,0x65,0x06,0x00]
alsl.wu $r19, $r8, $r25, 1

