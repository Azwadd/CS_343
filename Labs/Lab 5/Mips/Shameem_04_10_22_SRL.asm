.data
rt: .word 0x00000002
rd: .word 0x00000000

.text
lw $s1, rt
lw $s2, rd

# rd = rt << shamt
srl $s2, $s1, 1
sw $s2, rd
