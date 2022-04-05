.data
rt: .word 0x00000003
rd: .word 0x00000000

.text
lw $s1, rs
lw $s2, rd



sw $s2, rt

