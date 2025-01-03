multfac:
        move $s0, $a0
        move $s1, $a1
        bgez $s0, verificaMult
        nor $s0, $s0, $zero
        addi $s0, $s0, 1

verificaMult:
        bgez $s1, multiplica
        nor $s1, $s1, $zero
        addi $s1, $s1, 1

multiplica:
        
