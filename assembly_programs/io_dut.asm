.global _boot
.text

_boot:                    /* x0  = 0    0x000 */
    /* Test ADDI */
    addi x0, x0, 0
    li x8, 12
	sw x8, 0(x31)
    li x7, 0
    li x10, 0
    li x11, 6000000
    li x12, 6000000
    
    beq x0, x0, loopy
    
    loopy:
    	li x10, 0
    	li x7, 0
        sw x7, 0(x30)
        lw x8, 0(x29)
        
        beq x0, x0, wait1
        
        
   	wait1:
    	addi x10, x10, 1
        lw x8, 0(x29)
        beq x11, x10, second_loopy
        beq x0, x0, wait1
        
    second_loopy:
    	li x10, 0
        li x7,200000
        sw x7, 0(x30)
        lw x8, 0(x29)
        beq x0, x0, wait2
        
	wait2:
    	addi x10, x10, 1
        lw x8, 0(x29)
        beq x12, x10, loopy
        beq x0, x0, wait2
    	
    	
    
  
    
.data
variable:
	.word 0xdeadbeef