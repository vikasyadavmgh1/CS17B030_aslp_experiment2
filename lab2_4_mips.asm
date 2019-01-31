	.file	1 "lab2_4.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	IsEven
	.set	nomips16
	.set	nomicromips
	.ent	IsEven
	.type	IsEven, @function
IsEven:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lw	$2,8($fp)
	andi	$2,$2,0x1
	bne	$2,$0,$L2
	nop

	li	$2,1			# 0x1
	b	$L3
	nop

$L2:
	move	$2,$0
$L3:
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	IsEven
	.size	IsEven, .-IsEven
	.align	2
	.globl	isPrime
	.set	nomips16
	.set	nomicromips
	.ent	isPrime
	.type	isPrime, @function
isPrime:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	sw	$0,4($fp)
	li	$2,2			# 0x2
	sw	$2,0($fp)
	b	$L5
	nop

$L7:
	lw	$3,16($fp)
	lw	$2,0($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L6
	nop

	lw	$3,16($fp)
	lw	$2,0($fp)
	beq	$3,$2,$L6
	nop

	li	$2,1			# 0x1
	sw	$2,4($fp)
$L6:
	lw	$2,0($fp)
	addiu	$2,$2,1
	sw	$2,0($fp)
$L5:
	lw	$3,0($fp)
	lw	$2,16($fp)
	slt	$2,$2,$3
	beq	$2,$0,$L7
	nop

	lw	$3,4($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L8
	nop

	move	$2,$0
	b	$L9
	nop

$L8:
	li	$2,1			# 0x1
$L9:
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	isPrime
	.size	isPrime, .-isPrime
	.align	2
	.globl	op
	.set	nomips16
	.set	nomicromips
	.ent	op
	.type	op, @function
op:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	lw	$4,40($fp)
	.option	pic0
	jal	IsEven
	nop

	.option	pic2
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L11
	nop

	li	$2,1			# 0x1
	sw	$2,28($fp)
	b	$L12
	nop

$L11:
	li	$2,2			# 0x2
	sw	$2,28($fp)
$L12:
	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	op
	.size	op, .-op
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,56,$31		# vars= 24, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	li	$2,343			# 0x157
	sw	$2,36($fp)
	lw	$4,36($fp)
	.option	pic0
	jal	op
	nop

	.option	pic2
	sw	$2,40($fp)
	lw	$2,40($fp)
	li	$3,1			# 0x1
	beq	$2,$3,$L16
	nop

	li	$3,2			# 0x2
	beq	$2,$3,$L17
	nop

	b	$L15
	nop

$L16:
	lw	$3,36($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L18
	nop

	li	$2,2			# 0x2
	sw	$2,44($fp)
	b	$L15
	nop

$L18:
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,44($fp)
	b	$L15
	nop

$L17:
	lw	$4,36($fp)
	.option	pic0
	jal	isPrime
	nop

	.option	pic2
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L20
	nop

	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,44($fp)
	b	$L28
	nop

$L20:
	lw	$2,36($fp)
	addiu	$2,$2,-1
	sw	$2,28($fp)
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
	b	$L22
	nop

$L23:
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L22:
	lw	$4,32($fp)
	.option	pic0
	jal	isPrime
	nop

	.option	pic2
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L23
	nop

	b	$L24
	nop

$L25:
	lw	$2,28($fp)
	addiu	$2,$2,-1
	sw	$2,28($fp)
$L24:
	lw	$4,28($fp)
	.option	pic0
	jal	isPrime
	nop

	.option	pic2
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L25
	nop

	lw	$3,32($fp)
	lw	$2,36($fp)
	subu	$3,$3,$2
	lw	$4,28($fp)
	lw	$2,36($fp)
	subu	$2,$4,$2
	slt	$2,$3,$2
	bne	$2,$0,$L26
	nop

	lw	$2,32($fp)
	sw	$2,44($fp)
	b	$L28
	nop

$L26:
	lw	$2,28($fp)
	sw	$2,44($fp)
$L28:
	nop
$L15:
	move	$2,$0
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
