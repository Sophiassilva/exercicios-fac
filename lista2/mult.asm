multfac:
        move $s0, $a0 
        move $s1, $a1 

        add $s2. $zero, $zero 
        add $s3, $zero, $zero
        li $s4, 32
        move $lo, $s1
        move $hi, $zero

        bgez $s0, verificaMult
        nor $s0, $s0, $zero
        addi $s0, $s0, 1

verificaMult:
        bgez $s1, multiplica
        nor $s1, $s1, $zero
        addi $s1, $s1, 1

multiplica:
        beq $s3, 32, termina
        addi $s3, 1

        andi $t0, $lo, 1
        beq $t0, $zero, desloca
        add $hi, $hi, $s0
        j desloca

desloca: 
        andi $t1, $hi, 1 
        sll $hi, $hi, 1
        sll $lo, $lo, 1
        srl $t1, $t1, 31
        add $lo, $lo, $t1
        j multiplica

termina: 
        #verificar se um era negativo pra negar o resultado
        jr $ra
