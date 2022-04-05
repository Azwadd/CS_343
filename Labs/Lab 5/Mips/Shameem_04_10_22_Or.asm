.data
rs: .word 0x00000003
rt: .word 0x00000002
rd: .word 0x00000000

.text
lw $s0, rs
lw $s1, rt
lw $s2, rd

# rd = (rs | rt)
or $s2, $s0, $s1
sw $s2 rd
