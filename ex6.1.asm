.data
    arr: .space 400               # Array of size 100
    max: .asciz "The maximum value of the sequence is:\n"
    min: .asciz "The minimum value of the sequence is:\n"
    newline: .asciz "\n"

.text
    li a7, 5                      
    ecall
    mv a1, a0                     

    la t0, arr                    
    li t1, 0                      
    beqz a1, end                  

inputLoop:
    beq t1, a1, start             
    li a7, 5                      
    ecall

    sw a0, 0(t0)                  
    c.addi t0, 4                  
    c.addi t1, 1                  
    j inputLoop                   

start:
    li s0, 4
    c.mul s0, s0, a1              
    c.sub t0, t0, s0              
    lw a2, 0(t0)                  
    lw a3, 0(t0)                  
    c.addi a1, -1                 
    li t1, 0                      

updateLoop:
    beq t1, a1, print             
    lw a4, 4(t0)                  
if:
    blt a4, a2, updateMin         
    bgt a4, a3, updateMax         
    c.addi t0, 4                  
    c.addi t1, 1                  
    j updateLoop                  

updateMin:
    mv a2, a4                     
    j if
updateMax:
    mv a3, a4                     
    j if

print:
    li a7, 4                      
    la a0, min
    ecall

    li a7, 1                      
    mv a0, a2
    ecall

    li a7, 4                      
    la a0, newline
    ecall

    li a7, 4                      
    la a0, max
    ecall

    li a7, 1                      
    mv a0, a3
    ecall

end:
    li a7, 10                     
    ecall
