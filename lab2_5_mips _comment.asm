	.file	1 "lab2_5.c"
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
	.frame	$fp,80,$31		# vars= 48, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-80			-- $sp=$sp+ (-80);
	sw	$31,76($sp)			--Memory[$sp+76]=$31;
	sw	$fp,72($sp)			--Memory[$sp+72]=$fp;
	move	$fp,$sp				--$fp=$sp;
	lui	$28,%hi(__gnu_local_gp)		--$28=%hi(__gnu_local_gp)*2^16;
	addiu	$28,$28,%lo(__gnu_local_gp)	--$28=$28-%lo(__gnu_local_gp);
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28) --$1=Memory[$2+%got(__stack_chk_guard)($28)] Copy from memory to register
	lw	$2,0($2)			--$2=Memory[$2+0] Copy from memory to register
	sw	$2,68($fp)		--Memory[$fp+68]=$2 Copy from register to memory
	li	$2,45			# 0x2d	--$2=45;
	sw	$2,36($fp)		--Memory[$fp+36]=$2;
	li	$2,20			# 0x14	--$2=20;
	sw	$2,40($fp)		--Memory[$fp+40]=$2;
	li	$2,4			# 0x4	--$2=4;	
	sw	$2,44($fp)		--Memory[$fp+44]=$2;
	li	$2,554			# 0x22a	--$2=554;
	sw	$2,48($fp)		--Memory[$fp+48]=$2;
	li	$2,1			# 0x1	--$2=1;
	sw	$2,52($fp)		--Memory[$fp+52]=$2;
	li	$2,71			# 0x47	--$2=71;
	sw	$2,56($fp)		--Memory[$fp+56]=$2;
	li	$2,63			# 0x3f	--$2=63;
	sw	$2,60($fp)		--Memory[$fp+60]=$2;
	li	$2,14			# 0xe	--$2=14;
	sw	$2,64($fp)		--Memory[$fp+64]=$2;
	sw	$0,28($fp)		--Memory[$fp+28]=$0;
	b	$L2
	nop

$L5:
	sw	$0,32($fp)		--Memory[$fp+32]=$0;
	b	$L3
	nop

$L4:
	lw	$2,28($fp)	--$2=Memory[$fp+28];
	sll	$3,$2,1		--$3=$2<<1;
	lw	$2,32($fp)	--$2=Memory[$fp+32];
	addu	$2,$3,$2	--$2=$3+$2;
	sll	$2,$2,2		--$2=$2<<2;
	addiu	$3,$fp,72	--$3=$fp+72;
	addu	$2,$3,$2	--$2=$3+$2;
	lw	$3,-36($2)	--$3=Memory[$fp+ -36];
	lw	$2,28($fp)	--$2=Memory[$fp+28];
	sll	$4,$2,1		--$4=$2<<1;
	lw	$2,32($fp)	--$2=Memory[$fp+32];
	addu	$2,$4,$2	--$2=$4+$2;
	sll	$2,$2,2		--$2=$2<<2;
	addiu	$4,$fp,72	--$4=$fp+72;
	addu	$2,$4,$2	--$2=$4+$2;
	lw	$2,-20($2)	--$2=Memory[$2-20];
	addu	$3,$3,$2	--$3=$3+$2;
	lw	$2,28($fp)	--$2=Memory[$fp+28];
	sll	$4,$2,1		--$4=$2<<1;
	lw	$2,32($fp)	--$2=Memory[$fp+32];
	addu	$2,$4,$2	--$2=$4+$2;
	sll	$2,$2,2		--$2=$2<<2;
	addiu	$4,$fp,72	--$4=$fp+72;
	addu	$2,$4,$2	--$2=$4+$2;
	sw	$3,-36($2)	--Memory[$2-36]=$3;
	lw	$2,32($fp)	--$2=Memory[$fp+32];
	addiu	$2,$2,1		--$2=$2+1;
	sw	$2,32($fp)	--Memory[$fp+32]=$2;
$L3:
	lw	$2,32($fp)	--$2=Memory[$fp+32];
	slt	$2,$2,2		--if($2<2)$2=1;
				else $2=0
	bne	$2,$0,$L4	--if($0!=$2) go to
PC+4+$L4
	nop

	lw	$2,28($fp)	--$2=Memory[$fp+28];
	addiu	$2,$2,1		--$2=$2+1;
	sw	$2,28($fp)	--Memory[$fp+28]=$2;
$L2:
	lw	$2,28($fp)	--$2=Memory[$fp+28];
	slt	$2,$2,2		--if($2<2)$2=1;
				else $2=0;
	bne	$2,$0,$L5	--if($2!=$0) go to
PC+4+$L5
	nop

	move	$2,$0		--$2=$0;
	lw	$3,%got(__stack_chk_guard)($28)	--$3=Memory[$28+%got(__stack_chk_guard)];
	lw	$4,68($fp)	--$4=Memory[$fp+68];
	lw	$3,0($3)	--$3=Memory[$3+0];
	beq	$4,$3,$L7	--if($4!=$3) go to
PC+4+$L7;
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L7:
	move	$sp,$fp		--$sp=$fp;
	lw	$31,76($sp)	--$31=Memory[$fp+76];
	lw	$fp,72($sp)	--$fp=Memory[$sp+72];
	addiu	$sp,$sp,80	--$sp=$sp+80;
	j	$31		--go to address 31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
