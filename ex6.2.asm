.data
	newline: .asciz "\n"

.text
mainLoop:
	li a7, 5            
	ecall
	mv a1, a0           
	ecall
	jal AVG            
	li a7, 2            
	ecall
	mv t1, a0           
	li a7, 4            
	la a0, newline
	ecall
	or a1, a1, t1       
	beqz a1, exit       
	j mainLoop          

AVG:
	addi sp, sp, -12    
	sw ra, 8(sp)        
	sw a1, 4(sp)        
	sw a0, 0(sp)        
	li t0, 2            
	add a0, a0, a1      
	fcvt.s.w ft0, t0    
	fcvt.s.w fa0, a0    
	fdiv.s fa0, fa0, ft0 
	lw a0, 0(sp)        
	lw a1, 4(sp)        
	lw ra, 8(sp)        
	addi sp, sp, 12     
	jr ra               

exit:
	li a7, 10           
	ecall
