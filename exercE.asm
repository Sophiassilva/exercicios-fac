# le n numeros e imprimir maior
.data

.text

main: 
    li $v0, 5
    syscall
    move $s0, $v0
    li $s1, 1
    li $v0, 5
    syscall
    move $s2, $v0

loop:
    beq $s1, $s0, termina
    addi $s1, $s1, 1 
    li $v0, 5
    syscall
    move $a0, $v0
    move $a1, $s2
    slt $t0, $s2, $v0 
    beq $t0, $zero, loop
    jal troca
    j loop


termina:
    li $v0, 1
    move $a0, $s2
    syscall
    li $v0, 10
    syscall

troca: 
    move $s2, $a0
    jr $ra