  # hexmain.asm
  # Written 2015-09-04 by F Lundevall
  # Copyright abandonded - this file is in the public domain.

	.text
main:
	li	$a0,0		# change this to test different values

	jal	hexasc		# call hexasc
	nop			# delay slot filler (just in case)	
return:
	move	$a0,$v0		# copy return value to argument register

	li	$v0,11		# syscall with v0 = 11 will print out
	syscall			# one byte from a0 to the Run I/O window
	
stop:	j	stop		# stop after one run
	nop			# delay slot filler (just in case)

  # You can write your own code for hexasc here
  #
hexasc:
	move	$v0,$a0		# flytta till v0
	li	$t0,1		# värde till loopvilkor
	slti	$t1,$v0,10	#till loop
	bne	$t1,$t0,letter 	# om not equal så är det en bokstav
	addi	$v0,$v0,0x30	# till ASCII
	j return
	nop
	
	
	
letter:
	addi	$v0,$v0,0x37	#för att få ASCII sstora bokstäver
	j return		#hoppa tillbacka till return
	nop			#just on case
