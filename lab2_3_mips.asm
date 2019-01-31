	.file	1 "lab2_3.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,152,$31		# vars= 120, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-152
	sw	$31,148($sp)
	sw	$fp,144($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,140($fp)
	sw	$0,36($fp)
	li	$2,2			# 0x2
	sw	$2,24($fp)
	b	$L2
	nop

$L7:
	sw	$0,32($fp)
	li	$2,2			# 0x2
	sw	$2,28($fp)
	b	$L3
	nop

$L5:
	lw	$3,24($fp)
	lw	$2,28($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L4
	nop

	lw	$3,24($fp)
	lw	$2,28($fp)
	beq	$3,$2,$L4
	nop

	li	$2,1			# 0x1
	sw	$2,32($fp)
$L4:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L3:
	lw	$3,28($fp)
	lw	$2,24($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L5
	nop

	lw	$2,32($fp)
	bne	$2,$0,$L6
	nop

	lw	$2,36($fp)
	sll	$2,$2,2
	addiu	$3,$fp,144
	addu	$2,$3,$2
	lw	$3,24($fp)
	sw	$3,-104($2)
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
$L6:
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L2:
	lw	$2,24($fp)
	slt	$2,$2,100
	bne	$2,$0,$L7
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,140($fp)
	lw	$3,0($3)
	beq	$4,$3,$L9
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L9:
	move	$sp,$fp
	lw	$31,148($sp)
	lw	$fp,144($sp)
	addiu	$sp,$sp,152
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
