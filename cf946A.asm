
.text
	li	$t0,0	#i=0
	li	$v0,5
	syscall 
	move	$t1,$v0	#arasize
	li 	$t4,0	#sum1
	li	$t5,0	#sum2
loop:	beq	$t0,$t1,exit
	addi	$t0,$t0,1
	li	$v0,5
	syscall 
	move	$t3,$v0
	blez	$t3,less
	addu 	$t4,$t4,$t3
	b 	loop
less:	add 	$t5,$t5,$t3
	b	loop
exit:	sub 	$t6,$t4,$t5
	li	$v0,1
	move	$a0,$t6
	syscall 
	 