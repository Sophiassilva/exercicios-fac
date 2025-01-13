.data
msg: .asciiz"\n"
.text

main: 
    li $a0, -7
    li $a1, -3
    jal divfac

imprime: 
        li $v0, 1
        move $a0, $s0
        syscall 

        li $v0, 1
        move $a0, $s1
        syscall 

        li $v0, 1
        move $a0, $s2
        syscall 
        
        li $v0, 4
        la $a0, msg
        syscall

        li $v0, 1
        move $a0, $s3
        syscall 

        li $v0, 10 
        syscall
divfac:
    move $s0, $a0
    move $s1, $a1
    move $s2, $zero
    move $s4, $zero
    li $s5, 32
    move $s6, $zero
    move $s7, $zero

    bgez $s0, verificaDivisor
    nor $s0, $s0, $zero
    addi $s0, $s0, 1
    addi $s6, $s6, 1

verificaDivisor:
    bgez $s1, inicio
    nor $s1, $s1, $zero
    addi $s1, $s1, 1
    addi $s7, $s7, 1

inicio:
    move $s3, $s0
    li $t0, 1
    sll $t0, $t0, 31
    and $t0, $t0, $s3
    srl $t0, $t0, 31

    add $s2, $s2, $t0
    sll $s3, $s3, 1
    sll $s2, $s2, 1

subtrair:
    beq $s4, $s5, passo6
    addi $s4, $s4, 1

    subu $s2, $s2, $s1
    bltz $s2, casoB

casoA:
    li $t0, 1
    sll $t0, $t0, 31
    and $t0, $t0, $s3
    srl $t0, $t0, 31

    sll $s2, $s2, 1
    addu $s2, $s2, $t0
    sll $s3, $s3, 1
    addi $s3, $s3, 1
    bne $s3, $zero, subtrair
    addi $s2, $s2, 1
    j subtrair

casoB:
    addu $s2, $s2, $s1
    li $t0, 1
    sll $t0, $t0, 31
    and $t0, $t0, $s3
    srl $t0, $t0, 31

    sll $s2, $s2, 1
    addu $s2, $s2, $t0
    sll $s3, $s3, 1
    j subtrair
    
passo6:
    srl $s2, $s2, 1
    li $t0, 1
    bne $s6, $t0, verQuociente
    nor $s2, $s2, $zero
    addi $s2, $s2, 1

verQuociente:
    beq $s7, $s6, terminar
    nor $s3, $s3, $zero
    addi $s3, $s3, 1

terminar:          
    mthi $s2
    mtlo $s3
    jr $ra 
