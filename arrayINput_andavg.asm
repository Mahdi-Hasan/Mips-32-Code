	
.data
list:   .space  1000 
newline:   .asciiz	"\n"
sp:	.asciiz 	" "
sum:	.asciiz 	"SUM "
avg:	.asciiz 	"Avg "
.text
main:
	la	$s1, list      # $s1 = array address
	li	$t0, 0		#i=0	
	li	$t5,0		#sum=0	
	li	$t9,0
	li	$t8,0		
	li	$v0,5		#input call for size
	syscall 
	move	$t2,$v0		 #size      
initlp: beq	$t0, $t2, arrpr
	li	$v0,5		#input call for elements
	syscall 
	move	$t3,$v0		# array elements
	sw	$t3, list($t9)     # list[i] = t3
	addi	$t0,$t0,1
	addi	$t9,$t9,4
	b 	initlp
arrpr:	beq 	$t7,$t2,arrprexit
	lw	$t0,list($t8)
	add 	$t5,$t5,$t0	#sum+=list[t8]
	li	$v0,1
	move	$a0,$t0
	syscall 
	li	$v0,4
	la	$a0,sp
	syscall 
	addi	$t7,$t7,1
	addi	$t8,$t8,4
	b	arrpr
arrprexit:	li	$v0,4
		la	$a0,sum
		syscall
		li	$v0,1
		move	$a0,$t5
		syscall
		li	$v0,4
		la	$a0,avg
		syscall
		div  	$t5,$t2	
		mflo	$t7	#quotient=avg
		mfhi 	$t0	#remainder		  
		li	$v0,1
		move	$a0,$t7
		syscall 
		li 	$v0,10
		syscall 
