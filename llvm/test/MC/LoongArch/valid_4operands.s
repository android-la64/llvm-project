# RUN: llvm-mc %s -triple=loongarch64-unknown-linux-gnu -show-encoding | FileCheck %s
# CHECK: fmadd.s $f3, $f16, $f3, $f15
# CHECK: encoding: [0x03,0x8e,0x17,0x08]
fmadd.s $f3, $f16, $f3, $f15

# CHECK: fmadd.d $f21, $f24, $f28, $f24
# CHECK: encoding: [0x15,0x73,0x2c,0x08]
fmadd.d $f21, $f24, $f28, $f24

# CHECK: fmsub.s $f23, $f11, $f21, $f4
# CHECK: encoding: [0x77,0x55,0x52,0x08]
fmsub.s $f23, $f11, $f21, $f4

# CHECK: fmsub.d $f6, $f18, $f20, $f27
# CHECK: encoding: [0x46,0xd2,0x6d,0x08]
fmsub.d $f6, $f18, $f20, $f27

# CHECK: fnmadd.s $f29, $f1, $f24, $f20
# CHECK: encoding: [0x3d,0x60,0x9a,0x08]
fnmadd.s $f29, $f1, $f24, $f20

# CHECK: fnmadd.d $f25, $f13, $f19, $f30
# CHECK: encoding: [0xb9,0x4d,0xaf,0x08]
fnmadd.d $f25, $f13, $f19, $f30

# CHECK: fnmsub.s $f8, $f4, $f24, $f25
# CHECK: encoding: [0x88,0xe0,0xdc,0x08]
fnmsub.s $f8, $f4, $f24, $f25

# CHECK: fnmsub.d $f30, $f26, $f7, $f24
# CHECK: encoding: [0x5e,0x1f,0xec,0x08]
fnmsub.d $f30, $f26, $f7, $f24

# CHECK: fcmp.ceq.s $fcc7, $f17, $f29
# CHECK: encoding: [0x27,0x76,0x12,0x0c]
fcmp.ceq.s $fcc7, $f17, $f29

# CHECK: fcmp.ceq.d $fcc4, $f12, $f9
# CHECK: encoding: [0x84,0x25,0x22,0x0c]
fcmp.ceq.d $fcc4, $f12, $f9

# CHECK: fcmp.cult.s $fcc0, $f0, $f1
# CHECK: encoding: [0x00,0x04,0x15,0x0c]
fcmp.cult.s $fcc0, $f0, $f1

# CHECK: fcmp.cult.d $fcc2, $f3, $f4
# CHECK: encoding: [0x62,0x10,0x25,0x0c]
fcmp.cult.d $fcc2, $f3, $f4

# CHECK: fsel $f18, $f20, $f21, $fcc4
# CHECK: encoding: [0x92,0x56,0x02,0x0d]
fsel $f18, $f20, $f21, $fcc4

