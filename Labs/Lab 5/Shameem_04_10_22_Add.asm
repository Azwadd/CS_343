.data
rd: .word 0x00000000
rs: .word 0x7FFFFFFF
rt: .word 0x00000001

.text
lw $s0, rd
lw $s1, rs
lw $s2, rt

# rd = rs + rt
add $s0, $s1, $s2
sw $s0 rd