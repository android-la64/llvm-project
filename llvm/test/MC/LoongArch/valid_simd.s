# RUN: llvm-mc %s -triple=loongarch64-unknown-linux-gnu -show-encoding | FileCheck %s
# CHECK: vfmadd.s $vr15, $vr22, $vr10, $vr18
# CHECK: encoding: [0xcf,0x2a,0x19,0x09]
vfmadd.s $vr15, $vr22, $vr10, $vr18

# CHECK: vfmadd.d $vr1, $vr0, $vr12, $vr10
# CHECK: encoding: [0x01,0x30,0x25,0x09]
vfmadd.d $vr1, $vr0, $vr12, $vr10

# CHECK: vfmsub.s $vr16, $vr18, $vr13, $vr8
# CHECK: encoding: [0x50,0x36,0x54,0x09]
vfmsub.s $vr16, $vr18, $vr13, $vr8

# CHECK: vfmsub.d $vr25, $vr13, $vr1, $vr20
# CHECK: encoding: [0xb9,0x05,0x6a,0x09]
vfmsub.d $vr25, $vr13, $vr1, $vr20

# CHECK: vfnmadd.s $vr22, $vr2, $vr17, $vr22
# CHECK: encoding: [0x56,0x44,0x9b,0x09]
vfnmadd.s $vr22, $vr2, $vr17, $vr22

# CHECK: vfnmadd.d $vr28, $vr29, $vr2, $vr14
# CHECK: encoding: [0xbc,0x0b,0xa7,0x09]
vfnmadd.d $vr28, $vr29, $vr2, $vr14

# CHECK: vfnmsub.s $vr19, $vr4, $vr17, $vr24
# CHECK: encoding: [0x93,0x44,0xdc,0x09]
vfnmsub.s $vr19, $vr4, $vr17, $vr24

# CHECK: vfnmsub.d $vr24, $vr22, $vr28, $vr30
# CHECK: encoding: [0xd8,0x72,0xef,0x09]
vfnmsub.d $vr24, $vr22, $vr28, $vr30

# CHECK: xvfmadd.s $xr15, $xr28, $xr9, $xr15
# CHECK: encoding: [0x8f,0xa7,0x17,0x0a]
xvfmadd.s $xr15, $xr28, $xr9, $xr15

# CHECK: xvfmadd.d $xr5, $xr24, $xr12, $xr10
# CHECK: encoding: [0x05,0x33,0x25,0x0a]
xvfmadd.d $xr5, $xr24, $xr12, $xr10

# CHECK: xvfmsub.s $xr20, $xr0, $xr27, $xr26
# CHECK: encoding: [0x14,0x6c,0x5d,0x0a]
xvfmsub.s $xr20, $xr0, $xr27, $xr26

# CHECK: xvfmsub.d $xr13, $xr8, $xr25, $xr26
# CHECK: encoding: [0x0d,0x65,0x6d,0x0a]
xvfmsub.d $xr13, $xr8, $xr25, $xr26

# CHECK: xvfnmadd.s $xr14, $xr14, $xr22, $xr8
# CHECK: encoding: [0xce,0x59,0x94,0x0a]
xvfnmadd.s $xr14, $xr14, $xr22, $xr8

# CHECK: xvfnmadd.d $xr25, $xr17, $xr0, $xr4
# CHECK: encoding: [0x39,0x02,0xa2,0x0a]
xvfnmadd.d $xr25, $xr17, $xr0, $xr4

# CHECK: xvfnmsub.s $xr11, $xr3, $xr0, $xr11
# CHECK: encoding: [0x6b,0x80,0xd5,0x0a]
xvfnmsub.s $xr11, $xr3, $xr0, $xr11

# CHECK: xvfnmsub.d $xr2, $xr3, $xr24, $xr22
# CHECK: encoding: [0x62,0x60,0xeb,0x0a]
xvfnmsub.d $xr2, $xr3, $xr24, $xr22

# CHECK: vfcmp.ceq.s $vr26, $vr15, $vr27
# CHECK: encoding: [0xfa,0x6d,0x52,0x0c]
vfcmp.ceq.s $vr26, $vr15, $vr27

# CHECK: vfcmp.ceq.d $vr21, $vr21, $vr1
# CHECK: encoding: [0xb5,0x06,0x62,0x0c]
vfcmp.ceq.d $vr21, $vr21, $vr1

# CHECK: xvfcmp.ceq.s $xr8, $xr9, $xr19
# CHECK: encoding: [0x28,0x4d,0x92,0x0c]
xvfcmp.ceq.s $xr8, $xr9, $xr19

# CHECK: xvfcmp.ceq.d $xr25, $xr16, $xr28
# CHECK: encoding: [0x19,0x72,0xa2,0x0c]
xvfcmp.ceq.d $xr25, $xr16, $xr28

# CHECK: vbitsel.v $vr20, $vr23, $vr29, $vr9
# CHECK: encoding: [0xf4,0xf6,0x14,0x0d]
vbitsel.v $vr20, $vr23, $vr29, $vr9

# CHECK: xvbitsel.v $xr7, $xr26, $xr28, $xr23
# CHECK: encoding: [0x47,0xf3,0x2b,0x0d]
xvbitsel.v $xr7, $xr26, $xr28, $xr23

# CHECK: vshuf.b $vr11, $vr4, $vr7, $vr9
# CHECK: encoding: [0x8b,0x9c,0x54,0x0d]
vshuf.b $vr11, $vr4, $vr7, $vr9

# CHECK: xvshuf.b $xr16, $xr21, $xr10, $xr12
# CHECK: encoding: [0xb0,0x2a,0x66,0x0d]
xvshuf.b $xr16, $xr21, $xr10, $xr12

# CHECK: vld $vr28, $r25, -510
# CHECK: encoding: [0x3c,0x0b,0x38,0x2c]
vld $vr28, $r25, -510

# CHECK: vst $vr28, $r14, 527
# CHECK: encoding: [0xdc,0x3d,0x48,0x2c]
vst $vr28, $r14, 527

# CHECK: xvld $xr11, $r6, 512
# CHECK: encoding: [0xcb,0x00,0x88,0x2c]
xvld $xr11, $r6, 512

# CHECK: xvst $xr13, $r7, 1215
# CHECK: encoding: [0xed,0xfc,0xd2,0x2c]
xvst $xr13, $r7, 1215

# CHECK: vldrepl.d $vr8, $r9, -1544
# CHECK: encoding: [0x28,0xfd,0x14,0x30]
vldrepl.d $vr8, $r9, -1544

# CHECK: vldrepl.w $vr2, $r9, -296
# CHECK: encoding: [0x22,0xd9,0x2e,0x30]
vldrepl.w $vr2, $r9, -296

# CHECK: vldrepl.h $vr28, $r23, 252
# CHECK: encoding: [0xfc,0xfa,0x41,0x30]
vldrepl.h $vr28, $r23, 252

# CHECK: vldrepl.b $vr5, $r9, -725
# CHECK: encoding: [0x25,0xad,0xb4,0x30]
vldrepl.b $vr5, $r9, -725

# CHECK: vstelm.d $vr23, $r26, 680, 1
# CHECK: encoding: [0x57,0x57,0x15,0x31]
vstelm.d $vr23, $r26, 680, 1

# CHECK: vstelm.w $vr30, $r23, -372, 1
# CHECK: encoding: [0xfe,0x8e,0x26,0x31]
vstelm.w $vr30, $r23, -372, 1

# CHECK: vstelm.h $vr11, $r6, 30, 7
# CHECK: encoding: [0xcb,0x3c,0x5c,0x31]
vstelm.h $vr11, $r6, 30, 7

# CHECK: vstelm.b $vr3, $r15, 44, 14
# CHECK: encoding: [0xe3,0xb1,0xb8,0x31]
vstelm.b $vr3, $r15, 44, 14

# CHECK: xvldrepl.d $xr24, $r8, 840
# CHECK: encoding: [0x18,0xa5,0x11,0x32]
xvldrepl.d $xr24, $r8, 840

# CHECK: xvldrepl.w $xr14, $r24, 492
# CHECK: encoding: [0x0e,0xef,0x21,0x32]
xvldrepl.w $xr14, $r24, 492

# CHECK: xvldrepl.h $xr18, $r9, 804
# CHECK: encoding: [0x32,0x49,0x46,0x32]
xvldrepl.h $xr18, $r9, 804

# CHECK: xvldrepl.b $xr6, $r29, 811
# CHECK: encoding: [0xa6,0xaf,0x8c,0x32]
xvldrepl.b $xr6, $r29, 811

# CHECK: xvstelm.d $xr21, $sp, -216, 0
# CHECK: encoding: [0x75,0x94,0x13,0x33]
xvstelm.d $xr21, $sp, -216, 0

# CHECK: xvstelm.w $xr31, $r29, 424, 0
# CHECK: encoding: [0xbf,0xab,0x21,0x33]
xvstelm.w $xr31, $r29, 424, 0

# CHECK: xvstelm.h $xr14, $r7, 90, 4
# CHECK: encoding: [0xee,0xb4,0x50,0x33]
xvstelm.h $xr14, $r7, 90, 4

# CHECK: xvstelm.b $xr21, $r24, -5, 8
# CHECK: encoding: [0x15,0xef,0xa3,0x33]
xvstelm.b $xr21, $r24, -5, 8

# CHECK: vldx $vr29, $r4, $r30
# CHECK: encoding: [0x9d,0x78,0x40,0x38]
vldx $vr29, $r4, $r30

# CHECK: vstx $vr31, $r28, $r29
# CHECK: encoding: [0x9f,0x77,0x44,0x38]
vstx $vr31, $r28, $r29

# CHECK: xvldx $xr8, $r30, $r24
# CHECK: encoding: [0xc8,0x63,0x48,0x38]
xvldx $xr8, $r30, $r24

# CHECK: xvstx $xr2, $r9, $r29
# CHECK: encoding: [0x22,0x75,0x4c,0x38]
xvstx $xr2, $r9, $r29

# CHECK: vseq.b $vr28, $vr26, $vr23
# CHECK: encoding: [0x5c,0x5f,0x00,0x70]
vseq.b $vr28, $vr26, $vr23

# CHECK: vseq.h $vr10, $vr1, $vr5
# CHECK: encoding: [0x2a,0x94,0x00,0x70]
vseq.h $vr10, $vr1, $vr5

# CHECK: vseq.w $vr3, $vr27, $vr17
# CHECK: encoding: [0x63,0x47,0x01,0x70]
vseq.w $vr3, $vr27, $vr17

# CHECK: vseq.d $vr5, $vr3, $vr3
# CHECK: encoding: [0x65,0x8c,0x01,0x70]
vseq.d $vr5, $vr3, $vr3

# CHECK: vsle.b $vr29, $vr9, $vr7
# CHECK: encoding: [0x3d,0x1d,0x02,0x70]
vsle.b $vr29, $vr9, $vr7

# CHECK: vsle.h $vr5, $vr24, $vr9
# CHECK: encoding: [0x05,0xa7,0x02,0x70]
vsle.h $vr5, $vr24, $vr9

# CHECK: vsle.w $vr17, $vr30, $vr20
# CHECK: encoding: [0xd1,0x53,0x03,0x70]
vsle.w $vr17, $vr30, $vr20

# CHECK: vsle.d $vr27, $vr6, $vr13
# CHECK: encoding: [0xdb,0xb4,0x03,0x70]
vsle.d $vr27, $vr6, $vr13

# CHECK: vsle.bu $vr30, $vr11, $vr10
# CHECK: encoding: [0x7e,0x29,0x04,0x70]
vsle.bu $vr30, $vr11, $vr10

# CHECK: vsle.hu $vr19, $vr29, $vr31
# CHECK: encoding: [0xb3,0xff,0x04,0x70]
vsle.hu $vr19, $vr29, $vr31

# CHECK: vsle.wu $vr16, $vr18, $vr20
# CHECK: encoding: [0x50,0x52,0x05,0x70]
vsle.wu $vr16, $vr18, $vr20

# CHECK: vsle.du $vr31, $vr17, $vr8
# CHECK: encoding: [0x3f,0xa2,0x05,0x70]
vsle.du $vr31, $vr17, $vr8

# CHECK: vslt.b $vr26, $vr7, $vr5
# CHECK: encoding: [0xfa,0x14,0x06,0x70]
vslt.b $vr26, $vr7, $vr5

# CHECK: vslt.h $vr14, $vr2, $vr20
# CHECK: encoding: [0x4e,0xd0,0x06,0x70]
vslt.h $vr14, $vr2, $vr20

# CHECK: vslt.w $vr14, $vr5, $vr25
# CHECK: encoding: [0xae,0x64,0x07,0x70]
vslt.w $vr14, $vr5, $vr25

# CHECK: vslt.d $vr26, $vr9, $vr25
# CHECK: encoding: [0x3a,0xe5,0x07,0x70]
vslt.d $vr26, $vr9, $vr25

# CHECK: vslt.bu $vr31, $vr18, $vr14
# CHECK: encoding: [0x5f,0x3a,0x08,0x70]
vslt.bu $vr31, $vr18, $vr14

# CHECK: vslt.hu $vr5, $vr15, $vr5
# CHECK: encoding: [0xe5,0x95,0x08,0x70]
vslt.hu $vr5, $vr15, $vr5

# CHECK: vslt.wu $vr31, $vr28, $vr13
# CHECK: encoding: [0x9f,0x37,0x09,0x70]
vslt.wu $vr31, $vr28, $vr13

# CHECK: vslt.du $vr11, $vr19, $vr22
# CHECK: encoding: [0x6b,0xda,0x09,0x70]
vslt.du $vr11, $vr19, $vr22

# CHECK: vadd.b $vr26, $vr20, $vr31
# CHECK: encoding: [0x9a,0x7e,0x0a,0x70]
vadd.b $vr26, $vr20, $vr31

# CHECK: vadd.h $vr11, $vr25, $vr29
# CHECK: encoding: [0x2b,0xf7,0x0a,0x70]
vadd.h $vr11, $vr25, $vr29

# CHECK: vadd.w $vr7, $vr25, $vr13
# CHECK: encoding: [0x27,0x37,0x0b,0x70]
vadd.w $vr7, $vr25, $vr13

# CHECK: vadd.d $vr16, $vr13, $vr16
# CHECK: encoding: [0xb0,0xc1,0x0b,0x70]
vadd.d $vr16, $vr13, $vr16

# CHECK: vsub.b $vr12, $vr3, $vr21
# CHECK: encoding: [0x6c,0x54,0x0c,0x70]
vsub.b $vr12, $vr3, $vr21

# CHECK: vsub.h $vr15, $vr13, $vr25
# CHECK: encoding: [0xaf,0xe5,0x0c,0x70]
vsub.h $vr15, $vr13, $vr25

# CHECK: vsub.w $vr20, $vr16, $vr25
# CHECK: encoding: [0x14,0x66,0x0d,0x70]
vsub.w $vr20, $vr16, $vr25

# CHECK: vsub.d $vr19, $vr3, $vr7
# CHECK: encoding: [0x73,0x9c,0x0d,0x70]
vsub.d $vr19, $vr3, $vr7

# CHECK: vsadd.b $vr14, $vr30, $vr5
# CHECK: encoding: [0xce,0x17,0x46,0x70]
vsadd.b $vr14, $vr30, $vr5

# CHECK: vsadd.h $vr10, $vr1, $vr15
# CHECK: encoding: [0x2a,0xbc,0x46,0x70]
vsadd.h $vr10, $vr1, $vr15

# CHECK: vsadd.w $vr19, $vr31, $vr10
# CHECK: encoding: [0xf3,0x2b,0x47,0x70]
vsadd.w $vr19, $vr31, $vr10

# CHECK: vsadd.d $vr26, $vr19, $vr28
# CHECK: encoding: [0x7a,0xf2,0x47,0x70]
vsadd.d $vr26, $vr19, $vr28

# CHECK: vssub.b $vr24, $vr3, $vr7
# CHECK: encoding: [0x78,0x1c,0x48,0x70]
vssub.b $vr24, $vr3, $vr7

# CHECK: vssub.h $vr31, $vr4, $vr24
# CHECK: encoding: [0x9f,0xe0,0x48,0x70]
vssub.h $vr31, $vr4, $vr24

# CHECK: vssub.w $vr29, $vr27, $vr12
# CHECK: encoding: [0x7d,0x33,0x49,0x70]
vssub.w $vr29, $vr27, $vr12

# CHECK: vssub.d $vr23, $vr16, $vr9
# CHECK: encoding: [0x17,0xa6,0x49,0x70]
vssub.d $vr23, $vr16, $vr9

# CHECK: vsadd.bu $vr26, $vr29, $vr4
# CHECK: encoding: [0xba,0x13,0x4a,0x70]
vsadd.bu $vr26, $vr29, $vr4

# CHECK: vsadd.hu $vr15, $vr7, $vr9
# CHECK: encoding: [0xef,0xa4,0x4a,0x70]
vsadd.hu $vr15, $vr7, $vr9

# CHECK: vsadd.wu $vr13, $vr18, $vr16
# CHECK: encoding: [0x4d,0x42,0x4b,0x70]
vsadd.wu $vr13, $vr18, $vr16

# CHECK: vsadd.du $vr4, $vr5, $vr0
# CHECK: encoding: [0xa4,0x80,0x4b,0x70]
vsadd.du $vr4, $vr5, $vr0

# CHECK: vssub.bu $vr27, $vr17, $vr13
# CHECK: encoding: [0x3b,0x36,0x4c,0x70]
vssub.bu $vr27, $vr17, $vr13

# CHECK: vssub.hu $vr5, $vr8, $vr1
# CHECK: encoding: [0x05,0x85,0x4c,0x70]
vssub.hu $vr5, $vr8, $vr1

# CHECK: vssub.wu $vr14, $vr8, $vr22
# CHECK: encoding: [0x0e,0x59,0x4d,0x70]
vssub.wu $vr14, $vr8, $vr22

# CHECK: vssub.du $vr17, $vr9, $vr8
# CHECK: encoding: [0x31,0xa1,0x4d,0x70]
vssub.du $vr17, $vr9, $vr8

# CHECK: vhaddw.h.b $vr23, $vr19, $vr2
# CHECK: encoding: [0x77,0x0a,0x54,0x70]
vhaddw.h.b $vr23, $vr19, $vr2

# CHECK: vhaddw.w.h $vr26, $vr16, $vr26
# CHECK: encoding: [0x1a,0xea,0x54,0x70]
vhaddw.w.h $vr26, $vr16, $vr26

# CHECK: vhaddw.d.w $vr0, $vr31, $vr27
# CHECK: encoding: [0xe0,0x6f,0x55,0x70]
vhaddw.d.w $vr0, $vr31, $vr27

# CHECK: vhaddw.q.d $vr25, $vr13, $vr25
# CHECK: encoding: [0xb9,0xe5,0x55,0x70]
vhaddw.q.d $vr25, $vr13, $vr25

# CHECK: vhsubw.h.b $vr9, $vr23, $vr5
# CHECK: encoding: [0xe9,0x16,0x56,0x70]
vhsubw.h.b $vr9, $vr23, $vr5

# CHECK: vhsubw.w.h $vr15, $vr29, $vr26
# CHECK: encoding: [0xaf,0xeb,0x56,0x70]
vhsubw.w.h $vr15, $vr29, $vr26

# CHECK: vhsubw.d.w $vr0, $vr28, $vr18
# CHECK: encoding: [0x80,0x4b,0x57,0x70]
vhsubw.d.w $vr0, $vr28, $vr18

# CHECK: vhsubw.q.d $vr14, $vr25, $vr8
# CHECK: encoding: [0x2e,0xa3,0x57,0x70]
vhsubw.q.d $vr14, $vr25, $vr8

# CHECK: vhaddw.hu.bu $vr1, $vr16, $vr21
# CHECK: encoding: [0x01,0x56,0x58,0x70]
vhaddw.hu.bu $vr1, $vr16, $vr21

# CHECK: vhaddw.wu.hu $vr28, $vr21, $vr29
# CHECK: encoding: [0xbc,0xf6,0x58,0x70]
vhaddw.wu.hu $vr28, $vr21, $vr29

# CHECK: vhaddw.du.wu $vr29, $vr20, $vr16
# CHECK: encoding: [0x9d,0x42,0x59,0x70]
vhaddw.du.wu $vr29, $vr20, $vr16

# CHECK: vhaddw.qu.du $vr2, $vr10, $vr28
# CHECK: encoding: [0x42,0xf1,0x59,0x70]
vhaddw.qu.du $vr2, $vr10, $vr28

# CHECK: vhsubw.hu.bu $vr31, $vr3, $vr30
# CHECK: encoding: [0x7f,0x78,0x5a,0x70]
vhsubw.hu.bu $vr31, $vr3, $vr30

# CHECK: vhsubw.wu.hu $vr5, $vr9, $vr11
# CHECK: encoding: [0x25,0xad,0x5a,0x70]
vhsubw.wu.hu $vr5, $vr9, $vr11

# CHECK: vhsubw.du.wu $vr23, $vr31, $vr22
# CHECK: encoding: [0xf7,0x5b,0x5b,0x70]
vhsubw.du.wu $vr23, $vr31, $vr22

# CHECK: vhsubw.qu.du $vr4, $vr28, $vr18
# CHECK: encoding: [0x84,0xcb,0x5b,0x70]
vhsubw.qu.du $vr4, $vr28, $vr18

# CHECK: vadda.b $vr18, $vr13, $vr11
# CHECK: encoding: [0xb2,0x2d,0x5c,0x70]
vadda.b $vr18, $vr13, $vr11

# CHECK: vadda.h $vr17, $vr14, $vr12
# CHECK: encoding: [0xd1,0xb1,0x5c,0x70]
vadda.h $vr17, $vr14, $vr12

# CHECK: vadda.w $vr22, $vr11, $vr3
# CHECK: encoding: [0x76,0x0d,0x5d,0x70]
vadda.w $vr22, $vr11, $vr3

# CHECK: vadda.d $vr24, $vr24, $vr15
# CHECK: encoding: [0x18,0xbf,0x5d,0x70]
vadda.d $vr24, $vr24, $vr15

# CHECK: vabsd.b $vr23, $vr19, $vr17
# CHECK: encoding: [0x77,0x46,0x60,0x70]
vabsd.b $vr23, $vr19, $vr17

# CHECK: vabsd.h $vr14, $vr31, $vr13
# CHECK: encoding: [0xee,0xb7,0x60,0x70]
vabsd.h $vr14, $vr31, $vr13

# CHECK: vabsd.w $vr24, $vr1, $vr9
# CHECK: encoding: [0x38,0x24,0x61,0x70]
vabsd.w $vr24, $vr1, $vr9

# CHECK: vabsd.d $vr31, $vr20, $vr0
# CHECK: encoding: [0x9f,0x82,0x61,0x70]
vabsd.d $vr31, $vr20, $vr0

# CHECK: vabsd.bu $vr23, $vr12, $vr29
# CHECK: encoding: [0x97,0x75,0x62,0x70]
vabsd.bu $vr23, $vr12, $vr29

# CHECK: vabsd.hu $vr18, $vr19, $vr1
# CHECK: encoding: [0x72,0x86,0x62,0x70]
vabsd.hu $vr18, $vr19, $vr1

# CHECK: vabsd.wu $vr13, $vr21, $vr28
# CHECK: encoding: [0xad,0x72,0x63,0x70]
vabsd.wu $vr13, $vr21, $vr28

# CHECK: vabsd.du $vr16, $vr26, $vr11
# CHECK: encoding: [0x50,0xaf,0x63,0x70]
vabsd.du $vr16, $vr26, $vr11

# CHECK: vavg.b $vr1, $vr21, $vr27
# CHECK: encoding: [0xa1,0x6e,0x64,0x70]
vavg.b $vr1, $vr21, $vr27

# CHECK: vavg.h $vr20, $vr26, $vr15
# CHECK: encoding: [0x54,0xbf,0x64,0x70]
vavg.h $vr20, $vr26, $vr15

# CHECK: vavg.w $vr29, $vr18, $vr3
# CHECK: encoding: [0x5d,0x0e,0x65,0x70]
vavg.w $vr29, $vr18, $vr3

# CHECK: vavg.d $vr19, $vr15, $vr31
# CHECK: encoding: [0xf3,0xfd,0x65,0x70]
vavg.d $vr19, $vr15, $vr31

# CHECK: vavg.bu $vr11, $vr11, $vr17
# CHECK: encoding: [0x6b,0x45,0x66,0x70]
vavg.bu $vr11, $vr11, $vr17

# CHECK: vavg.hu $vr30, $vr28, $vr13
# CHECK: encoding: [0x9e,0xb7,0x66,0x70]
vavg.hu $vr30, $vr28, $vr13

# CHECK: vavg.wu $vr7, $vr7, $vr10
# CHECK: encoding: [0xe7,0x28,0x67,0x70]
vavg.wu $vr7, $vr7, $vr10

# CHECK: vavg.du $vr25, $vr7, $vr12
# CHECK: encoding: [0xf9,0xb0,0x67,0x70]
vavg.du $vr25, $vr7, $vr12

# CHECK: vavgr.b $vr29, $vr13, $vr7
# CHECK: encoding: [0xbd,0x1d,0x68,0x70]
vavgr.b $vr29, $vr13, $vr7

# CHECK: vavgr.h $vr5, $vr28, $vr19
# CHECK: encoding: [0x85,0xcf,0x68,0x70]
vavgr.h $vr5, $vr28, $vr19

# CHECK: vavgr.w $vr19, $vr15, $vr14
# CHECK: encoding: [0xf3,0x39,0x69,0x70]
vavgr.w $vr19, $vr15, $vr14

# CHECK: vavgr.d $vr3, $vr0, $vr2
# CHECK: encoding: [0x03,0x88,0x69,0x70]
vavgr.d $vr3, $vr0, $vr2

# CHECK: vavgr.bu $vr23, $vr11, $vr31
# CHECK: encoding: [0x77,0x7d,0x6a,0x70]
vavgr.bu $vr23, $vr11, $vr31

# CHECK: vavgr.hu $vr25, $vr19, $vr8
# CHECK: encoding: [0x79,0xa2,0x6a,0x70]
vavgr.hu $vr25, $vr19, $vr8

# CHECK: vavgr.wu $vr30, $vr25, $vr12
# CHECK: encoding: [0x3e,0x33,0x6b,0x70]
vavgr.wu $vr30, $vr25, $vr12

# CHECK: vavgr.du $vr25, $vr20, $vr25
# CHECK: encoding: [0x99,0xe6,0x6b,0x70]
vavgr.du $vr25, $vr20, $vr25

# CHECK: vmax.b $vr28, $vr26, $vr26
# CHECK: encoding: [0x5c,0x6b,0x70,0x70]
vmax.b $vr28, $vr26, $vr26

# CHECK: vmax.h $vr8, $vr13, $vr11
# CHECK: encoding: [0xa8,0xad,0x70,0x70]
vmax.h $vr8, $vr13, $vr11

# CHECK: vmax.w $vr21, $vr28, $vr31
# CHECK: encoding: [0x95,0x7f,0x71,0x70]
vmax.w $vr21, $vr28, $vr31

# CHECK: vmax.d $vr1, $vr30, $vr26
# CHECK: encoding: [0xc1,0xeb,0x71,0x70]
vmax.d $vr1, $vr30, $vr26

# CHECK: vmin.b $vr10, $vr14, $vr9
# CHECK: encoding: [0xca,0x25,0x72,0x70]
vmin.b $vr10, $vr14, $vr9

# CHECK: vmin.h $vr10, $vr11, $vr21
# CHECK: encoding: [0x6a,0xd5,0x72,0x70]
vmin.h $vr10, $vr11, $vr21

# CHECK: vmin.w $vr26, $vr0, $vr12
# CHECK: encoding: [0x1a,0x30,0x73,0x70]
vmin.w $vr26, $vr0, $vr12

# CHECK: vmin.d $vr19, $vr18, $vr0
# CHECK: encoding: [0x53,0x82,0x73,0x70]
vmin.d $vr19, $vr18, $vr0

# CHECK: vmax.bu $vr2, $vr25, $vr28
# CHECK: encoding: [0x22,0x73,0x74,0x70]
vmax.bu $vr2, $vr25, $vr28

# CHECK: vmax.hu $vr9, $vr22, $vr30
# CHECK: encoding: [0xc9,0xfa,0x74,0x70]
vmax.hu $vr9, $vr22, $vr30

# CHECK: vmax.wu $vr21, $vr25, $vr27
# CHECK: encoding: [0x35,0x6f,0x75,0x70]
vmax.wu $vr21, $vr25, $vr27

# CHECK: vmax.du $vr3, $vr14, $vr25
# CHECK: encoding: [0xc3,0xe5,0x75,0x70]
vmax.du $vr3, $vr14, $vr25

# CHECK: vmin.bu $vr24, $vr7, $vr27
# CHECK: encoding: [0xf8,0x6c,0x76,0x70]
vmin.bu $vr24, $vr7, $vr27

# CHECK: vmin.hu $vr18, $vr28, $vr29
# CHECK: encoding: [0x92,0xf7,0x76,0x70]
vmin.hu $vr18, $vr28, $vr29

# CHECK: vmin.wu $vr26, $vr4, $vr2
# CHECK: encoding: [0x9a,0x08,0x77,0x70]
vmin.wu $vr26, $vr4, $vr2

# CHECK: vmin.du $vr13, $vr0, $vr4
# CHECK: encoding: [0x0d,0x90,0x77,0x70]
vmin.du $vr13, $vr0, $vr4

# CHECK: vmul.b $vr1, $vr21, $vr23
# CHECK: encoding: [0xa1,0x5e,0x84,0x70]
vmul.b $vr1, $vr21, $vr23

# CHECK: vmul.h $vr9, $vr21, $vr25
# CHECK: encoding: [0xa9,0xe6,0x84,0x70]
vmul.h $vr9, $vr21, $vr25

# CHECK: vmul.w $vr16, $vr8, $vr28
# CHECK: encoding: [0x10,0x71,0x85,0x70]
vmul.w $vr16, $vr8, $vr28

# CHECK: vmul.d $vr4, $vr17, $vr11
# CHECK: encoding: [0x24,0xae,0x85,0x70]
vmul.d $vr4, $vr17, $vr11

# CHECK: vmuh.b $vr12, $vr24, $vr8
# CHECK: encoding: [0x0c,0x23,0x86,0x70]
vmuh.b $vr12, $vr24, $vr8

# CHECK: vmuh.h $vr6, $vr21, $vr24
# CHECK: encoding: [0xa6,0xe2,0x86,0x70]
vmuh.h $vr6, $vr21, $vr24

# CHECK: vmuh.w $vr11, $vr29, $vr30
# CHECK: encoding: [0xab,0x7b,0x87,0x70]
vmuh.w $vr11, $vr29, $vr30

# CHECK: vmuh.d $vr1, $vr17, $vr25
# CHECK: encoding: [0x21,0xe6,0x87,0x70]
vmuh.d $vr1, $vr17, $vr25

# CHECK: vmuh.bu $vr29, $vr29, $vr10
# CHECK: encoding: [0xbd,0x2b,0x88,0x70]
vmuh.bu $vr29, $vr29, $vr10

# CHECK: vmuh.hu $vr24, $vr9, $vr21
# CHECK: encoding: [0x38,0xd5,0x88,0x70]
vmuh.hu $vr24, $vr9, $vr21

# CHECK: vmuh.wu $vr15, $vr20, $vr19
# CHECK: encoding: [0x8f,0x4e,0x89,0x70]
vmuh.wu $vr15, $vr20, $vr19

# CHECK: vmuh.du $vr0, $vr28, $vr1
# CHECK: encoding: [0x80,0x87,0x89,0x70]
vmuh.du $vr0, $vr28, $vr1

# CHECK: vmadd.b $vr27, $vr0, $vr4
# CHECK: encoding: [0x1b,0x10,0xa8,0x70]
vmadd.b $vr27, $vr0, $vr4

# CHECK: vmadd.h $vr19, $vr20, $vr28
# CHECK: encoding: [0x93,0xf2,0xa8,0x70]
vmadd.h $vr19, $vr20, $vr28

# CHECK: vmadd.w $vr15, $vr7, $vr3
# CHECK: encoding: [0xef,0x0c,0xa9,0x70]
vmadd.w $vr15, $vr7, $vr3

# CHECK: vmadd.d $vr25, $vr25, $vr30
# CHECK: encoding: [0x39,0xfb,0xa9,0x70]
vmadd.d $vr25, $vr25, $vr30

# CHECK: vmsub.b $vr24, $vr25, $vr26
# CHECK: encoding: [0x38,0x6b,0xaa,0x70]
vmsub.b $vr24, $vr25, $vr26

