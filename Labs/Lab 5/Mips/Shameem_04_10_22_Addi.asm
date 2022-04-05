.data
rs: .word 0x00000003
rt: .word 0x00000002

.text
lw $s0, rs
lw $s2, rt

# rd = rt + signExtImm
addi $s2, $s0, 15873
sw $s2, rt
