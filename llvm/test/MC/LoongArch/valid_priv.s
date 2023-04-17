# RUN: llvm-mc %s -triple=loongarch64-unknown-linux-gnu -show-encoding | FileCheck %s
# CHECK: csrrd $r26, 30
# CHECK: encoding: [0x1a,0x78,0x00,0x04]
csrrd $r26, 30

# CHECK: csrwr $r24, 194
# CHECK: encoding: [0x38,0x08,0x03,0x04]
csrwr $r24, 194

# CHECK: csrxchg $r6, $r27, 214
# CHECK: encoding: [0x66,0x5b,0x03,0x04]
csrxchg $r6, $r27, 214

# CHECK: cacop 0, $r10, 27
# CHECK: encoding: [0x40,0x6d,0x00,0x06]
cacop 0, $r10, 27

# CHECK: lddir $r12, $r30, 92
# CHECK: encoding: [0xcc,0x73,0x41,0x06]
lddir $r12, $r30, 92

# CHECK: ldpte $r18, 200
# CHECK: encoding: [0x40,0x22,0x47,0x06]
ldpte $r18, 200

# CHECK: iocsrrd.b $r26, $r24
# CHECK: encoding: [0x1a,0x03,0x48,0x06]
iocsrrd.b $r26, $r24

# CHECK: iocsrrd.h $r5, $r27
# CHECK: encoding: [0x65,0x07,0x48,0x06]
iocsrrd.h $r5, $r27

# CHECK: iocsrrd.w $r10, $r20
# CHECK: encoding: [0x8a,0x0a,0x48,0x06]
iocsrrd.w $r10, $r20

# CHECK: iocsrrd.d $r17, $r25
# CHECK: encoding: [0x31,0x0f,0x48,0x06]
iocsrrd.d $r17, $r25

# CHECK: iocsrwr.b $r4, $r23
# CHECK: encoding: [0xe4,0x12,0x48,0x06]
iocsrwr.b $r4, $r23

# CHECK: iocsrwr.h $r11, $zero
# CHECK: encoding: [0x0b,0x14,0x48,0x06]
iocsrwr.h $r11, $zero

# CHECK: iocsrwr.w $r20, $r26
# CHECK: encoding: [0x54,0x1b,0x48,0x06]
iocsrwr.w $r20, $r26

# CHECK: iocsrwr.d $r20, $r7
# CHECK: encoding: [0xf4,0x1c,0x48,0x06]
iocsrwr.d $r20, $r7

# CHECK: tlbclr
# CHECK: encoding: [0x00,0x20,0x48,0x06]
tlbclr

# CHECK: tlbflush
# CHECK: encoding: [0x00,0x24,0x48,0x06]
tlbflush

# CHECK: tlbsrch
# CHECK: encoding: [0x00,0x28,0x48,0x06]
tlbsrch

# CHECK: tlbrd
# CHECK: encoding: [0x00,0x2c,0x48,0x06]
tlbrd

# CHECK: tlbwr
# CHECK: encoding: [0x00,0x30,0x48,0x06]
tlbwr

# CHECK: tlbfill
# CHECK: encoding: [0x00,0x34,0x48,0x06]
tlbfill

# CHECK: ertn
# CHECK: encoding: [0x00,0x38,0x48,0x06]
ertn

# CHECK: idle 204
# CHECK: encoding: [0xcc,0x80,0x48,0x06]
idle 204

# CHECK: invtlb 16, $r29, $r25
# CHECK: encoding: [0xb0,0xe7,0x49,0x06]
invtlb 16, $r29, $r25

# CHECK: rdtimel.w $r30, $r19
# CHECK: encoding: [0x7e,0x62,0x00,0x00]
rdtimel.w $r30, $r19

# CHECK: rdtimeh.w $r19, $r14
# CHECK: encoding: [0xd3,0x65,0x00,0x00]
rdtimeh.w $r19, $r14

# CHECK: rdtime.d $tp, $r15
# CHECK: encoding: [0xe2,0x69,0x00,0x00]
rdtime.d $tp, $r15

# CHECK: asrtle.d $r12, $r17
# CHECK: encoding: [0x80,0x45,0x01,0x00]
asrtle.d $r12, $r17

# CHECK: asrtgt.d $r20, $r20
# CHECK: encoding: [0x80,0xd2,0x01,0x00]
asrtgt.d $r20, $r20

# CHECK: break 199
# CHECK: encoding: [0xc7,0x00,0x2a,0x00]
break 199

# CHECK: dbcl 201
# CHECK: encoding: [0xc9,0x80,0x2a,0x00]
dbcl 201

# CHECK: syscall 100
# CHECK: encoding: [0x64,0x00,0x2b,0x00]
syscall 100