# CHECK: vmsub.h $vr12, $vr0, $vr13
# CHECK: encoding: [0x0c,0xb4,0xaa,0x70]
vmsub.h $vr12, $vr0, $vr13

# CHECK: vmsub.w $vr26, $vr16, $vr24
# CHECK: encoding: [0x1a,0x62,0xab,0x70]
vmsub.w $vr26, $vr16, $vr24

# CHECK: vmsub.d $vr13, $vr10, $vr8
# CHECK: encoding: [0x4d,0xa1,0xab,0x70]
vmsub.d $vr13, $vr10, $vr8

# CHECK: vdiv.b $vr18, $vr28, $vr21
# CHECK: encoding: [0x92,0x57,0xe0,0x70]
vdiv.b $vr18, $vr28, $vr21

# CHECK: vdiv.h $vr17, $vr24, $vr1
# CHECK: encoding: [0x11,0x87,0xe0,0x70]
vdiv.h $vr17, $vr24, $vr1

# CHECK: vdiv.w $vr3, $vr10, $vr22
# CHECK: encoding: [0x43,0x59,0xe1,0x70]
vdiv.w $vr3, $vr10, $vr22

# CHECK: vdiv.d $vr15, $vr13, $vr8
# CHECK: encoding: [0xaf,0xa1,0xe1,0x70]
vdiv.d $vr15, $vr13, $vr8

# CHECK: vmod.b $vr19, $vr25, $vr20
# CHECK: encoding: [0x33,0x53,0xe2,0x70]
vmod.b $vr19, $vr25, $vr20

# CHECK: vmod.h $vr2, $vr24, $vr22
# CHECK: encoding: [0x02,0xdb,0xe2,0x70]
vmod.h $vr2, $vr24, $vr22

# CHECK: vmod.w $vr31, $vr18, $vr0
# CHECK: encoding: [0x5f,0x02,0xe3,0x70]
vmod.w $vr31, $vr18, $vr0

# CHECK: vmod.d $vr31, $vr0, $vr2
# CHECK: encoding: [0x1f,0x88,0xe3,0x70]
vmod.d $vr31, $vr0, $vr2

# CHECK: vdiv.bu $vr15, $vr4, $vr3
# CHECK: encoding: [0x8f,0x0c,0xe4,0x70]
vdiv.bu $vr15, $vr4, $vr3

# CHECK: vdiv.hu $vr17, $vr7, $vr29
# CHECK: encoding: [0xf1,0xf4,0xe4,0x70]
vdiv.hu $vr17, $vr7, $vr29

# CHECK: vdiv.wu $vr27, $vr10, $vr3
# CHECK: encoding: [0x5b,0x0d,0xe5,0x70]
vdiv.wu $vr27, $vr10, $vr3

# CHECK: vdiv.du $vr8, $vr24, $vr26
# CHECK: encoding: [0x08,0xeb,0xe5,0x70]
vdiv.du $vr8, $vr24, $vr26

# CHECK: vmod.bu $vr10, $vr22, $vr24
# CHECK: encoding: [0xca,0x62,0xe6,0x70]
vmod.bu $vr10, $vr22, $vr24

# CHECK: vmod.hu $vr19, $vr31, $vr24
# CHECK: encoding: [0xf3,0xe3,0xe6,0x70]
vmod.hu $vr19, $vr31, $vr24

# CHECK: vmod.wu $vr26, $vr24, $vr13
# CHECK: encoding: [0x1a,0x37,0xe7,0x70]
vmod.wu $vr26, $vr24, $vr13

# CHECK: vmod.du $vr20, $vr19, $vr10
# CHECK: encoding: [0x74,0xaa,0xe7,0x70]
vmod.du $vr20, $vr19, $vr10

# CHECK: vsll.b $vr28, $vr18, $vr30
# CHECK: encoding: [0x5c,0x7a,0xe8,0x70]
vsll.b $vr28, $vr18, $vr30

# CHECK: vsll.h $vr22, $vr4, $vr30
# CHECK: encoding: [0x96,0xf8,0xe8,0x70]
vsll.h $vr22, $vr4, $vr30

# CHECK: vsll.w $vr1, $vr25, $vr8
# CHECK: encoding: [0x21,0x23,0xe9,0x70]
vsll.w $vr1, $vr25, $vr8

# CHECK: vsll.d $vr31, $vr18, $vr15
# CHECK: encoding: [0x5f,0xbe,0xe9,0x70]
vsll.d $vr31, $vr18, $vr15

# CHECK: vsrl.b $vr5, $vr12, $vr16
# CHECK: encoding: [0x85,0x41,0xea,0x70]
vsrl.b $vr5, $vr12, $vr16

# CHECK: vsrl.h $vr9, $vr5, $vr28
# CHECK: encoding: [0xa9,0xf0,0xea,0x70]
vsrl.h $vr9, $vr5, $vr28

# CHECK: vsrl.w $vr30, $vr16, $vr1
# CHECK: encoding: [0x1e,0x06,0xeb,0x70]
vsrl.w $vr30, $vr16, $vr1

# CHECK: vsrl.d $vr28, $vr23, $vr27
# CHECK: encoding: [0xfc,0xee,0xeb,0x70]
vsrl.d $vr28, $vr23, $vr27

# CHECK: vsra.b $vr15, $vr17, $vr25
# CHECK: encoding: [0x2f,0x66,0xec,0x70]
vsra.b $vr15, $vr17, $vr25

# CHECK: vsra.h $vr0, $vr8, $vr5
# CHECK: encoding: [0x00,0x95,0xec,0x70]
vsra.h $vr0, $vr8, $vr5

# CHECK: vsra.w $vr29, $vr9, $vr7
# CHECK: encoding: [0x3d,0x1d,0xed,0x70]
vsra.w $vr29, $vr9, $vr7

# CHECK: vsra.d $vr22, $vr3, $vr19
# CHECK: encoding: [0x76,0xcc,0xed,0x70]
vsra.d $vr22, $vr3, $vr19

# CHECK: vrotr.b $vr8, $vr16, $vr8
# CHECK: encoding: [0x08,0x22,0xee,0x70]
vrotr.b $vr8, $vr16, $vr8

# CHECK: vrotr.h $vr14, $vr5, $vr11
# CHECK: encoding: [0xae,0xac,0xee,0x70]
vrotr.h $vr14, $vr5, $vr11

# CHECK: vrotr.w $vr17, $vr28, $vr25
# CHECK: encoding: [0x91,0x67,0xef,0x70]
vrotr.w $vr17, $vr28, $vr25

# CHECK: vrotr.d $vr18, $vr28, $vr19
# CHECK: encoding: [0x92,0xcf,0xef,0x70]
vrotr.d $vr18, $vr28, $vr19

# CHECK: vsrlr.b $vr1, $vr27, $vr17
# CHECK: encoding: [0x61,0x47,0xf0,0x70]
vsrlr.b $vr1, $vr27, $vr17

# CHECK: vsrlr.h $vr26, $vr14, $vr10
# CHECK: encoding: [0xda,0xa9,0xf0,0x70]
vsrlr.h $vr26, $vr14, $vr10

# CHECK: vsrlr.w $vr3, $vr29, $vr24
# CHECK: encoding: [0xa3,0x63,0xf1,0x70]
vsrlr.w $vr3, $vr29, $vr24

# CHECK: vsrlr.d $vr23, $vr4, $vr10
# CHECK: encoding: [0x97,0xa8,0xf1,0x70]
vsrlr.d $vr23, $vr4, $vr10

# CHECK: vsrar.b $vr25, $vr2, $vr21
# CHECK: encoding: [0x59,0x54,0xf2,0x70]
vsrar.b $vr25, $vr2, $vr21

# CHECK: vsrar.h $vr4, $vr11, $vr20
# CHECK: encoding: [0x64,0xd1,0xf2,0x70]
vsrar.h $vr4, $vr11, $vr20

# CHECK: vsrar.w $vr11, $vr21, $vr29
# CHECK: encoding: [0xab,0x76,0xf3,0x70]
vsrar.w $vr11, $vr21, $vr29

# CHECK: vsrar.d $vr29, $vr5, $vr2
# CHECK: encoding: [0xbd,0x88,0xf3,0x70]
vsrar.d $vr29, $vr5, $vr2

# CHECK: vsrln.b.h $vr24, $vr14, $vr29
# CHECK: encoding: [0xd8,0xf5,0xf4,0x70]
vsrln.b.h $vr24, $vr14, $vr29

# CHECK: vsrln.h.w $vr26, $vr22, $vr16
# CHECK: encoding: [0xda,0x42,0xf5,0x70]
vsrln.h.w $vr26, $vr22, $vr16

# CHECK: vsrln.w.d $vr17, $vr31, $vr2
# CHECK: encoding: [0xf1,0x8b,0xf5,0x70]
vsrln.w.d $vr17, $vr31, $vr2

# CHECK: vsran.b.h $vr31, $vr0, $vr23
# CHECK: encoding: [0x1f,0xdc,0xf6,0x70]
vsran.b.h $vr31, $vr0, $vr23

# CHECK: vsran.h.w $vr20, $vr12, $vr29
# CHECK: encoding: [0x94,0x75,0xf7,0x70]
vsran.h.w $vr20, $vr12, $vr29

# CHECK: vsran.w.d $vr2, $vr1, $vr2
# CHECK: encoding: [0x22,0x88,0xf7,0x70]
vsran.w.d $vr2, $vr1, $vr2

# CHECK: vsrlrn.b.h $vr19, $vr28, $vr0
# CHECK: encoding: [0x93,0x83,0xf8,0x70]
vsrlrn.b.h $vr19, $vr28, $vr0

# CHECK: vsrlrn.h.w $vr23, $vr29, $vr14
# CHECK: encoding: [0xb7,0x3b,0xf9,0x70]
vsrlrn.h.w $vr23, $vr29, $vr14

# CHECK: vsrlrn.w.d $vr5, $vr26, $vr5
# CHECK: encoding: [0x45,0x97,0xf9,0x70]
vsrlrn.w.d $vr5, $vr26, $vr5

# CHECK: vsrarn.b.h $vr17, $vr15, $vr7
# CHECK: encoding: [0xf1,0x9d,0xfa,0x70]
vsrarn.b.h $vr17, $vr15, $vr7

# CHECK: vsrarn.h.w $vr12, $vr10, $vr29
# CHECK: encoding: [0x4c,0x75,0xfb,0x70]
vsrarn.h.w $vr12, $vr10, $vr29

# CHECK: vsrarn.w.d $vr24, $vr26, $vr27
# CHECK: encoding: [0x58,0xef,0xfb,0x70]
vsrarn.w.d $vr24, $vr26, $vr27

# CHECK: vssrln.b.h $vr1, $vr12, $vr14
# CHECK: encoding: [0x81,0xb9,0xfc,0x70]
vssrln.b.h $vr1, $vr12, $vr14

# CHECK: vssrln.h.w $vr11, $vr8, $vr18
# CHECK: encoding: [0x0b,0x49,0xfd,0x70]
vssrln.h.w $vr11, $vr8, $vr18

# CHECK: vssrln.w.d $vr31, $vr15, $vr6
# CHECK: encoding: [0xff,0x99,0xfd,0x70]
vssrln.w.d $vr31, $vr15, $vr6

# CHECK: vssran.b.h $vr13, $vr5, $vr24
# CHECK: encoding: [0xad,0xe0,0xfe,0x70]
vssran.b.h $vr13, $vr5, $vr24

# CHECK: vssran.h.w $vr4, $vr26, $vr7
# CHECK: encoding: [0x44,0x1f,0xff,0x70]
vssran.h.w $vr4, $vr26, $vr7

# CHECK: vssran.w.d $vr25, $vr10, $vr6
# CHECK: encoding: [0x59,0x99,0xff,0x70]
vssran.w.d $vr25, $vr10, $vr6

# CHECK: vssrlrn.b.h $vr28, $vr28, $vr6
# CHECK: encoding: [0x9c,0x9b,0x00,0x71]
vssrlrn.b.h $vr28, $vr28, $vr6

# CHECK: vssrlrn.h.w $vr15, $vr23, $vr17
# CHECK: encoding: [0xef,0x46,0x01,0x71]
vssrlrn.h.w $vr15, $vr23, $vr17

# CHECK: vssrlrn.w.d $vr12, $vr9, $vr2
# CHECK: encoding: [0x2c,0x89,0x01,0x71]
vssrlrn.w.d $vr12, $vr9, $vr2

# CHECK: vssrarn.b.h $vr1, $vr25, $vr17
# CHECK: encoding: [0x21,0xc7,0x02,0x71]
vssrarn.b.h $vr1, $vr25, $vr17

# CHECK: vssrarn.h.w $vr3, $vr9, $vr23
# CHECK: encoding: [0x23,0x5d,0x03,0x71]
vssrarn.h.w $vr3, $vr9, $vr23

# CHECK: vssrarn.w.d $vr14, $vr9, $vr27
# CHECK: encoding: [0x2e,0xed,0x03,0x71]
vssrarn.w.d $vr14, $vr9, $vr27

# CHECK: vssrln.bu.h $vr16, $vr24, $vr15
# CHECK: encoding: [0x10,0xbf,0x04,0x71]
vssrln.bu.h $vr16, $vr24, $vr15

# CHECK: vssrln.hu.w $vr21, $vr23, $vr30
# CHECK: encoding: [0xf5,0x7a,0x05,0x71]
vssrln.hu.w $vr21, $vr23, $vr30

# CHECK: vssrln.wu.d $vr12, $vr8, $vr30
# CHECK: encoding: [0x0c,0xf9,0x05,0x71]
vssrln.wu.d $vr12, $vr8, $vr30

# CHECK: vssran.bu.h $vr5, $vr18, $vr12
# CHECK: encoding: [0x45,0xb2,0x06,0x71]
vssran.bu.h $vr5, $vr18, $vr12

# CHECK: vssran.hu.w $vr0, $vr7, $vr28
# CHECK: encoding: [0xe0,0x70,0x07,0x71]
vssran.hu.w $vr0, $vr7, $vr28

# CHECK: vssran.wu.d $vr5, $vr11, $vr8
# CHECK: encoding: [0x65,0xa1,0x07,0x71]
vssran.wu.d $vr5, $vr11, $vr8

# CHECK: vssrlrn.bu.h $vr18, $vr25, $vr3
# CHECK: encoding: [0x32,0x8f,0x08,0x71]
vssrlrn.bu.h $vr18, $vr25, $vr3

# CHECK: vssrlrn.hu.w $vr19, $vr1, $vr20
# CHECK: encoding: [0x33,0x50,0x09,0x71]
vssrlrn.hu.w $vr19, $vr1, $vr20

# CHECK: vssrlrn.wu.d $vr6, $vr30, $vr18
# CHECK: encoding: [0xc6,0xcb,0x09,0x71]
vssrlrn.wu.d $vr6, $vr30, $vr18

# CHECK: vssrarn.bu.h $vr12, $vr13, $vr3
# CHECK: encoding: [0xac,0x8d,0x0a,0x71]
vssrarn.bu.h $vr12, $vr13, $vr3

# CHECK: vssrarn.hu.w $vr18, $vr5, $vr20
# CHECK: encoding: [0xb2,0x50,0x0b,0x71]
vssrarn.hu.w $vr18, $vr5, $vr20

# CHECK: vssrarn.wu.d $vr23, $vr8, $vr21
# CHECK: encoding: [0x17,0xd5,0x0b,0x71]
vssrarn.wu.d $vr23, $vr8, $vr21

# CHECK: vbitclr.b $vr14, $vr2, $vr31
# CHECK: encoding: [0x4e,0x7c,0x0c,0x71]
vbitclr.b $vr14, $vr2, $vr31

# CHECK: vbitclr.h $vr17, $vr25, $vr8
# CHECK: encoding: [0x31,0xa3,0x0c,0x71]
vbitclr.h $vr17, $vr25, $vr8

# CHECK: vbitclr.w $vr18, $vr11, $vr3
# CHECK: encoding: [0x72,0x0d,0x0d,0x71]
vbitclr.w $vr18, $vr11, $vr3

# CHECK: vbitclr.d $vr31, $vr15, $vr29
# CHECK: encoding: [0xff,0xf5,0x0d,0x71]
vbitclr.d $vr31, $vr15, $vr29

# CHECK: vbitset.b $vr8, $vr29, $vr16
# CHECK: encoding: [0xa8,0x43,0x0e,0x71]
vbitset.b $vr8, $vr29, $vr16

# CHECK: vbitset.h $vr5, $vr17, $vr17
# CHECK: encoding: [0x25,0xc6,0x0e,0x71]
vbitset.h $vr5, $vr17, $vr17

# CHECK: vbitset.w $vr5, $vr19, $vr5
# CHECK: encoding: [0x65,0x16,0x0f,0x71]
vbitset.w $vr5, $vr19, $vr5

# CHECK: vbitset.d $vr5, $vr27, $vr10
# CHECK: encoding: [0x65,0xab,0x0f,0x71]
vbitset.d $vr5, $vr27, $vr10

# CHECK: vbitrev.b $vr16, $vr5, $vr8
# CHECK: encoding: [0xb0,0x20,0x10,0x71]
vbitrev.b $vr16, $vr5, $vr8

# CHECK: vbitrev.h $vr12, $vr29, $vr12
# CHECK: encoding: [0xac,0xb3,0x10,0x71]
vbitrev.h $vr12, $vr29, $vr12

# CHECK: vbitrev.w $vr3, $vr14, $vr14
# CHECK: encoding: [0xc3,0x39,0x11,0x71]
vbitrev.w $vr3, $vr14, $vr14

# CHECK: vbitrev.d $vr31, $vr27, $vr14
# CHECK: encoding: [0x7f,0xbb,0x11,0x71]
vbitrev.d $vr31, $vr27, $vr14

# CHECK: vpackev.b $vr22, $vr24, $vr19
# CHECK: encoding: [0x16,0x4f,0x16,0x71]
vpackev.b $vr22, $vr24, $vr19

# CHECK: vpackev.h $vr28, $vr2, $vr18
# CHECK: encoding: [0x5c,0xc8,0x16,0x71]
vpackev.h $vr28, $vr2, $vr18

# CHECK: vpackev.w $vr21, $vr3, $vr4
# CHECK: encoding: [0x75,0x10,0x17,0x71]
vpackev.w $vr21, $vr3, $vr4

# CHECK: vpackev.d $vr24, $vr21, $vr11
# CHECK: encoding: [0xb8,0xae,0x17,0x71]
vpackev.d $vr24, $vr21, $vr11

# CHECK: vpackod.b $vr12, $vr31, $vr26
# CHECK: encoding: [0xec,0x6b,0x18,0x71]
vpackod.b $vr12, $vr31, $vr26

# CHECK: vpackod.h $vr25, $vr3, $vr16
# CHECK: encoding: [0x79,0xc0,0x18,0x71]
vpackod.h $vr25, $vr3, $vr16

# CHECK: vpackod.w $vr21, $vr18, $vr15
# CHECK: encoding: [0x55,0x3e,0x19,0x71]
vpackod.w $vr21, $vr18, $vr15

# CHECK: vpackod.d $vr2, $vr3, $vr0
# CHECK: encoding: [0x62,0x80,0x19,0x71]
vpackod.d $vr2, $vr3, $vr0

# CHECK: vilvl.b $vr8, $vr8, $vr28
# CHECK: encoding: [0x08,0x71,0x1a,0x71]
vilvl.b $vr8, $vr8, $vr28

# CHECK: vilvl.h $vr20, $vr0, $vr31
# CHECK: encoding: [0x14,0xfc,0x1a,0x71]
vilvl.h $vr20, $vr0, $vr31

# CHECK: vilvl.w $vr11, $vr10, $vr17
# CHECK: encoding: [0x4b,0x45,0x1b,0x71]
vilvl.w $vr11, $vr10, $vr17

# CHECK: vilvl.d $vr7, $vr7, $vr1
# CHECK: encoding: [0xe7,0x84,0x1b,0x71]
vilvl.d $vr7, $vr7, $vr1

# CHECK: vilvh.b $vr11, $vr11, $vr1
# CHECK: encoding: [0x6b,0x05,0x1c,0x71]
vilvh.b $vr11, $vr11, $vr1

# CHECK: vilvh.h $vr0, $vr31, $vr13
# CHECK: encoding: [0xe0,0xb7,0x1c,0x71]
vilvh.h $vr0, $vr31, $vr13

# CHECK: vilvh.w $vr28, $vr21, $vr7
# CHECK: encoding: [0xbc,0x1e,0x1d,0x71]
vilvh.w $vr28, $vr21, $vr7

# CHECK: vilvh.d $vr23, $vr3, $vr19
# CHECK: encoding: [0x77,0xcc,0x1d,0x71]
vilvh.d $vr23, $vr3, $vr19

# CHECK: vpickev.b $vr1, $vr21, $vr8
# CHECK: encoding: [0xa1,0x22,0x1e,0x71]
vpickev.b $vr1, $vr21, $vr8

# CHECK: vpickev.h $vr16, $vr1, $vr9
# CHECK: encoding: [0x30,0xa4,0x1e,0x71]
vpickev.h $vr16, $vr1, $vr9

# CHECK: vpickev.w $vr13, $vr13, $vr4
# CHECK: encoding: [0xad,0x11,0x1f,0x71]
vpickev.w $vr13, $vr13, $vr4

# CHECK: vpickev.d $vr11, $vr30, $vr30
# CHECK: encoding: [0xcb,0xfb,0x1f,0x71]
vpickev.d $vr11, $vr30, $vr30

# CHECK: vpickod.b $vr7, $vr11, $vr13
# CHECK: encoding: [0x67,0x35,0x20,0x71]
vpickod.b $vr7, $vr11, $vr13

# CHECK: vpickod.h $vr18, $vr3, $vr1
# CHECK: encoding: [0x72,0x84,0x20,0x71]
vpickod.h $vr18, $vr3, $vr1

# CHECK: vpickod.w $vr3, $vr16, $vr19
# CHECK: encoding: [0x03,0x4e,0x21,0x71]
vpickod.w $vr3, $vr16, $vr19

# CHECK: vpickod.d $vr12, $vr13, $vr21
# CHECK: encoding: [0xac,0xd5,0x21,0x71]
vpickod.d $vr12, $vr13, $vr21

# CHECK: vreplve.b $vr15, $vr17, $r19
# CHECK: encoding: [0x2f,0x4e,0x22,0x71]
vreplve.b $vr15, $vr17, $r19

# CHECK: vreplve.h $vr14, $vr23, $r4
# CHECK: encoding: [0xee,0x92,0x22,0x71]
vreplve.h $vr14, $vr23, $r4

# CHECK: vreplve.w $vr29, $vr19, $r27
# CHECK: encoding: [0x7d,0x6e,0x23,0x71]
vreplve.w $vr29, $vr19, $r27

# CHECK: vreplve.d $vr13, $vr20, $r20
# CHECK: encoding: [0x8d,0xd2,0x23,0x71]
vreplve.d $vr13, $vr20, $r20

# CHECK: vand.v $vr25, $vr2, $vr21
# CHECK: encoding: [0x59,0x54,0x26,0x71]
vand.v $vr25, $vr2, $vr21

# CHECK: vor.v $vr4, $vr27, $vr16
# CHECK: encoding: [0x64,0xc3,0x26,0x71]
vor.v $vr4, $vr27, $vr16

# CHECK: vxor.v $vr30, $vr25, $vr4
# CHECK: encoding: [0x3e,0x13,0x27,0x71]
vxor.v $vr30, $vr25, $vr4

# CHECK: vnor.v $vr9, $vr2, $vr22
# CHECK: encoding: [0x49,0xd8,0x27,0x71]
vnor.v $vr9, $vr2, $vr22

# CHECK: vandn.v $vr20, $vr26, $vr4
# CHECK: encoding: [0x54,0x13,0x28,0x71]
vandn.v $vr20, $vr26, $vr4

# CHECK: vorn.v $vr6, $vr21, $vr30
# CHECK: encoding: [0xa6,0xfa,0x28,0x71]
vorn.v $vr6, $vr21, $vr30

# CHECK: vfrstp.b $vr11, $vr9, $vr13
# CHECK: encoding: [0x2b,0x35,0x2b,0x71]
vfrstp.b $vr11, $vr9, $vr13

# CHECK: vfrstp.h $vr21, $vr26, $vr22
# CHECK: encoding: [0x55,0xdb,0x2b,0x71]
vfrstp.h $vr21, $vr26, $vr22

# CHECK: vadd.q $vr9, $vr7, $vr16
# CHECK: encoding: [0xe9,0x40,0x2d,0x71]
vadd.q $vr9, $vr7, $vr16

# CHECK: vsub.q $vr2, $vr1, $vr16
# CHECK: encoding: [0x22,0xc0,0x2d,0x71]
vsub.q $vr2, $vr1, $vr16

# CHECK: vsigncov.b $vr2, $vr2, $vr14
# CHECK: encoding: [0x42,0x38,0x2e,0x71]
vsigncov.b $vr2, $vr2, $vr14

# CHECK: vsigncov.h $vr21, $vr21, $vr13
# CHECK: encoding: [0xb5,0xb6,0x2e,0x71]
vsigncov.h $vr21, $vr21, $vr13

# CHECK: vsigncov.w $vr21, $vr7, $vr5
# CHECK: encoding: [0xf5,0x14,0x2f,0x71]
vsigncov.w $vr21, $vr7, $vr5

# CHECK: vsigncov.d $vr10, $vr10, $vr3
# CHECK: encoding: [0x4a,0x8d,0x2f,0x71]
vsigncov.d $vr10, $vr10, $vr3

# CHECK: vfadd.s $vr10, $vr4, $vr1
# CHECK: encoding: [0x8a,0x84,0x30,0x71]
vfadd.s $vr10, $vr4, $vr1

# CHECK: vfadd.d $vr15, $vr27, $vr2
# CHECK: encoding: [0x6f,0x0b,0x31,0x71]
vfadd.d $vr15, $vr27, $vr2

# CHECK: vfsub.s $vr14, $vr16, $vr9
# CHECK: encoding: [0x0e,0xa6,0x32,0x71]
vfsub.s $vr14, $vr16, $vr9

# CHECK: vfsub.d $vr4, $vr1, $vr8
# CHECK: encoding: [0x24,0x20,0x33,0x71]
vfsub.d $vr4, $vr1, $vr8

# CHECK: vfmul.s $vr0, $vr18, $vr6
# CHECK: encoding: [0x40,0x9a,0x38,0x71]
vfmul.s $vr0, $vr18, $vr6

# CHECK: vfmul.d $vr27, $vr31, $vr30
# CHECK: encoding: [0xfb,0x7b,0x39,0x71]
vfmul.d $vr27, $vr31, $vr30

# CHECK: vfdiv.s $vr3, $vr7, $vr6
# CHECK: encoding: [0xe3,0x98,0x3a,0x71]
vfdiv.s $vr3, $vr7, $vr6

# CHECK: vfdiv.d $vr16, $vr6, $vr30
# CHECK: encoding: [0xd0,0x78,0x3b,0x71]
vfdiv.d $vr16, $vr6, $vr30

# CHECK: vfmax.s $vr18, $vr30, $vr8
# CHECK: encoding: [0xd2,0xa3,0x3c,0x71]
vfmax.s $vr18, $vr30, $vr8

# CHECK: vfmax.d $vr19, $vr8, $vr24
# CHECK: encoding: [0x13,0x61,0x3d,0x71]
vfmax.d $vr19, $vr8, $vr24

# CHECK: vfmin.s $vr24, $vr26, $vr6
# CHECK: encoding: [0x58,0x9b,0x3e,0x71]
vfmin.s $vr24, $vr26, $vr6

# CHECK: vfmin.d $vr16, $vr25, $vr1
# CHECK: encoding: [0x30,0x07,0x3f,0x71]
vfmin.d $vr16, $vr25, $vr1

# CHECK: vfmaxa.s $vr8, $vr7, $vr14
# CHECK: encoding: [0xe8,0xb8,0x40,0x71]
vfmaxa.s $vr8, $vr7, $vr14

# CHECK: vfmaxa.d $vr10, $vr8, $vr4
# CHECK: encoding: [0x0a,0x11,0x41,0x71]
vfmaxa.d $vr10, $vr8, $vr4

# CHECK: vfmina.s $vr16, $vr6, $vr18
# CHECK: encoding: [0xd0,0xc8,0x42,0x71]
vfmina.s $vr16, $vr6, $vr18

# CHECK: vfmina.d $vr26, $vr7, $vr14
# CHECK: encoding: [0xfa,0x38,0x43,0x71]
vfmina.d $vr26, $vr7, $vr14

# CHECK: vfcvt.h.s $vr30, $vr4, $vr24
# CHECK: encoding: [0x9e,0x60,0x46,0x71]
vfcvt.h.s $vr30, $vr4, $vr24

# CHECK: vfcvt.s.d $vr16, $vr17, $vr4
# CHECK: encoding: [0x30,0x92,0x46,0x71]
vfcvt.s.d $vr16, $vr17, $vr4

# CHECK: vffint.s.l $vr25, $vr23, $vr10
# CHECK: encoding: [0xf9,0x2a,0x48,0x71]
vffint.s.l $vr25, $vr23, $vr10

# CHECK: vftint.w.d $vr9, $vr22, $vr27
# CHECK: encoding: [0xc9,0xee,0x49,0x71]
vftint.w.d $vr9, $vr22, $vr27

# CHECK: vftintrm.w.d $vr31, $vr10, $vr29
# CHECK: encoding: [0x5f,0x75,0x4a,0x71]
vftintrm.w.d $vr31, $vr10, $vr29

# CHECK: vftintrp.w.d $vr23, $vr13, $vr15
# CHECK: encoding: [0xb7,0xbd,0x4a,0x71]
vftintrp.w.d $vr23, $vr13, $vr15

# CHECK: vftintrz.w.d $vr18, $vr9, $vr6
# CHECK: encoding: [0x32,0x19,0x4b,0x71]
vftintrz.w.d $vr18, $vr9, $vr6

# CHECK: vftintrne.w.d $vr21, $vr12, $vr30
# CHECK: encoding: [0x95,0xf9,0x4b,0x71]
vftintrne.w.d $vr21, $vr12, $vr30

# CHECK: vshuf.h $vr3, $vr11, $vr2
# CHECK: encoding: [0x63,0x89,0x7a,0x71]
vshuf.h $vr3, $vr11, $vr2

# CHECK: vshuf.w $vr21, $vr4, $vr29
# CHECK: encoding: [0x95,0x74,0x7b,0x71]
vshuf.w $vr21, $vr4, $vr29

# CHECK: vshuf.d $vr11, $vr23, $vr18
# CHECK: encoding: [0xeb,0xca,0x7b,0x71]
vshuf.d $vr11, $vr23, $vr18

# CHECK: vseqi.b $vr27, $vr14, 7
# CHECK: encoding: [0xdb,0x1d,0x80,0x72]
vseqi.b $vr27, $vr14, 7

# CHECK: vseqi.h $vr23, $vr27, -6
# CHECK: encoding: [0x77,0xeb,0x80,0x72]
vseqi.h $vr23, $vr27, -6

# CHECK: vseqi.w $vr8, $vr8, -16
# CHECK: encoding: [0x08,0x41,0x81,0x72]
vseqi.w $vr8, $vr8, -16

# CHECK: vseqi.d $vr11, $vr5, 5
# CHECK: encoding: [0xab,0x94,0x81,0x72]
vseqi.d $vr11, $vr5, 5

# CHECK: vslei.b $vr8, $vr27, 7
# CHECK: encoding: [0x68,0x1f,0x82,0x72]
vslei.b $vr8, $vr27, 7

# CHECK: vslei.h $vr27, $vr29, -5
# CHECK: encoding: [0xbb,0xef,0x82,0x72]
vslei.h $vr27, $vr29, -5

# CHECK: vslei.w $vr23, $vr13, -3
# CHECK: encoding: [0xb7,0x75,0x83,0x72]
vslei.w $vr23, $vr13, -3

# CHECK: vslei.d $vr5, $vr15, -8
# CHECK: encoding: [0xe5,0xe1,0x83,0x72]
vslei.d $vr5, $vr15, -8

# CHECK: vslei.bu $vr29, $vr10, 9
# CHECK: encoding: [0x5d,0x25,0x84,0x72]
vslei.bu $vr29, $vr10, 9

# CHECK: vslei.hu $vr29, $vr18, 11
# CHECK: encoding: [0x5d,0xae,0x84,0x72]
vslei.hu $vr29, $vr18, 11

