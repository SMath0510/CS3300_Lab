		.text
		.globl  main
main:
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 44
		li $s0 24
		move $a0 $s0
		jal _halloc
		move $s0 $v0
		move $s0 $s0
		li $s1 12
		move $a0 $s1
		jal _halloc
		move $s1 $v0
		move $s1 $s1
		la $s2 BS_Div
		sw $s2, 8($s0)
		la $s2 BS_Print
		sw $s2, 16($s0)
		la $s2 BS_Init
		sw $s2, 20($s0)
		la $s2 BS_Start
		sw $s2, 0($s0)
		la $s2 BS_Search
		sw $s2, 4($s0)
		la $s2 BS_Compare
		sw $s2, 12($s0)
		li $s2 8
		move $s2 $s2
MAIN_L0:
		li $s3 11
		sle $s3, $s2, $s3
		beqz $s3 MAIN_L1
		add $s3, $s1, $s2
		li $s4 0
		sw $s4, 0($s3)
		li $s3 4
		add $s3, $s2, $s3
		move $s2 $s3
		b MAIN_L0
MAIN_L1:
		sw $s0, 0($s1)
		move $s0 $s1
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 0($s1)
		move $s1 $v0
		li $s2 20
		li $s3 0
		add $s2, $s2, $s3
		move $a0 $s0
		move $a1 $s2
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t3, 12($sp)
		sw $t4, 16($sp)
		sw $t5, 20($sp)
		sw $t6, 24($sp)
		sw $t7, 28($sp)
		sw $t8, 32($sp)
		sw $t9, 36($sp)
		jalr $s1
		lw $t9, 36($sp)
		lw $t8, 32($sp)
		lw $t7, 28($sp)
		lw $t6, 24($sp)
		lw $t5, 20($sp)
		lw $t4, 16($sp)
		lw $t3, 12($sp)
		lw $t2, 8($sp)
		lw $t1, 4($sp)
		lw $t0, 0($sp)
		move $s0 $v0
		move $a0 $s0
		jal _print
		addu $sp, $sp, 44
		lw $ra, -4($fp)
		j $ra
		.text
		.globl  BS_Start
BS_Start:
		sw $fp, -8($sp)
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 80
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		move $s2 $a0
		move $s1 $a1
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		move $s0 $s2
		lw $v0, 0($s0)
		move $s3 $v0
		lw $v0, 20($s3)
		move $s3 $v0
		move $a0 $s0
		move $a1 $s1
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s3
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s0 $v0
		move $v1 $s0
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 16($s1)
		move $s1 $v0
		move $a0 $s0
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s1
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s0 $v0
		move $v1 $s0
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 4($s1)
		move $s1 $v0
		li $s3 8
		move $a0 $s0
		move $a1 $s3
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s1
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s0 $v0
		beqz $s0 BS_Start_L2
		li $s0 1
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
		b BS_Start_L3
BS_Start_L2:
		li $s0 0
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
BS_Start_L3:
		nop
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 4($s1)
		move $s1 $v0
		li $s3 19
		move $a0 $s0
		move $a1 $s3
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s1
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s0 $v0
		beqz $s0 BS_Start_L4
		li $s0 1
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
		b BS_Start_L5
BS_Start_L4:
		li $s0 0
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
BS_Start_L5:
		nop
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 4($s1)
		move $s1 $v0
		li $s3 20
		move $a0 $s0
		move $a1 $s3
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s1
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s0 $v0
		beqz $s0 BS_Start_L6
		li $s0 1
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
		b BS_Start_L7
BS_Start_L6:
		li $s0 0
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
BS_Start_L7:
		nop
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 4($s1)
		move $s1 $v0
		li $s3 21
		move $a0 $s0
		move $a1 $s3
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s1
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s0 $v0
		beqz $s0 BS_Start_L8
		li $s0 1
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
		b BS_Start_L9
BS_Start_L8:
		li $s0 0
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
BS_Start_L9:
		nop
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 4($s1)
		move $s1 $v0
		li $s3 37
		move $a0 $s0
		move $a1 $s3
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s1
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s0 $v0
		beqz $s0 BS_Start_L10
		li $s0 1
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
		b BS_Start_L11
BS_Start_L10:
		li $s0 0
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
BS_Start_L11:
		nop
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 4($s1)
		move $s1 $v0
		li $s3 38
		move $a0 $s0
		move $a1 $s3
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s1
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s0 $v0
		beqz $s0 BS_Start_L12
		li $s0 1
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
		b BS_Start_L13
