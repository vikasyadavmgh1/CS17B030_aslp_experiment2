writing about instrution only first time they come
	addiu	$sp,$sp,-24	--$sp=$sp-24;
	sw	$fp,20($sp)	--Memory[$sp+20]=$fp;
	move	$fp,$sp		--$fp=$sp;
	li	$2,17			# 0x11	--$2=17;
	addu	$2,$3,$2	--$2=$3+$2;
	lw	$3,4($fp)	--$3=Memory[$fp+4];
	subu	$2,$3,$2	--$2=$3-$2;
	mul	$2,$3,$2	--$2=$3*$2;
	mfhi	$2		--$2=hi;
	mflo	$2		--$2=lo;
	or	$2,$3,$2	--$2=$3|$2;
	xor	$2,$3,$2	--$2=$3^$2;



	.file	1 "lab2_1.c"
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
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$fp,20($sp)
	move	$fp,$sp
	li	$2,17			# 0x11
	sw	$2,4($fp)
	li	$2,40			# 0x28
	sw	$2,8($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	addu	$2,$3,$2
	sw	$2,12($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	subu	$2,$3,$2
	sw	$2,12($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	mul	$2,$3,$2
	sw	$2,12($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	mflo	$2
	sw	$2,12($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	and	$2,$3,$2
	sw	$2,12($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	or	$2,$3,$2
	sw	$2,12($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	xor	$2,$3,$2
	sw	$2,12($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
