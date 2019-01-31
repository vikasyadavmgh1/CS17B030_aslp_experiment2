writing about instrution only first time they come

	addiu	$sp,$sp,-64	--$sp=$sp-64;
	sw	$31,60($sp)	--Memory[$sp+60]=$31;
	move	$fp,$sp		--$fp=$sp;
	lui	$28,%hi(__gnu_local_gp)	--$28=%hi(__gnu_local_gp)x2^16;
	lw	$2,0($2)	--$2=Memory[$2+0];
	li	$2,2			# 0x2	--$2=2;
	sll	$2,$2,2		--$2=$2<<2;
	slt	$2,$2,5		--if($2<5)$2=1;
else $2=0
	bne	$2,$0,$L3	--if($2!=$0) go to
PC+4+$L3
	beq	$4,$3,$L5	--if($4==$3) go to
PC+4+$L3



	.file	1 "lab2_2.c"
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
	.frame	$fp,64,$31		# vars= 32, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64
	sw	$31,60($sp)
	sw	$fp,56($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,52($fp)
	li	$2,2			# 0x2
	sw	$2,32($fp)
	li	$2,5			# 0x5
	sw	$2,36($fp)
	li	$2,6			# 0x6
	sw	$2,40($fp)
	li	$2,3			# 0x3
	sw	$2,44($fp)
	li	$2,4			# 0x4
	sw	$2,48($fp)
	sw	$0,28($fp)
	b	$L2
	nop

$L3:
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,56
	addu	$2,$3,$2
	lw	$2,-24($2)
	addiu	$3,$2,4
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$4,$fp,56
	addu	$2,$4,$2
	sw	$3,-24($2)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L2:
	lw	$2,28($fp)
	slt	$2,$2,5
	bne	$2,$0,$L3
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,52($fp)
	lw	$3,0($3)
	beq	$4,$3,$L5
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L5:
	move	$sp,$fp
	lw	$31,60($sp)
	lw	$fp,56($sp)
	addiu	$sp,$sp,64
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
