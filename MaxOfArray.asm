.globl main
.data
arrasz:		.word	5
arra:		.word 	25,60,70,8,34
newline:	.asciiz "\n"
.text 
main:	la	$s0,arra
	lw	$t3,arrasz
	li	$t0,0
	#li 	$t5,0
initlp:	beq	$t1,$t3,initdn
	lw	$t4,($s0)	
	addi 	$s0,$s0,4
	addi	$t1,$t1,1
	addu	$t5,$t4,$t5
	
	li 	$v0,1
	move	$a0,$t5
	syscall
	
	li 	$v0,4
	la	$a0,newline
	syscall 
	
	b 	initlp
initdn:	li 	$v0,10
	syscall
