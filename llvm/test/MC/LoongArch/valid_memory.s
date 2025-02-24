# RUN: llvm-mc %s -triple=loongarch64-unknown-linux-gnu -show-encoding | FileCheck %s
# CHECK: dbar 0
# CHECK: encoding: [0x00,0x00,0x72,0x38]
dbar 0

# CHECK: ibar 0
# CHECK: encoding: [0x00,0x80,0x72,0x38]
ibar 0

# CHECK: ll.w $tp, $r27, 220
# CHECK: encoding: [0x62,0xdf,0x00,0x20]
ll.w $tp, $r27, 220

# CHECK: sc.w $r19, $r14, 56
# CHECK: encoding: [0xd3,0x39,0x00,0x21]
sc.w $r19, $r14, 56

# CHECK: ll.d $r25, $r27, 16
# CHECK: encoding: [0x79,0x13,0x00,0x22]
ll.d $r25, $r27, 16

# CHECK: sc.d $r17, $r17, 244
# CHECK: encoding: [0x31,0xf6,0x00,0x23]
sc.d $r17, $r17, 244

# CHECK: ldptr.w $r26, $r6, 60
# CHECK: encoding: [0xda,0x3c,0x00,0x24]
ldptr.w $r26, $r6, 60

# CHECK: stptr.w $r28, $r5, 216
# CHECK: encoding: [0xbc,0xd8,0x00,0x25]
stptr.w $r28, $r5, 216

# CHECK: ldptr.d $r5, $r29, 244
# CHECK: encoding: [0xa5,0xf7,0x00,0x26]
ldptr.d $r5, $r29, 244

# CHECK: stptr.d $r14, $r24, 196
# CHECK: encoding: [0x0e,0xc7,0x00,0x27]
stptr.d $r14, $r24, 196

# CHECK: ld.b $r24, $r8, 21
# CHECK: encoding: [0x18,0x55,0x00,0x28]
ld.b $r24, $r8, 21

# CHECK: ld.h $r7, $r18, 80
# CHECK: encoding: [0x47,0x42,0x41,0x28]
ld.h $r7, $r18, 80

# CHECK: ld.w $r18, $r26, 92
# CHECK: encoding: [0x52,0x73,0x81,0x28]
ld.w $r18, $r26, 92

# CHECK: ld.d $r18, $r20, 159
# CHECK: encoding: [0x92,0x7e,0xc2,0x28]
ld.d $r18, $r20, 159

# CHECK: st.b $sp, $r7, 95
# CHECK: encoding: [0xe3,0x7c,0x01,0x29]
st.b $sp, $r7, 95

# CHECK: st.h $r25, $r16, 122
# CHECK: encoding: [0x19,0xea,0x41,0x29]
st.h $r25, $r16, 122

# CHECK: st.w $r13, $r13, 175
# CHECK: encoding: [0xad,0xbd,0x82,0x29]
st.w $r13, $r13, 175

# CHECK: st.d $r30, $r30, 60
# CHECK: encoding: [0xde,0xf3,0xc0,0x29]
st.d $r30, $r30, 60

# CHECK: ld.bu $r13, $r13, 150
# CHECK: encoding: [0xad,0x59,0x02,0x2a]
ld.bu $r13, $r13, 150

# CHECK: ld.hu $r18, $r29, 198
# CHECK: encoding: [0xb2,0x1b,0x43,0x2a]
ld.hu $r18, $r29, 198

# CHECK: ld.wu $r14, $r19, 31
# CHECK: encoding: [0x6e,0x7e,0x80,0x2a]
ld.wu $r14, $r19, 31

# CHECK: fld.s $f23, $r15, 250
# CHECK: encoding: [0xf7,0xe9,0x03,0x2b]
fld.s $f23, $r15, 250

# CHECK: fst.s $f30, $r19, 230
# CHECK: encoding: [0x7e,0x9a,0x43,0x2b]
fst.s $f30, $r19, 230

# CHECK: fld.d $f22, $r17, 114
# CHECK: encoding: [0x36,0xca,0x81,0x2b]
fld.d $f22, $r17, 114

# CHECK: fst.d $f28, $r7, 198
# CHECK: encoding: [0xfc,0x18,0xc3,0x2b]
fst.d $f28, $r7, 198

# CHECK: ldx.b $r24, $ra, $tp
# CHECK: encoding: [0x38,0x08,0x00,0x38]
ldx.b $r24, $ra, $tp

# CHECK: ldx.h $r22, $r22, $r17
# CHECK: encoding: [0xd6,0x46,0x04,0x38]
ldx.h $r22, $r22, $r17

