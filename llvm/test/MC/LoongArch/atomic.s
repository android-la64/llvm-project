# RUN: llvm-mc %s --triple=loongarch64 --show-encoding | \
# RUN:   FileCheck --check-prefixes=ASM,ASM-AND-OBJ %s
# RUN: llvm-mc %s --triple=loongarch64 --filetype=obj | llvm-objdump -d - | \
# RUN:   FileCheck --check-prefixes=ASM-AND-OBJ %s

# ASM-AND-OBJ: amadd_db.d $r5, $r17, $r29, 0
# ASM: encoding: [0xa5,0xc7,0x6a,0x38]
amadd_db.d $a1, $t5, $s6, 0

# ASM-AND-OBJ: amadd_db.d $r5, $r17, $r29, 0
# ASM: encoding: [0xa5,0xc7,0x6a,0x38]
amadd_db.d $a1, $t5, $s6
