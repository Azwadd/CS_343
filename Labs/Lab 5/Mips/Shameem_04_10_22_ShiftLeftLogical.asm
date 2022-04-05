.data
rt: .word 0x00000002
rd: .word 0x00000000

.text
lw $s0, rt
lw $s1, rd

# rd = rt << shamt
sll $s1, $s0, 1
sw $s1, rd