# CHECK: ldx.w $r25, $r11, $r23
# CHECK: encoding: [0x79,0x5d,0x08,0x38]
ldx.w $r25, $r11, $r23

# CHECK: ldx.d $r18, $r23, $r20
# CHECK: encoding: [0xf2,0x52,0x0c,0x38]
ldx.d $r18, $r23, $r20

# CHECK: stx.b $r19, $ra, $sp
# CHECK: encoding: [0x33,0x0c,0x10,0x38]
stx.b $r19, $ra, $sp

# CHECK: stx.h $zero, $r28, $r26
# CHECK: encoding: [0x80,0x6b,0x14,0x38]
stx.h $zero, $r28, $r26

# CHECK: stx.w $r7, $r4, $r31
# CHECK: encoding: [0x87,0x7c,0x18,0x38]
stx.w $r7, $r4, $r31

# CHECK: stx.d $r7, $r31, $r10
# CHECK: encoding: [0xe7,0x2b,0x1c,0x38]
stx.d $r7, $r31, $r10

# CHECK: ldx.bu $r11, $r9, $r9
# CHECK: encoding: [0x2b,0x25,0x20,0x38]
ldx.bu $r11, $r9, $r9

# CHECK: ldx.hu $r22, $r23, $r27
# CHECK: encoding: [0xf6,0x6e,0x24,0x38]
ldx.hu $r22, $r23, $r27

# CHECK: ldx.wu $r8, $r24, $r28
# CHECK: encoding: [0x08,0x73,0x28,0x38]
ldx.wu $r8, $r24, $r28

# CHECK: fldx.s $f1, $r15, $r19
# CHECK: encoding: [0xe1,0x4d,0x30,0x38]
fldx.s $f1, $r15, $r19

# CHECK: fldx.d $f27, $r13, $r31
# CHECK: encoding: [0xbb,0x7d,0x34,0x38]
fldx.d $f27, $r13, $r31

# CHECK: fstx.s $f26, $sp, $r22
# CHECK: encoding: [0x7a,0x58,0x38,0x38]
fstx.s $f26, $sp, $r22

# CHECK: fstx.d $f6, $r15, $r17
# CHECK: encoding: [0xe6,0x45,0x3c,0x38]
fstx.d $f6, $r15, $r17

# CHECK: amswap_db.w $r6, $r12, $r24, 0
# CHECK: encoding: [0x06,0x33,0x69,0x38]
amswap_db.w $r6, $r12, $r24, 0

# CHECK: amswap_db.d $tp, $r14, $r22, 0
# CHECK: encoding: [0xc2,0xba,0x69,0x38]
amswap_db.d $tp, $r14, $r22, 0

# CHECK: amadd_db.w $r8, $r12, $r21, 0
# CHECK: encoding: [0xa8,0x32,0x6a,0x38]
amadd_db.w $r8, $r12, $r21, 0

# CHECK: amadd_db.d $r5, $r17, $r29, 0
# CHECK: encoding: [0xa5,0xc7,0x6a,0x38]
amadd_db.d $r5, $r17, $r29, 0

# CHECK: amand_db.w $r4, $r19, $r22, 0
# CHECK: encoding: [0xc4,0x4e,0x6b,0x38]
amand_db.w $r4, $r19, $r22, 0

# CHECK: amand_db.d $r10, $r18, $r29, 0
# CHECK: encoding: [0xaa,0xcb,0x6b,0x38]
amand_db.d $r10, $r18, $r29, 0

# CHECK: amor_db.w $r6, $r16, $r23, 0
# CHECK: encoding: [0xe6,0x42,0x6c,0x38]
amor_db.w $r6, $r16, $r23, 0

# CHECK: amor_db.d $sp, $r16, $r24, 0
# CHECK: encoding: [0x03,0xc3,0x6c,0x38]
amor_db.d $sp, $r16, $r24, 0

# CHECK: amxor_db.w $tp, $r15, $r23, 0
# CHECK: encoding: [0xe2,0x3e,0x6d,0x38]
amxor_db.w $tp, $r15, $r23, 0

# CHECK: amxor_db.d $r8, $r20, $r28, 0
# CHECK: encoding: [0x88,0xd3,0x6d,0x38]
amxor_db.d $r8, $r20, $r28, 0

# CHECK: ammax_db.w $ra, $r11, $r23, 0
# CHECK: encoding: [0xe1,0x2e,0x6e,0x38]
ammax_db.w $ra, $r11, $r23, 0

