<<<<<<< HEAD
#en delay funktion
.text

main:
	li $a0,100	#hur l�nge ska delay vara
	li $a1,4711 	#konstant till loop f�r att st�lla in exakt 1ms i delay
	#move $a0,$s0
	#move $a1,$s1   funkar nu men kan va bra att byra ut $a0+1
	
while:			#start loop
	beq $a0,0,end
	sub $a0,$a0,-1 	#villkor f�r loop
for:	
	beq $a1,0,fordone
	sub $a1,$a1,-1				
	j for
	nop
fordone:							
	j while		#f�r att loopa while
	nop						
end:									
											
			
=======
delay:
	add	$t0,$0,$0
	add	$t1,$a0,0
	add	$t2,$0,4711
	
while:
	beq	$t1,$t0,slut
	addi	$a0,$a0,-1
	for:
		beq	$t1,$t2,while
		add	$t2,$t2,-1
		j	for
		nop
		
	j	while
	nop
slut:

	jr	$ra
	nop
	
	
	
		
	
>>>>>>> origin/master