# CHECK: vslei.wu $vr8, $vr1, 2
# CHECK: encoding: [0x28,0x08,0x85,0x72]
vslei.wu $vr8, $vr1, 2

# CHECK: vslei.du $vr16, $vr5, 10
# CHECK: encoding: [0xb0,0xa8,0x85,0x72]
vslei.du $vr16, $vr5, 10

# CHECK: vslti.b $vr8, $vr4, -2
# CHECK: encoding: [0x88,0x78,0x86,0x72]
vslti.b $vr8, $vr4, -2

# CHECK: vslti.h $vr26, $vr7, -14
# CHECK: encoding: [0xfa,0xc8,0x86,0x72]
vslti.h $vr26, $vr7, -14

# CHECK: vslti.w $vr28, $vr8, 12
# CHECK: encoding: [0x1c,0x31,0x87,0x72]
vslti.w $vr28, $vr8, 12

# CHECK: vslti.d $vr4, $vr27, 9
# CHECK: encoding: [0x64,0xa7,0x87,0x72]
vslti.d $vr4, $vr27, 9

# CHECK: vslti.bu $vr10, $vr14, 18
# CHECK: encoding: [0xca,0x49,0x88,0x72]
vslti.bu $vr10, $vr14, 18

# CHECK: vslti.hu $vr28, $vr28, 30
# CHECK: encoding: [0x9c,0xfb,0x88,0x72]
vslti.hu $vr28, $vr28, 30

# CHECK: vslti.wu $vr15, $vr27, 27
# CHECK: encoding: [0x6f,0x6f,0x89,0x72]
vslti.wu $vr15, $vr27, 27

# CHECK: vslti.du $vr30, $vr17, 19
# CHECK: encoding: [0x3e,0xce,0x89,0x72]
vslti.du $vr30, $vr17, 19

# CHECK: vaddi.bu $vr6, $vr1, 18
# CHECK: encoding: [0x26,0x48,0x8a,0x72]
vaddi.bu $vr6, $vr1, 18

# CHECK: vaddi.hu $vr12, $vr14, 5
# CHECK: encoding: [0xcc,0x95,0x8a,0x72]
vaddi.hu $vr12, $vr14, 5

# CHECK: vaddi.wu $vr28, $vr0, 26
# CHECK: encoding: [0x1c,0x68,0x8b,0x72]
vaddi.wu $vr28, $vr0, 26

# CHECK: vaddi.du $vr10, $vr5, 2
# CHECK: encoding: [0xaa,0x88,0x8b,0x72]
vaddi.du $vr10, $vr5, 2

# CHECK: vsubi.bu $vr22, $vr28, 2
# CHECK: encoding: [0x96,0x0b,0x8c,0x72]
vsubi.bu $vr22, $vr28, 2

# CHECK: vsubi.hu $vr0, $vr22, 31
# CHECK: encoding: [0xc0,0xfe,0x8c,0x72]
vsubi.hu $vr0, $vr22, 31

# CHECK: vsubi.wu $vr20, $vr6, 5
# CHECK: encoding: [0xd4,0x14,0x8d,0x72]
vsubi.wu $vr20, $vr6, 5

# CHECK: vsubi.du $vr18, $vr11, 1
# CHECK: encoding: [0x72,0x85,0x8d,0x72]
vsubi.du $vr18, $vr11, 1

# CHECK: vbsll.v $vr4, $vr26, 4
# CHECK: encoding: [0x44,0x13,0x8e,0x72]
vbsll.v $vr4, $vr26, 4

# CHECK: vbsrl.v $vr7, $vr31, 15
# CHECK: encoding: [0xe7,0xbf,0x8e,0x72]
vbsrl.v $vr7, $vr31, 15

# CHECK: vmaxi.b $vr19, $vr15, 14
# CHECK: encoding: [0xf3,0x39,0x90,0x72]
vmaxi.b $vr19, $vr15, 14

# CHECK: vmaxi.h $vr25, $vr3, -12
# CHECK: encoding: [0x79,0xd0,0x90,0x72]
vmaxi.h $vr25, $vr3, -12

# CHECK: vmaxi.w $vr20, $vr25, 5
# CHECK: encoding: [0x34,0x17,0x91,0x72]
vmaxi.w $vr20, $vr25, 5

# CHECK: vmaxi.d $vr9, $vr10, 12
# CHECK: encoding: [0x49,0xb1,0x91,0x72]
vmaxi.d $vr9, $vr10, 12

# CHECK: vmini.b $vr30, $vr21, -4
# CHECK: encoding: [0xbe,0x72,0x92,0x72]
vmini.b $vr30, $vr21, -4

# CHECK: vmini.h $vr11, $vr28, -3
# CHECK: encoding: [0x8b,0xf7,0x92,0x72]
vmini.h $vr11, $vr28, -3

# CHECK: vmini.w $vr6, $vr25, -9
# CHECK: encoding: [0x26,0x5f,0x93,0x72]
vmini.w $vr6, $vr25, -9

# CHECK: vmini.d $vr28, $vr8, 2
# CHECK: encoding: [0x1c,0x89,0x93,0x72]
vmini.d $vr28, $vr8, 2

# CHECK: vmaxi.bu $vr13, $vr24, 19
# CHECK: encoding: [0x0d,0x4f,0x94,0x72]
vmaxi.bu $vr13, $vr24, 19

# CHECK: vmaxi.hu $vr3, $vr1, 22
# CHECK: encoding: [0x23,0xd8,0x94,0x72]
vmaxi.hu $vr3, $vr1, 22

# CHECK: vmaxi.wu $vr1, $vr3, 23
# CHECK: encoding: [0x61,0x5c,0x95,0x72]
vmaxi.wu $vr1, $vr3, 23

# CHECK: vmaxi.du $vr6, $vr18, 21
# CHECK: encoding: [0x46,0xd6,0x95,0x72]
vmaxi.du $vr6, $vr18, 21

# CHECK: vmini.bu $vr10, $vr2, 20
# CHECK: encoding: [0x4a,0x50,0x96,0x72]
vmini.bu $vr10, $vr2, 20

# CHECK: vmini.hu $vr17, $vr17, 15
# CHECK: encoding: [0x31,0xbe,0x96,0x72]
vmini.hu $vr17, $vr17, 15

# CHECK: vmini.wu $vr26, $vr27, 23
# CHECK: encoding: [0x7a,0x5f,0x97,0x72]
vmini.wu $vr26, $vr27, 23

# CHECK: vmini.du $vr12, $vr27, 8
# CHECK: encoding: [0x6c,0xa3,0x97,0x72]
vmini.du $vr12, $vr27, 8

# CHECK: vfrstpi.b $vr26, $vr8, 9
# CHECK: encoding: [0x1a,0x25,0x9a,0x72]
vfrstpi.b $vr26, $vr8, 9

# CHECK: vfrstpi.h $vr16, $vr2, 20
# CHECK: encoding: [0x50,0xd0,0x9a,0x72]
vfrstpi.h $vr16, $vr2, 20

# CHECK: vclo.b $vr5, $vr17
# CHECK: encoding: [0x25,0x02,0x9c,0x72]
vclo.b $vr5, $vr17

# CHECK: vclo.h $vr8, $vr4
# CHECK: encoding: [0x88,0x04,0x9c,0x72]
vclo.h $vr8, $vr4

# CHECK: vclo.w $vr1, $vr13
# CHECK: encoding: [0xa1,0x09,0x9c,0x72]
vclo.w $vr1, $vr13

# CHECK: vclo.d $vr0, $vr23
# CHECK: encoding: [0xe0,0x0e,0x9c,0x72]
vclo.d $vr0, $vr23

# CHECK: vclz.b $vr4, $vr25
# CHECK: encoding: [0x24,0x13,0x9c,0x72]
vclz.b $vr4, $vr25

# CHECK: vclz.h $vr1, $vr25
# CHECK: encoding: [0x21,0x17,0x9c,0x72]
vclz.h $vr1, $vr25

# CHECK: vclz.w $vr1, $vr5
# CHECK: encoding: [0xa1,0x18,0x9c,0x72]
vclz.w $vr1, $vr5

# CHECK: vclz.d $vr16, $vr17
# CHECK: encoding: [0x30,0x1e,0x9c,0x72]
vclz.d $vr16, $vr17

# CHECK: vpcnt.b $vr4, $vr3
# CHECK: encoding: [0x64,0x20,0x9c,0x72]
vpcnt.b $vr4, $vr3

# CHECK: vpcnt.h $vr15, $vr17
# CHECK: encoding: [0x2f,0x26,0x9c,0x72]
vpcnt.h $vr15, $vr17

# CHECK: vpcnt.w $vr13, $vr8
# CHECK: encoding: [0x0d,0x29,0x9c,0x72]
vpcnt.w $vr13, $vr8

# CHECK: vpcnt.d $vr0, $vr8
# CHECK: encoding: [0x00,0x2d,0x9c,0x72]
vpcnt.d $vr0, $vr8

# CHECK: vneg.b $vr14, $vr24
# CHECK: encoding: [0x0e,0x33,0x9c,0x72]
vneg.b $vr14, $vr24

# CHECK: vneg.h $vr24, $vr7
# CHECK: encoding: [0xf8,0x34,0x9c,0x72]
vneg.h $vr24, $vr7

# CHECK: vneg.w $vr19, $vr5
# CHECK: encoding: [0xb3,0x38,0x9c,0x72]
vneg.w $vr19, $vr5

# CHECK: vneg.d $vr3, $vr28
# CHECK: encoding: [0x83,0x3f,0x9c,0x72]
vneg.d $vr3, $vr28

# CHECK: vmskltz.b $vr31, $vr25
# CHECK: encoding: [0x3f,0x43,0x9c,0x72]
vmskltz.b $vr31, $vr25

# CHECK: vmskltz.h $vr9, $vr20
# CHECK: encoding: [0x89,0x46,0x9c,0x72]
vmskltz.h $vr9, $vr20

# CHECK: vmskltz.w $vr22, $vr26
# CHECK: encoding: [0x56,0x4b,0x9c,0x72]
vmskltz.w $vr22, $vr26

# CHECK: vmskltz.d $vr28, $vr10
# CHECK: encoding: [0x5c,0x4d,0x9c,0x72]
vmskltz.d $vr28, $vr10

# CHECK: vmskgez.b $vr7, $vr5
# CHECK: encoding: [0xa7,0x50,0x9c,0x72]
vmskgez.b $vr7, $vr5

# CHECK: vmsknz.b $vr20, $vr12
# CHECK: encoding: [0x94,0x61,0x9c,0x72]
vmsknz.b $vr20, $vr12

# CHECK: vseteqz.v $fcc5, $vr14
# CHECK: encoding: [0xc5,0x99,0x9c,0x72]
vseteqz.v $fcc5, $vr14

# CHECK: vsetnez.v $fcc2, $vr8
# CHECK: encoding: [0x02,0x9d,0x9c,0x72]
vsetnez.v $fcc2, $vr8

# CHECK: vsetanyeqz.b $fcc0, $vr20
# CHECK: encoding: [0x80,0xa2,0x9c,0x72]
vsetanyeqz.b $fcc0, $vr20

# CHECK: vsetanyeqz.h $fcc4, $vr16
# CHECK: encoding: [0x04,0xa6,0x9c,0x72]
vsetanyeqz.h $fcc4, $vr16

# CHECK: vsetanyeqz.w $fcc7, $vr2
# CHECK: encoding: [0x47,0xa8,0x9c,0x72]
vsetanyeqz.w $fcc7, $vr2

# CHECK: vsetanyeqz.d $fcc4, $vr12
# CHECK: encoding: [0x84,0xad,0x9c,0x72]
vsetanyeqz.d $fcc4, $vr12

# CHECK: vsetallnez.b $fcc7, $vr0
# CHECK: encoding: [0x07,0xb0,0x9c,0x72]
vsetallnez.b $fcc7, $vr0

# CHECK: vsetallnez.h $fcc2, $vr11
# CHECK: encoding: [0x62,0xb5,0x9c,0x72]
vsetallnez.h $fcc2, $vr11

# CHECK: vsetallnez.w $fcc6, $vr25
# CHECK: encoding: [0x26,0xbb,0x9c,0x72]
vsetallnez.w $fcc6, $vr25

# CHECK: vsetallnez.d $fcc7, $vr31
# CHECK: encoding: [0xe7,0xbf,0x9c,0x72]
vsetallnez.d $fcc7, $vr31

# CHECK: vflogb.s $vr14, $vr28
# CHECK: encoding: [0x8e,0xc7,0x9c,0x72]
vflogb.s $vr14, $vr28

# CHECK: vflogb.d $vr29, $vr9
# CHECK: encoding: [0x3d,0xc9,0x9c,0x72]
vflogb.d $vr29, $vr9

# CHECK: vfclass.s $vr3, $vr13
# CHECK: encoding: [0xa3,0xd5,0x9c,0x72]
vfclass.s $vr3, $vr13

# CHECK: vfclass.d $vr5, $vr15
# CHECK: encoding: [0xe5,0xd9,0x9c,0x72]
vfclass.d $vr5, $vr15

# CHECK: vfsqrt.s $vr19, $vr27
# CHECK: encoding: [0x73,0xe7,0x9c,0x72]
vfsqrt.s $vr19, $vr27

# CHECK: vfsqrt.d $vr31, $vr3
# CHECK: encoding: [0x7f,0xe8,0x9c,0x72]
vfsqrt.d $vr31, $vr3

# CHECK: vfrecip.s $vr24, $vr16
# CHECK: encoding: [0x18,0xf6,0x9c,0x72]
vfrecip.s $vr24, $vr16

# CHECK: vfrecip.d $vr23, $vr19
# CHECK: encoding: [0x77,0xfa,0x9c,0x72]
vfrecip.d $vr23, $vr19

# CHECK: vfrsqrt.s $vr18, $vr15
# CHECK: encoding: [0xf2,0x05,0x9d,0x72]
vfrsqrt.s $vr18, $vr15

# CHECK: vfrsqrt.d $vr18, $vr31
# CHECK: encoding: [0xf2,0x0b,0x9d,0x72]
vfrsqrt.d $vr18, $vr31

# CHECK: vfrint.s $vr26, $vr11
# CHECK: encoding: [0x7a,0x35,0x9d,0x72]
vfrint.s $vr26, $vr11

# CHECK: vfrint.d $vr24, $vr18
# CHECK: encoding: [0x58,0x3a,0x9d,0x72]
vfrint.d $vr24, $vr18

# CHECK: vfrintrm.s $vr5, $vr3
# CHECK: encoding: [0x65,0x44,0x9d,0x72]
vfrintrm.s $vr5, $vr3

# CHECK: vfrintrm.d $vr23, $vr10
# CHECK: encoding: [0x57,0x49,0x9d,0x72]
vfrintrm.d $vr23, $vr10

# CHECK: vfrintrp.s $vr20, $vr2
# CHECK: encoding: [0x54,0x54,0x9d,0x72]
vfrintrp.s $vr20, $vr2

# CHECK: vfrintrp.d $vr30, $vr17
# CHECK: encoding: [0x3e,0x5a,0x9d,0x72]
vfrintrp.d $vr30, $vr17

# CHECK: vfrintrz.s $vr19, $vr6
# CHECK: encoding: [0xd3,0x64,0x9d,0x72]
vfrintrz.s $vr19, $vr6

# CHECK: vfrintrz.d $vr16, $vr18
# CHECK: encoding: [0x50,0x6a,0x9d,0x72]
vfrintrz.d $vr16, $vr18

# CHECK: vfrintrne.s $vr8, $vr24
# CHECK: encoding: [0x08,0x77,0x9d,0x72]
vfrintrne.s $vr8, $vr24

# CHECK: vfrintrne.d $vr6, $vr5
# CHECK: encoding: [0xa6,0x78,0x9d,0x72]
vfrintrne.d $vr6, $vr5

# CHECK: vfcvtl.s.h $vr4, $vr6
# CHECK: encoding: [0xc4,0xe8,0x9d,0x72]
vfcvtl.s.h $vr4, $vr6

# CHECK: vfcvth.s.h $vr16, $vr7
# CHECK: encoding: [0xf0,0xec,0x9d,0x72]
vfcvth.s.h $vr16, $vr7

# CHECK: vfcvtl.d.s $vr16, $vr10
# CHECK: encoding: [0x50,0xf1,0x9d,0x72]
vfcvtl.d.s $vr16, $vr10

# CHECK: vfcvth.d.s $vr28, $vr25
# CHECK: encoding: [0x3c,0xf7,0x9d,0x72]
vfcvth.d.s $vr28, $vr25

# CHECK: vffint.s.w $vr28, $vr16
# CHECK: encoding: [0x1c,0x02,0x9e,0x72]
vffint.s.w $vr28, $vr16

# CHECK: vffint.s.wu $vr4, $vr31
# CHECK: encoding: [0xe4,0x07,0x9e,0x72]
vffint.s.wu $vr4, $vr31

# CHECK: vffint.d.l $vr18, $vr25
# CHECK: encoding: [0x32,0x0b,0x9e,0x72]
vffint.d.l $vr18, $vr25

# CHECK: vffint.d.lu $vr24, $vr17
# CHECK: encoding: [0x38,0x0e,0x9e,0x72]
vffint.d.lu $vr24, $vr17

# CHECK: vffintl.d.w $vr2, $vr27
# CHECK: encoding: [0x62,0x13,0x9e,0x72]
vffintl.d.w $vr2, $vr27

# CHECK: vffinth.d.w $vr4, $vr16
# CHECK: encoding: [0x04,0x16,0x9e,0x72]
vffinth.d.w $vr4, $vr16

# CHECK: vftint.w.s $vr17, $vr0
# CHECK: encoding: [0x11,0x30,0x9e,0x72]
vftint.w.s $vr17, $vr0

# CHECK: vftint.l.d $vr23, $vr18
# CHECK: encoding: [0x57,0x36,0x9e,0x72]
vftint.l.d $vr23, $vr18

# CHECK: vftintrm.w.s $vr23, $vr4
# CHECK: encoding: [0x97,0x38,0x9e,0x72]
vftintrm.w.s $vr23, $vr4

# CHECK: vftintrm.l.d $vr30, $vr14
# CHECK: encoding: [0xde,0x3d,0x9e,0x72]
vftintrm.l.d $vr30, $vr14

# CHECK: vftintrp.w.s $vr7, $vr0
# CHECK: encoding: [0x07,0x40,0x9e,0x72]
vftintrp.w.s $vr7, $vr0

# CHECK: vftintrp.l.d $vr28, $vr20
# CHECK: encoding: [0x9c,0x46,0x9e,0x72]
vftintrp.l.d $vr28, $vr20

# CHECK: vftintrz.w.s $vr28, $vr31
# CHECK: encoding: [0xfc,0x4b,0x9e,0x72]
vftintrz.w.s $vr28, $vr31

# CHECK: vftintrz.l.d $vr18, $vr0
# CHECK: encoding: [0x12,0x4c,0x9e,0x72]
vftintrz.l.d $vr18, $vr0

# CHECK: vftintrne.w.s $vr14, $vr17
# CHECK: encoding: [0x2e,0x52,0x9e,0x72]
vftintrne.w.s $vr14, $vr17

# CHECK: vftintrne.l.d $vr22, $vr18
# CHECK: encoding: [0x56,0x56,0x9e,0x72]
vftintrne.l.d $vr22, $vr18

# CHECK: vftint.wu.s $vr26, $vr25
# CHECK: encoding: [0x3a,0x5b,0x9e,0x72]
vftint.wu.s $vr26, $vr25

# CHECK: vftint.lu.d $vr9, $vr27
# CHECK: encoding: [0x69,0x5f,0x9e,0x72]
vftint.lu.d $vr9, $vr27

# CHECK: vftintrz.wu.s $vr26, $vr22
# CHECK: encoding: [0xda,0x72,0x9e,0x72]
vftintrz.wu.s $vr26, $vr22

# CHECK: vftintrz.lu.d $vr29, $vr20
# CHECK: encoding: [0x9d,0x76,0x9e,0x72]
vftintrz.lu.d $vr29, $vr20

# CHECK: vftintl.l.s $vr22, $vr1
# CHECK: encoding: [0x36,0x80,0x9e,0x72]
vftintl.l.s $vr22, $vr1

# CHECK: vftinth.l.s $vr13, $vr24
# CHECK: encoding: [0x0d,0x87,0x9e,0x72]
vftinth.l.s $vr13, $vr24

# CHECK: vftintrml.l.s $vr8, $vr27
# CHECK: encoding: [0x68,0x8b,0x9e,0x72]
vftintrml.l.s $vr8, $vr27

# CHECK: vftintrmh.l.s $vr18, $vr28
# CHECK: encoding: [0x92,0x8f,0x9e,0x72]
vftintrmh.l.s $vr18, $vr28

# CHECK: vftintrpl.l.s $vr27, $vr28
# CHECK: encoding: [0x9b,0x93,0x9e,0x72]
vftintrpl.l.s $vr27, $vr28

# CHECK: vftintrph.l.s $vr20, $vr7
# CHECK: encoding: [0xf4,0x94,0x9e,0x72]
vftintrph.l.s $vr20, $vr7

# CHECK: vftintrzl.l.s $vr6, $vr2
# CHECK: encoding: [0x46,0x98,0x9e,0x72]
vftintrzl.l.s $vr6, $vr2

# CHECK: vftintrzh.l.s $vr21, $vr6
# CHECK: encoding: [0xd5,0x9c,0x9e,0x72]
vftintrzh.l.s $vr21, $vr6

# CHECK: vftintrnel.l.s $vr25, $vr3
# CHECK: encoding: [0x79,0xa0,0x9e,0x72]
vftintrnel.l.s $vr25, $vr3

# CHECK: vftintrneh.l.s $vr7, $vr5
# CHECK: encoding: [0xa7,0xa4,0x9e,0x72]
vftintrneh.l.s $vr7, $vr5

# CHECK: vexth.h.b $vr9, $vr2
# CHECK: encoding: [0x49,0xe0,0x9e,0x72]
vexth.h.b $vr9, $vr2

# CHECK: vexth.w.h $vr4, $vr27
# CHECK: encoding: [0x64,0xe7,0x9e,0x72]
vexth.w.h $vr4, $vr27

# CHECK: vexth.d.w $vr23, $vr1
# CHECK: encoding: [0x37,0xe8,0x9e,0x72]
vexth.d.w $vr23, $vr1

# CHECK: vexth.q.d $vr15, $vr6
# CHECK: encoding: [0xcf,0xec,0x9e,0x72]
vexth.q.d $vr15, $vr6

# CHECK: vexth.hu.bu $vr3, $vr2
# CHECK: encoding: [0x43,0xf0,0x9e,0x72]
vexth.hu.bu $vr3, $vr2

# CHECK: vexth.wu.hu $vr31, $vr26
# CHECK: encoding: [0x5f,0xf7,0x9e,0x72]
vexth.wu.hu $vr31, $vr26

# CHECK: vexth.du.wu $vr10, $vr31
# CHECK: encoding: [0xea,0xfb,0x9e,0x72]
vexth.du.wu $vr10, $vr31

# CHECK: vexth.qu.du $vr28, $vr8
# CHECK: encoding: [0x1c,0xfd,0x9e,0x72]
vexth.qu.du $vr28, $vr8

# CHECK: vreplgr2vr.b $vr15, $sp
# CHECK: encoding: [0x6f,0x00,0x9f,0x72]
vreplgr2vr.b $vr15, $sp

# CHECK: vreplgr2vr.h $vr10, $r23
# CHECK: encoding: [0xea,0x06,0x9f,0x72]
vreplgr2vr.h $vr10, $r23

# CHECK: vreplgr2vr.w $vr25, $r16
# CHECK: encoding: [0x19,0x0a,0x9f,0x72]
vreplgr2vr.w $vr25, $r16

# CHECK: vreplgr2vr.d $vr27, $r7
# CHECK: encoding: [0xfb,0x0c,0x9f,0x72]
vreplgr2vr.d $vr27, $r7

# CHECK: vrotri.b $vr24, $vr24, 7
# CHECK: encoding: [0x18,0x3f,0xa0,0x72]
vrotri.b $vr24, $vr24, 7

# CHECK: vrotri.h $vr1, $vr5, 0
# CHECK: encoding: [0xa1,0x40,0xa0,0x72]
vrotri.h $vr1, $vr5, 0

# CHECK: vrotri.w $vr10, $vr8, 12
# CHECK: encoding: [0x0a,0xb1,0xa0,0x72]
vrotri.w $vr10, $vr8, 12

# CHECK: vrotri.d $vr30, $vr29, 42
# CHECK: encoding: [0xbe,0xab,0xa1,0x72]
vrotri.d $vr30, $vr29, 42

# CHECK: vsrlri.b $vr1, $vr16, 3
# CHECK: encoding: [0x01,0x2e,0xa4,0x72]
vsrlri.b $vr1, $vr16, 3

# CHECK: vsrlri.h $vr28, $vr21, 1
# CHECK: encoding: [0xbc,0x46,0xa4,0x72]
vsrlri.h $vr28, $vr21, 1

# CHECK: vsrlri.w $vr18, $vr4, 15
# CHECK: encoding: [0x92,0xbc,0xa4,0x72]
vsrlri.w $vr18, $vr4, 15

# CHECK: vsrlri.d $vr30, $vr3, 19
# CHECK: encoding: [0x7e,0x4c,0xa5,0x72]
vsrlri.d $vr30, $vr3, 19

# CHECK: vsrari.b $vr13, $vr0, 7
# CHECK: encoding: [0x0d,0x3c,0xa8,0x72]
vsrari.b $vr13, $vr0, 7

# CHECK: vsrari.h $vr17, $vr9, 6
# CHECK: encoding: [0x31,0x59,0xa8,0x72]
vsrari.h $vr17, $vr9, 6

# CHECK: vsrari.w $vr3, $vr28, 6
# CHECK: encoding: [0x83,0x9b,0xa8,0x72]
vsrari.w $vr3, $vr28, 6

# CHECK: vsrari.d $vr4, $vr2, 34
# CHECK: encoding: [0x44,0x88,0xa9,0x72]
vsrari.d $vr4, $vr2, 34

# CHECK: vinsgr2vr.b $vr8, $r8, 4
# CHECK: encoding: [0x08,0x91,0xeb,0x72]
vinsgr2vr.b $vr8, $r8, 4

# CHECK: vinsgr2vr.h $vr13, $r7, 1
# CHECK: encoding: [0xed,0xc4,0xeb,0x72]
vinsgr2vr.h $vr13, $r7, 1

# CHECK: vinsgr2vr.w $vr4, $r6, 3
# CHECK: encoding: [0xc4,0xec,0xeb,0x72]
vinsgr2vr.w $vr4, $r6, 3

# CHECK: vinsgr2vr.d $vr23, $r31, 0
# CHECK: encoding: [0xf7,0xf3,0xeb,0x72]
vinsgr2vr.d $vr23, $r31, 0

# CHECK: vpickve2gr.b $r24, $vr16, 10
# CHECK: encoding: [0x18,0xaa,0xef,0x72]
vpickve2gr.b $r24, $vr16, 10

# CHECK: vpickve2gr.h $r17, $vr25, 3
# CHECK: encoding: [0x31,0xcf,0xef,0x72]
vpickve2gr.h $r17, $vr25, 3

# CHECK: vpickve2gr.w $r30, $vr28, 2
# CHECK: encoding: [0x9e,0xeb,0xef,0x72]
vpickve2gr.w $r30, $vr28, 2

# CHECK: vpickve2gr.d $r25, $vr9, 1
# CHECK: encoding: [0x39,0xf5,0xef,0x72]
vpickve2gr.d $r25, $vr9, 1

# CHECK: vpickve2gr.bu $r31, $vr14, 2
# CHECK: encoding: [0xdf,0x89,0xf3,0x72]
vpickve2gr.bu $r31, $vr14, 2

# CHECK: vpickve2gr.hu $r12, $vr1, 6
# CHECK: encoding: [0x2c,0xd8,0xf3,0x72]
vpickve2gr.hu $r12, $vr1, 6

# CHECK: vpickve2gr.wu $r10, $vr17, 1
# CHECK: encoding: [0x2a,0xe6,0xf3,0x72]
vpickve2gr.wu $r10, $vr17, 1

# CHECK: vpickve2gr.du $r26, $vr8, 1
# CHECK: encoding: [0x1a,0xf5,0xf3,0x72]
vpickve2gr.du $r26, $vr8, 1

# CHECK: vreplvei.b $vr3, $vr6, 12
# CHECK: encoding: [0xc3,0xb0,0xf7,0x72]
vreplvei.b $vr3, $vr6, 12

# CHECK: vreplvei.h $vr22, $vr29, 7
# CHECK: encoding: [0xb6,0xdf,0xf7,0x72]
vreplvei.h $vr22, $vr29, 7

# CHECK: vreplvei.w $vr17, $vr26, 1
# CHECK: encoding: [0x51,0xe7,0xf7,0x72]
vreplvei.w $vr17, $vr26, 1

# CHECK: vreplvei.d $vr0, $vr17, 1
# CHECK: encoding: [0x20,0xf6,0xf7,0x72]
vreplvei.d $vr0, $vr17, 1

# CHECK: vsllwil.h.b $vr25, $vr14, 2
# CHECK: encoding: [0xd9,0x29,0x08,0x73]
vsllwil.h.b $vr25, $vr14, 2

# CHECK: vsllwil.w.h $vr24, $vr5, 1
# CHECK: encoding: [0xb8,0x44,0x08,0x73]
vsllwil.w.h $vr24, $vr5, 1

# CHECK: vsllwil.d.w $vr25, $vr14, 8
# CHECK: encoding: [0xd9,0xa1,0x08,0x73]
vsllwil.d.w $vr25, $vr14, 8

# CHECK: vextl.q.d $vr3, $vr22
# CHECK: encoding: [0xc3,0x02,0x09,0x73]
vextl.q.d $vr3, $vr22

# CHECK: vsllwil.hu.bu $vr11, $vr25, 3
# CHECK: encoding: [0x2b,0x2f,0x0c,0x73]
vsllwil.hu.bu $vr11, $vr25, 3

# CHECK: vsllwil.wu.hu $vr2, $vr26, 10
# CHECK: encoding: [0x42,0x6b,0x0c,0x73]
vsllwil.wu.hu $vr2, $vr26, 10

# CHECK: vsllwil.du.wu $vr18, $vr9, 28
# CHECK: encoding: [0x32,0xf1,0x0c,0x73]
vsllwil.du.wu $vr18, $vr9, 28

# CHECK: vextl.qu.du $vr13, $vr25
# CHECK: encoding: [0x2d,0x03,0x0d,0x73]
vextl.qu.du $vr13, $vr25

# CHECK: vbitclri.b $vr29, $vr24, 6
# CHECK: encoding: [0x1d,0x3b,0x10,0x73]
vbitclri.b $vr29, $vr24, 6

# CHECK: vbitclri.h $vr27, $vr15, 5
# CHECK: encoding: [0xfb,0x55,0x10,0x73]
vbitclri.h $vr27, $vr15, 5

# CHECK: vbitclri.w $vr11, $vr10, 8
# CHECK: encoding: [0x4b,0xa1,0x10,0x73]
vbitclri.w $vr11, $vr10, 8

# CHECK: vbitclri.d $vr4, $vr7, 15
# CHECK: encoding: [0xe4,0x3c,0x11,0x73]
vbitclri.d $vr4, $vr7, 15

# CHECK: vbitseti.b $vr24, $vr20, 3
# CHECK: encoding: [0x98,0x2e,0x14,0x73]
vbitseti.b $vr24, $vr20, 3

# CHECK: vbitseti.h $vr6, $vr8, 8
# CHECK: encoding: [0x06,0x61,0x14,0x73]
vbitseti.h $vr6, $vr8, 8

# CHECK: vbitseti.w $vr21, $vr9, 24
# CHECK: encoding: [0x35,0xe1,0x14,0x73]
vbitseti.w $vr21, $vr9, 24

# CHECK: vbitseti.d $vr28, $vr18, 30
# CHECK: encoding: [0x5c,0x7a,0x15,0x73]
vbitseti.d $vr28, $vr18, 30

# CHECK: vbitrevi.b $vr19, $vr31, 0
# CHECK: encoding: [0xf3,0x23,0x18,0x73]
vbitrevi.b $vr19, $vr31, 0

# CHECK: vbitrevi.h $vr18, $vr1, 0
# CHECK: encoding: [0x32,0x40,0x18,0x73]
vbitrevi.h $vr18, $vr1, 0

# CHECK: vbitrevi.w $vr25, $vr6, 18
# CHECK: encoding: [0xd9,0xc8,0x18,0x73]
vbitrevi.w $vr25, $vr6, 18