BS_Start_L12:
		li $s0 0
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
BS_Start_L13:
		nop
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 4($s1)
		move $s1 $v0
		li $s3 39
		move $a0 $s0
		move $a1 $s3
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s1
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s0 $v0
		beqz $s0 BS_Start_L14
		li $s0 1
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
		b BS_Start_L15
BS_Start_L14:
		li $s0 0
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
BS_Start_L15:
		nop
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 4($s1)
		move $s1 $v0
		li $s2 50
		move $a0 $s0
		move $a1 $s2
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s1
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s0 $v0
		beqz $s0 BS_Start_L16
		li $s0 1
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
		b BS_Start_L17
BS_Start_L16:
		li $s0 0
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
BS_Start_L17:
		nop
		li $s0 999
		move $v0 $s0
		lw $s7, 28($sp)
		lw $s6, 24($sp)
		lw $s5, 20($sp)
		lw $s4, 16($sp)
		lw $s3, 12($sp)
		lw $s2, 8($sp)
		lw $s1, 4($sp)
		lw $s0, 0($sp)
		addu $sp, $sp, 80
		lw $ra, -4($fp)
		lw $fp, -8($sp)
		j $ra
		.text
		.globl  BS_Search
BS_Search:
		sw $fp, -8($sp)
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 80
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		move $s1 $a0
		move $s2 $a1
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $s0 $s0
		li $s3 0
		move $v1 $s3
		lw $v0, 4($s1)
		move $s3 $v0
		lw $v0, 0($s3)
		move $s3 $v0
		li $s4 4
		div $s3, $s3, $s4
		move $s3 $s3
		li $s4 1
		sub $s4, $s3, $s4
		move $s3 $s4
		li $s4 0
		move $s4 $s4
		li $s5 1
		move $s5 $s5
BS_Search_L18:
		beqz $s5 BS_Search_L19
		add $s6, $s4, $s3
		move $s6 $s6
		move $s7 $s1
		lw $v0, 0($s7)
		move $t0 $v0
		lw $v0, 8($t0)
		move $t0 $v0
		move $a0 $s7
		move $a1 $s6
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $t0
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s7 $v0
		move $s6 $s7
		lw $v0, 4($s1)
		move $s7 $v0
		li $t0 4
		mul $t0, $s6, $t0
		lw $v0, 0($s7)
		move $t1 $v0
		li $t2 1
		li $t3 1
		sub $t1, $t1, $t3
		sle $t1, $s6, $t1
		sub $t1, $t2, $t1
		beqz $t1 BS_Search_L20
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BS_Search_L20:
		nop
		li $t1 4
		add $t0, $t0, $t1
		add $s7, $s7, $t0
		lw $v0, 0($s7)
		move $s7 $v0
		move $s0 $s7
		li $s7 1
		sub $s7, $s0, $s7
		sle $s7, $s2, $s7
		beqz $s7 BS_Search_L21
		li $s7 1
		sub $s7, $s6, $s7
		move $s3 $s7
		b BS_Search_L22
BS_Search_L21:
		li $s7 1
		add $s6, $s6, $s7
		move $s4 $s6
BS_Search_L22:
		nop
		move $s6 $s1
		lw $v0, 0($s6)
		move $s7 $v0
		lw $v0, 12($s7)
		move $s7 $v0
		move $a0 $s6
		move $a1 $s0
		move $a2 $s2
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s7
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s6 $v0
		beqz $s6 BS_Search_L23
		li $s6 0
		move $s5 $s6
		b BS_Search_L24
BS_Search_L23:
		li $s6 1
		move $s5 $s6
BS_Search_L24:
		nop
		li $s6 1
		sub $s6, $s4, $s6
		sle $s6, $s3, $s6
		beqz $s6 BS_Search_L25
		li $s6 0
		move $s5 $s6
		b BS_Search_L26
BS_Search_L25:
		li $s6 0
		move $v1 $s6
BS_Search_L26:
		nop
		b BS_Search_L18
BS_Search_L19:
		nop
		move $s1 $s1
		lw $v0, 0($s1)
		move $s3 $v0
		lw $v0, 12($s3)
		move $s3 $v0
		move $a0 $s1
		move $a1 $s0
		move $a2 $s2
		sw $t0, 32($sp)
		sw $t1, 36($sp)
		sw $t2, 40($sp)
		sw $t3, 44($sp)
		sw $t4, 48($sp)
		sw $t5, 52($sp)
		sw $t6, 56($sp)
		sw $t7, 60($sp)
		sw $t8, 64($sp)
		sw $t9, 68($sp)
		jalr $s3
		lw $t9, 68($sp)
		lw $t8, 64($sp)
		lw $t7, 60($sp)
		lw $t6, 56($sp)
		lw $t5, 52($sp)
		lw $t4, 48($sp)
		lw $t3, 44($sp)
		lw $t2, 40($sp)
		lw $t1, 36($sp)
		lw $t0, 32($sp)
		move $s0 $v0
		beqz $s0 BS_Search_L27
		li $s0 1
		move $s0 $s0
		b BS_Search_L28
