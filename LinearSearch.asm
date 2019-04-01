.globl main
.data 
array:	.word 16,13,14,15,16,1,3,13,13,16,16,16
size:	.word 12
found:	.asciiz	"found"
notFound:.asciiz "notFound"
.text 
main:	la	$s0,array
	lw	$t1,size
	li	$t2,17
	li	$t3,0
	li	$t4,0
itnitlp:beq	$t3,$t1,initdn
	lw	$t0,($s0)
	bne	$t2,$t0 ,inc	
	addi 	$t4,$t4,1	#ap++
inc:	addi	$t3,$t3,1	#i++
	addi	$s0,$s0,4	#arr[i++]
	b	itnitlp
initdn:
	beqz 	$t4,NotFound		
	li	$v0,4
	la	$a0,found
	syscall
	li	$v0,10
	syscall 
NotFound:li	$v0,4
	la	$a0,notFound
	syscall 
	li	$v0,10
	syscall 	