.data
list:   .space  1000
listsz: .word	250 
sp:	.asciiz  " "
.text
	la	$s0, list
	li	$t0,0	#i=0
	li	$v0,5	#input call
	syscall 
	move	$t1,$v0	#arasize
	li 	$t4,0	#sum1
	li	$t5,0	#sum2
loop:	beq	$t0,$t1,exit
	addi	$t0,$t0,1	#i++	
	li	$v0,5		#input call
	syscall 
	move	$t3,$v0		#input
	sw	$t3,($s0)	#save to array
	addi	$s0,$s0,4
	blez	$t3,less
	addu 	$t4,$t4,$t3
	b 	loop
less:	add 	$t5,$t5,$t3
	b	loop
exit:	sub 	$t6,$t4,$t5
	li	$v0,1
	move	$a0,$t6
	syscall
	li	$t7,0
arrpr:	beq 	$t7,$t1,arrprexit
	lw	$t0,($s0)
	li	$v0,1
	move	$a0,$t0
	syscall 
	li	$v0,4
	la	$a0,sp
	syscall 
	addi	$t7,$t7,1
	addi	$s0,$s0,4
	b	arrpr
arrprexit:li $v0,10
	syscall 
		 