# CHECK: vbitrevi.d $vr8, $vr27, 22
# CHECK: encoding: [0x68,0x5b,0x19,0x73]
vbitrevi.d $vr8, $vr27, 22

# CHECK: vsat.b $vr21, $vr28, 2
# CHECK: encoding: [0x95,0x2b,0x24,0x73]
vsat.b $vr21, $vr28, 2

# CHECK: vsat.h $vr6, $vr5, 12
# CHECK: encoding: [0xa6,0x70,0x24,0x73]
vsat.h $vr6, $vr5, 12

# CHECK: vsat.w $vr3, $vr30, 16
# CHECK: encoding: [0xc3,0xc3,0x24,0x73]
vsat.w $vr3, $vr30, 16

# CHECK: vsat.d $vr0, $vr31, 24
# CHECK: encoding: [0xe0,0x63,0x25,0x73]
vsat.d $vr0, $vr31, 24

# CHECK: vsat.bu $vr20, $vr20, 2
# CHECK: encoding: [0x94,0x2a,0x28,0x73]
vsat.bu $vr20, $vr20, 2

# CHECK: vsat.hu $vr8, $vr6, 12
# CHECK: encoding: [0xc8,0x70,0x28,0x73]
vsat.hu $vr8, $vr6, 12

# CHECK: vsat.wu $vr18, $vr20, 26
# CHECK: encoding: [0x92,0xea,0x28,0x73]
vsat.wu $vr18, $vr20, 26

# CHECK: vsat.du $vr10, $vr6, 33
# CHECK: encoding: [0xca,0x84,0x29,0x73]
vsat.du $vr10, $vr6, 33

# CHECK: vslli.b $vr4, $vr19, 3
# CHECK: encoding: [0x64,0x2e,0x2c,0x73]
vslli.b $vr4, $vr19, 3

# CHECK: vslli.h $vr3, $vr23, 14
# CHECK: encoding: [0xe3,0x7a,0x2c,0x73]
vslli.h $vr3, $vr23, 14

# CHECK: vslli.w $vr22, $vr21, 6
# CHECK: encoding: [0xb6,0x9a,0x2c,0x73]
vslli.w $vr22, $vr21, 6

# CHECK: vslli.d $vr23, $vr15, 36
# CHECK: encoding: [0xf7,0x91,0x2d,0x73]
vslli.d $vr23, $vr15, 36

# CHECK: vsrli.b $vr5, $vr25, 4
# CHECK: encoding: [0x25,0x33,0x30,0x73]
vsrli.b $vr5, $vr25, 4

# CHECK: vsrli.h $vr9, $vr14, 9
# CHECK: encoding: [0xc9,0x65,0x30,0x73]
vsrli.h $vr9, $vr14, 9

# CHECK: vsrli.w $vr7, $vr24, 12
# CHECK: encoding: [0x07,0xb3,0x30,0x73]
vsrli.w $vr7, $vr24, 12

# CHECK: vsrli.d $vr15, $vr18, 63
# CHECK: encoding: [0x4f,0xfe,0x31,0x73]
vsrli.d $vr15, $vr18, 63

# CHECK: vsrai.b $vr6, $vr1, 3
# CHECK: encoding: [0x26,0x2c,0x34,0x73]
vsrai.b $vr6, $vr1, 3

# CHECK: vsrai.h $vr7, $vr29, 3
# CHECK: encoding: [0xa7,0x4f,0x34,0x73]
vsrai.h $vr7, $vr29, 3

# CHECK: vsrai.w $vr31, $vr27, 29
# CHECK: encoding: [0x7f,0xf7,0x34,0x73]
vsrai.w $vr31, $vr27, 29

# CHECK: vsrai.d $vr28, $vr30, 56
# CHECK: encoding: [0xdc,0xe3,0x35,0x73]
vsrai.d $vr28, $vr30, 56

# CHECK: vsrlni.b.h $vr2, $vr26, 2
# CHECK: encoding: [0x42,0x4b,0x40,0x73]
vsrlni.b.h $vr2, $vr26, 2

# CHECK: vsrlni.h.w $vr31, $vr14, 3
# CHECK: encoding: [0xdf,0x8d,0x40,0x73]
vsrlni.h.w $vr31, $vr14, 3

# CHECK: vsrlni.w.d $vr19, $vr4, 33
# CHECK: encoding: [0x93,0x84,0x41,0x73]
vsrlni.w.d $vr19, $vr4, 33

# CHECK: vsrlni.d.q $vr31, $vr3, 63
# CHECK: encoding: [0x7f,0xfc,0x42,0x73]
vsrlni.d.q $vr31, $vr3, 63

# CHECK: vsrlrni.b.h $vr26, $vr18, 0
# CHECK: encoding: [0x5a,0x42,0x44,0x73]
vsrlrni.b.h $vr26, $vr18, 0

# CHECK: vsrlrni.h.w $vr18, $vr22, 5
# CHECK: encoding: [0xd2,0x96,0x44,0x73]
vsrlrni.h.w $vr18, $vr22, 5

# CHECK: vsrlrni.w.d $vr24, $vr11, 21
# CHECK: encoding: [0x78,0x55,0x45,0x73]
vsrlrni.w.d $vr24, $vr11, 21

# CHECK: vsrlrni.d.q $vr6, $vr11, 37
# CHECK: encoding: [0x66,0x95,0x46,0x73]
vsrlrni.d.q $vr6, $vr11, 37

# CHECK: vssrlni.b.h $vr3, $vr21, 5
# CHECK: encoding: [0xa3,0x56,0x48,0x73]
vssrlni.b.h $vr3, $vr21, 5

# CHECK: vssrlni.h.w $vr6, $vr1, 16
# CHECK: encoding: [0x26,0xc0,0x48,0x73]
vssrlni.h.w $vr6, $vr1, 16

# CHECK: vssrlni.w.d $vr4, $vr21, 27
# CHECK: encoding: [0xa4,0x6e,0x49,0x73]
vssrlni.w.d $vr4, $vr21, 27

# CHECK: vssrlni.d.q $vr8, $vr18, 94
# CHECK: encoding: [0x48,0x7a,0x4b,0x73]
vssrlni.d.q $vr8, $vr18, 94

# CHECK: vssrlni.bu.h $vr6, $vr2, 5
# CHECK: encoding: [0x46,0x54,0x4c,0x73]
vssrlni.bu.h $vr6, $vr2, 5

# CHECK: vssrlni.hu.w $vr29, $vr29, 2
# CHECK: encoding: [0xbd,0x8b,0x4c,0x73]
vssrlni.hu.w $vr29, $vr29, 2

# CHECK: vssrlni.wu.d $vr28, $vr20, 47
# CHECK: encoding: [0x9c,0xbe,0x4d,0x73]
vssrlni.wu.d $vr28, $vr20, 47

# CHECK: vssrlni.du.q $vr22, $vr10, 82
# CHECK: encoding: [0x56,0x49,0x4f,0x73]
vssrlni.du.q $vr22, $vr10, 82

# CHECK: vssrlrni.b.h $vr17, $vr25, 10
# CHECK: encoding: [0x31,0x6b,0x50,0x73]
vssrlrni.b.h $vr17, $vr25, 10

# CHECK: vssrlrni.h.w $vr21, $vr29, 0
# CHECK: encoding: [0xb5,0x83,0x50,0x73]
vssrlrni.h.w $vr21, $vr29, 0

# CHECK: vssrlrni.w.d $vr9, $vr15, 63
# CHECK: encoding: [0xe9,0xfd,0x51,0x73]
vssrlrni.w.d $vr9, $vr15, 63

# CHECK: vssrlrni.d.q $vr4, $vr1, 117
# CHECK: encoding: [0x24,0xd4,0x53,0x73]
vssrlrni.d.q $vr4, $vr1, 117

# CHECK: vssrlrni.bu.h $vr25, $vr13, 3
# CHECK: encoding: [0xb9,0x4d,0x54,0x73]
vssrlrni.bu.h $vr25, $vr13, 3

# CHECK: vssrlrni.hu.w $vr30, $vr28, 7
# CHECK: encoding: [0x9e,0x9f,0x54,0x73]
vssrlrni.hu.w $vr30, $vr28, 7

# CHECK: vssrlrni.wu.d $vr16, $vr27, 11
# CHECK: encoding: [0x70,0x2f,0x55,0x73]
vssrlrni.wu.d $vr16, $vr27, 11

# CHECK: vssrlrni.du.q $vr20, $vr13, 63
# CHECK: encoding: [0xb4,0xfd,0x56,0x73]
vssrlrni.du.q $vr20, $vr13, 63

# CHECK: vsrani.b.h $vr3, $vr25, 4
# CHECK: encoding: [0x23,0x53,0x58,0x73]
vsrani.b.h $vr3, $vr25, 4

# CHECK: vsrani.h.w $vr12, $vr13, 17
# CHECK: encoding: [0xac,0xc5,0x58,0x73]
vsrani.h.w $vr12, $vr13, 17

# CHECK: vsrani.w.d $vr2, $vr6, 25
# CHECK: encoding: [0xc2,0x64,0x59,0x73]
vsrani.w.d $vr2, $vr6, 25

# CHECK: vsrani.d.q $vr12, $vr8, 105
# CHECK: encoding: [0x0c,0xa5,0x5b,0x73]
vsrani.d.q $vr12, $vr8, 105

# CHECK: vsrarni.b.h $vr27, $vr21, 2
# CHECK: encoding: [0xbb,0x4a,0x5c,0x73]
vsrarni.b.h $vr27, $vr21, 2

# CHECK: vsrarni.h.w $vr13, $vr3, 0
# CHECK: encoding: [0x6d,0x80,0x5c,0x73]
vsrarni.h.w $vr13, $vr3, 0

# CHECK: vsrarni.w.d $vr9, $vr31, 42
# CHECK: encoding: [0xe9,0xab,0x5d,0x73]
vsrarni.w.d $vr9, $vr31, 42

# CHECK: vsrarni.d.q $vr25, $vr5, 59
# CHECK: encoding: [0xb9,0xec,0x5e,0x73]
vsrarni.d.q $vr25, $vr5, 59

# CHECK: vssrani.b.h $vr8, $vr7, 12
# CHECK: encoding: [0xe8,0x70,0x60,0x73]
vssrani.b.h $vr8, $vr7, 12

# CHECK: vssrani.h.w $vr21, $vr18, 30
# CHECK: encoding: [0x55,0xfa,0x60,0x73]
vssrani.h.w $vr21, $vr18, 30

# CHECK: vssrani.w.d $vr23, $vr7, 51
# CHECK: encoding: [0xf7,0xcc,0x61,0x73]
vssrani.w.d $vr23, $vr7, 51

# CHECK: vssrani.d.q $vr12, $vr14, 8
# CHECK: encoding: [0xcc,0x21,0x62,0x73]
vssrani.d.q $vr12, $vr14, 8

# CHECK: vssrani.bu.h $vr19, $vr5, 12
# CHECK: encoding: [0xb3,0x70,0x64,0x73]
vssrani.bu.h $vr19, $vr5, 12

# CHECK: vssrani.hu.w $vr27, $vr25, 15
# CHECK: encoding: [0x3b,0xbf,0x64,0x73]
vssrani.hu.w $vr27, $vr25, 15

# CHECK: vssrani.wu.d $vr24, $vr28, 42
# CHECK: encoding: [0x98,0xab,0x65,0x73]
vssrani.wu.d $vr24, $vr28, 42

# CHECK: vssrani.du.q $vr4, $vr23, 63
# CHECK: encoding: [0xe4,0xfe,0x66,0x73]
vssrani.du.q $vr4, $vr23, 63

# CHECK: vssrarni.b.h $vr26, $vr8, 0
# CHECK: encoding: [0x1a,0x41,0x68,0x73]
vssrarni.b.h $vr26, $vr8, 0

# CHECK: vssrarni.h.w $vr4, $vr3, 25
# CHECK: encoding: [0x64,0xe4,0x68,0x73]
vssrarni.h.w $vr4, $vr3, 25

# CHECK: vssrarni.w.d $vr0, $vr25, 19
# CHECK: encoding: [0x20,0x4f,0x69,0x73]
vssrarni.w.d $vr0, $vr25, 19

# CHECK: vssrarni.d.q $vr20, $vr11, 106
# CHECK: encoding: [0x74,0xa9,0x6b,0x73]
vssrarni.d.q $vr20, $vr11, 106

# CHECK: vssrarni.bu.h $vr25, $vr28, 9
# CHECK: encoding: [0x99,0x67,0x6c,0x73]
vssrarni.bu.h $vr25, $vr28, 9

# CHECK: vssrarni.hu.w $vr20, $vr23, 12
# CHECK: encoding: [0xf4,0xb2,0x6c,0x73]
vssrarni.hu.w $vr20, $vr23, 12

# CHECK: vssrarni.wu.d $vr28, $vr23, 58
# CHECK: encoding: [0xfc,0xea,0x6d,0x73]
vssrarni.wu.d $vr28, $vr23, 58

# CHECK: vssrarni.du.q $vr1, $vr14, 93
# CHECK: encoding: [0xc1,0x75,0x6f,0x73]
vssrarni.du.q $vr1, $vr14, 93

# CHECK: vextrins.d $vr15, $vr27, 7
# CHECK: encoding: [0x6f,0x1f,0x80,0x73]
vextrins.d $vr15, $vr27, 7

# CHECK: vextrins.w $vr19, $vr0, 147
# CHECK: encoding: [0x13,0x4c,0x86,0x73]
vextrins.w $vr19, $vr0, 147

# CHECK: vextrins.h $vr29, $vr9, 69
# CHECK: encoding: [0x3d,0x15,0x89,0x73]
vextrins.h $vr29, $vr9, 69

# CHECK: vextrins.b $vr0, $vr21, 23
# CHECK: encoding: [0xa0,0x5e,0x8c,0x73]
vextrins.b $vr0, $vr21, 23

# CHECK: vshuf4i.b $vr19, $vr10, 188
# CHECK: encoding: [0x53,0xf1,0x92,0x73]
vshuf4i.b $vr19, $vr10, 188

# CHECK: vshuf4i.h $vr15, $vr1, 139
# CHECK: encoding: [0x2f,0x2c,0x96,0x73]
vshuf4i.h $vr15, $vr1, 139

# CHECK: vshuf4i.w $vr3, $vr5, 130
# CHECK: encoding: [0xa3,0x08,0x9a,0x73]
vshuf4i.w $vr3, $vr5, 130

# CHECK: vshuf4i.d $vr8, $vr29, 131
# CHECK: encoding: [0xa8,0x0f,0x9e,0x73]
vshuf4i.d $vr8, $vr29, 131

# CHECK: vbitseli.b $vr16, $vr25, 168
# CHECK: encoding: [0x30,0xa3,0xc6,0x73]
vbitseli.b $vr16, $vr25, 168

# CHECK: vandi.b $vr4, $vr23, 121
# CHECK: encoding: [0xe4,0xe6,0xd1,0x73]
vandi.b $vr4, $vr23, 121

# CHECK: vori.b $vr7, $vr10, 188
# CHECK: encoding: [0x47,0xf1,0xd6,0x73]
vori.b $vr7, $vr10, 188

# CHECK: vxori.b $vr9, $vr26, 216
# CHECK: encoding: [0x49,0x63,0xdb,0x73]
vxori.b $vr9, $vr26, 216

# CHECK: vnori.b $vr4, $vr28, 219
# CHECK: encoding: [0x84,0x6f,0xdf,0x73]
vnori.b $vr4, $vr28, 219

# CHECK: vldi $vr22, -3742
# CHECK: encoding: [0x56,0x2c,0xe2,0x73]
vldi $vr22, -3742

# CHECK: vpermi.w $vr14, $vr29, 16
# CHECK: encoding: [0xae,0x43,0xe4,0x73]
vpermi.w $vr14, $vr29, 16

# CHECK: xvseq.b $xr11, $xr23, $xr21
# CHECK: encoding: [0xeb,0x56,0x00,0x74]
xvseq.b $xr11, $xr23, $xr21

# CHECK: xvseq.h $xr6, $xr10, $xr27
# CHECK: encoding: [0x46,0xed,0x00,0x74]
xvseq.h $xr6, $xr10, $xr27

# CHECK: xvseq.w $xr19, $xr27, $xr21
# CHECK: encoding: [0x73,0x57,0x01,0x74]
xvseq.w $xr19, $xr27, $xr21

# CHECK: xvseq.d $xr18, $xr4, $xr2
# CHECK: encoding: [0x92,0x88,0x01,0x74]
xvseq.d $xr18, $xr4, $xr2

# CHECK: xvsle.b $xr19, $xr10, $xr5
# CHECK: encoding: [0x53,0x15,0x02,0x74]
xvsle.b $xr19, $xr10, $xr5

# CHECK: xvsle.h $xr10, $xr25, $xr14
# CHECK: encoding: [0x2a,0xbb,0x02,0x74]
xvsle.h $xr10, $xr25, $xr14

# CHECK: xvsle.w $xr17, $xr23, $xr18
# CHECK: encoding: [0xf1,0x4a,0x03,0x74]
xvsle.w $xr17, $xr23, $xr18

# CHECK: xvsle.d $xr15, $xr7, $xr9
# CHECK: encoding: [0xef,0xa4,0x03,0x74]
xvsle.d $xr15, $xr7, $xr9

# CHECK: xvsle.bu $xr5, $xr14, $xr15
# CHECK: encoding: [0xc5,0x3d,0x04,0x74]
xvsle.bu $xr5, $xr14, $xr15

# CHECK: xvsle.hu $xr9, $xr25, $xr25
# CHECK: encoding: [0x29,0xe7,0x04,0x74]
xvsle.hu $xr9, $xr25, $xr25

# CHECK: xvsle.wu $xr28, $xr31, $xr16
# CHECK: encoding: [0xfc,0x43,0x05,0x74]
xvsle.wu $xr28, $xr31, $xr16

# CHECK: xvsle.du $xr17, $xr24, $xr24
# CHECK: encoding: [0x11,0xe3,0x05,0x74]
xvsle.du $xr17, $xr24, $xr24

# CHECK: xvslt.b $xr18, $xr28, $xr25
# CHECK: encoding: [0x92,0x67,0x06,0x74]
xvslt.b $xr18, $xr28, $xr25

# CHECK: xvslt.h $xr29, $xr6, $xr2
# CHECK: encoding: [0xdd,0x88,0x06,0x74]
xvslt.h $xr29, $xr6, $xr2

# CHECK: xvslt.w $xr14, $xr10, $xr5
# CHECK: encoding: [0x4e,0x15,0x07,0x74]
xvslt.w $xr14, $xr10, $xr5

# CHECK: xvslt.d $xr19, $xr30, $xr15
# CHECK: encoding: [0xd3,0xbf,0x07,0x74]
xvslt.d $xr19, $xr30, $xr15

# CHECK: xvslt.bu $xr14, $xr6, $xr27
# CHECK: encoding: [0xce,0x6c,0x08,0x74]
xvslt.bu $xr14, $xr6, $xr27

# CHECK: xvslt.hu $xr27, $xr26, $xr5
# CHECK: encoding: [0x5b,0x97,0x08,0x74]
xvslt.hu $xr27, $xr26, $xr5

# CHECK: xvslt.wu $xr6, $xr9, $xr10
# CHECK: encoding: [0x26,0x29,0x09,0x74]
xvslt.wu $xr6, $xr9, $xr10

# CHECK: xvslt.du $xr13, $xr12, $xr28
# CHECK: encoding: [0x8d,0xf1,0x09,0x74]
xvslt.du $xr13, $xr12, $xr28

# CHECK: xvadd.b $xr0, $xr6, $xr3
# CHECK: encoding: [0xc0,0x0c,0x0a,0x74]
xvadd.b $xr0, $xr6, $xr3

# CHECK: xvadd.h $xr8, $xr11, $xr10
# CHECK: encoding: [0x68,0xa9,0x0a,0x74]
xvadd.h $xr8, $xr11, $xr10

# CHECK: xvadd.w $xr5, $xr6, $xr21
# CHECK: encoding: [0xc5,0x54,0x0b,0x74]
xvadd.w $xr5, $xr6, $xr21

# CHECK: xvadd.d $xr4, $xr21, $xr10
# CHECK: encoding: [0xa4,0xaa,0x0b,0x74]
xvadd.d $xr4, $xr21, $xr10

# CHECK: xvsub.b $xr16, $xr0, $xr30
# CHECK: encoding: [0x10,0x78,0x0c,0x74]
xvsub.b $xr16, $xr0, $xr30

# CHECK: xvsub.h $xr28, $xr11, $xr18
# CHECK: encoding: [0x7c,0xc9,0x0c,0x74]
xvsub.h $xr28, $xr11, $xr18

# CHECK: xvsub.w $xr13, $xr2, $xr13
# CHECK: encoding: [0x4d,0x34,0x0d,0x74]
xvsub.w $xr13, $xr2, $xr13

# CHECK: xvsub.d $xr0, $xr25, $xr21
# CHECK: encoding: [0x20,0xd7,0x0d,0x74]
xvsub.d $xr0, $xr25, $xr21

# CHECK: xvaddwev.h.b $xr8, $xr30, $xr11
# CHECK: encoding: [0xc8,0x2f,0x1e,0x74]
xvaddwev.h.b $xr8, $xr30, $xr11

# CHECK: xvaddwev.w.h $xr10, $xr30, $xr5
# CHECK: encoding: [0xca,0x97,0x1e,0x74]
xvaddwev.w.h $xr10, $xr30, $xr5

# CHECK: xvaddwev.d.w $xr20, $xr25, $xr1
# CHECK: encoding: [0x34,0x07,0x1f,0x74]
xvaddwev.d.w $xr20, $xr25, $xr1

# CHECK: xvaddwev.q.d $xr22, $xr24, $xr24
# CHECK: encoding: [0x16,0xe3,0x1f,0x74]
xvaddwev.q.d $xr22, $xr24, $xr24

# CHECK: xvsubwev.h.b $xr1, $xr25, $xr1
# CHECK: encoding: [0x21,0x07,0x20,0x74]
xvsubwev.h.b $xr1, $xr25, $xr1

# CHECK: xvsubwev.w.h $xr4, $xr30, $xr11
# CHECK: encoding: [0xc4,0xaf,0x20,0x74]
xvsubwev.w.h $xr4, $xr30, $xr11

# CHECK: xvsubwev.d.w $xr6, $xr2, $xr18
# CHECK: encoding: [0x46,0x48,0x21,0x74]
xvsubwev.d.w $xr6, $xr2, $xr18

# CHECK: xvsubwev.q.d $xr0, $xr11, $xr31
# CHECK: encoding: [0x60,0xfd,0x21,0x74]
xvsubwev.q.d $xr0, $xr11, $xr31

# CHECK: xvaddwod.h.b $xr4, $xr4, $xr25
# CHECK: encoding: [0x84,0x64,0x22,0x74]
xvaddwod.h.b $xr4, $xr4, $xr25

# CHECK: xvaddwod.w.h $xr12, $xr25, $xr29
# CHECK: encoding: [0x2c,0xf7,0x22,0x74]
xvaddwod.w.h $xr12, $xr25, $xr29

# CHECK: xvaddwod.d.w $xr16, $xr22, $xr19
# CHECK: encoding: [0xd0,0x4e,0x23,0x74]
xvaddwod.d.w $xr16, $xr22, $xr19

# CHECK: xvaddwod.q.d $xr23, $xr25, $xr14
# CHECK: encoding: [0x37,0xbb,0x23,0x74]
xvaddwod.q.d $xr23, $xr25, $xr14

# CHECK: xvsubwod.h.b $xr1, $xr16, $xr8
# CHECK: encoding: [0x01,0x22,0x24,0x74]
xvsubwod.h.b $xr1, $xr16, $xr8

# CHECK: xvsubwod.w.h $xr5, $xr11, $xr8
# CHECK: encoding: [0x65,0xa1,0x24,0x74]
xvsubwod.w.h $xr5, $xr11, $xr8

# CHECK: xvsubwod.d.w $xr20, $xr7, $xr0
# CHECK: encoding: [0xf4,0x00,0x25,0x74]
xvsubwod.d.w $xr20, $xr7, $xr0

# CHECK: xvsubwod.q.d $xr17, $xr23, $xr20
# CHECK: encoding: [0xf1,0xd2,0x25,0x74]
xvsubwod.q.d $xr17, $xr23, $xr20

# CHECK: xvaddwev.h.bu $xr15, $xr10, $xr31
# CHECK: encoding: [0x4f,0x7d,0x2e,0x74]
xvaddwev.h.bu $xr15, $xr10, $xr31

# CHECK: xvaddwev.w.hu $xr21, $xr24, $xr28
# CHECK: encoding: [0x15,0xf3,0x2e,0x74]
xvaddwev.w.hu $xr21, $xr24, $xr28

# CHECK: xvaddwev.d.wu $xr9, $xr31, $xr14
# CHECK: encoding: [0xe9,0x3b,0x2f,0x74]
xvaddwev.d.wu $xr9, $xr31, $xr14

# CHECK: xvaddwev.q.du $xr25, $xr1, $xr8
# CHECK: encoding: [0x39,0xa0,0x2f,0x74]
xvaddwev.q.du $xr25, $xr1, $xr8

# CHECK: xvsubwev.h.bu $xr30, $xr31, $xr13
# CHECK: encoding: [0xfe,0x37,0x30,0x74]
xvsubwev.h.bu $xr30, $xr31, $xr13

# CHECK: xvsubwev.w.hu $xr1, $xr28, $xr1
# CHECK: encoding: [0x81,0x87,0x30,0x74]
xvsubwev.w.hu $xr1, $xr28, $xr1

# CHECK: xvsubwev.d.wu $xr29, $xr23, $xr29
# CHECK: encoding: [0xfd,0x76,0x31,0x74]
xvsubwev.d.wu $xr29, $xr23, $xr29

# CHECK: xvsubwev.q.du $xr13, $xr16, $xr27
# CHECK: encoding: [0x0d,0xee,0x31,0x74]
xvsubwev.q.du $xr13, $xr16, $xr27

# CHECK: xvaddwod.h.bu $xr13, $xr29, $xr2
# CHECK: encoding: [0xad,0x0b,0x32,0x74]
xvaddwod.h.bu $xr13, $xr29, $xr2

# CHECK: xvaddwod.w.hu $xr14, $xr10, $xr13
# CHECK: encoding: [0x4e,0xb5,0x32,0x74]
xvaddwod.w.hu $xr14, $xr10, $xr13

# CHECK: xvaddwod.d.wu $xr30, $xr26, $xr10
# CHECK: encoding: [0x5e,0x2b,0x33,0x74]
xvaddwod.d.wu $xr30, $xr26, $xr10

# CHECK: xvaddwod.q.du $xr2, $xr13, $xr0
# CHECK: encoding: [0xa2,0x81,0x33,0x74]
xvaddwod.q.du $xr2, $xr13, $xr0

# CHECK: xvsubwod.h.bu $xr6, $xr22, $xr5
# CHECK: encoding: [0xc6,0x16,0x34,0x74]
xvsubwod.h.bu $xr6, $xr22, $xr5

# CHECK: xvsubwod.w.hu $xr19, $xr21, $xr8
# CHECK: encoding: [0xb3,0xa2,0x34,0x74]
xvsubwod.w.hu $xr19, $xr21, $xr8

# CHECK: xvsubwod.d.wu $xr16, $xr11, $xr30
# CHECK: encoding: [0x70,0x79,0x35,0x74]
xvsubwod.d.wu $xr16, $xr11, $xr30

# CHECK: xvsubwod.q.du $xr1, $xr26, $xr9
# CHECK: encoding: [0x41,0xa7,0x35,0x74]
xvsubwod.q.du $xr1, $xr26, $xr9

# CHECK: xvaddwev.h.bu.b $xr5, $xr13, $xr2
# CHECK: encoding: [0xa5,0x09,0x3e,0x74]
xvaddwev.h.bu.b $xr5, $xr13, $xr2

# CHECK: xvaddwev.w.hu.h $xr17, $xr21, $xr20
# CHECK: encoding: [0xb1,0xd2,0x3e,0x74]
xvaddwev.w.hu.h $xr17, $xr21, $xr20

# CHECK: xvaddwev.d.wu.w $xr11, $xr27, $xr19
# CHECK: encoding: [0x6b,0x4f,0x3f,0x74]
xvaddwev.d.wu.w $xr11, $xr27, $xr19

# CHECK: xvaddwev.q.du.d $xr20, $xr21, $xr29
# CHECK: encoding: [0xb4,0xf6,0x3f,0x74]
xvaddwev.q.du.d $xr20, $xr21, $xr29

# CHECK: xvaddwod.h.bu.b $xr1, $xr6, $xr14
# CHECK: encoding: [0xc1,0x38,0x40,0x74]
xvaddwod.h.bu.b $xr1, $xr6, $xr14

# CHECK: xvaddwod.w.hu.h $xr7, $xr29, $xr11
# CHECK: encoding: [0xa7,0xaf,0x40,0x74]
xvaddwod.w.hu.h $xr7, $xr29, $xr11

# CHECK: xvaddwod.d.wu.w $xr16, $xr10, $xr14
# CHECK: encoding: [0x50,0x39,0x41,0x74]
xvaddwod.d.wu.w $xr16, $xr10, $xr14

# CHECK: xvaddwod.q.du.d $xr10, $xr11, $xr23
# CHECK: encoding: [0x6a,0xdd,0x41,0x74]
xvaddwod.q.du.d $xr10, $xr11, $xr23

# CHECK: xvsadd.b $xr24, $xr10, $xr28
# CHECK: encoding: [0x58,0x71,0x46,0x74]
xvsadd.b $xr24, $xr10, $xr28

# CHECK: xvsadd.h $xr19, $xr18, $xr17
# CHECK: encoding: [0x53,0xc6,0x46,0x74]
xvsadd.h $xr19, $xr18, $xr17

# CHECK: xvsadd.w $xr2, $xr6, $xr12
# CHECK: encoding: [0xc2,0x30,0x47,0x74]
xvsadd.w $xr2, $xr6, $xr12

# CHECK: xvsadd.d $xr15, $xr18, $xr29
# CHECK: encoding: [0x4f,0xf6,0x47,0x74]
xvsadd.d $xr15, $xr18, $xr29

# CHECK: xvssub.b $xr15, $xr29, $xr16
# CHECK: encoding: [0xaf,0x43,0x48,0x74]
xvssub.b $xr15, $xr29, $xr16

# CHECK: xvssub.h $xr28, $xr3, $xr9
# CHECK: encoding: [0x7c,0xa4,0x48,0x74]
xvssub.h $xr28, $xr3, $xr9

# CHECK: xvssub.w $xr8, $xr20, $xr15
# CHECK: encoding: [0x88,0x3e,0x49,0x74]
xvssub.w $xr8, $xr20, $xr15

# CHECK: xvssub.d $xr23, $xr8, $xr19
# CHECK: encoding: [0x17,0xcd,0x49,0x74]
xvssub.d $xr23, $xr8, $xr19

# CHECK: xvsadd.bu $xr12, $xr4, $xr16
# CHECK: encoding: [0x8c,0x40,0x4a,0x74]
xvsadd.bu $xr12, $xr4, $xr16

# CHECK: xvsadd.hu $xr9, $xr26, $xr20
# CHECK: encoding: [0x49,0xd3,0x4a,0x74]
xvsadd.hu $xr9, $xr26, $xr20

# CHECK: xvsadd.wu $xr30, $xr15, $xr28
# CHECK: encoding: [0xfe,0x71,0x4b,0x74]
xvsadd.wu $xr30, $xr15, $xr28

# CHECK: xvsadd.du $xr15, $xr13, $xr28
# CHECK: encoding: [0xaf,0xf1,0x4b,0x74]
xvsadd.du $xr15, $xr13, $xr28

# CHECK: xvssub.bu $xr10, $xr3, $xr15
# CHECK: encoding: [0x6a,0x3c,0x4c,0x74]
xvssub.bu $xr10, $xr3, $xr15

# CHECK: xvssub.hu $xr0, $xr12, $xr2
# CHECK: encoding: [0x80,0x89,0x4c,0x74]
xvssub.hu $xr0, $xr12, $xr2

# CHECK: xvssub.wu $xr30, $xr10, $xr23
# CHECK: encoding: [0x5e,0x5d,0x4d,0x74]
xvssub.wu $xr30, $xr10, $xr23

# CHECK: xvssub.du $xr9, $xr30, $xr14
# CHECK: encoding: [0xc9,0xbb,0x4d,0x74]
xvssub.du $xr9, $xr30, $xr14

