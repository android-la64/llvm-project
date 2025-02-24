# RUN: llvm-mc %s -triple=loongarch64-unknown-linux-gnu -show-encoding | FileCheck %s
# CHECK: fadd.s $f29, $f15, $f25
# CHECK: encoding: [0xfd,0xe5,0x00,0x01]
fadd.s $f29, $f15, $f25

# CHECK: fadd.d $f25, $f7, $f13
# CHECK: encoding: [0xf9,0x34,0x01,0x01]
fadd.d $f25, $f7, $f13

# CHECK: fsub.s $f14, $f6, $f31
# CHECK: encoding: [0xce,0xfc,0x02,0x01]
fsub.s $f14, $f6, $f31

# CHECK: fsub.d $f29, $f1, $f18
# CHECK: encoding: [0x3d,0x48,0x03,0x01]
fsub.d $f29, $f1, $f18

# CHECK: fmul.s $f0, $f7, $f17
# CHECK: encoding: [0xe0,0xc4,0x04,0x01]
fmul.s $f0, $f7, $f17

# CHECK: fmul.d $f4, $f30, $f7
# CHECK: encoding: [0xc4,0x1f,0x05,0x01]
fmul.d $f4, $f30, $f7

# CHECK: fdiv.s $f20, $f24, $f19
# CHECK: encoding: [0x14,0xcf,0x06,0x01]
fdiv.s $f20, $f24, $f19

# CHECK: fdiv.d $f3, $f25, $f28
# CHECK: encoding: [0x23,0x73,0x07,0x01]
fdiv.d $f3, $f25, $f28

# CHECK: fmax.s $f22, $f6, $f27
# CHECK: encoding: [0xd6,0xec,0x08,0x01]
fmax.s $f22, $f6, $f27

# CHECK: fmax.d $f11, $f26, $f13
# CHECK: encoding: [0x4b,0x37,0x09,0x01]
fmax.d $f11, $f26, $f13

# CHECK: fmin.s $f14, $f10, $f19
# CHECK: encoding: [0x4e,0xcd,0x0a,0x01]
fmin.s $f14, $f10, $f19

# CHECK: fmin.d $f1, $f13, $f27
# CHECK: encoding: [0xa1,0x6d,0x0b,0x01]
fmin.d $f1, $f13, $f27

# CHECK: fmaxa.s $f9, $f27, $f31
# CHECK: encoding: [0x69,0xff,0x0c,0x01]
fmaxa.s $f9, $f27, $f31

# CHECK: fmaxa.d $f24, $f13, $f4
# CHECK: encoding: [0xb8,0x11,0x0d,0x01]
fmaxa.d $f24, $f13, $f4

# CHECK: fmina.s $f15, $f18, $f1
# CHECK: encoding: [0x4f,0x86,0x0e,0x01]
fmina.s $f15, $f18, $f1

# CHECK: fmina.d $f18, $f10, $f0
# CHECK: encoding: [0x52,0x01,0x0f,0x01]
fmina.d $f18, $f10, $f0

# CHECK: fscaleb.s $f21, $f23, $f6
# CHECK: encoding: [0xf5,0x9a,0x10,0x01]
fscaleb.s $f21, $f23, $f6

# CHECK: fscaleb.d $f12, $f14, $f26
# CHECK: encoding: [0xcc,0x69,0x11,0x01]
fscaleb.d $f12, $f14, $f26

# CHECK: fcopysign.s $f13, $f24, $f23
# CHECK: encoding: [0x0d,0xdf,0x12,0x01]
fcopysign.s $f13, $f24, $f23

# CHECK: fcopysign.d $f16, $f26, $f6
# CHECK: encoding: [0x50,0x1b,0x13,0x01]
fcopysign.d $f16, $f26, $f6

# CHECK: fabs.s $f28, $f12
# CHECK: encoding: [0x9c,0x05,0x14,0x01]
fabs.s $f28, $f12

# CHECK: fabs.d $f23, $f3
# CHECK: encoding: [0x77,0x08,0x14,0x01]
fabs.d $f23, $f3

# CHECK: fneg.s $f21, $f24
# CHECK: encoding: [0x15,0x17,0x14,0x01]
fneg.s $f21, $f24