BS_Search_L27:
		li $s1 0
		move $s0 $s1
BS_Search_L28:
		nop
		move $v0 $s0
		lw $s7, 28($sp)
		lw $s6, 24($sp)
		lw $s5, 20($sp)
		lw $s4, 16($sp)
		lw $s3, 12($sp)
		lw $s2, 8($sp)
		lw $s1, 4($sp)
		lw $s0, 0($sp)
		addu $sp, $sp, 80
		lw $ra, -4($fp)
		lw $fp, -8($sp)
		j $ra
		.text
		.globl  BS_Div
BS_Div:
		sw $fp, -8($sp)
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 40
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		move $v1 $a0
		move $s1 $a1
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $s0 $s0
		li $s2 0
		move $s2 $s2
		li $s3 1
		sub $s1, $s1, $s3
		move $s1 $s1
BS_Div_L29:
		li $s3 0
		move $s3 $s3
		sle $s4, $s2, $s1
		beqz $s4 BS_Div_L31
		sne $s4, $s2, $s1
		beqz $s4 BS_Div_L31
		li $s4 1
		move $s3 $s4
BS_Div_L31:
		nop
		beqz $s3 BS_Div_L30
		li $s3 1
		add $s3, $s0, $s3
		move $s0 $s3
		li $s3 2
		add $s3, $s2, $s3
		move $s2 $s3
		b BS_Div_L29
BS_Div_L30:
		nop
		move $v0 $s0
		lw $s7, 28($sp)
		lw $s6, 24($sp)
		lw $s5, 20($sp)
		lw $s4, 16($sp)
		lw $s3, 12($sp)
		lw $s2, 8($sp)
		lw $s1, 4($sp)
		lw $s0, 0($sp)
		addu $sp, $sp, 40
		lw $ra, -4($fp)
		lw $fp, -8($sp)
		j $ra
		.text
		.globl  BS_Compare
BS_Compare:
		sw $fp, -8($sp)
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 40
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		move $v1 $a0
		move $s2 $a1
		move $s1 $a2
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 1
		add $s0, $s1, $s0
		move $s0 $s0
		li $s3 1
		sub $s1, $s1, $s3
		sle $s1, $s2, $s1
		beqz $s1 BS_Compare_L32
		li $s1 0
		move $s1 $s1
		b BS_Compare_L33
BS_Compare_L32:
		li $s3 1
		li $s4 1
		sub $s0, $s0, $s4
		sle $s0, $s2, $s0
		sub $s0, $s3, $s0
		beqz $s0 BS_Compare_L34
		li $s0 0
		move $s1 $s0
		b BS_Compare_L35
BS_Compare_L34:
		li $s0 1
		move $s1 $s0
BS_Compare_L35:
		nop
BS_Compare_L33:
		nop
		move $v0 $s1
		lw $s7, 28($sp)
		lw $s6, 24($sp)
		lw $s5, 20($sp)
		lw $s4, 16($sp)
		lw $s3, 12($sp)
		lw $s2, 8($sp)
		lw $s1, 4($sp)
		lw $s0, 0($sp)
		addu $sp, $sp, 40
		lw $ra, -4($fp)
		lw $fp, -8($sp)
		j $ra
		.text
		.globl  BS_Print
BS_Print:
		sw $fp, -8($sp)
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 40
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		move $s1 $a0
		li $s0 0
		move $v1 $s0
		li $s0 1
		move $s0 $s0
BS_Print_L36:
		li $s2 0
		move $s2 $s2
		lw $v0, 8($s1)
		move $s3 $v0
		sle $s3, $s0, $s3
		beqz $s3 BS_Print_L38
		lw $v0, 8($s1)
		move $s3 $v0
		sne $s3, $s0, $s3
		beqz $s3 BS_Print_L38
		li $s3 1
		move $s2 $s3
BS_Print_L38:
		nop
		beqz $s2 BS_Print_L37
		lw $v0, 4($s1)
		move $s2 $v0
		li $s3 4
		mul $s3, $s0, $s3
		lw $v0, 0($s2)
		move $s4 $v0
		li $s5 1
		li $s6 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4 BS_Print_L39
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BS_Print_L39:
		nop
		li $s4 4
		add $s3, $s3, $s4
		add $s2, $s2, $s3
		lw $v0, 0($s2)
		move $s2 $v0
		move $a0 $s2
		jal _print
		li $s2 1
		add $s2, $s0, $s2
		move $s0 $s2
		b BS_Print_L36
