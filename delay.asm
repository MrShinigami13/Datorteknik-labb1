#en delay funktion
.text

main:
	li $a0,100	#hur länge ska delay vara
	li $a1,4711 	#konstant till loop för att ställa in exakt 1ms i delay
	#move $a0,$s0
	#move $a1,$s1   funkar nu men kan va bra att byra ut $a0+1
	
while:			#start loop
	beq $a0,0,end
	sub $a0,$a0,-1 	#villkor för loop
for:	
	beq $a1,0,fordone
	sub $a1,$a1,-1				
	j for
	nop
fordone:							
	j while		#för att loopa while
	nop						
end:									
											
			