# RUN: llvm-mc %s -triple=loongarch64-unknown-linux-gnu -show-encoding | FileCheck %s
# CHECK: la.pcrel $r4, symbol # encoding: [0x04,0x00,0x00,0x1c]
# CHECK: # fixup A - offset: 0, value: (symbol)+2048, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup D - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_5_20
# CHECK: # la expanded slot # encoding: [0x84,0x00,0xc0,0x02]
# CHECK: # fixup A - offset: 0, value: (symbol)+4, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: (symbol)+2052, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup C - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup D - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup E - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_SL
# CHECK: # fixup G - offset: 0, value: 0, kind: fixup_LARCH_SOP_SUB
# CHECK: # fixup H - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_10_12
la.local $a0, symbol

# CHECK: la.got $r4, symbol # encoding: [0x04,0x00,0x00,0x1c]
# CHECK: # fixup A - offset: 0, value: _GLOBAL_OFFSET_TABLE_+2048, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_GPREL
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup D - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup E - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_5_20
# CHECK: # la expanded slot # encoding: [0x84,0x00,0xc0,0x28]
# CHECK: # fixup A - offset: 0, value: _GLOBAL_OFFSET_TABLE_+4, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_GPREL
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup D - offset: 0, value: _GLOBAL_OFFSET_TABLE_+2052, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup E - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_GPREL
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup G - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup H - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup I - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup J - offset: 0, value: 0, kind: fixup_LARCH_SOP_SL
# CHECK: # fixup K - offset: 0, value: 0, kind: fixup_LARCH_SOP_SUB
# CHECK: # fixup L - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_10_12
la.global $a0, symbol

# CHECK: la.pcrel $r4, symbol # encoding: [0x04,0x00,0x00,0x1c]
# CHECK: # fixup A - offset: 0, value: (symbol)+2048, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup D - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_5_20
# CHECK: # la expanded slot # encoding: [0x84,0x00,0xc0,0x02]
# CHECK: # fixup A - offset: 0, value: (symbol)+4, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: (symbol)+2052, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup C - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup D - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup E - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_SL
# CHECK: # fixup G - offset: 0, value: 0, kind: fixup_LARCH_SOP_SUB
# CHECK: # fixup H - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_10_12
la.pcrel $a0, symbol

# CHECK: la.got $r4, symbol # encoding: [0x04,0x00,0x00,0x1c]
# CHECK: # fixup A - offset: 0, value: _GLOBAL_OFFSET_TABLE_+2048, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_GPREL
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup D - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup E - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_5_20
# CHECK: # la expanded slot # encoding: [0x84,0x00,0xc0,0x28]
# CHECK: # fixup A - offset: 0, value: _GLOBAL_OFFSET_TABLE_+4, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_GPREL
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup D - offset: 0, value: _GLOBAL_OFFSET_TABLE_+2052, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup E - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_GPREL
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup G - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup H - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup I - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup J - offset: 0, value: 0, kind: fixup_LARCH_SOP_SL
# CHECK: # fixup K - offset: 0, value: 0, kind: fixup_LARCH_SOP_SUB
# CHECK: # fixup L - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_10_12
la.got $a0, symbol

# CHECK: la.tls.le $r4, symbol # encoding: [0x04,0x00,0x00,0x14]
# CHECK: # fixup A - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_TPREL
# CHECK: # fixup B - offset: 0, value: 32, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_SL
# CHECK: # fixup D - offset: 0, value: 44, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup E - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_5_20
# CHECK: # la expanded slot # encoding: [0x84,0x00,0x80,0x03]
# CHECK: # fixup A - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_TPREL
# CHECK: # fixup B - offset: 0, value: 4095, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_AND
# CHECK: # fixup D - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_U_10_12
# CHECK: # la expanded slot # encoding: [0x04,0x00,0x00,0x16]
# CHECK: # fixup A - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_TPREL
# CHECK: # fixup B - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_SL
# CHECK: # fixup D - offset: 0, value: 44, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup E - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_5_20
# CHECK: # la expanded slot # encoding: [0x84,0x00,0x00,0x03]
# CHECK: # fixup A - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_TPREL
# CHECK: # fixup B - offset: 0, value: 52, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup D - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_10_12
la.tls.le $a0, symbol

# CHECK: la.tls.ie $r4, symbol # encoding: [0x04,0x00,0x00,0x1c]
# CHECK: # fixup A - offset: 0, value: _GLOBAL_OFFSET_TABLE_+2048, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_GOT
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup D - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup E - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_5_20
# CHECK: # la expanded slot # encoding: [0x84,0x00,0xc0,0x28]
# CHECK: # fixup A - offset: 0, value: _GLOBAL_OFFSET_TABLE_+4, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_GOT
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup D - offset: 0, value: _GLOBAL_OFFSET_TABLE_+2052, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup E - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_GOT
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup G - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup H - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup I - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup J - offset: 0, value: 0, kind: fixup_LARCH_SOP_SL
# CHECK: # fixup K - offset: 0, value: 0, kind: fixup_LARCH_SOP_SUB
# CHECK: # fixup L - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_10_12
la.tls.ie $a0, symbol

# CHECK: la.tls.gd $r4, symbol # encoding: [0x04,0x00,0x00,0x1c]
# CHECK: # fixup A - offset: 0, value: _GLOBAL_OFFSET_TABLE_+2048, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_GD
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup D - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup E - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_5_20
# CHECK: # la expanded slot # encoding: [0x84,0x00,0xc0,0x02]
# CHECK: # fixup A - offset: 0, value: _GLOBAL_OFFSET_TABLE_+4, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_GD
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup D - offset: 0, value: _GLOBAL_OFFSET_TABLE_+2052, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup E - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_GD
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup G - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup H - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup I - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup J - offset: 0, value: 0, kind: fixup_LARCH_SOP_SL
# CHECK: # fixup K - offset: 0, value: 0, kind: fixup_LARCH_SOP_SUB
# CHECK: # fixup L - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_10_12
la.tls.ld $a0, symbol

# CHECK: la.tls.gd $r4, symbol # encoding: [0x04,0x00,0x00,0x1c]
# CHECK: # fixup A - offset: 0, value: _GLOBAL_OFFSET_TABLE_+2048, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_GD
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup D - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup E - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_5_20
# CHECK: # la expanded slot # encoding: [0x84,0x00,0xc0,0x02]
# CHECK: # fixup A - offset: 0, value: _GLOBAL_OFFSET_TABLE_+4, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup B - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_GD
# CHECK: # fixup C - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup D - offset: 0, value: _GLOBAL_OFFSET_TABLE_+2052, kind: fixup_LARCH_SOP_PUSH_PCREL
# CHECK: # fixup E - offset: 0, value: symbol, kind: fixup_LARCH_SOP_PUSH_TLS_GD
# CHECK: # fixup F - offset: 0, value: 0, kind: fixup_LARCH_SOP_ADD
# CHECK: # fixup G - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup H - offset: 0, value: 0, kind: fixup_LARCH_SOP_SR
# CHECK: # fixup I - offset: 0, value: 12, kind: fixup_LARCH_SOP_PUSH_ABSOLUTE
# CHECK: # fixup J - offset: 0, value: 0, kind: fixup_LARCH_SOP_SL
# CHECK: # fixup K - offset: 0, value: 0, kind: fixup_LARCH_SOP_SUB
# CHECK: # fixup L - offset: 0, value: 0, kind: fixup_LARCH_SOP_POP_32_S_10_12
la.tls.gd $a0, symbol
