.text
	li s1, 10
	li a7, 5
	ecall
	
	loop:
	beq a0, zero, exit
	rem a1, a0, s1 
	add s0, s0, a1 
	sub a0, a0, a1
	div a0, a0, s1
	j loop
	
	exit:
	add a0, zero, s0
	li a7, 1
	ecall
	li a7, 10
	ecall 