# CHECK: xvhaddw.h.b $xr25, $xr5, $xr18
# CHECK: encoding: [0xb9,0x48,0x54,0x74]
xvhaddw.h.b $xr25, $xr5, $xr18

# CHECK: xvhaddw.w.h $xr7, $xr20, $xr19
# CHECK: encoding: [0x87,0xce,0x54,0x74]
xvhaddw.w.h $xr7, $xr20, $xr19

# CHECK: xvhaddw.d.w $xr23, $xr5, $xr4
# CHECK: encoding: [0xb7,0x10,0x55,0x74]
xvhaddw.d.w $xr23, $xr5, $xr4

# CHECK: xvhaddw.q.d $xr17, $xr7, $xr25
# CHECK: encoding: [0xf1,0xe4,0x55,0x74]
xvhaddw.q.d $xr17, $xr7, $xr25

# CHECK: xvhsubw.h.b $xr29, $xr18, $xr19
# CHECK: encoding: [0x5d,0x4e,0x56,0x74]
xvhsubw.h.b $xr29, $xr18, $xr19

# CHECK: xvhsubw.w.h $xr30, $xr28, $xr3
# CHECK: encoding: [0x9e,0x8f,0x56,0x74]
xvhsubw.w.h $xr30, $xr28, $xr3

# CHECK: xvhsubw.d.w $xr5, $xr9, $xr13
# CHECK: encoding: [0x25,0x35,0x57,0x74]
xvhsubw.d.w $xr5, $xr9, $xr13

# CHECK: xvhsubw.q.d $xr20, $xr12, $xr29
# CHECK: encoding: [0x94,0xf5,0x57,0x74]
xvhsubw.q.d $xr20, $xr12, $xr29

# CHECK: xvhaddw.hu.bu $xr11, $xr10, $xr7
# CHECK: encoding: [0x4b,0x1d,0x58,0x74]
xvhaddw.hu.bu $xr11, $xr10, $xr7

# CHECK: xvhaddw.wu.hu $xr16, $xr21, $xr21
# CHECK: encoding: [0xb0,0xd6,0x58,0x74]
xvhaddw.wu.hu $xr16, $xr21, $xr21

# CHECK: xvhaddw.du.wu $xr17, $xr31, $xr8
# CHECK: encoding: [0xf1,0x23,0x59,0x74]
xvhaddw.du.wu $xr17, $xr31, $xr8

# CHECK: xvhaddw.qu.du $xr2, $xr4, $xr11
# CHECK: encoding: [0x82,0xac,0x59,0x74]
xvhaddw.qu.du $xr2, $xr4, $xr11

# CHECK: xvhsubw.hu.bu $xr21, $xr14, $xr8
# CHECK: encoding: [0xd5,0x21,0x5a,0x74]
xvhsubw.hu.bu $xr21, $xr14, $xr8

# CHECK: xvhsubw.wu.hu $xr25, $xr0, $xr27
# CHECK: encoding: [0x19,0xec,0x5a,0x74]
xvhsubw.wu.hu $xr25, $xr0, $xr27

# CHECK: xvhsubw.du.wu $xr4, $xr16, $xr30
# CHECK: encoding: [0x04,0x7a,0x5b,0x74]
xvhsubw.du.wu $xr4, $xr16, $xr30

# CHECK: xvhsubw.qu.du $xr11, $xr9, $xr6
# CHECK: encoding: [0x2b,0x99,0x5b,0x74]
xvhsubw.qu.du $xr11, $xr9, $xr6

# CHECK: xvadda.b $xr14, $xr21, $xr26
# CHECK: encoding: [0xae,0x6a,0x5c,0x74]
xvadda.b $xr14, $xr21, $xr26

# CHECK: xvadda.h $xr21, $xr30, $xr21
# CHECK: encoding: [0xd5,0xd7,0x5c,0x74]
xvadda.h $xr21, $xr30, $xr21

# CHECK: xvadda.w $xr31, $xr19, $xr19
# CHECK: encoding: [0x7f,0x4e,0x5d,0x74]
xvadda.w $xr31, $xr19, $xr19

# CHECK: xvadda.d $xr9, $xr4, $xr31
# CHECK: encoding: [0x89,0xfc,0x5d,0x74]
xvadda.d $xr9, $xr4, $xr31

# CHECK: xvabsd.b $xr20, $xr19, $xr13
# CHECK: encoding: [0x74,0x36,0x60,0x74]
xvabsd.b $xr20, $xr19, $xr13

# CHECK: xvabsd.h $xr20, $xr7, $xr10
# CHECK: encoding: [0xf4,0xa8,0x60,0x74]
xvabsd.h $xr20, $xr7, $xr10

# CHECK: xvabsd.w $xr23, $xr31, $xr0
# CHECK: encoding: [0xf7,0x03,0x61,0x74]
xvabsd.w $xr23, $xr31, $xr0

# CHECK: xvabsd.d $xr7, $xr17, $xr14
# CHECK: encoding: [0x27,0xba,0x61,0x74]
xvabsd.d $xr7, $xr17, $xr14

# CHECK: xvabsd.bu $xr12, $xr23, $xr6
# CHECK: encoding: [0xec,0x1a,0x62,0x74]
xvabsd.bu $xr12, $xr23, $xr6

# CHECK: xvabsd.hu $xr16, $xr30, $xr19
# CHECK: encoding: [0xd0,0xcf,0x62,0x74]
xvabsd.hu $xr16, $xr30, $xr19

# CHECK: xvabsd.wu $xr19, $xr5, $xr26
# CHECK: encoding: [0xb3,0x68,0x63,0x74]
xvabsd.wu $xr19, $xr5, $xr26

# CHECK: xvabsd.du $xr0, $xr12, $xr7
# CHECK: encoding: [0x80,0x9d,0x63,0x74]
xvabsd.du $xr0, $xr12, $xr7

# CHECK: xvavg.b $xr23, $xr31, $xr25
# CHECK: encoding: [0xf7,0x67,0x64,0x74]
xvavg.b $xr23, $xr31, $xr25

# CHECK: xvavg.h $xr27, $xr2, $xr27
# CHECK: encoding: [0x5b,0xec,0x64,0x74]
xvavg.h $xr27, $xr2, $xr27

# CHECK: xvavg.w $xr20, $xr0, $xr16
# CHECK: encoding: [0x14,0x40,0x65,0x74]
xvavg.w $xr20, $xr0, $xr16

# CHECK: xvavg.d $xr13, $xr9, $xr10
# CHECK: encoding: [0x2d,0xa9,0x65,0x74]
xvavg.d $xr13, $xr9, $xr10

# CHECK: xvavg.bu $xr31, $xr30, $xr4
# CHECK: encoding: [0xdf,0x13,0x66,0x74]
xvavg.bu $xr31, $xr30, $xr4

# CHECK: xvavg.hu $xr22, $xr17, $xr5
# CHECK: encoding: [0x36,0x96,0x66,0x74]
xvavg.hu $xr22, $xr17, $xr5

# CHECK: xvavg.wu $xr21, $xr29, $xr17
# CHECK: encoding: [0xb5,0x47,0x67,0x74]
xvavg.wu $xr21, $xr29, $xr17

# CHECK: xvavg.du $xr11, $xr5, $xr29
# CHECK: encoding: [0xab,0xf4,0x67,0x74]
xvavg.du $xr11, $xr5, $xr29

# CHECK: xvavgr.b $xr23, $xr13, $xr13
# CHECK: encoding: [0xb7,0x35,0x68,0x74]
xvavgr.b $xr23, $xr13, $xr13

# CHECK: xvavgr.h $xr30, $xr20, $xr31
# CHECK: encoding: [0x9e,0xfe,0x68,0x74]
xvavgr.h $xr30, $xr20, $xr31

# CHECK: xvavgr.w $xr29, $xr28, $xr9
# CHECK: encoding: [0x9d,0x27,0x69,0x74]
xvavgr.w $xr29, $xr28, $xr9

# CHECK: xvavgr.d $xr21, $xr20, $xr8
# CHECK: encoding: [0x95,0xa2,0x69,0x74]
xvavgr.d $xr21, $xr20, $xr8

# CHECK: xvavgr.bu $xr0, $xr9, $xr4
# CHECK: encoding: [0x20,0x11,0x6a,0x74]
xvavgr.bu $xr0, $xr9, $xr4

# CHECK: xvavgr.hu $xr3, $xr0, $xr27
# CHECK: encoding: [0x03,0xec,0x6a,0x74]
xvavgr.hu $xr3, $xr0, $xr27

# CHECK: xvavgr.wu $xr2, $xr30, $xr21
# CHECK: encoding: [0xc2,0x57,0x6b,0x74]
xvavgr.wu $xr2, $xr30, $xr21

# CHECK: xvavgr.du $xr22, $xr21, $xr17
# CHECK: encoding: [0xb6,0xc6,0x6b,0x74]
xvavgr.du $xr22, $xr21, $xr17

# CHECK: xvmax.b $xr1, $xr20, $xr19
# CHECK: encoding: [0x81,0x4e,0x70,0x74]
xvmax.b $xr1, $xr20, $xr19

# CHECK: xvmax.h $xr0, $xr17, $xr14
# CHECK: encoding: [0x20,0xba,0x70,0x74]
xvmax.h $xr0, $xr17, $xr14

# CHECK: xvmax.w $xr0, $xr8, $xr16
# CHECK: encoding: [0x00,0x41,0x71,0x74]
xvmax.w $xr0, $xr8, $xr16

# CHECK: xvmax.d $xr16, $xr23, $xr16
# CHECK: encoding: [0xf0,0xc2,0x71,0x74]
xvmax.d $xr16, $xr23, $xr16

# CHECK: xvmin.b $xr20, $xr6, $xr14
# CHECK: encoding: [0xd4,0x38,0x72,0x74]
xvmin.b $xr20, $xr6, $xr14

# CHECK: xvmin.h $xr4, $xr3, $xr24
# CHECK: encoding: [0x64,0xe0,0x72,0x74]
xvmin.h $xr4, $xr3, $xr24

# CHECK: xvmin.w $xr5, $xr2, $xr23
# CHECK: encoding: [0x45,0x5c,0x73,0x74]
xvmin.w $xr5, $xr2, $xr23

# CHECK: xvmin.d $xr31, $xr23, $xr26
# CHECK: encoding: [0xff,0xea,0x73,0x74]
xvmin.d $xr31, $xr23, $xr26

# CHECK: xvmax.bu $xr14, $xr13, $xr3
# CHECK: encoding: [0xae,0x0d,0x74,0x74]
xvmax.bu $xr14, $xr13, $xr3

# CHECK: xvmax.hu $xr22, $xr17, $xr4
# CHECK: encoding: [0x36,0x92,0x74,0x74]
xvmax.hu $xr22, $xr17, $xr4

# CHECK: xvmax.wu $xr17, $xr13, $xr29
# CHECK: encoding: [0xb1,0x75,0x75,0x74]
xvmax.wu $xr17, $xr13, $xr29

# CHECK: xvmax.du $xr13, $xr2, $xr0
# CHECK: encoding: [0x4d,0x80,0x75,0x74]
xvmax.du $xr13, $xr2, $xr0

# CHECK: xvmin.bu $xr18, $xr31, $xr27
# CHECK: encoding: [0xf2,0x6f,0x76,0x74]
xvmin.bu $xr18, $xr31, $xr27

# CHECK: xvmin.hu $xr2, $xr10, $xr14
# CHECK: encoding: [0x42,0xb9,0x76,0x74]
xvmin.hu $xr2, $xr10, $xr14

# CHECK: xvmin.wu $xr31, $xr8, $xr26
# CHECK: encoding: [0x1f,0x69,0x77,0x74]
xvmin.wu $xr31, $xr8, $xr26

# CHECK: xvmin.du $xr12, $xr26, $xr9
# CHECK: encoding: [0x4c,0xa7,0x77,0x74]
xvmin.du $xr12, $xr26, $xr9

# CHECK: xvmul.b $xr26, $xr2, $xr3
# CHECK: encoding: [0x5a,0x0c,0x84,0x74]
xvmul.b $xr26, $xr2, $xr3

# CHECK: xvmul.h $xr16, $xr29, $xr5
# CHECK: encoding: [0xb0,0x97,0x84,0x74]
xvmul.h $xr16, $xr29, $xr5

# CHECK: xvmul.w $xr19, $xr1, $xr3
# CHECK: encoding: [0x33,0x0c,0x85,0x74]
xvmul.w $xr19, $xr1, $xr3

# CHECK: xvmul.d $xr15, $xr15, $xr0
# CHECK: encoding: [0xef,0x81,0x85,0x74]
xvmul.d $xr15, $xr15, $xr0

# CHECK: xvmuh.b $xr9, $xr12, $xr9
# CHECK: encoding: [0x89,0x25,0x86,0x74]
xvmuh.b $xr9, $xr12, $xr9

# CHECK: xvmuh.h $xr8, $xr23, $xr16
# CHECK: encoding: [0xe8,0xc2,0x86,0x74]
xvmuh.h $xr8, $xr23, $xr16

# CHECK: xvmuh.w $xr29, $xr6, $xr11
# CHECK: encoding: [0xdd,0x2c,0x87,0x74]
xvmuh.w $xr29, $xr6, $xr11

# CHECK: xvmuh.d $xr3, $xr18, $xr7
# CHECK: encoding: [0x43,0x9e,0x87,0x74]
xvmuh.d $xr3, $xr18, $xr7

# CHECK: xvmuh.bu $xr3, $xr7, $xr19
# CHECK: encoding: [0xe3,0x4c,0x88,0x74]
xvmuh.bu $xr3, $xr7, $xr19

# CHECK: xvmuh.hu $xr13, $xr1, $xr18
# CHECK: encoding: [0x2d,0xc8,0x88,0x74]
xvmuh.hu $xr13, $xr1, $xr18

# CHECK: xvmuh.wu $xr15, $xr21, $xr16
# CHECK: encoding: [0xaf,0x42,0x89,0x74]
xvmuh.wu $xr15, $xr21, $xr16

# CHECK: xvmuh.du $xr11, $xr10, $xr19
# CHECK: encoding: [0x4b,0xcd,0x89,0x74]
xvmuh.du $xr11, $xr10, $xr19

# CHECK: xvmulwev.h.b $xr4, $xr12, $xr9
# CHECK: encoding: [0x84,0x25,0x90,0x74]
xvmulwev.h.b $xr4, $xr12, $xr9

# CHECK: xvmulwev.w.h $xr10, $xr3, $xr20
# CHECK: encoding: [0x6a,0xd0,0x90,0x74]
xvmulwev.w.h $xr10, $xr3, $xr20

# CHECK: xvmulwev.d.w $xr4, $xr22, $xr18
# CHECK: encoding: [0xc4,0x4a,0x91,0x74]
xvmulwev.d.w $xr4, $xr22, $xr18

# CHECK: xvmulwev.q.d $xr20, $xr21, $xr27
# CHECK: encoding: [0xb4,0xee,0x91,0x74]
xvmulwev.q.d $xr20, $xr21, $xr27

# CHECK: xvmulwod.h.b $xr5, $xr7, $xr0
# CHECK: encoding: [0xe5,0x00,0x92,0x74]
xvmulwod.h.b $xr5, $xr7, $xr0

# CHECK: xvmulwod.w.h $xr19, $xr28, $xr11
# CHECK: encoding: [0x93,0xaf,0x92,0x74]
xvmulwod.w.h $xr19, $xr28, $xr11

# CHECK: xvmulwod.d.w $xr19, $xr7, $xr16
# CHECK: encoding: [0xf3,0x40,0x93,0x74]
xvmulwod.d.w $xr19, $xr7, $xr16

# CHECK: xvmulwod.q.d $xr11, $xr12, $xr13
# CHECK: encoding: [0x8b,0xb5,0x93,0x74]
xvmulwod.q.d $xr11, $xr12, $xr13

# CHECK: xvmulwev.h.bu $xr22, $xr2, $xr1
# CHECK: encoding: [0x56,0x04,0x98,0x74]
xvmulwev.h.bu $xr22, $xr2, $xr1

# CHECK: xvmulwev.w.hu $xr2, $xr3, $xr4
# CHECK: encoding: [0x62,0x90,0x98,0x74]
xvmulwev.w.hu $xr2, $xr3, $xr4

# CHECK: xvmulwev.d.wu $xr2, $xr12, $xr25
# CHECK: encoding: [0x82,0x65,0x99,0x74]
xvmulwev.d.wu $xr2, $xr12, $xr25

# CHECK: xvmulwev.q.du $xr22, $xr29, $xr17
# CHECK: encoding: [0xb6,0xc7,0x99,0x74]
xvmulwev.q.du $xr22, $xr29, $xr17

# CHECK: xvmulwod.h.bu $xr9, $xr9, $xr0
# CHECK: encoding: [0x29,0x01,0x9a,0x74]
xvmulwod.h.bu $xr9, $xr9, $xr0

# CHECK: xvmulwod.w.hu $xr20, $xr2, $xr16
# CHECK: encoding: [0x54,0xc0,0x9a,0x74]
xvmulwod.w.hu $xr20, $xr2, $xr16

# CHECK: xvmulwod.d.wu $xr1, $xr11, $xr24
# CHECK: encoding: [0x61,0x61,0x9b,0x74]
xvmulwod.d.wu $xr1, $xr11, $xr24

# CHECK: xvmulwod.q.du $xr19, $xr2, $xr22
# CHECK: encoding: [0x53,0xd8,0x9b,0x74]
xvmulwod.q.du $xr19, $xr2, $xr22

# CHECK: xvmulwev.h.bu.b $xr22, $xr29, $xr24
# CHECK: encoding: [0xb6,0x63,0xa0,0x74]
xvmulwev.h.bu.b $xr22, $xr29, $xr24

# CHECK: xvmulwev.w.hu.h $xr1, $xr22, $xr11
# CHECK: encoding: [0xc1,0xae,0xa0,0x74]
xvmulwev.w.hu.h $xr1, $xr22, $xr11

# CHECK: xvmulwev.d.wu.w $xr12, $xr12, $xr12
# CHECK: encoding: [0x8c,0x31,0xa1,0x74]
xvmulwev.d.wu.w $xr12, $xr12, $xr12

# CHECK: xvmulwev.q.du.d $xr0, $xr17, $xr23
# CHECK: encoding: [0x20,0xde,0xa1,0x74]
xvmulwev.q.du.d $xr0, $xr17, $xr23

# CHECK: xvmulwod.h.bu.b $xr26, $xr16, $xr23
# CHECK: encoding: [0x1a,0x5e,0xa2,0x74]
xvmulwod.h.bu.b $xr26, $xr16, $xr23

# CHECK: xvmulwod.w.hu.h $xr31, $xr12, $xr9
# CHECK: encoding: [0x9f,0xa5,0xa2,0x74]
xvmulwod.w.hu.h $xr31, $xr12, $xr9

# CHECK: xvmulwod.d.wu.w $xr21, $xr27, $xr19
# CHECK: encoding: [0x75,0x4f,0xa3,0x74]
xvmulwod.d.wu.w $xr21, $xr27, $xr19

# CHECK: xvmulwod.q.du.d $xr7, $xr5, $xr11
# CHECK: encoding: [0xa7,0xac,0xa3,0x74]
xvmulwod.q.du.d $xr7, $xr5, $xr11

# CHECK: xvmadd.b $xr22, $xr11, $xr15
# CHECK: encoding: [0x76,0x3d,0xa8,0x74]
xvmadd.b $xr22, $xr11, $xr15

# CHECK: xvmadd.h $xr3, $xr30, $xr25
# CHECK: encoding: [0xc3,0xe7,0xa8,0x74]
xvmadd.h $xr3, $xr30, $xr25

# CHECK: xvmadd.w $xr1, $xr18, $xr5
# CHECK: encoding: [0x41,0x16,0xa9,0x74]
xvmadd.w $xr1, $xr18, $xr5

# CHECK: xvmadd.d $xr16, $xr21, $xr11
# CHECK: encoding: [0xb0,0xae,0xa9,0x74]
xvmadd.d $xr16, $xr21, $xr11

# CHECK: xvmsub.b $xr11, $xr12, $xr10
# CHECK: encoding: [0x8b,0x29,0xaa,0x74]
xvmsub.b $xr11, $xr12, $xr10

# CHECK: xvmsub.h $xr16, $xr11, $xr1
# CHECK: encoding: [0x70,0x85,0xaa,0x74]
xvmsub.h $xr16, $xr11, $xr1

# CHECK: xvmsub.w $xr15, $xr21, $xr21
# CHECK: encoding: [0xaf,0x56,0xab,0x74]
xvmsub.w $xr15, $xr21, $xr21

# CHECK: xvmsub.d $xr12, $xr11, $xr4
# CHECK: encoding: [0x6c,0x91,0xab,0x74]
xvmsub.d $xr12, $xr11, $xr4

# CHECK: xvmaddwev.h.b $xr21, $xr7, $xr6
# CHECK: encoding: [0xf5,0x18,0xac,0x74]
xvmaddwev.h.b $xr21, $xr7, $xr6

# CHECK: xvmaddwev.w.h $xr16, $xr29, $xr13
# CHECK: encoding: [0xb0,0xb7,0xac,0x74]
xvmaddwev.w.h $xr16, $xr29, $xr13

# CHECK: xvmaddwev.d.w $xr7, $xr25, $xr30
# CHECK: encoding: [0x27,0x7b,0xad,0x74]
xvmaddwev.d.w $xr7, $xr25, $xr30

# CHECK: xvmaddwev.q.d $xr19, $xr3, $xr8
# CHECK: encoding: [0x73,0xa0,0xad,0x74]
xvmaddwev.q.d $xr19, $xr3, $xr8

# CHECK: xvmaddwod.h.b $xr20, $xr27, $xr12
# CHECK: encoding: [0x74,0x33,0xae,0x74]
xvmaddwod.h.b $xr20, $xr27, $xr12

# CHECK: xvmaddwod.w.h $xr0, $xr21, $xr13
# CHECK: encoding: [0xa0,0xb6,0xae,0x74]
xvmaddwod.w.h $xr0, $xr21, $xr13

# CHECK: xvmaddwod.d.w $xr25, $xr13, $xr31
# CHECK: encoding: [0xb9,0x7d,0xaf,0x74]
xvmaddwod.d.w $xr25, $xr13, $xr31

# CHECK: xvmaddwod.q.d $xr26, $xr26, $xr16
# CHECK: encoding: [0x5a,0xc3,0xaf,0x74]
xvmaddwod.q.d $xr26, $xr26, $xr16

# CHECK: xvmaddwev.h.bu $xr18, $xr26, $xr21
# CHECK: encoding: [0x52,0x57,0xb4,0x74]
xvmaddwev.h.bu $xr18, $xr26, $xr21

# CHECK: xvmaddwev.w.hu $xr14, $xr16, $xr5
# CHECK: encoding: [0x0e,0x96,0xb4,0x74]
xvmaddwev.w.hu $xr14, $xr16, $xr5

# CHECK: xvmaddwev.d.wu $xr19, $xr29, $xr20
# CHECK: encoding: [0xb3,0x53,0xb5,0x74]
xvmaddwev.d.wu $xr19, $xr29, $xr20

# CHECK: xvmaddwev.q.du $xr15, $xr29, $xr17
# CHECK: encoding: [0xaf,0xc7,0xb5,0x74]
xvmaddwev.q.du $xr15, $xr29, $xr17

# CHECK: xvmaddwod.h.bu $xr13, $xr26, $xr1
# CHECK: encoding: [0x4d,0x07,0xb6,0x74]
xvmaddwod.h.bu $xr13, $xr26, $xr1

# CHECK: xvmaddwod.w.hu $xr15, $xr25, $xr16
# CHECK: encoding: [0x2f,0xc3,0xb6,0x74]
xvmaddwod.w.hu $xr15, $xr25, $xr16

# CHECK: xvmaddwod.d.wu $xr23, $xr4, $xr9
# CHECK: encoding: [0x97,0x24,0xb7,0x74]
xvmaddwod.d.wu $xr23, $xr4, $xr9

# CHECK: xvmaddwod.q.du $xr29, $xr22, $xr17
# CHECK: encoding: [0xdd,0xc6,0xb7,0x74]
xvmaddwod.q.du $xr29, $xr22, $xr17

# CHECK: xvmaddwev.h.bu.b $xr23, $xr1, $xr6
# CHECK: encoding: [0x37,0x18,0xbc,0x74]
xvmaddwev.h.bu.b $xr23, $xr1, $xr6

# CHECK: xvmaddwev.w.hu.h $xr4, $xr27, $xr12
# CHECK: encoding: [0x64,0xb3,0xbc,0x74]
xvmaddwev.w.hu.h $xr4, $xr27, $xr12

# CHECK: xvmaddwev.d.wu.w $xr0, $xr2, $xr5
# CHECK: encoding: [0x40,0x14,0xbd,0x74]
xvmaddwev.d.wu.w $xr0, $xr2, $xr5

# CHECK: xvmaddwev.q.du.d $xr9, $xr31, $xr1
# CHECK: encoding: [0xe9,0x87,0xbd,0x74]
xvmaddwev.q.du.d $xr9, $xr31, $xr1

# CHECK: xvmaddwod.h.bu.b $xr9, $xr19, $xr20
# CHECK: encoding: [0x69,0x52,0xbe,0x74]
xvmaddwod.h.bu.b $xr9, $xr19, $xr20

# CHECK: xvmaddwod.w.hu.h $xr7, $xr5, $xr13
# CHECK: encoding: [0xa7,0xb4,0xbe,0x74]
xvmaddwod.w.hu.h $xr7, $xr5, $xr13

# CHECK: xvmaddwod.d.wu.w $xr10, $xr27, $xr1
# CHECK: encoding: [0x6a,0x07,0xbf,0x74]
xvmaddwod.d.wu.w $xr10, $xr27, $xr1

# CHECK: xvmaddwod.q.du.d $xr25, $xr19, $xr0
# CHECK: encoding: [0x79,0x82,0xbf,0x74]
xvmaddwod.q.du.d $xr25, $xr19, $xr0

# CHECK: xvdiv.b $xr3, $xr31, $xr2
# CHECK: encoding: [0xe3,0x0b,0xe0,0x74]
xvdiv.b $xr3, $xr31, $xr2

# CHECK: xvdiv.h $xr1, $xr12, $xr17
# CHECK: encoding: [0x81,0xc5,0xe0,0x74]
xvdiv.h $xr1, $xr12, $xr17

# CHECK: xvdiv.w $xr13, $xr0, $xr12
# CHECK: encoding: [0x0d,0x30,0xe1,0x74]
xvdiv.w $xr13, $xr0, $xr12

# CHECK: xvdiv.d $xr17, $xr5, $xr11
# CHECK: encoding: [0xb1,0xac,0xe1,0x74]
xvdiv.d $xr17, $xr5, $xr11

# CHECK: xvmod.b $xr22, $xr17, $xr1
# CHECK: encoding: [0x36,0x06,0xe2,0x74]
xvmod.b $xr22, $xr17, $xr1

# CHECK: xvmod.h $xr28, $xr5, $xr12
# CHECK: encoding: [0xbc,0xb0,0xe2,0x74]
xvmod.h $xr28, $xr5, $xr12

# CHECK: xvmod.w $xr29, $xr19, $xr14
# CHECK: encoding: [0x7d,0x3a,0xe3,0x74]
xvmod.w $xr29, $xr19, $xr14

# CHECK: xvmod.d $xr17, $xr8, $xr6
# CHECK: encoding: [0x11,0x99,0xe3,0x74]
xvmod.d $xr17, $xr8, $xr6

# CHECK: xvdiv.bu $xr23, $xr6, $xr2
# CHECK: encoding: [0xd7,0x08,0xe4,0x74]
xvdiv.bu $xr23, $xr6, $xr2

# CHECK: xvdiv.hu $xr9, $xr31, $xr0
# CHECK: encoding: [0xe9,0x83,0xe4,0x74]
xvdiv.hu $xr9, $xr31, $xr0

# CHECK: xvdiv.wu $xr15, $xr1, $xr4
# CHECK: encoding: [0x2f,0x10,0xe5,0x74]
xvdiv.wu $xr15, $xr1, $xr4

# CHECK: xvdiv.du $xr14, $xr29, $xr11
# CHECK: encoding: [0xae,0xaf,0xe5,0x74]
xvdiv.du $xr14, $xr29, $xr11

# CHECK: xvmod.bu $xr4, $xr12, $xr31
# CHECK: encoding: [0x84,0x7d,0xe6,0x74]
xvmod.bu $xr4, $xr12, $xr31

# CHECK: xvmod.hu $xr22, $xr12, $xr11
# CHECK: encoding: [0x96,0xad,0xe6,0x74]
xvmod.hu $xr22, $xr12, $xr11

# CHECK: xvmod.wu $xr21, $xr23, $xr10
# CHECK: encoding: [0xf5,0x2a,0xe7,0x74]
xvmod.wu $xr21, $xr23, $xr10

# CHECK: xvmod.du $xr21, $xr21, $xr31
# CHECK: encoding: [0xb5,0xfe,0xe7,0x74]
xvmod.du $xr21, $xr21, $xr31

# CHECK: xvsll.b $xr16, $xr10, $xr11
# CHECK: encoding: [0x50,0x2d,0xe8,0x74]
xvsll.b $xr16, $xr10, $xr11

# CHECK: xvsll.h $xr12, $xr10, $xr27
# CHECK: encoding: [0x4c,0xed,0xe8,0x74]
xvsll.h $xr12, $xr10, $xr27

# CHECK: xvsll.w $xr30, $xr2, $xr26
# CHECK: encoding: [0x5e,0x68,0xe9,0x74]
xvsll.w $xr30, $xr2, $xr26

# CHECK: xvsll.d $xr8, $xr21, $xr17
# CHECK: encoding: [0xa8,0xc6,0xe9,0x74]
xvsll.d $xr8, $xr21, $xr17

# CHECK: xvsrl.b $xr27, $xr24, $xr18
# CHECK: encoding: [0x1b,0x4b,0xea,0x74]
xvsrl.b $xr27, $xr24, $xr18

# CHECK: xvsrl.h $xr17, $xr31, $xr24
# CHECK: encoding: [0xf1,0xe3,0xea,0x74]
xvsrl.h $xr17, $xr31, $xr24

# CHECK: xvsrl.w $xr5, $xr3, $xr4
# CHECK: encoding: [0x65,0x10,0xeb,0x74]
xvsrl.w $xr5, $xr3, $xr4

# CHECK: xvsrl.d $xr21, $xr6, $xr8
# CHECK: encoding: [0xd5,0xa0,0xeb,0x74]
xvsrl.d $xr21, $xr6, $xr8

# CHECK: xvsra.b $xr28, $xr28, $xr21
# CHECK: encoding: [0x9c,0x57,0xec,0x74]
xvsra.b $xr28, $xr28, $xr21

# CHECK: xvsra.h $xr19, $xr4, $xr26
# CHECK: encoding: [0x93,0xe8,0xec,0x74]
xvsra.h $xr19, $xr4, $xr26

# CHECK: xvsra.w $xr13, $xr20, $xr1
# CHECK: encoding: [0x8d,0x06,0xed,0x74]
xvsra.w $xr13, $xr20, $xr1

# CHECK: xvsra.d $xr0, $xr8, $xr18
# CHECK: encoding: [0x00,0xc9,0xed,0x74]
xvsra.d $xr0, $xr8, $xr18

# CHECK: xvrotr.b $xr8, $xr30, $xr28
# CHECK: encoding: [0xc8,0x73,0xee,0x74]
xvrotr.b $xr8, $xr30, $xr28

# CHECK: xvrotr.h $xr17, $xr19, $xr0
# CHECK: encoding: [0x71,0x82,0xee,0x74]
xvrotr.h $xr17, $xr19, $xr0

# CHECK: xvrotr.w $xr15, $xr28, $xr23
# CHECK: encoding: [0x8f,0x5f,0xef,0x74]
xvrotr.w $xr15, $xr28, $xr23

# CHECK: xvrotr.d $xr31, $xr2, $xr21
# CHECK: encoding: [0x5f,0xd4,0xef,0x74]
xvrotr.d $xr31, $xr2, $xr21

# CHECK: xvsrlr.b $xr20, $xr26, $xr11
# CHECK: encoding: [0x54,0x2f,0xf0,0x74]
xvsrlr.b $xr20, $xr26, $xr11

# CHECK: xvsrlr.h $xr13, $xr18, $xr7
# CHECK: encoding: [0x4d,0x9e,0xf0,0x74]
xvsrlr.h $xr13, $xr18, $xr7

