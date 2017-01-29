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
	
	
	
		
	