# CHECK: ammax_db.d $r9, $r20, $r27, 0
# CHECK: encoding: [0x69,0xd3,0x6e,0x38]
ammax_db.d $r9, $r20, $r27, 0

# CHECK: ammin_db.w $r9, $r14, $r23, 0
# CHECK: encoding: [0xe9,0x3a,0x6f,0x38]
ammin_db.w $r9, $r14, $r23, 0

# CHECK: ammin_db.d $r9, $r13, $r22, 0
# CHECK: encoding: [0xc9,0xb6,0x6f,0x38]
ammin_db.d $r9, $r13, $r22, 0

# CHECK: ammax_db.wu $r9, $r11, $r22, 0
# CHECK: encoding: [0xc9,0x2e,0x70,0x38]
ammax_db.wu $r9, $r11, $r22, 0

# CHECK: ammax_db.du $r6, $r16, $r25, 0
# CHECK: encoding: [0x26,0xc3,0x70,0x38]
ammax_db.du $r6, $r16, $r25, 0

# CHECK: ammin_db.wu $r8, $r18, $r30, 0
# CHECK: encoding: [0xc8,0x4b,0x71,0x38]
ammin_db.wu $r8, $r18, $r30, 0

# CHECK: ammin_db.du $r7, $r16, $r25, 0
# CHECK: encoding: [0x27,0xc3,0x71,0x38]
ammin_db.du $r7, $r16, $r25, 0

# CHECK: amswap.w $r6, $r12, $r24, 0
# CHECK: encoding: [0x06,0x33,0x60,0x38]
amswap.w $r6, $r12, $r24, 0

# CHECK: amswap.d $tp, $r14, $r22, 0
# CHECK: encoding: [0xc2,0xba,0x60,0x38]
amswap.d $tp, $r14, $r22, 0

# CHECK: amadd.w $r8, $r12, $r21, 0
# CHECK: encoding: [0xa8,0x32,0x61,0x38]
amadd.w $r8, $r12, $r21, 0

# CHECK: amadd.d $r5, $r17, $r29, 0
# CHECK: encoding: [0xa5,0xc7,0x61,0x38]
amadd.d $r5, $r17, $r29, 0

# CHECK: amand.w $r4, $r19, $r22, 0
# CHECK: encoding: [0xc4,0x4e,0x62,0x38]
amand.w $r4, $r19, $r22, 0

# CHECK: amand.d $r10, $r18, $r29, 0
# CHECK: encoding: [0xaa,0xcb,0x62,0x38]
amand.d $r10, $r18, $r29, 0

# CHECK: amor.w $r6, $r16, $r23, 0
# CHECK: encoding: [0xe6,0x42,0x63,0x38]
amor.w $r6, $r16, $r23, 0

# CHECK: amor.d $sp, $r16, $r24, 0
# CHECK: encoding: [0x03,0xc3,0x63,0x38]
amor.d $sp, $r16, $r24, 0

# CHECK: amxor.w $tp, $r15, $r23, 0
# CHECK: encoding: [0xe2,0x3e,0x64,0x38]
amxor.w $tp, $r15, $r23, 0

# CHECK: amxor.d $r8, $r20, $r28, 0
# CHECK: encoding: [0x88,0xd3,0x64,0x38]
amxor.d $r8, $r20, $r28, 0

# CHECK: ammax.w $ra, $r11, $r23, 0
# CHECK: encoding: [0xe1,0x2e,0x65,0x38]
ammax.w $ra, $r11, $r23, 0

# CHECK: ammax.d $r9, $r20, $r27, 0
# CHECK: encoding: [0x69,0xd3,0x65,0x38]
ammax.d $r9, $r20, $r27, 0

# CHECK: ammin.w $r9, $r14, $r23, 0
# CHECK: encoding: [0xe9,0x3a,0x66,0x38]
ammin.w $r9, $r14, $r23, 0

# CHECK: ammin.d $r9, $r13, $r22, 0
# CHECK: encoding: [0xc9,0xb6,0x66,0x38]
ammin.d $r9, $r13, $r22, 0

# CHECK: ammax.wu $r9, $r11, $r22, 0
# CHECK: encoding: [0xc9,0x2e,0x67,0x38]
ammax.wu $r9, $r11, $r22, 0

# CHECK: ammax.du $r6, $r16, $r25, 0
# CHECK: encoding: [0x26,0xc3,0x67,0x38]
ammax.du $r6, $r16, $r25, 0

# CHECK: ammin.wu $r8, $r18, $r30, 0
# CHECK: encoding: [0xc8,0x4b,0x68,0x38]
ammin.wu $r8, $r18, $r30, 0

