.data
c5: .double 5.0
c9: .double 9.0
c32: .double 32.0
c273: .double 273.15
.text

# ta com erros!!!! vou consertar

main:
    l.d $f2, c5
    l.d $f4, c9
    div.d $f8, $f2, $f4 # 5/9
    div.d $f6, $f4, $f2 # 9/5
    l.d $f2, c32
    l.d $f4, c273

    li $v0, 12
    syscall
    move $t0, $v0

    li $v0, 12
    syscall
    move $s0, $v0

    li $v0, 6
    syscall
    mov.d $f20, $f0

    li $t1, 'K'
    beq $t0, $t1, kelvinToOther
    li $t1, 'F'
    beq $t0, $t1, fahrenheitToOther

celsius:
    li $t0, 'K'
    beq $t0, $s0, celsiusToKelvin
    mul.d $f20, $f20, $f6
    add.d $f12, $f20, $f2
    j imprime

celsiusToKelvin:
    add.d $f12, $f20, $f4
    j imprime

fahrenheitToOther:
    sub.d $f20, $f20, $f2
    mul.d $f12, $f20, $f8
    li $t0, 'C'
    beq $t0, $s0, imprime # CELSIUS
    add.d $f12, $f12, $f4 # KELVIN
    j imprime

kelvinToOther:
    sub.d $f12, $f20, $f4
    li $t0, 'C'
    beq $t0, $s0, imprime # CELSIUS
    mul.d $f12, $f12, $f6
    add.d $f12, $f12, $f2

imprime:
    li $v0, 3
    syscall
    li $v0, 10
    syscall