# CHECK: xvsrlr.w $xr28, $xr1, $xr3
# CHECK: encoding: [0x3c,0x0c,0xf1,0x74]
xvsrlr.w $xr28, $xr1, $xr3

# CHECK: xvsrlr.d $xr6, $xr3, $xr14
# CHECK: encoding: [0x66,0xb8,0xf1,0x74]
xvsrlr.d $xr6, $xr3, $xr14

# CHECK: xvsrar.b $xr10, $xr8, $xr17
# CHECK: encoding: [0x0a,0x45,0xf2,0x74]
xvsrar.b $xr10, $xr8, $xr17

# CHECK: xvsrar.h $xr31, $xr2, $xr11
# CHECK: encoding: [0x5f,0xac,0xf2,0x74]
xvsrar.h $xr31, $xr2, $xr11

# CHECK: xvsrar.w $xr13, $xr8, $xr5
# CHECK: encoding: [0x0d,0x15,0xf3,0x74]
xvsrar.w $xr13, $xr8, $xr5

# CHECK: xvsrar.d $xr12, $xr18, $xr0
# CHECK: encoding: [0x4c,0x82,0xf3,0x74]
xvsrar.d $xr12, $xr18, $xr0

# CHECK: xvsrln.b.h $xr15, $xr6, $xr15
# CHECK: encoding: [0xcf,0xbc,0xf4,0x74]
xvsrln.b.h $xr15, $xr6, $xr15

# CHECK: xvsrln.h.w $xr22, $xr19, $xr17
# CHECK: encoding: [0x76,0x46,0xf5,0x74]
xvsrln.h.w $xr22, $xr19, $xr17

# CHECK: xvsrln.w.d $xr4, $xr7, $xr5
# CHECK: encoding: [0xe4,0x94,0xf5,0x74]
xvsrln.w.d $xr4, $xr7, $xr5

# CHECK: xvsran.b.h $xr3, $xr19, $xr23
# CHECK: encoding: [0x63,0xde,0xf6,0x74]
xvsran.b.h $xr3, $xr19, $xr23

# CHECK: xvsran.h.w $xr16, $xr6, $xr1
# CHECK: encoding: [0xd0,0x04,0xf7,0x74]
xvsran.h.w $xr16, $xr6, $xr1

# CHECK: xvsran.w.d $xr27, $xr16, $xr0
# CHECK: encoding: [0x1b,0x82,0xf7,0x74]
xvsran.w.d $xr27, $xr16, $xr0

# CHECK: xvsrlrn.b.h $xr2, $xr9, $xr9
# CHECK: encoding: [0x22,0xa5,0xf8,0x74]
xvsrlrn.b.h $xr2, $xr9, $xr9

# CHECK: xvsrlrn.h.w $xr16, $xr11, $xr19
# CHECK: encoding: [0x70,0x4d,0xf9,0x74]
xvsrlrn.h.w $xr16, $xr11, $xr19

# CHECK: xvsrlrn.w.d $xr29, $xr25, $xr15
# CHECK: encoding: [0x3d,0xbf,0xf9,0x74]
xvsrlrn.w.d $xr29, $xr25, $xr15

# CHECK: xvsrarn.b.h $xr13, $xr20, $xr13
# CHECK: encoding: [0x8d,0xb6,0xfa,0x74]
xvsrarn.b.h $xr13, $xr20, $xr13

# CHECK: xvsrarn.h.w $xr13, $xr22, $xr1
# CHECK: encoding: [0xcd,0x06,0xfb,0x74]
xvsrarn.h.w $xr13, $xr22, $xr1

# CHECK: xvsrarn.w.d $xr13, $xr12, $xr2
# CHECK: encoding: [0x8d,0x89,0xfb,0x74]
xvsrarn.w.d $xr13, $xr12, $xr2

# CHECK: xvssrln.b.h $xr19, $xr19, $xr10
# CHECK: encoding: [0x73,0xaa,0xfc,0x74]
xvssrln.b.h $xr19, $xr19, $xr10

# CHECK: xvssrln.h.w $xr12, $xr24, $xr17
# CHECK: encoding: [0x0c,0x47,0xfd,0x74]
xvssrln.h.w $xr12, $xr24, $xr17

# CHECK: xvssrln.w.d $xr7, $xr30, $xr14
# CHECK: encoding: [0xc7,0xbb,0xfd,0x74]
xvssrln.w.d $xr7, $xr30, $xr14

# CHECK: xvssran.b.h $xr6, $xr9, $xr23
# CHECK: encoding: [0x26,0xdd,0xfe,0x74]
xvssran.b.h $xr6, $xr9, $xr23

# CHECK: xvssran.h.w $xr13, $xr9, $xr2
# CHECK: encoding: [0x2d,0x09,0xff,0x74]
xvssran.h.w $xr13, $xr9, $xr2

# CHECK: xvssran.w.d $xr18, $xr26, $xr1
# CHECK: encoding: [0x52,0x87,0xff,0x74]
xvssran.w.d $xr18, $xr26, $xr1

# CHECK: xvssrlrn.b.h $xr24, $xr17, $xr23
# CHECK: encoding: [0x38,0xde,0x00,0x75]
xvssrlrn.b.h $xr24, $xr17, $xr23

# CHECK: xvssrlrn.h.w $xr10, $xr12, $xr8
# CHECK: encoding: [0x8a,0x21,0x01,0x75]
xvssrlrn.h.w $xr10, $xr12, $xr8

# CHECK: xvssrlrn.w.d $xr30, $xr27, $xr6
# CHECK: encoding: [0x7e,0x9b,0x01,0x75]
xvssrlrn.w.d $xr30, $xr27, $xr6

# CHECK: xvssrarn.b.h $xr20, $xr27, $xr31
# CHECK: encoding: [0x74,0xff,0x02,0x75]
xvssrarn.b.h $xr20, $xr27, $xr31

# CHECK: xvssrarn.h.w $xr24, $xr23, $xr23
# CHECK: encoding: [0xf8,0x5e,0x03,0x75]
xvssrarn.h.w $xr24, $xr23, $xr23

# CHECK: xvssrarn.w.d $xr8, $xr29, $xr25
# CHECK: encoding: [0xa8,0xe7,0x03,0x75]
xvssrarn.w.d $xr8, $xr29, $xr25

# CHECK: xvssrln.bu.h $xr14, $xr4, $xr17
# CHECK: encoding: [0x8e,0xc4,0x04,0x75]
xvssrln.bu.h $xr14, $xr4, $xr17

# CHECK: xvssrln.hu.w $xr28, $xr20, $xr10
# CHECK: encoding: [0x9c,0x2a,0x05,0x75]
xvssrln.hu.w $xr28, $xr20, $xr10

# CHECK: xvssrln.wu.d $xr10, $xr8, $xr20
# CHECK: encoding: [0x0a,0xd1,0x05,0x75]
xvssrln.wu.d $xr10, $xr8, $xr20

# CHECK: xvssran.bu.h $xr18, $xr28, $xr23
# CHECK: encoding: [0x92,0xdf,0x06,0x75]
xvssran.bu.h $xr18, $xr28, $xr23

# CHECK: xvssran.hu.w $xr25, $xr19, $xr24
# CHECK: encoding: [0x79,0x62,0x07,0x75]
xvssran.hu.w $xr25, $xr19, $xr24

# CHECK: xvssran.wu.d $xr16, $xr29, $xr18
# CHECK: encoding: [0xb0,0xcb,0x07,0x75]
xvssran.wu.d $xr16, $xr29, $xr18

# CHECK: xvssrlrn.bu.h $xr2, $xr19, $xr14
# CHECK: encoding: [0x62,0xba,0x08,0x75]
xvssrlrn.bu.h $xr2, $xr19, $xr14

# CHECK: xvssrlrn.hu.w $xr6, $xr0, $xr18
# CHECK: encoding: [0x06,0x48,0x09,0x75]
xvssrlrn.hu.w $xr6, $xr0, $xr18

# CHECK: xvssrlrn.wu.d $xr30, $xr4, $xr31
# CHECK: encoding: [0x9e,0xfc,0x09,0x75]
xvssrlrn.wu.d $xr30, $xr4, $xr31

# CHECK: xvssrarn.bu.h $xr16, $xr28, $xr8
# CHECK: encoding: [0x90,0xa3,0x0a,0x75]
xvssrarn.bu.h $xr16, $xr28, $xr8

# CHECK: xvssrarn.hu.w $xr11, $xr2, $xr6
# CHECK: encoding: [0x4b,0x18,0x0b,0x75]
xvssrarn.hu.w $xr11, $xr2, $xr6

# CHECK: xvssrarn.wu.d $xr22, $xr6, $xr12
# CHECK: encoding: [0xd6,0xb0,0x0b,0x75]
xvssrarn.wu.d $xr22, $xr6, $xr12

# CHECK: xvbitclr.b $xr4, $xr16, $xr16
# CHECK: encoding: [0x04,0x42,0x0c,0x75]
xvbitclr.b $xr4, $xr16, $xr16

# CHECK: xvbitclr.h $xr16, $xr31, $xr26
# CHECK: encoding: [0xf0,0xeb,0x0c,0x75]
xvbitclr.h $xr16, $xr31, $xr26

# CHECK: xvbitclr.w $xr24, $xr2, $xr20
# CHECK: encoding: [0x58,0x50,0x0d,0x75]
xvbitclr.w $xr24, $xr2, $xr20

# CHECK: xvbitclr.d $xr18, $xr12, $xr30
# CHECK: encoding: [0x92,0xf9,0x0d,0x75]
xvbitclr.d $xr18, $xr12, $xr30

# CHECK: xvbitset.b $xr26, $xr27, $xr23
# CHECK: encoding: [0x7a,0x5f,0x0e,0x75]
xvbitset.b $xr26, $xr27, $xr23

# CHECK: xvbitset.h $xr19, $xr19, $xr11
# CHECK: encoding: [0x73,0xae,0x0e,0x75]
xvbitset.h $xr19, $xr19, $xr11

# CHECK: xvbitset.w $xr7, $xr9, $xr18
# CHECK: encoding: [0x27,0x49,0x0f,0x75]
xvbitset.w $xr7, $xr9, $xr18

# CHECK: xvbitset.d $xr6, $xr30, $xr3
# CHECK: encoding: [0xc6,0x8f,0x0f,0x75]
xvbitset.d $xr6, $xr30, $xr3

# CHECK: xvbitrev.b $xr30, $xr13, $xr7
# CHECK: encoding: [0xbe,0x1d,0x10,0x75]
xvbitrev.b $xr30, $xr13, $xr7

# CHECK: xvbitrev.h $xr12, $xr3, $xr8
# CHECK: encoding: [0x6c,0xa0,0x10,0x75]
xvbitrev.h $xr12, $xr3, $xr8

# CHECK: xvbitrev.w $xr8, $xr20, $xr20
# CHECK: encoding: [0x88,0x52,0x11,0x75]
xvbitrev.w $xr8, $xr20, $xr20

# CHECK: xvbitrev.d $xr28, $xr7, $xr17
# CHECK: encoding: [0xfc,0xc4,0x11,0x75]
xvbitrev.d $xr28, $xr7, $xr17

# CHECK: xvpackev.b $xr29, $xr18, $xr12
# CHECK: encoding: [0x5d,0x32,0x16,0x75]
xvpackev.b $xr29, $xr18, $xr12

# CHECK: xvpackev.h $xr6, $xr11, $xr17
# CHECK: encoding: [0x66,0xc5,0x16,0x75]
xvpackev.h $xr6, $xr11, $xr17

# CHECK: xvpackev.w $xr2, $xr2, $xr30
# CHECK: encoding: [0x42,0x78,0x17,0x75]
xvpackev.w $xr2, $xr2, $xr30

# CHECK: xvpackev.d $xr26, $xr15, $xr21
# CHECK: encoding: [0xfa,0xd5,0x17,0x75]
xvpackev.d $xr26, $xr15, $xr21

# CHECK: xvpackod.b $xr19, $xr17, $xr17
# CHECK: encoding: [0x33,0x46,0x18,0x75]
xvpackod.b $xr19, $xr17, $xr17

# CHECK: xvpackod.h $xr15, $xr8, $xr3
# CHECK: encoding: [0x0f,0x8d,0x18,0x75]
xvpackod.h $xr15, $xr8, $xr3

# CHECK: xvpackod.w $xr13, $xr15, $xr12
# CHECK: encoding: [0xed,0x31,0x19,0x75]
xvpackod.w $xr13, $xr15, $xr12

# CHECK: xvpackod.d $xr5, $xr3, $xr26
# CHECK: encoding: [0x65,0xe8,0x19,0x75]
xvpackod.d $xr5, $xr3, $xr26

# CHECK: xvilvl.b $xr27, $xr9, $xr1
# CHECK: encoding: [0x3b,0x05,0x1a,0x75]
xvilvl.b $xr27, $xr9, $xr1

# CHECK: xvilvl.h $xr29, $xr8, $xr1
# CHECK: encoding: [0x1d,0x85,0x1a,0x75]
xvilvl.h $xr29, $xr8, $xr1

# CHECK: xvilvl.w $xr9, $xr8, $xr7
# CHECK: encoding: [0x09,0x1d,0x1b,0x75]
xvilvl.w $xr9, $xr8, $xr7

# CHECK: xvilvl.d $xr25, $xr7, $xr18
# CHECK: encoding: [0xf9,0xc8,0x1b,0x75]
xvilvl.d $xr25, $xr7, $xr18

# CHECK: xvilvh.b $xr7, $xr24, $xr26
# CHECK: encoding: [0x07,0x6b,0x1c,0x75]
xvilvh.b $xr7, $xr24, $xr26

# CHECK: xvilvh.h $xr6, $xr20, $xr28
# CHECK: encoding: [0x86,0xf2,0x1c,0x75]
xvilvh.h $xr6, $xr20, $xr28

# CHECK: xvilvh.w $xr13, $xr5, $xr12
# CHECK: encoding: [0xad,0x30,0x1d,0x75]
xvilvh.w $xr13, $xr5, $xr12

# CHECK: xvilvh.d $xr1, $xr21, $xr31
# CHECK: encoding: [0xa1,0xfe,0x1d,0x75]
xvilvh.d $xr1, $xr21, $xr31

# CHECK: xvpickev.b $xr17, $xr13, $xr31
# CHECK: encoding: [0xb1,0x7d,0x1e,0x75]
xvpickev.b $xr17, $xr13, $xr31

# CHECK: xvpickev.h $xr4, $xr8, $xr14
# CHECK: encoding: [0x04,0xb9,0x1e,0x75]
xvpickev.h $xr4, $xr8, $xr14

# CHECK: xvpickev.w $xr10, $xr8, $xr11
# CHECK: encoding: [0x0a,0x2d,0x1f,0x75]
xvpickev.w $xr10, $xr8, $xr11

# CHECK: xvpickev.d $xr26, $xr20, $xr8
# CHECK: encoding: [0x9a,0xa2,0x1f,0x75]
xvpickev.d $xr26, $xr20, $xr8

# CHECK: xvpickod.b $xr19, $xr21, $xr27
# CHECK: encoding: [0xb3,0x6e,0x20,0x75]
xvpickod.b $xr19, $xr21, $xr27

# CHECK: xvpickod.h $xr28, $xr5, $xr19
# CHECK: encoding: [0xbc,0xcc,0x20,0x75]
xvpickod.h $xr28, $xr5, $xr19

# CHECK: xvpickod.w $xr21, $xr18, $xr22
# CHECK: encoding: [0x55,0x5a,0x21,0x75]
xvpickod.w $xr21, $xr18, $xr22

# CHECK: xvpickod.d $xr28, $xr7, $xr18
# CHECK: encoding: [0xfc,0xc8,0x21,0x75]
xvpickod.d $xr28, $xr7, $xr18

# CHECK: xvreplve.b $xr6, $xr20, $r25
# CHECK: encoding: [0x86,0x66,0x22,0x75]
xvreplve.b $xr6, $xr20, $r25

# CHECK: xvreplve.h $xr27, $xr7, $r14
# CHECK: encoding: [0xfb,0xb8,0x22,0x75]
xvreplve.h $xr27, $xr7, $r14

# CHECK: xvreplve.w $xr1, $xr4, $r15
# CHECK: encoding: [0x81,0x3c,0x23,0x75]
xvreplve.w $xr1, $xr4, $r15

# CHECK: xvreplve.d $xr12, $xr12, $r16
# CHECK: encoding: [0x8c,0xc1,0x23,0x75]
xvreplve.d $xr12, $xr12, $r16

# CHECK: xvand.v $xr1, $xr3, $xr29
# CHECK: encoding: [0x61,0x74,0x26,0x75]
xvand.v $xr1, $xr3, $xr29

# CHECK: xvor.v $xr23, $xr11, $xr20
# CHECK: encoding: [0x77,0xd1,0x26,0x75]
xvor.v $xr23, $xr11, $xr20

# CHECK: xvxor.v $xr31, $xr1, $xr30
# CHECK: encoding: [0x3f,0x78,0x27,0x75]
xvxor.v $xr31, $xr1, $xr30

# CHECK: xvnor.v $xr29, $xr26, $xr13
# CHECK: encoding: [0x5d,0xb7,0x27,0x75]
xvnor.v $xr29, $xr26, $xr13

# CHECK: xvandn.v $xr9, $xr14, $xr0
# CHECK: encoding: [0xc9,0x01,0x28,0x75]
xvandn.v $xr9, $xr14, $xr0

# CHECK: xvorn.v $xr25, $xr8, $xr12
# CHECK: encoding: [0x19,0xb1,0x28,0x75]
xvorn.v $xr25, $xr8, $xr12

# CHECK: xvfrstp.b $xr21, $xr26, $xr26
# CHECK: encoding: [0x55,0x6b,0x2b,0x75]
xvfrstp.b $xr21, $xr26, $xr26

# CHECK: xvfrstp.h $xr4, $xr17, $xr2
# CHECK: encoding: [0x24,0x8a,0x2b,0x75]
xvfrstp.h $xr4, $xr17, $xr2

# CHECK: xvadd.q $xr29, $xr28, $xr17
# CHECK: encoding: [0x9d,0x47,0x2d,0x75]
xvadd.q $xr29, $xr28, $xr17

# CHECK: xvsub.q $xr29, $xr2, $xr27
# CHECK: encoding: [0x5d,0xec,0x2d,0x75]
xvsub.q $xr29, $xr2, $xr27

# CHECK: xvsigncov.b $xr18, $xr28, $xr7
# CHECK: encoding: [0x92,0x1f,0x2e,0x75]
xvsigncov.b $xr18, $xr28, $xr7

# CHECK: xvsigncov.h $xr18, $xr12, $xr17
# CHECK: encoding: [0x92,0xc5,0x2e,0x75]
xvsigncov.h $xr18, $xr12, $xr17

# CHECK: xvsigncov.w $xr26, $xr1, $xr0
# CHECK: encoding: [0x3a,0x00,0x2f,0x75]
xvsigncov.w $xr26, $xr1, $xr0

# CHECK: xvsigncov.d $xr10, $xr27, $xr14
# CHECK: encoding: [0x6a,0xbb,0x2f,0x75]
xvsigncov.d $xr10, $xr27, $xr14

# CHECK: xvfadd.s $xr15, $xr25, $xr8
# CHECK: encoding: [0x2f,0xa3,0x30,0x75]
xvfadd.s $xr15, $xr25, $xr8

# CHECK: xvfadd.d $xr19, $xr6, $xr21
# CHECK: encoding: [0xd3,0x54,0x31,0x75]
xvfadd.d $xr19, $xr6, $xr21

# CHECK: xvfsub.s $xr26, $xr6, $xr6
# CHECK: encoding: [0xda,0x98,0x32,0x75]
xvfsub.s $xr26, $xr6, $xr6

# CHECK: xvfsub.d $xr9, $xr0, $xr21
# CHECK: encoding: [0x09,0x54,0x33,0x75]
xvfsub.d $xr9, $xr0, $xr21

# CHECK: xvfmul.s $xr6, $xr8, $xr14
# CHECK: encoding: [0x06,0xb9,0x38,0x75]
xvfmul.s $xr6, $xr8, $xr14

# CHECK: xvfmul.d $xr11, $xr21, $xr26
# CHECK: encoding: [0xab,0x6a,0x39,0x75]
xvfmul.d $xr11, $xr21, $xr26

# CHECK: xvfdiv.s $xr11, $xr7, $xr6
# CHECK: encoding: [0xeb,0x98,0x3a,0x75]
xvfdiv.s $xr11, $xr7, $xr6

# CHECK: xvfdiv.d $xr0, $xr26, $xr4
# CHECK: encoding: [0x40,0x13,0x3b,0x75]
xvfdiv.d $xr0, $xr26, $xr4

# CHECK: xvfmax.s $xr7, $xr9, $xr4
# CHECK: encoding: [0x27,0x91,0x3c,0x75]
xvfmax.s $xr7, $xr9, $xr4

# CHECK: xvfmax.d $xr0, $xr26, $xr20
# CHECK: encoding: [0x40,0x53,0x3d,0x75]
xvfmax.d $xr0, $xr26, $xr20

# CHECK: xvfmin.s $xr8, $xr10, $xr26
# CHECK: encoding: [0x48,0xe9,0x3e,0x75]
xvfmin.s $xr8, $xr10, $xr26

# CHECK: xvfmin.d $xr2, $xr22, $xr25
# CHECK: encoding: [0xc2,0x66,0x3f,0x75]
xvfmin.d $xr2, $xr22, $xr25

# CHECK: xvfmaxa.s $xr17, $xr4, $xr1
# CHECK: encoding: [0x91,0x84,0x40,0x75]
xvfmaxa.s $xr17, $xr4, $xr1

# CHECK: xvfmaxa.d $xr27, $xr23, $xr9
# CHECK: encoding: [0xfb,0x26,0x41,0x75]
xvfmaxa.d $xr27, $xr23, $xr9

# CHECK: xvfmina.s $xr21, $xr3, $xr27
# CHECK: encoding: [0x75,0xec,0x42,0x75]
xvfmina.s $xr21, $xr3, $xr27

# CHECK: xvfmina.d $xr7, $xr6, $xr4
# CHECK: encoding: [0xc7,0x10,0x43,0x75]
xvfmina.d $xr7, $xr6, $xr4

# CHECK: xvfcvt.h.s $xr9, $xr10, $xr20
# CHECK: encoding: [0x49,0x51,0x46,0x75]
xvfcvt.h.s $xr9, $xr10, $xr20

# CHECK: xvfcvt.s.d $xr5, $xr23, $xr21
# CHECK: encoding: [0xe5,0xd6,0x46,0x75]
xvfcvt.s.d $xr5, $xr23, $xr21

# CHECK: xvffint.s.l $xr28, $xr24, $xr10
# CHECK: encoding: [0x1c,0x2b,0x48,0x75]
xvffint.s.l $xr28, $xr24, $xr10

# CHECK: xvftint.w.d $xr6, $xr24, $xr1
# CHECK: encoding: [0x06,0x87,0x49,0x75]
xvftint.w.d $xr6, $xr24, $xr1

# CHECK: xvftintrm.w.d $xr27, $xr26, $xr30
# CHECK: encoding: [0x5b,0x7b,0x4a,0x75]
xvftintrm.w.d $xr27, $xr26, $xr30

# CHECK: xvftintrp.w.d $xr31, $xr12, $xr1
# CHECK: encoding: [0x9f,0x85,0x4a,0x75]
xvftintrp.w.d $xr31, $xr12, $xr1

# CHECK: xvftintrz.w.d $xr11, $xr21, $xr21
# CHECK: encoding: [0xab,0x56,0x4b,0x75]
xvftintrz.w.d $xr11, $xr21, $xr21

# CHECK: xvftintrne.w.d $xr15, $xr8, $xr28
# CHECK: encoding: [0x0f,0xf1,0x4b,0x75]
xvftintrne.w.d $xr15, $xr8, $xr28

# CHECK: xvshuf.h $xr20, $xr21, $xr3
# CHECK: encoding: [0xb4,0x8e,0x7a,0x75]
xvshuf.h $xr20, $xr21, $xr3

# CHECK: xvshuf.w $xr22, $xr2, $xr31
# CHECK: encoding: [0x56,0x7c,0x7b,0x75]
xvshuf.w $xr22, $xr2, $xr31

# CHECK: xvshuf.d $xr15, $xr3, $xr26
# CHECK: encoding: [0x6f,0xe8,0x7b,0x75]
xvshuf.d $xr15, $xr3, $xr26

# CHECK: xvperm.w $xr21, $xr23, $xr24
# CHECK: encoding: [0xf5,0x62,0x7d,0x75]
xvperm.w $xr21, $xr23, $xr24

# CHECK: xvseqi.b $xr28, $xr5, 1
# CHECK: encoding: [0xbc,0x04,0x80,0x76]
xvseqi.b $xr28, $xr5, 1

# CHECK: xvseqi.h $xr19, $xr9, -5
# CHECK: encoding: [0x33,0xed,0x80,0x76]
xvseqi.h $xr19, $xr9, -5

# CHECK: xvseqi.w $xr8, $xr18, -2
# CHECK: encoding: [0x48,0x7a,0x81,0x76]
xvseqi.w $xr8, $xr18, -2

# CHECK: xvseqi.d $xr2, $xr22, -4
# CHECK: encoding: [0xc2,0xf2,0x81,0x76]
xvseqi.d $xr2, $xr22, -4

# CHECK: xvslei.b $xr4, $xr21, -10
# CHECK: encoding: [0xa4,0x5a,0x82,0x76]
xvslei.b $xr4, $xr21, -10

# CHECK: xvslei.h $xr17, $xr20, -12
# CHECK: encoding: [0x91,0xd2,0x82,0x76]
xvslei.h $xr17, $xr20, -12

# CHECK: xvslei.w $xr9, $xr20, -7
# CHECK: encoding: [0x89,0x66,0x83,0x76]
xvslei.w $xr9, $xr20, -7

# CHECK: xvslei.d $xr19, $xr30, 10
# CHECK: encoding: [0xd3,0xab,0x83,0x76]
xvslei.d $xr19, $xr30, 10

# CHECK: xvslei.bu $xr4, $xr26, 1
# CHECK: encoding: [0x44,0x07,0x84,0x76]
xvslei.bu $xr4, $xr26, 1

# CHECK: xvslei.hu $xr11, $xr8, 4
# CHECK: encoding: [0x0b,0x91,0x84,0x76]
xvslei.hu $xr11, $xr8, 4

# CHECK: xvslei.wu $xr18, $xr12, 31
# CHECK: encoding: [0x92,0x7d,0x85,0x76]
xvslei.wu $xr18, $xr12, 31

# CHECK: xvslei.du $xr30, $xr7, 26
# CHECK: encoding: [0xfe,0xe8,0x85,0x76]
xvslei.du $xr30, $xr7, 26

# CHECK: xvslti.b $xr11, $xr29, 2
# CHECK: encoding: [0xab,0x0b,0x86,0x76]
xvslti.b $xr11, $xr29, 2

# CHECK: xvslti.h $xr6, $xr27, 8
# CHECK: encoding: [0x66,0xa3,0x86,0x76]
xvslti.h $xr6, $xr27, 8

# CHECK: xvslti.w $xr21, $xr23, 1
# CHECK: encoding: [0xf5,0x06,0x87,0x76]
xvslti.w $xr21, $xr23, 1

# CHECK: xvslti.d $xr18, $xr31, -5
# CHECK: encoding: [0xf2,0xef,0x87,0x76]
xvslti.d $xr18, $xr31, -5

# CHECK: xvslti.bu $xr27, $xr12, 17
# CHECK: encoding: [0x9b,0x45,0x88,0x76]
xvslti.bu $xr27, $xr12, 17

# CHECK: xvslti.hu $xr18, $xr14, 12
# CHECK: encoding: [0xd2,0xb1,0x88,0x76]
xvslti.hu $xr18, $xr14, 12

# CHECK: xvslti.wu $xr4, $xr12, 14
# CHECK: encoding: [0x84,0x39,0x89,0x76]
xvslti.wu $xr4, $xr12, 14

# CHECK: xvslti.du $xr26, $xr0, 24
# CHECK: encoding: [0x1a,0xe0,0x89,0x76]
xvslti.du $xr26, $xr0, 24

# CHECK: xvaddi.bu $xr30, $xr2, 5
# CHECK: encoding: [0x5e,0x14,0x8a,0x76]
xvaddi.bu $xr30, $xr2, 5

# CHECK: xvaddi.hu $xr22, $xr17, 9
# CHECK: encoding: [0x36,0xa6,0x8a,0x76]
xvaddi.hu $xr22, $xr17, 9

# CHECK: xvaddi.wu $xr3, $xr26, 29
# CHECK: encoding: [0x43,0x77,0x8b,0x76]
xvaddi.wu $xr3, $xr26, 29

# CHECK: xvaddi.du $xr0, $xr20, 30
# CHECK: encoding: [0x80,0xfa,0x8b,0x76]
xvaddi.du $xr0, $xr20, 30

# CHECK: xvsubi.bu $xr0, $xr20, 7
# CHECK: encoding: [0x80,0x1e,0x8c,0x76]
xvsubi.bu $xr0, $xr20, 7

# CHECK: xvsubi.hu $xr4, $xr24, 18
# CHECK: encoding: [0x04,0xcb,0x8c,0x76]
xvsubi.hu $xr4, $xr24, 18

# CHECK: xvsubi.wu $xr1, $xr26, 26
# CHECK: encoding: [0x41,0x6b,0x8d,0x76]
xvsubi.wu $xr1, $xr26, 26

# CHECK: xvsubi.du $xr9, $xr28, 8
# CHECK: encoding: [0x89,0xa3,0x8d,0x76]
xvsubi.du $xr9, $xr28, 8

# CHECK: xvbsll.v $xr0, $xr21, 8
# CHECK: encoding: [0xa0,0x22,0x8e,0x76]
xvbsll.v $xr0, $xr21, 8

# CHECK: xvbsrl.v $xr4, $xr8, 28
# CHECK: encoding: [0x04,0xf1,0x8e,0x76]
xvbsrl.v $xr4, $xr8, 28

# CHECK: xvmaxi.b $xr8, $xr1, -14
# CHECK: encoding: [0x28,0x48,0x90,0x76]
xvmaxi.b $xr8, $xr1, -14

# CHECK: xvmaxi.h $xr19, $xr12, -16
# CHECK: encoding: [0x93,0xc1,0x90,0x76]
xvmaxi.h $xr19, $xr12, -16

# CHECK: xvmaxi.w $xr27, $xr1, 5
# CHECK: encoding: [0x3b,0x14,0x91,0x76]
xvmaxi.w $xr27, $xr1, 5

# CHECK: xvmaxi.d $xr6, $xr7, 3
# CHECK: encoding: [0xe6,0x8c,0x91,0x76]
xvmaxi.d $xr6, $xr7, 3

# CHECK: xvmini.b $xr10, $xr6, 5
# CHECK: encoding: [0xca,0x14,0x92,0x76]
xvmini.b $xr10, $xr6, 5

# CHECK: xvmini.h $xr8, $xr18, -12
# CHECK: encoding: [0x48,0xd2,0x92,0x76]
xvmini.h $xr8, $xr18, -12

# CHECK: xvmini.w $xr31, $xr13, -7
# CHECK: encoding: [0xbf,0x65,0x93,0x76]
xvmini.w $xr31, $xr13, -7

# CHECK: xvmini.d $xr15, $xr27, 9
# CHECK: encoding: [0x6f,0xa7,0x93,0x76]
xvmini.d $xr15, $xr27, 9

# CHECK: xvmaxi.bu $xr5, $xr17, 22
# CHECK: encoding: [0x25,0x5a,0x94,0x76]
xvmaxi.bu $xr5, $xr17, 22

# CHECK: xvmaxi.hu $xr6, $xr3, 4
# CHECK: encoding: [0x66,0x90,0x94,0x76]
xvmaxi.hu $xr6, $xr3, 4

# CHECK: xvmaxi.wu $xr26, $xr12, 17
# CHECK: encoding: [0x9a,0x45,0x95,0x76]
xvmaxi.wu $xr26, $xr12, 17

# CHECK: xvmaxi.du $xr30, $xr11, 30
# CHECK: encoding: [0x7e,0xf9,0x95,0x76]
xvmaxi.du $xr30, $xr11, 30

# CHECK: xvmini.bu $xr15, $xr8, 7
# CHECK: encoding: [0x0f,0x1d,0x96,0x76]
xvmini.bu $xr15, $xr8, 7

