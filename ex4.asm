.data
	arr: .space 400 #Array of size 100
	max: .asciz "The maximum value of the sequence is:\n"
	min: .asciz "The minimum value of the sequence is:\n"
	newline: .asciz "\n"
.text
    li a7, 5              
    ecall
    add a1, zero, a0

    la t0, arr
    li t1, 0
    beqz a1, end
    
inputLoop:
    beq t1, a1, start
    li a7, 5
    ecall
    
    sw a0, 0(t0)             
	addi t0, t0, 4
	addi t1, t1, 1
	j inputLoop

start:
	li s0, 4
	mul s0, s0, a1
	sub t0, t0, s0
	lw a2, 0(t0) #Min
	lw a3, 0(t0) #Max
	addi a1, a1, -1
	li t1, 0
	
updateLoop:
	beq t1, a1, print
	lw a4, 4(t0) #Comparing dummy
	if:
	blt a4, a2, updateMin
	bgt a4, a3, updateMax
	addi t0, t0, 4
	addi t1, t1, 1
	j updateLoop
	
updateMin:
	add a2, a4, zero
	j if
updateMax:
	add a3, a4, zero
	j if

print:
	li a7, 4
	la a0, min
	ecall
	
	li a7, 1
	add a0, a2, zero
	ecall
	
	li a7, 4
	la a0, newline
	ecall
	
	li a7, 4
	la a0, max
	ecall
	
	li a7, 1
	add a0, a3, zero
	ecall
end:
	li a7, 10
	ecall