# CHECK: ammin.du $r7, $r16, $r25, 0
# CHECK: encoding: [0x27,0xc3,0x68,0x38]
ammin.du $r7, $r16, $r25, 0

# CHECK: fldgt.s $f3, $r27, $r13
# CHECK: encoding: [0x63,0x37,0x74,0x38]
fldgt.s $f3, $r27, $r13

# CHECK: fldgt.d $f26, $r5, $r31
# CHECK: encoding: [0xba,0xfc,0x74,0x38]
fldgt.d $f26, $r5, $r31

# CHECK: fldle.s $f24, $r29, $r17
# CHECK: encoding: [0xb8,0x47,0x75,0x38]
fldle.s $f24, $r29, $r17

# CHECK: fldle.d $f3, $r15, $r22
# CHECK: encoding: [0xe3,0xd9,0x75,0x38]
fldle.d $f3, $r15, $r22

# CHECK: fstgt.s $f31, $r13, $r30
# CHECK: encoding: [0xbf,0x79,0x76,0x38]
fstgt.s $f31, $r13, $r30

# CHECK: fstgt.d $f13, $r11, $r26
# CHECK: encoding: [0x6d,0xe9,0x76,0x38]
fstgt.d $f13, $r11, $r26

# CHECK: fstle.s $f13, $r13, $r7
# CHECK: encoding: [0xad,0x1d,0x77,0x38]
fstle.s $f13, $r13, $r7

# CHECK: fstle.d $f18, $r9, $r13
# CHECK: encoding: [0x32,0xb5,0x77,0x38]
fstle.d $f18, $r9, $r13

# CHECK: preld 10, $zero, 23
# CHECK: encoding: [0x0a,0x5c,0xc0,0x2a]
preld 10, $zero, 23

# CHECK: ldgt.b $r6, $r6, $r29
# CHECK: encoding: [0xc6,0x74,0x78,0x38]
ldgt.b $r6, $r6, $r29

# CHECK: ldgt.h $r5, $r31, $ra
# CHECK: encoding: [0xe5,0x87,0x78,0x38]
ldgt.h $r5, $r31, $ra

# CHECK: ldgt.w $r15, $r26, $r8
# CHECK: encoding: [0x4f,0x23,0x79,0x38]
ldgt.w $r15, $r26, $r8

# CHECK: ldgt.d $r23, $r25, $r31
# CHECK: encoding: [0x37,0xff,0x79,0x38]
ldgt.d $r23, $r25, $r31

# CHECK: ldle.b $r9, $r12, $r15
# CHECK: encoding: [0x89,0x3d,0x7a,0x38]
ldle.b $r9, $r12, $r15

# CHECK: ldle.h $r11, $r11, $r23
# CHECK: encoding: [0x6b,0xdd,0x7a,0x38]
ldle.h $r11, $r11, $r23

# CHECK: ldle.w $r24, $tp, $tp
# CHECK: encoding: [0x58,0x08,0x7b,0x38]
ldle.w $r24, $tp, $tp

# CHECK: ldle.d $r20, $r15, $r16
# CHECK: encoding: [0xf4,0xc1,0x7b,0x38]
ldle.d $r20, $r15, $r16

# CHECK: stgt.b $r27, $r19, $r20
# CHECK: encoding: [0x7b,0x52,0x7c,0x38]
stgt.b $r27, $r19, $r20

# CHECK: stgt.h $r16, $r4, $r6
# CHECK: encoding: [0x90,0x98,0x7c,0x38]
stgt.h $r16, $r4, $r6

# CHECK: stgt.w $r31, $r28, $r14
# CHECK: encoding: [0x9f,0x3b,0x7d,0x38]
stgt.w $r31, $r28, $r14

# CHECK: stgt.d $r30, $r21, $r24
# CHECK: encoding: [0xbe,0xe2,0x7d,0x38]
stgt.d $r30, $r21, $r24

# CHECK: stle.b $r10, $r4, $r16
# CHECK: encoding: [0x8a,0x40,0x7e,0x38]
stle.b $r10, $r4, $r16

# CHECK: stle.h $r17, $r17, $r21
# CHECK: encoding: [0x31,0xd6,0x7e,0x38]
stle.h $r17, $r17, $r21

# CHECK: stle.w $r23, $r28, $r29
# CHECK: encoding: [0x97,0x77,0x7f,0x38]
stle.w $r23, $r28, $r29

# CHECK: stle.d $r25, $r24, $r29
# CHECK: encoding: [0x19,0xf7,0x7f,0x38]
stle.d $r25, $r24, $r29