# CHECK: xvmini.hu $xr18, $xr25, 1
# CHECK: encoding: [0x32,0x87,0x96,0x76]
xvmini.hu $xr18, $xr25, 1

# CHECK: xvmini.wu $xr16, $xr28, 0
# CHECK: encoding: [0x90,0x03,0x97,0x76]
xvmini.wu $xr16, $xr28, 0

# CHECK: xvmini.du $xr10, $xr19, 29
# CHECK: encoding: [0x6a,0xf6,0x97,0x76]
xvmini.du $xr10, $xr19, 29

# CHECK: xvfrstpi.b $xr8, $xr25, 2
# CHECK: encoding: [0x28,0x0b,0x9a,0x76]
xvfrstpi.b $xr8, $xr25, 2

# CHECK: xvfrstpi.h $xr28, $xr19, 26
# CHECK: encoding: [0x7c,0xea,0x9a,0x76]
xvfrstpi.h $xr28, $xr19, 26

# CHECK: xvclo.b $xr2, $xr8
# CHECK: encoding: [0x02,0x01,0x9c,0x76]
xvclo.b $xr2, $xr8

# CHECK: xvclo.h $xr10, $xr9
# CHECK: encoding: [0x2a,0x05,0x9c,0x76]
xvclo.h $xr10, $xr9

# CHECK: xvclo.w $xr2, $xr31
# CHECK: encoding: [0xe2,0x0b,0x9c,0x76]
xvclo.w $xr2, $xr31

# CHECK: xvclo.d $xr21, $xr24
# CHECK: encoding: [0x15,0x0f,0x9c,0x76]
xvclo.d $xr21, $xr24

# CHECK: xvclz.b $xr13, $xr24
# CHECK: encoding: [0x0d,0x13,0x9c,0x76]
xvclz.b $xr13, $xr24

# CHECK: xvclz.h $xr4, $xr31
# CHECK: encoding: [0xe4,0x17,0x9c,0x76]
xvclz.h $xr4, $xr31

# CHECK: xvclz.w $xr7, $xr1
# CHECK: encoding: [0x27,0x18,0x9c,0x76]
xvclz.w $xr7, $xr1

# CHECK: xvclz.d $xr13, $xr22
# CHECK: encoding: [0xcd,0x1e,0x9c,0x76]
xvclz.d $xr13, $xr22

# CHECK: xvpcnt.b $xr9, $xr26
# CHECK: encoding: [0x49,0x23,0x9c,0x76]
xvpcnt.b $xr9, $xr26

# CHECK: xvpcnt.h $xr10, $xr3
# CHECK: encoding: [0x6a,0x24,0x9c,0x76]
xvpcnt.h $xr10, $xr3

# CHECK: xvpcnt.w $xr24, $xr7
# CHECK: encoding: [0xf8,0x28,0x9c,0x76]
xvpcnt.w $xr24, $xr7

# CHECK: xvpcnt.d $xr5, $xr8
# CHECK: encoding: [0x05,0x2d,0x9c,0x76]
xvpcnt.d $xr5, $xr8

# CHECK: xvneg.b $xr19, $xr11
# CHECK: encoding: [0x73,0x31,0x9c,0x76]
xvneg.b $xr19, $xr11

# CHECK: xvneg.h $xr21, $xr21
# CHECK: encoding: [0xb5,0x36,0x9c,0x76]
xvneg.h $xr21, $xr21

# CHECK: xvneg.w $xr19, $xr17
# CHECK: encoding: [0x33,0x3a,0x9c,0x76]
xvneg.w $xr19, $xr17

# CHECK: xvneg.d $xr31, $xr29
# CHECK: encoding: [0xbf,0x3f,0x9c,0x76]
xvneg.d $xr31, $xr29

# CHECK: xvmskltz.b $xr22, $xr27
# CHECK: encoding: [0x76,0x43,0x9c,0x76]
xvmskltz.b $xr22, $xr27

# CHECK: xvmskltz.h $xr5, $xr0
# CHECK: encoding: [0x05,0x44,0x9c,0x76]
xvmskltz.h $xr5, $xr0

# CHECK: xvmskltz.w $xr24, $xr28
# CHECK: encoding: [0x98,0x4b,0x9c,0x76]
xvmskltz.w $xr24, $xr28

# CHECK: xvmskltz.d $xr25, $xr2
# CHECK: encoding: [0x59,0x4c,0x9c,0x76]
xvmskltz.d $xr25, $xr2

# CHECK: xvmskgez.b $xr30, $xr30
# CHECK: encoding: [0xde,0x53,0x9c,0x76]
xvmskgez.b $xr30, $xr30

# CHECK: xvmsknz.b $xr5, $xr20
# CHECK: encoding: [0x85,0x62,0x9c,0x76]
xvmsknz.b $xr5, $xr20

# CHECK: xvseteqz.v $fcc1, $xr25
# CHECK: encoding: [0x21,0x9b,0x9c,0x76]
xvseteqz.v $fcc1, $xr25

# CHECK: xvsetnez.v $fcc5, $xr13
# CHECK: encoding: [0xa5,0x9d,0x9c,0x76]
xvsetnez.v $fcc5, $xr13

# CHECK: xvsetanyeqz.b $fcc0, $xr4
# CHECK: encoding: [0x80,0xa0,0x9c,0x76]
xvsetanyeqz.b $fcc0, $xr4

# CHECK: xvsetanyeqz.h $fcc0, $xr31
# CHECK: encoding: [0xe0,0xa7,0x9c,0x76]
xvsetanyeqz.h $fcc0, $xr31

# CHECK: xvsetanyeqz.w $fcc2, $xr30
# CHECK: encoding: [0xc2,0xab,0x9c,0x76]
xvsetanyeqz.w $fcc2, $xr30

# CHECK: xvsetanyeqz.d $fcc3, $xr31
# CHECK: encoding: [0xe3,0xaf,0x9c,0x76]
xvsetanyeqz.d $fcc3, $xr31

# CHECK: xvsetallnez.b $fcc1, $xr21
# CHECK: encoding: [0xa1,0xb2,0x9c,0x76]
xvsetallnez.b $fcc1, $xr21

# CHECK: xvsetallnez.h $fcc0, $xr21
# CHECK: encoding: [0xa0,0xb6,0x9c,0x76]
xvsetallnez.h $fcc0, $xr21

# CHECK: xvsetallnez.w $fcc0, $xr0
# CHECK: encoding: [0x00,0xb8,0x9c,0x76]
xvsetallnez.w $fcc0, $xr0

# CHECK: xvsetallnez.d $fcc1, $xr31
# CHECK: encoding: [0xe1,0xbf,0x9c,0x76]
xvsetallnez.d $fcc1, $xr31

# CHECK: xvflogb.s $xr21, $xr4
# CHECK: encoding: [0x95,0xc4,0x9c,0x76]
xvflogb.s $xr21, $xr4

# CHECK: xvflogb.d $xr8, $xr20
# CHECK: encoding: [0x88,0xca,0x9c,0x76]
xvflogb.d $xr8, $xr20

# CHECK: xvfclass.s $xr15, $xr29
# CHECK: encoding: [0xaf,0xd7,0x9c,0x76]
xvfclass.s $xr15, $xr29

# CHECK: xvfclass.d $xr7, $xr14
# CHECK: encoding: [0xc7,0xd9,0x9c,0x76]
xvfclass.d $xr7, $xr14

# CHECK: xvfsqrt.s $xr28, $xr19
# CHECK: encoding: [0x7c,0xe6,0x9c,0x76]
xvfsqrt.s $xr28, $xr19

# CHECK: xvfsqrt.d $xr11, $xr31
# CHECK: encoding: [0xeb,0xeb,0x9c,0x76]
xvfsqrt.d $xr11, $xr31

# CHECK: xvfrecip.s $xr6, $xr23
# CHECK: encoding: [0xe6,0xf6,0x9c,0x76]
xvfrecip.s $xr6, $xr23

# CHECK: xvfrecip.d $xr0, $xr24
# CHECK: encoding: [0x00,0xfb,0x9c,0x76]
xvfrecip.d $xr0, $xr24

# CHECK: xvfrsqrt.s $xr8, $xr16
# CHECK: encoding: [0x08,0x06,0x9d,0x76]
xvfrsqrt.s $xr8, $xr16

# CHECK: xvfrsqrt.d $xr15, $xr17
# CHECK: encoding: [0x2f,0x0a,0x9d,0x76]
xvfrsqrt.d $xr15, $xr17

# CHECK: xvfrint.s $xr4, $xr25
# CHECK: encoding: [0x24,0x37,0x9d,0x76]
xvfrint.s $xr4, $xr25

# CHECK: xvfrint.d $xr1, $xr20
# CHECK: encoding: [0x81,0x3a,0x9d,0x76]
xvfrint.d $xr1, $xr20

# CHECK: xvfrintrm.s $xr29, $xr16
# CHECK: encoding: [0x1d,0x46,0x9d,0x76]
xvfrintrm.s $xr29, $xr16

# CHECK: xvfrintrm.d $xr4, $xr10
# CHECK: encoding: [0x44,0x49,0x9d,0x76]
xvfrintrm.d $xr4, $xr10

# CHECK: xvfrintrp.s $xr13, $xr31
# CHECK: encoding: [0xed,0x57,0x9d,0x76]
xvfrintrp.s $xr13, $xr31

# CHECK: xvfrintrp.d $xr20, $xr11
# CHECK: encoding: [0x74,0x59,0x9d,0x76]
xvfrintrp.d $xr20, $xr11

# CHECK: xvfrintrz.s $xr27, $xr13
# CHECK: encoding: [0xbb,0x65,0x9d,0x76]
xvfrintrz.s $xr27, $xr13

# CHECK: xvfrintrz.d $xr17, $xr25
# CHECK: encoding: [0x31,0x6b,0x9d,0x76]
xvfrintrz.d $xr17, $xr25

# CHECK: xvfrintrne.s $xr14, $xr8
# CHECK: encoding: [0x0e,0x75,0x9d,0x76]
xvfrintrne.s $xr14, $xr8

# CHECK: xvfrintrne.d $xr23, $xr26
# CHECK: encoding: [0x57,0x7b,0x9d,0x76]
xvfrintrne.d $xr23, $xr26

# CHECK: xvfcvtl.s.h $xr4, $xr23
# CHECK: encoding: [0xe4,0xea,0x9d,0x76]
xvfcvtl.s.h $xr4, $xr23

# CHECK: xvfcvth.s.h $xr14, $xr11
# CHECK: encoding: [0x6e,0xed,0x9d,0x76]
xvfcvth.s.h $xr14, $xr11

# CHECK: xvfcvtl.d.s $xr26, $xr31
# CHECK: encoding: [0xfa,0xf3,0x9d,0x76]
xvfcvtl.d.s $xr26, $xr31

# CHECK: xvfcvth.d.s $xr13, $xr28
# CHECK: encoding: [0x8d,0xf7,0x9d,0x76]
xvfcvth.d.s $xr13, $xr28

# CHECK: xvffint.s.w $xr14, $xr28
# CHECK: encoding: [0x8e,0x03,0x9e,0x76]
xvffint.s.w $xr14, $xr28

# CHECK: xvffint.s.wu $xr0, $xr8
# CHECK: encoding: [0x00,0x05,0x9e,0x76]
xvffint.s.wu $xr0, $xr8

# CHECK: xvffint.d.l $xr5, $xr27
# CHECK: encoding: [0x65,0x0b,0x9e,0x76]
xvffint.d.l $xr5, $xr27

# CHECK: xvffint.d.lu $xr29, $xr18
# CHECK: encoding: [0x5d,0x0e,0x9e,0x76]
xvffint.d.lu $xr29, $xr18

# CHECK: xvffintl.d.w $xr9, $xr20
# CHECK: encoding: [0x89,0x12,0x9e,0x76]
xvffintl.d.w $xr9, $xr20

# CHECK: xvffinth.d.w $xr11, $xr13
# CHECK: encoding: [0xab,0x15,0x9e,0x76]
xvffinth.d.w $xr11, $xr13

# CHECK: xvftint.w.s $xr6, $xr4
# CHECK: encoding: [0x86,0x30,0x9e,0x76]
xvftint.w.s $xr6, $xr4

# CHECK: xvftint.l.d $xr11, $xr22
# CHECK: encoding: [0xcb,0x36,0x9e,0x76]
xvftint.l.d $xr11, $xr22

# CHECK: xvftintrm.w.s $xr20, $xr21
# CHECK: encoding: [0xb4,0x3a,0x9e,0x76]
xvftintrm.w.s $xr20, $xr21

# CHECK: xvftintrm.l.d $xr28, $xr27
# CHECK: encoding: [0x7c,0x3f,0x9e,0x76]
xvftintrm.l.d $xr28, $xr27

# CHECK: xvftintrp.w.s $xr14, $xr16
# CHECK: encoding: [0x0e,0x42,0x9e,0x76]
xvftintrp.w.s $xr14, $xr16

# CHECK: xvftintrp.l.d $xr14, $xr25
# CHECK: encoding: [0x2e,0x47,0x9e,0x76]
xvftintrp.l.d $xr14, $xr25

# CHECK: xvftintrz.w.s $xr5, $xr30
# CHECK: encoding: [0xc5,0x4b,0x9e,0x76]
xvftintrz.w.s $xr5, $xr30

# CHECK: xvftintrz.l.d $xr11, $xr19
# CHECK: encoding: [0x6b,0x4e,0x9e,0x76]
xvftintrz.l.d $xr11, $xr19

# CHECK: xvftintrne.w.s $xr27, $xr23
# CHECK: encoding: [0xfb,0x52,0x9e,0x76]
xvftintrne.w.s $xr27, $xr23

# CHECK: xvftintrne.l.d $xr27, $xr13
# CHECK: encoding: [0xbb,0x55,0x9e,0x76]
xvftintrne.l.d $xr27, $xr13

# CHECK: xvftint.wu.s $xr28, $xr2
# CHECK: encoding: [0x5c,0x58,0x9e,0x76]
xvftint.wu.s $xr28, $xr2

# CHECK: xvftint.lu.d $xr27, $xr12
# CHECK: encoding: [0x9b,0x5d,0x9e,0x76]
xvftint.lu.d $xr27, $xr12

# CHECK: xvftintrz.wu.s $xr21, $xr29
# CHECK: encoding: [0xb5,0x73,0x9e,0x76]
xvftintrz.wu.s $xr21, $xr29

# CHECK: xvftintrz.lu.d $xr19, $xr2
# CHECK: encoding: [0x53,0x74,0x9e,0x76]
xvftintrz.lu.d $xr19, $xr2

# CHECK: xvftintl.l.s $xr2, $xr18
# CHECK: encoding: [0x42,0x82,0x9e,0x76]
xvftintl.l.s $xr2, $xr18

# CHECK: xvftinth.l.s $xr8, $xr30
# CHECK: encoding: [0xc8,0x87,0x9e,0x76]
xvftinth.l.s $xr8, $xr30

# CHECK: xvftintrml.l.s $xr13, $xr17
# CHECK: encoding: [0x2d,0x8a,0x9e,0x76]
xvftintrml.l.s $xr13, $xr17

# CHECK: xvftintrmh.l.s $xr30, $xr26
# CHECK: encoding: [0x5e,0x8f,0x9e,0x76]
xvftintrmh.l.s $xr30, $xr26

# CHECK: xvftintrpl.l.s $xr11, $xr26
# CHECK: encoding: [0x4b,0x93,0x9e,0x76]
xvftintrpl.l.s $xr11, $xr26

# CHECK: xvftintrph.l.s $xr30, $xr11
# CHECK: encoding: [0x7e,0x95,0x9e,0x76]
xvftintrph.l.s $xr30, $xr11

# CHECK: xvftintrzl.l.s $xr25, $xr7
# CHECK: encoding: [0xf9,0x98,0x9e,0x76]
xvftintrzl.l.s $xr25, $xr7

# CHECK: xvftintrzh.l.s $xr12, $xr5
# CHECK: encoding: [0xac,0x9c,0x9e,0x76]
xvftintrzh.l.s $xr12, $xr5

# CHECK: xvftintrnel.l.s $xr8, $xr24
# CHECK: encoding: [0x08,0xa3,0x9e,0x76]
xvftintrnel.l.s $xr8, $xr24

# CHECK: xvftintrneh.l.s $xr25, $xr24
# CHECK: encoding: [0x19,0xa7,0x9e,0x76]
xvftintrneh.l.s $xr25, $xr24

# CHECK: xvexth.h.b $xr23, $xr5
# CHECK: encoding: [0xb7,0xe0,0x9e,0x76]
xvexth.h.b $xr23, $xr5

# CHECK: xvexth.w.h $xr25, $xr6
# CHECK: encoding: [0xd9,0xe4,0x9e,0x76]
xvexth.w.h $xr25, $xr6

# CHECK: xvexth.d.w $xr7, $xr27
# CHECK: encoding: [0x67,0xeb,0x9e,0x76]
xvexth.d.w $xr7, $xr27

# CHECK: xvexth.q.d $xr14, $xr10
# CHECK: encoding: [0x4e,0xed,0x9e,0x76]
xvexth.q.d $xr14, $xr10

# CHECK: xvexth.hu.bu $xr0, $xr21
# CHECK: encoding: [0xa0,0xf2,0x9e,0x76]
xvexth.hu.bu $xr0, $xr21

# CHECK: xvexth.wu.hu $xr15, $xr22
# CHECK: encoding: [0xcf,0xf6,0x9e,0x76]
xvexth.wu.hu $xr15, $xr22

# CHECK: xvexth.du.wu $xr24, $xr15
# CHECK: encoding: [0xf8,0xf9,0x9e,0x76]
xvexth.du.wu $xr24, $xr15

# CHECK: xvexth.qu.du $xr4, $xr2
# CHECK: encoding: [0x44,0xfc,0x9e,0x76]
xvexth.qu.du $xr4, $xr2

# CHECK: xvreplgr2vr.b $xr21, $r6
# CHECK: encoding: [0xd5,0x00,0x9f,0x76]
xvreplgr2vr.b $xr21, $r6

# CHECK: xvreplgr2vr.h $xr11, $ra
# CHECK: encoding: [0x2b,0x04,0x9f,0x76]
xvreplgr2vr.h $xr11, $ra

# CHECK: xvreplgr2vr.w $xr13, $r22
# CHECK: encoding: [0xcd,0x0a,0x9f,0x76]
xvreplgr2vr.w $xr13, $r22

# CHECK: xvreplgr2vr.d $xr9, $r17
# CHECK: encoding: [0x29,0x0e,0x9f,0x76]
xvreplgr2vr.d $xr9, $r17

# CHECK: vext2xv.h.b $xr18, $xr16
# CHECK: encoding: [0x12,0x12,0x9f,0x76]
vext2xv.h.b $xr18, $xr16

# CHECK: vext2xv.w.b $xr3, $xr23
# CHECK: encoding: [0xe3,0x16,0x9f,0x76]
vext2xv.w.b $xr3, $xr23

# CHECK: vext2xv.d.b $xr30, $xr16
# CHECK: encoding: [0x1e,0x1a,0x9f,0x76]
vext2xv.d.b $xr30, $xr16

# CHECK: vext2xv.w.h $xr28, $xr23
# CHECK: encoding: [0xfc,0x1e,0x9f,0x76]
vext2xv.w.h $xr28, $xr23

# CHECK: vext2xv.d.h $xr4, $xr1
# CHECK: encoding: [0x24,0x20,0x9f,0x76]
vext2xv.d.h $xr4, $xr1

# CHECK: vext2xv.d.w $xr23, $xr12
# CHECK: encoding: [0x97,0x25,0x9f,0x76]
vext2xv.d.w $xr23, $xr12

# CHECK: vext2xv.hu.bu $xr0, $xr5
# CHECK: encoding: [0xa0,0x28,0x9f,0x76]
vext2xv.hu.bu $xr0, $xr5

# CHECK: vext2xv.wu.bu $xr1, $xr4
# CHECK: encoding: [0x81,0x2c,0x9f,0x76]
vext2xv.wu.bu $xr1, $xr4

# CHECK: vext2xv.du.bu $xr17, $xr11
# CHECK: encoding: [0x71,0x31,0x9f,0x76]
vext2xv.du.bu $xr17, $xr11

# CHECK: vext2xv.wu.hu $xr28, $xr0
# CHECK: encoding: [0x1c,0x34,0x9f,0x76]
vext2xv.wu.hu $xr28, $xr0

# CHECK: vext2xv.du.hu $xr26, $xr25
# CHECK: encoding: [0x3a,0x3b,0x9f,0x76]
vext2xv.du.hu $xr26, $xr25

# CHECK: vext2xv.du.wu $xr29, $xr14
# CHECK: encoding: [0xdd,0x3d,0x9f,0x76]
vext2xv.du.wu $xr29, $xr14

# CHECK: xvhseli.d $xr3, $xr22, 13
# CHECK: encoding: [0xc3,0xb6,0x9f,0x76]
xvhseli.d $xr3, $xr22, 13

# CHECK: xvrotri.b $xr0, $xr14, 2
# CHECK: encoding: [0xc0,0x29,0xa0,0x76]
xvrotri.b $xr0, $xr14, 2

# CHECK: xvrotri.h $xr0, $xr7, 11
# CHECK: encoding: [0xe0,0x6c,0xa0,0x76]
xvrotri.h $xr0, $xr7, 11

# CHECK: xvrotri.w $xr24, $xr1, 3
# CHECK: encoding: [0x38,0x8c,0xa0,0x76]
xvrotri.w $xr24, $xr1, 3

# CHECK: xvrotri.d $xr31, $xr7, 16
# CHECK: encoding: [0xff,0x40,0xa1,0x76]
xvrotri.d $xr31, $xr7, 16

# CHECK: xvsrlri.b $xr20, $xr19, 1
# CHECK: encoding: [0x74,0x26,0xa4,0x76]
xvsrlri.b $xr20, $xr19, 1

# CHECK: xvsrlri.h $xr28, $xr1, 11
# CHECK: encoding: [0x3c,0x6c,0xa4,0x76]
xvsrlri.h $xr28, $xr1, 11

# CHECK: xvsrlri.w $xr25, $xr2, 27
# CHECK: encoding: [0x59,0xec,0xa4,0x76]
xvsrlri.w $xr25, $xr2, 27

# CHECK: xvsrlri.d $xr29, $xr9, 6
# CHECK: encoding: [0x3d,0x19,0xa5,0x76]
xvsrlri.d $xr29, $xr9, 6

# CHECK: xvsrari.b $xr7, $xr5, 2
# CHECK: encoding: [0xa7,0x28,0xa8,0x76]
xvsrari.b $xr7, $xr5, 2

# CHECK: xvsrari.h $xr0, $xr10, 9
# CHECK: encoding: [0x40,0x65,0xa8,0x76]
xvsrari.h $xr0, $xr10, 9

# CHECK: xvsrari.w $xr17, $xr24, 10
# CHECK: encoding: [0x11,0xab,0xa8,0x76]
xvsrari.w $xr17, $xr24, 10

# CHECK: xvsrari.d $xr7, $xr14, 38
# CHECK: encoding: [0xc7,0x99,0xa9,0x76]
xvsrari.d $xr7, $xr14, 38

# CHECK: xvinsgr2vr.w $xr5, $r31, 1
# CHECK: encoding: [0xe5,0xc7,0xeb,0x76]
xvinsgr2vr.w $xr5, $r31, 1

# CHECK: xvinsgr2vr.d $xr5, $r26, 1
# CHECK: encoding: [0x45,0xe7,0xeb,0x76]
xvinsgr2vr.d $xr5, $r26, 1

# CHECK: xvpickve2gr.w $r18, $xr28, 2
# CHECK: encoding: [0x92,0xcb,0xef,0x76]
xvpickve2gr.w $r18, $xr28, 2

# CHECK: xvpickve2gr.d $r20, $xr10, 1
# CHECK: encoding: [0x54,0xe5,0xef,0x76]
xvpickve2gr.d $r20, $xr10, 1

# CHECK: xvpickve2gr.wu $r9, $xr12, 6
# CHECK: encoding: [0x89,0xd9,0xf3,0x76]
xvpickve2gr.wu $r9, $xr12, 6

# CHECK: xvpickve2gr.du $r9, $xr13, 2
# CHECK: encoding: [0xa9,0xe9,0xf3,0x76]
xvpickve2gr.du $r9, $xr13, 2

# CHECK: xvrepl128vei.b $xr1, $xr30, 5
# CHECK: encoding: [0xc1,0x97,0xf7,0x76]
xvrepl128vei.b $xr1, $xr30, 5

# CHECK: xvrepl128vei.h $xr13, $xr13, 7
# CHECK: encoding: [0xad,0xdd,0xf7,0x76]
xvrepl128vei.h $xr13, $xr13, 7

# CHECK: xvrepl128vei.w $xr7, $xr13, 2
# CHECK: encoding: [0xa7,0xe9,0xf7,0x76]
xvrepl128vei.w $xr7, $xr13, 2

# CHECK: xvrepl128vei.d $xr2, $xr31, 1
# CHECK: encoding: [0xe2,0xf7,0xf7,0x76]
xvrepl128vei.d $xr2, $xr31, 1

# CHECK: xvinsve0.w $xr4, $xr13, 3
# CHECK: encoding: [0xa4,0xcd,0xff,0x76]
xvinsve0.w $xr4, $xr13, 3

# CHECK: xvinsve0.d $xr27, $xr25, 0
# CHECK: encoding: [0x3b,0xe3,0xff,0x76]
xvinsve0.d $xr27, $xr25, 0

# CHECK: xvpickve.w $xr29, $xr19, 7
# CHECK: encoding: [0x7d,0xde,0x03,0x77]
xvpickve.w $xr29, $xr19, 7

# CHECK: xvpickve.d $xr19, $xr16, 3
# CHECK: encoding: [0x13,0xee,0x03,0x77]
xvpickve.d $xr19, $xr16, 3

# CHECK: xvreplve0.b $xr5, $xr5
# CHECK: encoding: [0xa5,0x00,0x07,0x77]
xvreplve0.b $xr5, $xr5

# CHECK: xvreplve0.h $xr14, $xr24
# CHECK: encoding: [0x0e,0x83,0x07,0x77]
xvreplve0.h $xr14, $xr24

# CHECK: xvreplve0.w $xr15, $xr13
# CHECK: encoding: [0xaf,0xc1,0x07,0x77]
xvreplve0.w $xr15, $xr13

# CHECK: xvreplve0.d $xr20, $xr20
# CHECK: encoding: [0x94,0xe2,0x07,0x77]
xvreplve0.d $xr20, $xr20

# CHECK: xvreplve0.q $xr5, $xr10
# CHECK: encoding: [0x45,0xf1,0x07,0x77]
xvreplve0.q $xr5, $xr10

# CHECK: xvsllwil.h.b $xr31, $xr0, 3
# CHECK: encoding: [0x1f,0x2c,0x08,0x77]
xvsllwil.h.b $xr31, $xr0, 3

# CHECK: xvsllwil.w.h $xr21, $xr24, 7
# CHECK: encoding: [0x15,0x5f,0x08,0x77]
xvsllwil.w.h $xr21, $xr24, 7

# CHECK: xvsllwil.d.w $xr26, $xr24, 18
# CHECK: encoding: [0x1a,0xcb,0x08,0x77]
xvsllwil.d.w $xr26, $xr24, 18

# CHECK: xvextl.q.d $xr5, $xr6
# CHECK: encoding: [0xc5,0x00,0x09,0x77]
xvextl.q.d $xr5, $xr6

# CHECK: xvsllwil.hu.bu $xr13, $xr31, 6
# CHECK: encoding: [0xed,0x3b,0x0c,0x77]
xvsllwil.hu.bu $xr13, $xr31, 6

# CHECK: xvsllwil.wu.hu $xr19, $xr20, 8
# CHECK: encoding: [0x93,0x62,0x0c,0x77]
xvsllwil.wu.hu $xr19, $xr20, 8

# CHECK: xvsllwil.du.wu $xr14, $xr13, 2
# CHECK: encoding: [0xae,0x89,0x0c,0x77]
xvsllwil.du.wu $xr14, $xr13, 2

# CHECK: xvextl.qu.du $xr10, $xr7
# CHECK: encoding: [0xea,0x00,0x0d,0x77]
xvextl.qu.du $xr10, $xr7

# CHECK: xvbitclri.b $xr31, $xr21, 5
# CHECK: encoding: [0xbf,0x36,0x10,0x77]
xvbitclri.b $xr31, $xr21, 5

# CHECK: xvbitclri.h $xr26, $xr4, 2
# CHECK: encoding: [0x9a,0x48,0x10,0x77]
xvbitclri.h $xr26, $xr4, 2

# CHECK: xvbitclri.w $xr21, $xr25, 15
# CHECK: encoding: [0x35,0xbf,0x10,0x77]
xvbitclri.w $xr21, $xr25, 15

# CHECK: xvbitclri.d $xr14, $xr0, 63
# CHECK: encoding: [0x0e,0xfc,0x11,0x77]
xvbitclri.d $xr14, $xr0, 63

# CHECK: xvbitseti.b $xr16, $xr1, 5
# CHECK: encoding: [0x30,0x34,0x14,0x77]
xvbitseti.b $xr16, $xr1, 5

# CHECK: xvbitseti.h $xr19, $xr30, 3
# CHECK: encoding: [0xd3,0x4f,0x14,0x77]
xvbitseti.h $xr19, $xr30, 3

# CHECK: xvbitseti.w $xr18, $xr22, 27
# CHECK: encoding: [0xd2,0xee,0x14,0x77]
xvbitseti.w $xr18, $xr22, 27

# CHECK: xvbitseti.d $xr15, $xr1, 40
# CHECK: encoding: [0x2f,0xa0,0x15,0x77]
xvbitseti.d $xr15, $xr1, 40

# CHECK: xvbitrevi.b $xr23, $xr5, 0
# CHECK: encoding: [0xb7,0x20,0x18,0x77]
xvbitrevi.b $xr23, $xr5, 0

# CHECK: xvbitrevi.h $xr5, $xr2, 7
# CHECK: encoding: [0x45,0x5c,0x18,0x77]
xvbitrevi.h $xr5, $xr2, 7

# CHECK: xvbitrevi.w $xr23, $xr6, 12
# CHECK: encoding: [0xd7,0xb0,0x18,0x77]
xvbitrevi.w $xr23, $xr6, 12

# CHECK: xvbitrevi.d $xr18, $xr14, 33
# CHECK: encoding: [0xd2,0x85,0x19,0x77]
xvbitrevi.d $xr18, $xr14, 33

# CHECK: xvsat.b $xr27, $xr26, 4
# CHECK: encoding: [0x5b,0x33,0x24,0x77]
xvsat.b $xr27, $xr26, 4

# CHECK: xvsat.h $xr4, $xr21, 5
# CHECK: encoding: [0xa4,0x56,0x24,0x77]
xvsat.h $xr4, $xr21, 5

# CHECK: xvsat.w $xr29, $xr27, 10
# CHECK: encoding: [0x7d,0xab,0x24,0x77]
xvsat.w $xr29, $xr27, 10

# CHECK: xvsat.d $xr14, $xr0, 60
# CHECK: encoding: [0x0e,0xf0,0x25,0x77]
xvsat.d $xr14, $xr0, 60

# CHECK: xvsat.bu $xr31, $xr25, 3
# CHECK: encoding: [0x3f,0x2f,0x28,0x77]
xvsat.bu $xr31, $xr25, 3

# CHECK: xvsat.hu $xr17, $xr4, 14
# CHECK: encoding: [0x91,0x78,0x28,0x77]
xvsat.hu $xr17, $xr4, 14

# CHECK: xvsat.wu $xr17, $xr17, 4
# CHECK: encoding: [0x31,0x92,0x28,0x77]
xvsat.wu $xr17, $xr17, 4

# CHECK: xvsat.du $xr11, $xr0, 43
# CHECK: encoding: [0x0b,0xac,0x29,0x77]
xvsat.du $xr11, $xr0, 43

# CHECK: xvslli.b $xr24, $xr24, 2
# CHECK: encoding: [0x18,0x2b,0x2c,0x77]
xvslli.b $xr24, $xr24, 2

# CHECK: xvslli.h $xr23, $xr9, 7
# CHECK: encoding: [0x37,0x5d,0x2c,0x77]
xvslli.h $xr23, $xr9, 7

# CHECK: xvslli.w $xr13, $xr12, 16
# CHECK: encoding: [0x8d,0xc1,0x2c,0x77]
xvslli.w $xr13, $xr12, 16

# CHECK: xvslli.d $xr11, $xr22, 17
# CHECK: encoding: [0xcb,0x46,0x2d,0x77]
xvslli.d $xr11, $xr22, 17

