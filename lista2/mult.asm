# .data

# .text

# main: 
#         li $a0, 170000000
#         li $a1, 1000
#         jal multfac

# imprime: 
#         li $v0, 1
#         move $a0, $s0
#         syscall 

#         li $v0, 1
#         move $a0, $s1
#         syscall 

#         li $v0, 1
#         move $a0, $s4
#         syscall 

#         li $v0, 1
#         move $a0, $s5
#         syscall 

#         li $v0, 10 
#         syscall

multfac:
        move $s0, $a0 
        move $s1, $a1 
        move $s2, $zero 
        li $s3, 32 

        move $s4, $zero 
        move $s5, $s1 
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
        addi $s2, $s2, 1
        # li $v0, 1
        # move $a0, $s2
        # syscall 

        andi $t0, $s5, 1 
        beq $t0, $zero, deslocar
        add $s4, $s4, $s0 

deslocar: 
        srl $s5, $s5, 1

        andi $t1, $s4, 1
        sll $t1, $t1, 31
        or $s5, $s5, $t1

        srl $s4, $s4, 1
        # li $v0, 1
        # move $a0, $s4
        # syscall 
        # li $v0, 1
        # move $a0, $s5
        # syscall 

        j multiplica

verificar:

        beq $s6, $zero, retornar
        nor $s4, $s4, $zero
        addi $s5, $s5, 1
        nor $s5, $s5, $zero
        addi $s4, $s4, 1

retornar:   
        # li $v0, 1
        # move $a0, $s4
        # syscall 
        # li $v0, 1
        # move $a0, $s5
        # syscall 
        
        mthi $s4
        mtlo $s5
        jr $ra 