# CHECK: fneg.d $f11, $f26
# CHECK: encoding: [0x4b,0x1b,0x14,0x01]
fneg.d $f11, $f26

# CHECK: flogb.s $f31, $f23
# CHECK: encoding: [0xff,0x26,0x14,0x01]
flogb.s $f31, $f23

# CHECK: flogb.d $f21, $f29
# CHECK: encoding: [0xb5,0x2b,0x14,0x01]
flogb.d $f21, $f29

# CHECK: fclass.s $f20, $f9
# CHECK: encoding: [0x34,0x35,0x14,0x01]
fclass.s $f20, $f9

# CHECK: fclass.d $f19, $f2
# CHECK: encoding: [0x53,0x38,0x14,0x01]
fclass.d $f19, $f2

# CHECK: fsqrt.s $f27, $f18
# CHECK: encoding: [0x5b,0x46,0x14,0x01]
fsqrt.s $f27, $f18

# CHECK: fsqrt.d $f2, $f11
# CHECK: encoding: [0x62,0x49,0x14,0x01]
fsqrt.d $f2, $f11

# CHECK: frecip.s $f17, $f27
# CHECK: encoding: [0x71,0x57,0x14,0x01]
frecip.s $f17, $f27

# CHECK: frecip.d $f27, $f27
# CHECK: encoding: [0x7b,0x5b,0x14,0x01]
frecip.d $f27, $f27

# CHECK: frsqrt.s $f25, $f12
# CHECK: encoding: [0x99,0x65,0x14,0x01]
frsqrt.s $f25, $f12

# CHECK: frsqrt.d $f22, $f3
# CHECK: encoding: [0x76,0x68,0x14,0x01]
frsqrt.d $f22, $f3

# CHECK: fmov.s $f13, $f23
# CHECK: encoding: [0xed,0x96,0x14,0x01]
fmov.s $f13, $f23

# CHECK: fmov.d $f30, $f9
# CHECK: encoding: [0x3e,0x99,0x14,0x01]
fmov.d $f30, $f9

# CHECK: movgr2fr.w $f6, $tp
# CHECK: encoding: [0x46,0xa4,0x14,0x01]
movgr2fr.w $f6, $tp

# CHECK: movgr2fr.d $f30, $r11
# CHECK: encoding: [0x7e,0xa9,0x14,0x01]
movgr2fr.d $f30, $r11

# CHECK: movgr2frh.w $f23, $r26
# CHECK: encoding: [0x57,0xaf,0x14,0x01]
movgr2frh.w $f23, $r26

# CHECK: movfr2gr.s $r10, $f22
# CHECK: encoding: [0xca,0xb6,0x14,0x01]
movfr2gr.s $r10, $f22

# CHECK: movfr2gr.d $r26, $f17
# CHECK: encoding: [0x3a,0xba,0x14,0x01]
movfr2gr.d $r26, $f17

# CHECK: movfrh2gr.s $sp, $f26
# CHECK: encoding: [0x43,0xbf,0x14,0x01]
movfrh2gr.s $sp, $f26

# CHECK: movfr2cf $fcc4, $f11
# CHECK: encoding: [0x64,0xd1,0x14,0x01]
movfr2cf $fcc4, $f11

# CHECK: movcf2fr $f16, $fcc0
# CHECK: encoding: [0x10,0xd4,0x14,0x01]
movcf2fr $f16, $fcc0

# CHECK: movgr2cf $fcc5, $ra
# CHECK: encoding: [0x25,0xd8,0x14,0x01]
movgr2cf $fcc5, $ra

# CHECK: movcf2gr $r21, $fcc7
# CHECK: encoding: [0xf5,0xdc,0x14,0x01]
movcf2gr $r21, $fcc7

# CHECK: fcvt.s.d $f12, $f19
# CHECK: encoding: [0x6c,0x1a,0x19,0x01]
fcvt.s.d $f12, $f19

# CHECK: fcvt.d.s $f10, $f6
# CHECK: encoding: [0xca,0x24,0x19,0x01]
fcvt.d.s $f10, $f6

# CHECK: ftintrm.w.s $f16, $f16
# CHECK: encoding: [0x10,0x06,0x1a,0x01]
ftintrm.w.s $f16, $f16