# CHECK: xvsrli.b $xr9, $xr14, 1
# CHECK: encoding: [0xc9,0x25,0x30,0x77]
xvsrli.b $xr9, $xr14, 1

# CHECK: xvsrli.h $xr22, $xr20, 15
# CHECK: encoding: [0x96,0x7e,0x30,0x77]
xvsrli.h $xr22, $xr20, 15

# CHECK: xvsrli.w $xr5, $xr30, 20
# CHECK: encoding: [0xc5,0xd3,0x30,0x77]
xvsrli.w $xr5, $xr30, 20

# CHECK: xvsrli.d $xr1, $xr16, 58
# CHECK: encoding: [0x01,0xea,0x31,0x77]
xvsrli.d $xr1, $xr16, 58

# CHECK: xvsrai.b $xr18, $xr6, 2
# CHECK: encoding: [0xd2,0x28,0x34,0x77]
xvsrai.b $xr18, $xr6, 2

# CHECK: xvsrai.h $xr21, $xr16, 12
# CHECK: encoding: [0x15,0x72,0x34,0x77]
xvsrai.h $xr21, $xr16, 12

# CHECK: xvsrai.w $xr13, $xr17, 17
# CHECK: encoding: [0x2d,0xc6,0x34,0x77]
xvsrai.w $xr13, $xr17, 17

# CHECK: xvsrai.d $xr3, $xr12, 51
# CHECK: encoding: [0x83,0xcd,0x35,0x77]
xvsrai.d $xr3, $xr12, 51

# CHECK: xvsrlni.b.h $xr1, $xr7, 4
# CHECK: encoding: [0xe1,0x50,0x40,0x77]
xvsrlni.b.h $xr1, $xr7, 4

# CHECK: xvsrlni.h.w $xr16, $xr21, 25
# CHECK: encoding: [0xb0,0xe6,0x40,0x77]
xvsrlni.h.w $xr16, $xr21, 25

# CHECK: xvsrlni.w.d $xr13, $xr10, 48
# CHECK: encoding: [0x4d,0xc1,0x41,0x77]
xvsrlni.w.d $xr13, $xr10, 48

# CHECK: xvsrlni.d.q $xr17, $xr12, 126
# CHECK: encoding: [0x91,0xf9,0x43,0x77]
xvsrlni.d.q $xr17, $xr12, 126

# CHECK: xvsrlrni.b.h $xr17, $xr19, 15
# CHECK: encoding: [0x71,0x7e,0x44,0x77]
xvsrlrni.b.h $xr17, $xr19, 15

# CHECK: xvsrlrni.h.w $xr21, $xr24, 14
# CHECK: encoding: [0x15,0xbb,0x44,0x77]
xvsrlrni.h.w $xr21, $xr24, 14

# CHECK: xvsrlrni.w.d $xr20, $xr31, 3
# CHECK: encoding: [0xf4,0x0f,0x45,0x77]
xvsrlrni.w.d $xr20, $xr31, 3

# CHECK: xvsrlrni.d.q $xr28, $xr24, 76
# CHECK: encoding: [0x1c,0x33,0x47,0x77]
xvsrlrni.d.q $xr28, $xr24, 76

# CHECK: xvssrlni.b.h $xr26, $xr7, 7
# CHECK: encoding: [0xfa,0x5c,0x48,0x77]
xvssrlni.b.h $xr26, $xr7, 7

# CHECK: xvssrlni.h.w $xr27, $xr28, 25
# CHECK: encoding: [0x9b,0xe7,0x48,0x77]
xvssrlni.h.w $xr27, $xr28, 25

# CHECK: xvssrlni.w.d $xr4, $xr8, 16
# CHECK: encoding: [0x04,0x41,0x49,0x77]
xvssrlni.w.d $xr4, $xr8, 16

# CHECK: xvssrlni.d.q $xr14, $xr17, 84
# CHECK: encoding: [0x2e,0x52,0x4b,0x77]
xvssrlni.d.q $xr14, $xr17, 84

# CHECK: xvssrlni.bu.h $xr17, $xr6, 2
# CHECK: encoding: [0xd1,0x48,0x4c,0x77]
xvssrlni.bu.h $xr17, $xr6, 2

# CHECK: xvssrlni.hu.w $xr6, $xr26, 3
# CHECK: encoding: [0x46,0x8f,0x4c,0x77]
xvssrlni.hu.w $xr6, $xr26, 3

# CHECK: xvssrlni.wu.d $xr10, $xr18, 54
# CHECK: encoding: [0x4a,0xda,0x4d,0x77]
xvssrlni.wu.d $xr10, $xr18, 54

# CHECK: xvssrlni.du.q $xr29, $xr26, 70
# CHECK: encoding: [0x5d,0x1b,0x4f,0x77]
xvssrlni.du.q $xr29, $xr26, 70

# CHECK: xvssrlrni.b.h $xr6, $xr9, 6
# CHECK: encoding: [0x26,0x59,0x50,0x77]
xvssrlrni.b.h $xr6, $xr9, 6

# CHECK: xvssrlrni.h.w $xr22, $xr8, 1
# CHECK: encoding: [0x16,0x85,0x50,0x77]
xvssrlrni.h.w $xr22, $xr8, 1

# CHECK: xvssrlrni.w.d $xr28, $xr9, 28
# CHECK: encoding: [0x3c,0x71,0x51,0x77]
xvssrlrni.w.d $xr28, $xr9, 28

# CHECK: xvssrlrni.d.q $xr20, $xr27, 104
# CHECK: encoding: [0x74,0xa3,0x53,0x77]
xvssrlrni.d.q $xr20, $xr27, 104

# CHECK: xvssrlrni.bu.h $xr25, $xr4, 12
# CHECK: encoding: [0x99,0x70,0x54,0x77]
xvssrlrni.bu.h $xr25, $xr4, 12

# CHECK: xvssrlrni.hu.w $xr21, $xr29, 5
# CHECK: encoding: [0xb5,0x97,0x54,0x77]
xvssrlrni.hu.w $xr21, $xr29, 5

# CHECK: xvssrlrni.wu.d $xr1, $xr16, 54
# CHECK: encoding: [0x01,0xda,0x55,0x77]
xvssrlrni.wu.d $xr1, $xr16, 54

# CHECK: xvssrlrni.du.q $xr29, $xr7, 25
# CHECK: encoding: [0xfd,0x64,0x56,0x77]
xvssrlrni.du.q $xr29, $xr7, 25

# CHECK: xvsrani.b.h $xr16, $xr25, 4
# CHECK: encoding: [0x30,0x53,0x58,0x77]
xvsrani.b.h $xr16, $xr25, 4

# CHECK: xvsrani.h.w $xr13, $xr10, 6
# CHECK: encoding: [0x4d,0x99,0x58,0x77]
xvsrani.h.w $xr13, $xr10, 6

# CHECK: xvsrani.w.d $xr7, $xr21, 53
# CHECK: encoding: [0xa7,0xd6,0x59,0x77]
xvsrani.w.d $xr7, $xr21, 53

# CHECK: xvsrani.d.q $xr26, $xr18, 55
# CHECK: encoding: [0x5a,0xde,0x5a,0x77]
xvsrani.d.q $xr26, $xr18, 55

# CHECK: xvsrarni.b.h $xr17, $xr21, 11
# CHECK: encoding: [0xb1,0x6e,0x5c,0x77]
xvsrarni.b.h $xr17, $xr21, 11

# CHECK: xvsrarni.h.w $xr15, $xr30, 2
# CHECK: encoding: [0xcf,0x8b,0x5c,0x77]
xvsrarni.h.w $xr15, $xr30, 2

# CHECK: xvsrarni.w.d $xr23, $xr11, 31
# CHECK: encoding: [0x77,0x7d,0x5d,0x77]
xvsrarni.w.d $xr23, $xr11, 31

# CHECK: xvsrarni.d.q $xr22, $xr25, 16
# CHECK: encoding: [0x36,0x43,0x5e,0x77]
xvsrarni.d.q $xr22, $xr25, 16

# CHECK: xvssrani.b.h $xr19, $xr20, 10
# CHECK: encoding: [0x93,0x6a,0x60,0x77]
xvssrani.b.h $xr19, $xr20, 10

# CHECK: xvssrani.h.w $xr25, $xr9, 22
# CHECK: encoding: [0x39,0xd9,0x60,0x77]
xvssrani.h.w $xr25, $xr9, 22

# CHECK: xvssrani.w.d $xr23, $xr2, 7
# CHECK: encoding: [0x57,0x1c,0x61,0x77]
xvssrani.w.d $xr23, $xr2, 7

# CHECK: xvssrani.d.q $xr6, $xr8, 127
# CHECK: encoding: [0x06,0xfd,0x63,0x77]
xvssrani.d.q $xr6, $xr8, 127

# CHECK: xvssrani.bu.h $xr27, $xr14, 5
# CHECK: encoding: [0xdb,0x55,0x64,0x77]
xvssrani.bu.h $xr27, $xr14, 5

# CHECK: xvssrani.hu.w $xr14, $xr1, 20
# CHECK: encoding: [0x2e,0xd0,0x64,0x77]
xvssrani.hu.w $xr14, $xr1, 20

# CHECK: xvssrani.wu.d $xr10, $xr4, 59
# CHECK: encoding: [0x8a,0xec,0x65,0x77]
xvssrani.wu.d $xr10, $xr4, 59

# CHECK: xvssrani.du.q $xr17, $xr1, 82
# CHECK: encoding: [0x31,0x48,0x67,0x77]
xvssrani.du.q $xr17, $xr1, 82

# CHECK: xvssrarni.b.h $xr27, $xr18, 15
# CHECK: encoding: [0x5b,0x7e,0x68,0x77]
xvssrarni.b.h $xr27, $xr18, 15

# CHECK: xvssrarni.h.w $xr16, $xr3, 15
# CHECK: encoding: [0x70,0xbc,0x68,0x77]
xvssrarni.h.w $xr16, $xr3, 15

# CHECK: xvssrarni.w.d $xr26, $xr25, 18
# CHECK: encoding: [0x3a,0x4b,0x69,0x77]
xvssrarni.w.d $xr26, $xr25, 18

# CHECK: xvssrarni.d.q $xr28, $xr25, 0
# CHECK: encoding: [0x3c,0x03,0x6a,0x77]
xvssrarni.d.q $xr28, $xr25, 0

# CHECK: xvssrarni.bu.h $xr1, $xr12, 8
# CHECK: encoding: [0x81,0x61,0x6c,0x77]
xvssrarni.bu.h $xr1, $xr12, 8

# CHECK: xvssrarni.hu.w $xr3, $xr27, 31
# CHECK: encoding: [0x63,0xff,0x6c,0x77]
xvssrarni.hu.w $xr3, $xr27, 31

# CHECK: xvssrarni.wu.d $xr24, $xr27, 52
# CHECK: encoding: [0x78,0xd3,0x6d,0x77]
xvssrarni.wu.d $xr24, $xr27, 52

# CHECK: xvssrarni.du.q $xr5, $xr3, 112
# CHECK: encoding: [0x65,0xc0,0x6f,0x77]
xvssrarni.du.q $xr5, $xr3, 112

# CHECK: xvextrins.d $xr21, $xr25, 163
# CHECK: encoding: [0x35,0x8f,0x82,0x77]
xvextrins.d $xr21, $xr25, 163

# CHECK: xvextrins.w $xr19, $xr17, 28
# CHECK: encoding: [0x33,0x72,0x84,0x77]
xvextrins.w $xr19, $xr17, 28

# CHECK: xvextrins.h $xr30, $xr7, 79
# CHECK: encoding: [0xfe,0x3c,0x89,0x77]
xvextrins.h $xr30, $xr7, 79

# CHECK: xvextrins.b $xr1, $xr31, 210
# CHECK: encoding: [0xe1,0x4b,0x8f,0x77]
xvextrins.b $xr1, $xr31, 210

# CHECK: xvshuf4i.b $xr3, $xr22, 148
# CHECK: encoding: [0xc3,0x52,0x92,0x77]
xvshuf4i.b $xr3, $xr22, 148

# CHECK: xvshuf4i.h $xr2, $xr22, 34
# CHECK: encoding: [0xc2,0x8a,0x94,0x77]
xvshuf4i.h $xr2, $xr22, 34

# CHECK: xvshuf4i.w $xr31, $xr19, 165
# CHECK: encoding: [0x7f,0x96,0x9a,0x77]
xvshuf4i.w $xr31, $xr19, 165

# CHECK: xvshuf4i.d $xr31, $xr17, 14
# CHECK: encoding: [0x3f,0x3a,0x9c,0x77]
xvshuf4i.d $xr31, $xr17, 14

# CHECK: xvbitseli.b $xr27, $xr0, 80
# CHECK: encoding: [0x1b,0x40,0xc5,0x77]
xvbitseli.b $xr27, $xr0, 80

# CHECK: xvandi.b $xr23, $xr2, 153
# CHECK: encoding: [0x57,0x64,0xd2,0x77]
xvandi.b $xr23, $xr2, 153

# CHECK: xvori.b $xr27, $xr28, 188
# CHECK: encoding: [0x9b,0xf3,0xd6,0x77]
xvori.b $xr27, $xr28, 188

# CHECK: xvxori.b $xr28, $xr1, 254
# CHECK: encoding: [0x3c,0xf8,0xdb,0x77]
xvxori.b $xr28, $xr1, 254

# CHECK: xvnori.b $xr4, $xr2, 36
# CHECK: encoding: [0x44,0x90,0xdc,0x77]
xvnori.b $xr4, $xr2, 36

# CHECK: xvldi $xr26, -2544
# CHECK: encoding: [0x1a,0xc2,0xe2,0x77]
xvldi $xr26, -2544

# CHECK: xvpermi.w $xr22, $xr24, 168
# CHECK: encoding: [0x16,0xa3,0xe6,0x77]
xvpermi.w $xr22, $xr24, 168

# CHECK: xvpermi.d $xr14, $xr31, 136
# CHECK: encoding: [0xee,0x23,0xea,0x77]
xvpermi.d $xr14, $xr31, 136

# CHECK: xvpermi.q $xr28, $xr14, 211
# CHECK: encoding: [0xdc,0x4d,0xef,0x77]
xvpermi.q $xr28, $xr14, 211

# CHECK: vaddwev.h.b $vr0, $vr31, $vr31
# CHECK: encoding: [0xe0,0x7f,0x1e,0x70]
vaddwev.h.b $vr0, $vr31, $vr31

# CHECK: vaddwev.w.h $vr3, $vr4, $vr23
# CHECK: encoding: [0x83,0xdc,0x1e,0x70]
vaddwev.w.h $vr3, $vr4, $vr23

# CHECK: vaddwev.d.w $vr30, $vr26, $vr11
# CHECK: encoding: [0x5e,0x2f,0x1f,0x70]
vaddwev.d.w $vr30, $vr26, $vr11

# CHECK: vaddwev.q.d $vr25, $vr29, $vr13
# CHECK: encoding: [0xb9,0xb7,0x1f,0x70]
vaddwev.q.d $vr25, $vr29, $vr13

# CHECK: vsubwev.h.b $vr11, $vr28, $vr1
# CHECK: encoding: [0x8b,0x07,0x20,0x70]
vsubwev.h.b $vr11, $vr28, $vr1

# CHECK: vsubwev.w.h $vr9, $vr15, $vr5
# CHECK: encoding: [0xe9,0x95,0x20,0x70]
vsubwev.w.h $vr9, $vr15, $vr5

# CHECK: vsubwev.d.w $vr17, $vr9, $vr10
# CHECK: encoding: [0x31,0x29,0x21,0x70]
vsubwev.d.w $vr17, $vr9, $vr10

# CHECK: vsubwev.q.d $vr26, $vr18, $vr11
# CHECK: encoding: [0x5a,0xae,0x21,0x70]
vsubwev.q.d $vr26, $vr18, $vr11

# CHECK: vaddwod.h.b $vr7, $vr11, $vr18
# CHECK: encoding: [0x67,0x49,0x22,0x70]
vaddwod.h.b $vr7, $vr11, $vr18

# CHECK: vaddwod.w.h $vr0, $vr7, $vr12
# CHECK: encoding: [0xe0,0xb0,0x22,0x70]
vaddwod.w.h $vr0, $vr7, $vr12

# CHECK: vaddwod.d.w $vr30, $vr27, $vr16
# CHECK: encoding: [0x7e,0x43,0x23,0x70]
vaddwod.d.w $vr30, $vr27, $vr16

# CHECK: vaddwod.q.d $vr2, $vr20, $vr29
# CHECK: encoding: [0x82,0xf6,0x23,0x70]
vaddwod.q.d $vr2, $vr20, $vr29

# CHECK: vsubwod.h.b $vr26, $vr7, $vr19
# CHECK: encoding: [0xfa,0x4c,0x24,0x70]
vsubwod.h.b $vr26, $vr7, $vr19

# CHECK: vsubwod.w.h $vr19, $vr3, $vr11
# CHECK: encoding: [0x73,0xac,0x24,0x70]
vsubwod.w.h $vr19, $vr3, $vr11

# CHECK: vsubwod.d.w $vr31, $vr28, $vr12
# CHECK: encoding: [0x9f,0x33,0x25,0x70]
vsubwod.d.w $vr31, $vr28, $vr12

# CHECK: vsubwod.q.d $vr1, $vr24, $vr16
# CHECK: encoding: [0x01,0xc3,0x25,0x70]
vsubwod.q.d $vr1, $vr24, $vr16

# CHECK: vaddwev.h.bu $vr3, $vr29, $vr29
# CHECK: encoding: [0xa3,0x77,0x2e,0x70]
vaddwev.h.bu $vr3, $vr29, $vr29

# CHECK: vaddwev.w.hu $vr10, $vr15, $vr10
# CHECK: encoding: [0xea,0xa9,0x2e,0x70]
vaddwev.w.hu $vr10, $vr15, $vr10

# CHECK: vaddwev.d.wu $vr24, $vr29, $vr4
# CHECK: encoding: [0xb8,0x13,0x2f,0x70]
vaddwev.d.wu $vr24, $vr29, $vr4

# CHECK: vaddwev.q.du $vr17, $vr23, $vr0
# CHECK: encoding: [0xf1,0x82,0x2f,0x70]
vaddwev.q.du $vr17, $vr23, $vr0

# CHECK: vsubwev.h.bu $vr25, $vr11, $vr20
# CHECK: encoding: [0x79,0x51,0x30,0x70]
vsubwev.h.bu $vr25, $vr11, $vr20

# CHECK: vsubwev.w.hu $vr17, $vr15, $vr20
# CHECK: encoding: [0xf1,0xd1,0x30,0x70]
vsubwev.w.hu $vr17, $vr15, $vr20

# CHECK: vsubwev.d.wu $vr10, $vr25, $vr5
# CHECK: encoding: [0x2a,0x17,0x31,0x70]
vsubwev.d.wu $vr10, $vr25, $vr5

# CHECK: vsubwev.q.du $vr29, $vr3, $vr8
# CHECK: encoding: [0x7d,0xa0,0x31,0x70]
vsubwev.q.du $vr29, $vr3, $vr8

# CHECK: vaddwod.h.bu $vr10, $vr0, $vr25
# CHECK: encoding: [0x0a,0x64,0x32,0x70]
vaddwod.h.bu $vr10, $vr0, $vr25

# CHECK: vaddwod.w.hu $vr2, $vr27, $vr23
# CHECK: encoding: [0x62,0xdf,0x32,0x70]
vaddwod.w.hu $vr2, $vr27, $vr23

# CHECK: vaddwod.d.wu $vr2, $vr0, $vr22
# CHECK: encoding: [0x02,0x58,0x33,0x70]
vaddwod.d.wu $vr2, $vr0, $vr22

# CHECK: vaddwod.q.du $vr0, $vr2, $vr3
# CHECK: encoding: [0x40,0x8c,0x33,0x70]
vaddwod.q.du $vr0, $vr2, $vr3

# CHECK: vsubwod.h.bu $vr14, $vr31, $vr3
# CHECK: encoding: [0xee,0x0f,0x34,0x70]
vsubwod.h.bu $vr14, $vr31, $vr3

# CHECK: vsubwod.w.hu $vr21, $vr2, $vr7
# CHECK: encoding: [0x55,0x9c,0x34,0x70]
vsubwod.w.hu $vr21, $vr2, $vr7

# CHECK: vsubwod.d.wu $vr11, $vr8, $vr18
# CHECK: encoding: [0x0b,0x49,0x35,0x70]
vsubwod.d.wu $vr11, $vr8, $vr18

# CHECK: vsubwod.q.du $vr30, $vr20, $vr0
# CHECK: encoding: [0x9e,0x82,0x35,0x70]
vsubwod.q.du $vr30, $vr20, $vr0

# CHECK: vaddwev.h.bu.b $vr19, $vr28, $vr17
# CHECK: encoding: [0x93,0x47,0x3e,0x70]
vaddwev.h.bu.b $vr19, $vr28, $vr17

# CHECK: vaddwev.w.hu.h $vr14, $vr15, $vr30
# CHECK: encoding: [0xee,0xf9,0x3e,0x70]
vaddwev.w.hu.h $vr14, $vr15, $vr30

# CHECK: vaddwev.d.wu.w $vr15, $vr7, $vr10
# CHECK: encoding: [0xef,0x28,0x3f,0x70]
vaddwev.d.wu.w $vr15, $vr7, $vr10

# CHECK: vaddwev.q.du.d $vr19, $vr14, $vr30
# CHECK: encoding: [0xd3,0xf9,0x3f,0x70]
vaddwev.q.du.d $vr19, $vr14, $vr30

# CHECK: vaddwod.h.bu.b $vr15, $vr18, $vr8
# CHECK: encoding: [0x4f,0x22,0x40,0x70]
vaddwod.h.bu.b $vr15, $vr18, $vr8

# CHECK: vaddwod.w.hu.h $vr19, $vr27, $vr6
# CHECK: encoding: [0x73,0x9b,0x40,0x70]
vaddwod.w.hu.h $vr19, $vr27, $vr6

# CHECK: vaddwod.d.wu.w $vr7, $vr11, $vr15
# CHECK: encoding: [0x67,0x3d,0x41,0x70]
vaddwod.d.wu.w $vr7, $vr11, $vr15

# CHECK: vaddwod.q.du.d $vr0, $vr0, $vr26
# CHECK: encoding: [0x00,0xe8,0x41,0x70]
vaddwod.q.du.d $vr0, $vr0, $vr26

# CHECK: vmulwev.h.b $vr24, $vr19, $vr21
# CHECK: encoding: [0x78,0x56,0x90,0x70]
vmulwev.h.b $vr24, $vr19, $vr21

# CHECK: vmulwev.w.h $vr13, $vr22, $vr18
# CHECK: encoding: [0xcd,0xca,0x90,0x70]
vmulwev.w.h $vr13, $vr22, $vr18

# CHECK: vmulwev.d.w $vr24, $vr22, $vr13
# CHECK: encoding: [0xd8,0x36,0x91,0x70]
vmulwev.d.w $vr24, $vr22, $vr13

# CHECK: vmulwev.q.d $vr4, $vr22, $vr30
# CHECK: encoding: [0xc4,0xfa,0x91,0x70]
vmulwev.q.d $vr4, $vr22, $vr30

# CHECK: vmulwod.h.b $vr22, $vr26, $vr24
# CHECK: encoding: [0x56,0x63,0x92,0x70]
vmulwod.h.b $vr22, $vr26, $vr24

# CHECK: vmulwod.w.h $vr17, $vr12, $vr4
# CHECK: encoding: [0x91,0x91,0x92,0x70]
vmulwod.w.h $vr17, $vr12, $vr4

# CHECK: vmulwod.d.w $vr16, $vr15, $vr26
# CHECK: encoding: [0xf0,0x69,0x93,0x70]
vmulwod.d.w $vr16, $vr15, $vr26

# CHECK: vmulwod.q.d $vr3, $vr16, $vr5
# CHECK: encoding: [0x03,0x96,0x93,0x70]
vmulwod.q.d $vr3, $vr16, $vr5

# CHECK: vmulwev.h.bu $vr31, $vr19, $vr19
# CHECK: encoding: [0x7f,0x4e,0x98,0x70]
vmulwev.h.bu $vr31, $vr19, $vr19

# CHECK: vmulwev.w.hu $vr22, $vr31, $vr5
# CHECK: encoding: [0xf6,0x97,0x98,0x70]
vmulwev.w.hu $vr22, $vr31, $vr5

# CHECK: vmulwev.d.wu $vr0, $vr4, $vr30
# CHECK: encoding: [0x80,0x78,0x99,0x70]
vmulwev.d.wu $vr0, $vr4, $vr30

# CHECK: vmulwev.q.du $vr31, $vr3, $vr20
# CHECK: encoding: [0x7f,0xd0,0x99,0x70]
vmulwev.q.du $vr31, $vr3, $vr20

# CHECK: vmulwod.h.bu $vr25, $vr7, $vr13
# CHECK: encoding: [0xf9,0x34,0x9a,0x70]
vmulwod.h.bu $vr25, $vr7, $vr13

# CHECK: vmulwod.w.hu $vr1, $vr12, $vr12
# CHECK: encoding: [0x81,0xb1,0x9a,0x70]
vmulwod.w.hu $vr1, $vr12, $vr12

# CHECK: vmulwod.d.wu $vr15, $vr15, $vr30
# CHECK: encoding: [0xef,0x79,0x9b,0x70]
vmulwod.d.wu $vr15, $vr15, $vr30

# CHECK: vmulwod.q.du $vr13, $vr28, $vr6
# CHECK: encoding: [0x8d,0x9b,0x9b,0x70]
vmulwod.q.du $vr13, $vr28, $vr6

# CHECK: vmulwev.h.bu.b $vr8, $vr26, $vr3
# CHECK: encoding: [0x48,0x0f,0xa0,0x70]
vmulwev.h.bu.b $vr8, $vr26, $vr3

# CHECK: vmulwev.w.hu.h $vr10, $vr25, $vr1
# CHECK: encoding: [0x2a,0x87,0xa0,0x70]
vmulwev.w.hu.h $vr10, $vr25, $vr1

# CHECK: vmulwev.d.wu.w $vr9, $vr0, $vr19
# CHECK: encoding: [0x09,0x4c,0xa1,0x70]
vmulwev.d.wu.w $vr9, $vr0, $vr19

# CHECK: vmulwev.q.du.d $vr13, $vr24, $vr23
# CHECK: encoding: [0x0d,0xdf,0xa1,0x70]
vmulwev.q.du.d $vr13, $vr24, $vr23

# CHECK: vmulwod.h.bu.b $vr20, $vr0, $vr14
# CHECK: encoding: [0x14,0x38,0xa2,0x70]
vmulwod.h.bu.b $vr20, $vr0, $vr14

# CHECK: vmulwod.w.hu.h $vr16, $vr20, $vr3
# CHECK: encoding: [0x90,0x8e,0xa2,0x70]
vmulwod.w.hu.h $vr16, $vr20, $vr3

# CHECK: vmulwod.d.wu.w $vr5, $vr23, $vr27
# CHECK: encoding: [0xe5,0x6e,0xa3,0x70]
vmulwod.d.wu.w $vr5, $vr23, $vr27

# CHECK: vmulwod.q.du.d $vr30, $vr30, $vr29
# CHECK: encoding: [0xde,0xf7,0xa3,0x70]
vmulwod.q.du.d $vr30, $vr30, $vr29

# CHECK: vmaddwev.h.b $vr18, $vr0, $vr8
# CHECK: encoding: [0x12,0x20,0xac,0x70]
vmaddwev.h.b $vr18, $vr0, $vr8

# CHECK: vmaddwev.w.h $vr29, $vr22, $vr7
# CHECK: encoding: [0xdd,0x9e,0xac,0x70]
vmaddwev.w.h $vr29, $vr22, $vr7

# CHECK: vmaddwev.d.w $vr28, $vr13, $vr31
# CHECK: encoding: [0xbc,0x7d,0xad,0x70]
vmaddwev.d.w $vr28, $vr13, $vr31

# CHECK: vmaddwev.q.d $vr5, $vr3, $vr13
# CHECK: encoding: [0x65,0xb4,0xad,0x70]
vmaddwev.q.d $vr5, $vr3, $vr13

# CHECK: vmaddwod.h.b $vr4, $vr1, $vr9
# CHECK: encoding: [0x24,0x24,0xae,0x70]
vmaddwod.h.b $vr4, $vr1, $vr9

# CHECK: vmaddwod.w.h $vr26, $vr9, $vr24
# CHECK: encoding: [0x3a,0xe1,0xae,0x70]
vmaddwod.w.h $vr26, $vr9, $vr24

# CHECK: vmaddwod.d.w $vr30, $vr3, $vr13
# CHECK: encoding: [0x7e,0x34,0xaf,0x70]
vmaddwod.d.w $vr30, $vr3, $vr13

# CHECK: vmaddwod.q.d $vr15, $vr13, $vr29
# CHECK: encoding: [0xaf,0xf5,0xaf,0x70]
vmaddwod.q.d $vr15, $vr13, $vr29

# CHECK: vmaddwev.h.bu $vr24, $vr20, $vr5
# CHECK: encoding: [0x98,0x16,0xb4,0x70]
vmaddwev.h.bu $vr24, $vr20, $vr5

# CHECK: vmaddwev.w.hu $vr3, $vr4, $vr8
# CHECK: encoding: [0x83,0xa0,0xb4,0x70]
vmaddwev.w.hu $vr3, $vr4, $vr8

# CHECK: vmaddwev.d.wu $vr27, $vr19, $vr4
# CHECK: encoding: [0x7b,0x12,0xb5,0x70]
vmaddwev.d.wu $vr27, $vr19, $vr4

# CHECK: vmaddwev.q.du $vr28, $vr27, $vr29
# CHECK: encoding: [0x7c,0xf7,0xb5,0x70]
vmaddwev.q.du $vr28, $vr27, $vr29

# CHECK: vmaddwod.h.bu $vr5, $vr20, $vr26
# CHECK: encoding: [0x85,0x6a,0xb6,0x70]
vmaddwod.h.bu $vr5, $vr20, $vr26

# CHECK: vmaddwod.w.hu $vr21, $vr30, $vr10
# CHECK: encoding: [0xd5,0xab,0xb6,0x70]
vmaddwod.w.hu $vr21, $vr30, $vr10

# CHECK: vmaddwod.d.wu $vr7, $vr11, $vr20
# CHECK: encoding: [0x67,0x51,0xb7,0x70]
vmaddwod.d.wu $vr7, $vr11, $vr20

# CHECK: vmaddwod.q.du $vr30, $vr18, $vr24
# CHECK: encoding: [0x5e,0xe2,0xb7,0x70]
vmaddwod.q.du $vr30, $vr18, $vr24

# CHECK: vmaddwev.h.bu.b $vr4, $vr1, $vr4
# CHECK: encoding: [0x24,0x10,0xbc,0x70]
vmaddwev.h.bu.b $vr4, $vr1, $vr4

# CHECK: vmaddwev.w.hu.h $vr25, $vr11, $vr15
# CHECK: encoding: [0x79,0xbd,0xbc,0x70]
vmaddwev.w.hu.h $vr25, $vr11, $vr15

# CHECK: vmaddwev.d.wu.w $vr10, $vr16, $vr20
# CHECK: encoding: [0x0a,0x52,0xbd,0x70]
vmaddwev.d.wu.w $vr10, $vr16, $vr20

# CHECK: vmaddwev.q.du.d $vr22, $vr20, $vr23
# CHECK: encoding: [0x96,0xde,0xbd,0x70]
vmaddwev.q.du.d $vr22, $vr20, $vr23

# CHECK: vmaddwod.h.bu.b $vr31, $vr25, $vr27
# CHECK: encoding: [0x3f,0x6f,0xbe,0x70]
vmaddwod.h.bu.b $vr31, $vr25, $vr27

# CHECK: vmaddwod.w.hu.h $vr8, $vr18, $vr24
# CHECK: encoding: [0x48,0xe2,0xbe,0x70]
vmaddwod.w.hu.h $vr8, $vr18, $vr24

# CHECK: vmaddwod.d.wu.w $vr18, $vr13, $vr10
# CHECK: encoding: [0xb2,0x29,0xbf,0x70]
vmaddwod.d.wu.w $vr18, $vr13, $vr10

# CHECK: vmaddwod.q.du.d $vr10, $vr5, $vr15
# CHECK: encoding: [0xaa,0xbc,0xbf,0x70]
vmaddwod.q.du.d $vr10, $vr5, $vr15

