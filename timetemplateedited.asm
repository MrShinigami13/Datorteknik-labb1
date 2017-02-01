  # timetemplate.asm
  # Written 2015 by F Lundevall
  # Copyright abandonded - this file is in the public domain.

.macro	PUSH (%reg)
	addi	$sp,$sp,-4
	sw	%reg,0($sp)
.end_macro

.macro	POP (%reg)
	lw	%reg,0($sp)
	addi	$sp,$sp,4
.end_macro

	.data
	.align 2
mytime:	.word 0x5957
timstr:	.ascii "text more text lots of text\0"
	.text
main:
	# print timstr
	la	$a0,timstr
	li	$v0,4
	syscall
	nop
	# wait a little
<<<<<<< HEAD
	li	$a0,2
=======
	li	$a0,1000
>>>>>>> origin/master
	jal	delay
	nop
	# call tick
	la	$a0,mytime
	jal	tick
	nop
	# call your function time2string
	la	$a0,timstr
	la	$t0,mytime
	lw	$a1,0($t0)
	jal	time2string
	nop
	# print a newline
	li	$a0,10
	li	$v0,11
	syscall
	nop
	# go back and do it all again
	j	main
	nop
# tick: update time pointed to by $a0
tick:	lw	$t0,0($a0)	# get time
	addiu	$t0,$t0,1	# increase
	andi	$t1,$t0,0xf	# check lowest digit
	sltiu	$t2,$t1,0xa	# if digit < a, okay
	bnez	$t2,tiend
	nop
	addiu	$t0,$t0,0x6	# adjust lowest digit
	andi	$t1,$t0,0xf0	# check next digit
	sltiu	$t2,$t1,0x60	# if digit < 6, okay
	bnez	$t2,tiend
	nop
	addiu	$t0,$t0,0xa0	# adjust digit
	andi	$t1,$t0,0xf00	# check minute digit
	sltiu	$t2,$t1,0xa00	# if digit < a, okay
	bnez	$t2,tiend
	nop
	addiu	$t0,$t0,0x600	# adjust digit
	andi	$t1,$t0,0xf000	# check last digit
	sltiu	$t2,$t1,0x6000	# if digit < 6, okay
	bnez	$t2,tiend
	nop
	addiu	$t0,$t0,0xa000	# adjust last digit
tiend:	sw	$t0,0($a0)	# save updated result
	jr	$ra		# return
	nop

  # you can write your code for subroutine "hexasc" below this line
  #
hexasc:
	andi    $a1,$a1,0xf	#maska bort allt utom 4 minst signifikanta bitarna
	move	$v0,$a1		# flytta till v0
<<<<<<< HEAD
	li	$t0,1		# värde till loopvilkor
	slti	$t1,$v0,10	#till loop
	bne	$t1,$t0,letter 	# om not equal så är det en bokstav
=======
	li	$t0,1		# vï¿½rde till loopvilkor
	slti	$t1,$v0,10	#till loop
	bne	$t1,$t0,letter
	nop 	# om not equal sï¿½ ï¿½r det en bokstav
>>>>>>> origin/master
	addi	$v0,$v0,0x30	# till ASCII
	jr	$ra
	nop
	
	
	
<<<<<<< HEAD
letter:				#hör till hexasc:
	addi	$v0,$v0,0x37	#för att få ASCII sstora bokstäver
=======
letter:				#hï¿½r till hexasc:
	addi	$v0,$v0,0x37	#fï¿½r att fï¿½ ASCII sstora bokstï¿½ver
>>>>>>> origin/master
	jr	$ra		#hoppa tillbacka till return
	nop			#just on case
	
#delayfunktion
delay:
<<<<<<< HEAD
	jr $ra
	nop

=======
	add	$t0,$0,$0
	addi	$t1,$a0,0
	addi	$t2,$0,1000
	
while:
	ble	$t1,$t0,slut
	nop
	addi	$t1,$t1,-1
	for:
		beq	$t1,$t2,while
		nop
		addi	$t2,$t2,-1
		j	for
		nop
		

slut:

	jr	$ra
	nop
#slut delay
>>>>>>> origin/master
time2string:
	PUSH $ra
	PUSH $s0
	PUSH $s1
	add $t0,$a1,0
	addi $s0,$0,0x3a
	addi $s1,$0,0x00
	PUSH $a0
	PUSH $a1
	PUSH $t0
	jal hexasc
	nop
	POP $t0
	POP $a1
	POP $a0
	sb $v0,0x04($a0)
	srl $a1,$a1,4
	PUSH $a0
	PUSH $a1
	PUSH $t0
	jal hexasc
	nop
	POP $t0
	POP $a1
	POP $a0
	sb $v0,0x03($a0)
	sb $s0,0x02($a0)
	srl $a1,$a1,4
	PUSH $a0
	PUSH $a1
	PUSH $t0
	jal hexasc
	nop
	POP $t0
	POP $a1
	POP $a0
	sb $v0,0x01($a0)
	srl $a1,$a1,4
	PUSH $a0
	PUSH $a1
	PUSH $t0
	jal hexasc
	nop
	POP $t0
	POP $a1
	POP $a0
	sb $v0,0x00($a0)
	sb $s1,0x05($a0)
	POP $s1
	POP $s0
	POP $ra
	jr $ra
<<<<<<< HEAD
	
=======
	nop
	
>>>>>>> origin/master