# CHECK: ftintrm.w.d $f7, $f8
# CHECK: encoding: [0x07,0x09,0x1a,0x01]
ftintrm.w.d $f7, $f8

# CHECK: ftintrm.l.s $f24, $f10
# CHECK: encoding: [0x58,0x25,0x1a,0x01]
ftintrm.l.s $f24, $f10

# CHECK: ftintrm.l.d $f9, $f9
# CHECK: encoding: [0x29,0x29,0x1a,0x01]
ftintrm.l.d $f9, $f9

# CHECK: ftintrp.w.s $f14, $f31
# CHECK: encoding: [0xee,0x47,0x1a,0x01]
ftintrp.w.s $f14, $f31

# CHECK: ftintrp.w.d $f12, $f3
# CHECK: encoding: [0x6c,0x48,0x1a,0x01]
ftintrp.w.d $f12, $f3

# CHECK: ftintrp.l.s $f0, $f16
# CHECK: encoding: [0x00,0x66,0x1a,0x01]
ftintrp.l.s $f0, $f16

# CHECK: ftintrp.l.d $f4, $f29
# CHECK: encoding: [0xa4,0x6b,0x1a,0x01]
ftintrp.l.d $f4, $f29

# CHECK: ftintrz.w.s $f4, $f29
# CHECK: encoding: [0xa4,0x87,0x1a,0x01]
ftintrz.w.s $f4, $f29

# CHECK: ftintrz.w.d $f25, $f24
# CHECK: encoding: [0x19,0x8b,0x1a,0x01]
ftintrz.w.d $f25, $f24

# CHECK: ftintrz.l.s $f23, $f5
# CHECK: encoding: [0xb7,0xa4,0x1a,0x01]
ftintrz.l.s $f23, $f5

# CHECK: ftintrz.l.d $f3, $f10
# CHECK: encoding: [0x43,0xa9,0x1a,0x01]
ftintrz.l.d $f3, $f10

# CHECK: ftintrne.w.s $f4, $f17
# CHECK: encoding: [0x24,0xc6,0x1a,0x01]
ftintrne.w.s $f4, $f17

# CHECK: ftintrne.w.d $f31, $f12
# CHECK: encoding: [0x9f,0xc9,0x1a,0x01]
ftintrne.w.d $f31, $f12

# CHECK: ftintrne.l.s $f22, $f27
# CHECK: encoding: [0x76,0xe7,0x1a,0x01]
ftintrne.l.s $f22, $f27

# CHECK: ftintrne.l.d $f28, $f6
# CHECK: encoding: [0xdc,0xe8,0x1a,0x01]
ftintrne.l.d $f28, $f6

# CHECK: ftint.w.s $f21, $f13
# CHECK: encoding: [0xb5,0x05,0x1b,0x01]
ftint.w.s $f21, $f13

# CHECK: ftint.w.d $f3, $f14
# CHECK: encoding: [0xc3,0x09,0x1b,0x01]
ftint.w.d $f3, $f14

# CHECK: ftint.l.s $f31, $f24
# CHECK: encoding: [0x1f,0x27,0x1b,0x01]
ftint.l.s $f31, $f24

# CHECK: ftint.l.d $f16, $f24
# CHECK: encoding: [0x10,0x2b,0x1b,0x01]
ftint.l.d $f16, $f24

# CHECK: ffint.s.w $f30, $f5
# CHECK: encoding: [0xbe,0x10,0x1d,0x01]
ffint.s.w $f30, $f5

# CHECK: ffint.s.l $f6, $f5
# CHECK: encoding: [0xa6,0x18,0x1d,0x01]
ffint.s.l $f6, $f5

# CHECK: ffint.d.w $f24, $f18
# CHECK: encoding: [0x58,0x22,0x1d,0x01]
ffint.d.w $f24, $f18

# CHECK: ffint.d.l $f23, $f26
# CHECK: encoding: [0x57,0x2b,0x1d,0x01]
ffint.d.l $f23, $f26

# CHECK: frint.s $f5, $f17
# CHECK: encoding: [0x25,0x46,0x1e,0x01]
frint.s $f5, $f17

# CHECK: frint.d $f29, $f2
# CHECK: encoding: [0x5d,0x48,0x1e,0x01]
frint.d $f29, $f2

