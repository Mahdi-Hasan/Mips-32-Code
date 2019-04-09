	
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
	li	$t9,0
	li	$t8,0
	li	$t4,2		
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
	div	$t3,$t4
	mfhi	$t5
	beqz 	$t5,eveninc
	b 	initlp
eveninc:addi	$t8,$t8,1	#even++
	b 	initlp
	
arrpr:	li	$v0,1
	move	$a0,$t8
	syscall
	li	$v0,10
	syscall 	 

