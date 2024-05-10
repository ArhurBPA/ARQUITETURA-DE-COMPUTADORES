.data

valor1: .word 0

valor2: .word 0

msg1:   .asciiz "Digite o primeiro valor:\n"

msg2:   .asciiz "Digite o segundo valor:\n"

msg3:   .asciiz "Valores do primeiro até o segundo:\n"

msg4:   .asciiz "Valores do segundo até o primeiro em ordem decrescente:\n"

msg5:   .asciiz "Os valores são iguais: "

space:  .asciiz " "

newline:.asciiz "\n"



.text

.globl main

    

main:

    # Leitura do primeiro valor

    li $v0, 4

    la $a0, msg1

    syscall

    

    li $v0, 5

    syscall

    sw $v0, valor1

    

    # Leitura do segundo valor

    li $v0, 4

    la $a0, msg2

    syscall

    

    li $v0, 5

    syscall

    sw $v0, valor2

    

    # Comparação dos valores

    lw $t0, valor1

    lw $t1, valor2

    

    ble $t0, $t1, menor_igual

    bgt $t0, $t1, maior

    li $v0, 4

    la $a0, msg5

    syscall

    lw $a0, valor1

    li $v0, 1

    syscall

    li $v0, 4

    la $a0, newline

    syscall

    j fim

    

menor_igual:

    li $v0, 4

    la $a0, msg3

    syscall

    

    lw $t2, valor1

imprimir_valores_menor_igual:

    li $v0, 1

    move $a0, $t2

    syscall

    li $v0, 4

    la $a0, space

    syscall

    addi $t2, $t2, 1

    ble $t2, $t1, imprimir_valores_menor_igual

    

    li $v0, 4

    la $a0, newline

    syscall

    j fim



maior:

    li $v0, 4

    la $a0, msg4

    syscall

    

    lw $t2, valor1

imprimir_valores_maior:

    li $v0, 1

    move $a0, $t2

    syscall

    li $v0, 4

    la $a0, space

    syscall

    subi $t2, $t2, 1

    bge $t2, $t1, imprimir_valores_maior

    

    li $v0, 4

    la $a0, newline

    syscall



fim:

    li $v0, 10

    syscall

