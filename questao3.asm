.data

newline: .asciiz "\n "

tabuada_prompt: .asciiz "Tabuada de "

multiplicacao_prompt: .asciiz " X "

igual_prompt: .asciiz " = "



.text

.globl main



main:

    # Inicializa o contador para a tabuada (i)

    li $t0, 1           # $t0 = i

    

tabuada_loop:

    # Verifica se o contador i é maior que 10

    bgt $t0, 10, exit   # Se sim, saia do loop

    

    # Imprime a frase "Tabuada de "

    la $a0, tabuada_prompt

    li $v0, 4

    syscall

    

    # Imprime o número da tabuada (i)

    move $a0, $t0       # $a0 = i

    li $v0, 1

    syscall



    # Imprime o caractere de multiplicação 'x'

    la $a0, multiplicacao_prompt

    li $v0, 4

    syscall



    # Inicializa o contador para os múltiplos (j)

    li $t1, 1           # $t1 = j



multiplicacao_loop:

    # Imprime o número da tabuada (i)

    move $a0, $t0       # $a0 = i

    li $v0, 1

    syscall



    # Imprime o caractere de multiplicação 'x'

    la $a0, multiplicacao_prompt

    li $v0, 4

    syscall



    # Imprime o contador j

    move $a0, $t1       # $a0 = j

    li $v0, 1

    syscall



    # Imprime o caractere de igualdade '='

    la $a0, igual_prompt

    li $v0, 4

    syscall



    # Calcula e imprime o resultado da multiplicação (i * j)

    move $a0, $t0       # $a0 = i

    move $a1, $t1       # $a1 = j

    jal multiplicacao

    move $a0, $v0       # $a0 = resultado

    li $v0, 1

    syscall



    # Imprime uma nova linha

    la $a0, newline

    li $v0, 4

    syscall



    # Incrementa o contador j

    addi $t1, $t1, 1    # j++



    # Verifica se o contador j é maior que 10

    bgt $t1, 10, next_tabuada # Se sim, vá para a próxima tabuada



    # Loop para multiplicação

    j multiplicacao_loop



next_tabuada:

    # Imprime uma nova linha para separar as tabuadas

    la $a0, newline

    li $v0, 4

    syscall



    # Incrementa o contador i

    addi $t0, $t0, 1    # i++



    # Loop para próxima tabuada

    j tabuada_loop



exit:

    # Termina o programa

    li $v0, 10

    syscall



# Função para calcular a multiplicação (i * j)

multiplicacao:

    # Multiplica os valores de $a0 e $a1

    mul $v0, $a0, $a1

    jr $ra