BS_Print_L37:
		nop
		li $s0 9999
		li $s1 0
		add $s0, $s0, $s1
		move $a0 $s0
		jal _print
		li $s0 0
		move $v0 $s0
		lw $s7, 28($sp)
		lw $s6, 24($sp)
		lw $s5, 20($sp)
		lw $s4, 16($sp)
		lw $s3, 12($sp)
		lw $s2, 8($sp)
		lw $s1, 4($sp)
		lw $s0, 0($sp)
		addu $sp, $sp, 40
		lw $ra, -4($fp)
		lw $fp, -8($sp)
		j $ra
		.text
		.globl  BS_Init
BS_Init:
		sw $fp, -8($sp)
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 40
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		move $s2 $a0
		move $s1 $a1
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		sw $s1, 8($s2)
		li $s0 1
		add $s0, $s1, $s0
		li $s3 4
		mul $s0, $s0, $s3
		move $a0 $s0
		jal _halloc
		move $s0 $v0
		move $s0 $s0
		li $s3 4
		move $s3 $s3
BS_Init_L40:
		li $s4 1
		add $s4, $s1, $s4
		li $s5 4
		mul $s4, $s4, $s5
		li $s5 1
		sub $s4, $s4, $s5
		sle $s4, $s3, $s4
		beqz $s4 BS_Init_L41
		add $s4, $s0, $s3
		li $s5 0
		sw $s5, 0($s4)
		li $s4 4
		add $s4, $s3, $s4
		move $s3 $s4
		b BS_Init_L40
BS_Init_L41:
		li $s3 4
		mul $s1, $s1, $s3
		sw $s1, 0($s0)
		sw $s0, 4($s2)
		li $s0 0
		li $s1 0
		lw $v0, 4($s2)
		move $s3 $v0
		li $s4 4
		mul $s0, $s0, $s4
		lw $v0, 0($s3)
		move $s4 $v0
		li $s5 1
		li $s6 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4 BS_Init_L42
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BS_Init_L42:
		nop
		li $s4 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s1, 0($s0)
		li $s0 1
		move $s0 $s0
		lw $v0, 8($s2)
		move $s1 $v0
		li $s3 1
		add $s1, $s1, $s3
		move $s1 $s1
BS_Init_L43:
		lw $v0, 8($s2)
		move $s3 $v0
		li $s4 1
		sub $s3, $s3, $s4
		sle $s3, $s0, $s3
		beqz $s3 BS_Init_L44
		li $s3 2
		mul $s3, $s3, $s0
		move $s3 $s3
		li $s4 3
		sub $s4, $s1, $s4
		move $s4 $s4
		add $s3, $s3, $s4
		lw $v0, 4($s2)
		move $s4 $v0
		li $s5 4
		mul $s5, $s0, $s5
		lw $v0, 0($s4)
		move $s6 $v0
		li $s7 1
		li $t0 1
		sub $s6, $s6, $t0
		sle $s6, $s5, $s6
		sub $s6, $s7, $s6
		beqz $s6 BS_Init_L45
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BS_Init_L45:
		nop
		li $s6 4
		add $s5, $s5, $s6
		add $s4, $s4, $s5
		sw $s3, 0($s4)
		li $s3 1
		add $s3, $s0, $s3
		move $s0 $s3
		li $s3 1
		sub $s3, $s1, $s3
		move $s1 $s3
		b BS_Init_L43
BS_Init_L44:
		nop
		li $s0 0
		move $v0 $s0
		lw $s7, 28($sp)
		lw $s6, 24($sp)
		lw $s5, 20($sp)
		lw $s4, 16($sp)
		lw $s3, 12($sp)
		lw $s2, 8($sp)
		lw $s1, 4($sp)
		lw $s0, 0($sp)
		addu $sp, $sp, 40
		lw $ra, -4($fp)
		lw $fp, -8($sp)
		j $ra
		.text
		.globl  _halloc
_halloc:
		li $v0, 9
		syscall
		j $ra
		.text
		.globl  _print
_print:
		li $v0, 1
		syscall
		la $a0, newl
		li $v0, 4
		syscall
		j $ra
		.data
		.align 0
newl:	.asciiz "\n"
		.data
		.align 0
str_er:	.asciiz "ERROR: abnormal termination\n"
