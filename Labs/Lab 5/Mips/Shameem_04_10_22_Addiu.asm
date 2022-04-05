.data
rs: .word 0x00000003
rd: .word 0x00000000

.text
lw $s0, rs
lw $s2, rd

# rd = rt + signExtImm
addiu $s2, $s0, 0x00000001
sw $s2, rd
