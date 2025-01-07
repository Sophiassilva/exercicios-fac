.data

.text

main: 
        li $a0, -2
        li $a1, -4
        jal multfac

imprime: 
        li $v0, 1
        move $a0, $s0
        syscall 

        li $v0, 1
        move $a0, $s1
        syscall 

        li $v0, 1
        move $a0, $s4
        syscall 

        li $v0, 1
        move $a0, $s5
        syscall 

        li $v0, 10 # encerra programa
        syscall

multfac:
        move $s0, $a0 # M
        move $s1, $a1 # Q
        move $s2, $zero # contador
        li $s3, 32 # iteracoes
        
        # $s4 = P[7-4] & $s5 = P[3-0] & temNegativo = 0
        move $s4, $zero # HI ->
        move $s5, $s1 # LO -> P[3-0] = Q
        move $s6, $zero


        bgez $s0, verificaMult
        nor $s0, $s0, $zero
        addi $s0, $s0, 1
        addi $s6, $s6, 1

verificaMult:
        bgez $s1, multiplica
        nor $s1, $s1, $zero
        addi $s1, $s1, 1
        addi $s6, $s6, 1

multiplica:
        beq $s2, $s3, verificar
        addi $s2, 1
        # ATÉ AQUI TUDO CERTO

        andi $t0, $s5, 1 # verifica P[0]
        beq $t0, $zero, deslocar
        add $s5, $s5, $s0 # SE NÃO, P[7-4] += M
        j deslocar

deslocar: 
# deslocar LO 
        srl $s5, $s5, 1
# acha bit menos significativo de HI e coloca em LO
        andi $t0, $s4, 1
        sll $t0, $t0, 31
        add $s4, $s4, $t0
# deslocar HI
        srl $s4, $s4, 1
        j multiplica

verificar:
        beq $zero, $s6, retornar
        nor $s4, $s4, $zero
        nor $s5, $s5, $zero

retornar:   
        mthi $s4
        mtlo $s5
        jr $ra 
