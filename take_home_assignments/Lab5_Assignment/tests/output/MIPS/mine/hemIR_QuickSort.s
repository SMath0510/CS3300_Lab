		.text
		.globl  main
main:
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 44
		li $s0 16
		move $a0 $s0
		jal _halloc
		move $s0 $v0
		move $s0 $s0
		li $s1 12
		move $a0 $s1
		jal _halloc
		move $s1 $v0
		move $s1 $s1
		la $s2 QS_Print
		sw $s2, 8($s0)
		la $s2 QS_Init
		sw $s2, 12($s0)
		la $s2 QS_Start
		sw $s2, 0($s0)
		la $s2 QS_Sort
		sw $s2, 4($s0)
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
		li $s2 10
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
		.globl  QS_Start
QS_Start:
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
		move $s0 $s2
		lw $v0, 0($s0)
		move $s3 $v0
		lw $v0, 12($s3)
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
		lw $v0, 8($s1)
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
		li $s0 9999
		move $a0 $s0
		jal _print
		lw $v0, 8($s2)
		move $s0 $v0
		li $s1 1
		sub $s0, $s0, $s1
		move $s0 $s0
		move $s1 $s2
		lw $v0, 0($s1)
		move $s3 $v0
		lw $v0, 4($s3)
		move $s3 $v0
		li $s4 0
		move $a0 $s1
		move $a1 $s4
		move $a2 $s0
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
		lw $v0, 8($s1)
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
		addu $sp, $sp, 80
		lw $ra, -4($fp)
		lw $fp, -8($sp)
		j $ra
		.text
		.globl  QS_Sort
QS_Sort:
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
		move $s3 $a2
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
		move $v1 $s0
		li $s0 0
		move $s0 $s0
		li $s4 0
		move $s4 $s4
		sle $s5, $s1, $s3
		beqz $s5 QS_Sort_L4
		sne $s5, $s1, $s3
		beqz $s5 QS_Sort_L4
		li $s5 1
		move $s4 $s5
QS_Sort_L4:
		nop
		beqz $s4 QS_Sort_L2
		lw $v0, 4($s2)
		move $s4 $v0
		li $s5 4
		mul $s5, $s3, $s5
		lw $v0, 0($s4)
		move $s6 $v0
		li $s7 1
		li $t0 1
		sub $s6, $s6, $t0
		sle $s6, $s3, $s6
		sub $s6, $s7, $s6
		beqz $s6 QS_Sort_L5
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L5:
		nop
		li $s6 4
		add $s5, $s5, $s6
		add $s4, $s4, $s5
		lw $v0, 0($s4)
		move $s4 $v0
		move $s4 $s4
		li $s5 1
		sub $s5, $s1, $s5
		move $s5 $s5
		move $s6 $s3
		li $s7 1
		move $s7 $s7
QS_Sort_L6:
		beqz $s7 QS_Sort_L7
		li $t0 1
		move $t0 $t0
QS_Sort_L8:
		beqz $t0 QS_Sort_L9
		li $t1 1
		add $t1, $s5, $t1
		move $s5 $t1
		lw $v0, 4($s2)
		move $t1 $v0
		li $t2 4
		mul $t2, $s5, $t2
		lw $v0, 0($t1)
		move $t3 $v0
		li $t4 1
		li $t5 1
		sub $t3, $t3, $t5
		sle $t3, $s5, $t3
		sub $t3, $t4, $t3
		beqz $t3 QS_Sort_L10
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L10:
		nop
		li $t3 4
		add $t2, $t2, $t3
		add $t1, $t1, $t2
		lw $v0, 0($t1)
		move $t1 $v0
		move $t1 $t1
		li $t2 1
		li $t3 1
		sub $t3, $s4, $t3
		sle $t3, $t1, $t3
		sub $t2, $t2, $t3
		beqz $t2 QS_Sort_L11
		li $t2 0
		move $t0 $t2
		b QS_Sort_L12
QS_Sort_L11:
		li $t2 1
		move $t0 $t2
QS_Sort_L12:
		nop
		b QS_Sort_L8
QS_Sort_L9:
		nop
		li $t2 1
		move $t0 $t2
QS_Sort_L13:
		beqz $t0 QS_Sort_L14
		li $t2 1
		sub $t2, $s6, $t2
		move $s6 $t2
		lw $v0, 4($s2)
		move $t2 $v0
		li $t3 4
		mul $t3, $s6, $t3
		lw $v0, 0($t2)
		move $t4 $v0
		li $t5 1
		li $t6 1
		sub $t4, $t4, $t6
		sle $t4, $s6, $t4
		sub $t4, $t5, $t4
		beqz $t4 QS_Sort_L15
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L15:
		nop
		li $t4 4
		add $t3, $t3, $t4
		add $t2, $t2, $t3
		lw $v0, 0($t2)
		move $t2 $v0
		move $t1 $t2
		li $t2 1
		li $t3 1
		sub $t1, $t1, $t3
		sle $t1, $s4, $t1
		sub $t1, $t2, $t1
		beqz $t1 QS_Sort_L16
		li $t1 0
		move $t0 $t1
		b QS_Sort_L17
QS_Sort_L16:
		li $t1 1
		move $t0 $t1
QS_Sort_L17:
		nop
		b QS_Sort_L13
QS_Sort_L14:
		nop
		lw $v0, 4($s2)
		move $t0 $v0
		li $t1 4
		mul $t1, $s5, $t1
		lw $v0, 0($t0)
		move $t2 $v0
		li $t3 1
		li $t4 1
		sub $t2, $t2, $t4
		sle $t2, $s5, $t2
		sub $t2, $t3, $t2
		beqz $t2 QS_Sort_L18
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L18:
		nop
		li $t2 4
		add $t1, $t1, $t2
		add $t0, $t0, $t1
		lw $v0, 0($t0)
		move $t0 $v0
		move $s0 $t0
		lw $v0, 4($s2)
		move $t0 $v0
		li $t1 4
		mul $t1, $s6, $t1
		lw $v0, 0($t0)
		move $t2 $v0
		li $t3 1
		li $t4 1
		sub $t2, $t2, $t4
		sle $t2, $s6, $t2
		sub $t2, $t3, $t2
		beqz $t2 QS_Sort_L19
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L19:
		nop
		li $t2 4
		add $t1, $t1, $t2
		add $t0, $t0, $t1
		lw $v0, 0($t0)
		move $t0 $v0
		lw $v0, 4($s2)
		move $t1 $v0
		li $t2 4
		mul $t2, $s5, $t2
		lw $v0, 0($t1)
		move $t3 $v0
		li $t4 1
		li $t5 1
		sub $t3, $t3, $t5
		sle $t3, $t2, $t3
		sub $t3, $t4, $t3
		beqz $t3 QS_Sort_L20
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L20:
		nop
		li $t3 4
		add $t2, $t2, $t3
		add $t1, $t1, $t2
		sw $t0, 0($t1)
		lw $v0, 4($s2)
		move $t0 $v0
		li $t1 4
		mul $t1, $s6, $t1
		lw $v0, 0($t0)
		move $t2 $v0
		li $t3 1
		li $t4 1
		sub $t2, $t2, $t4
		sle $t2, $t1, $t2
		sub $t2, $t3, $t2
		beqz $t2 QS_Sort_L21
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L21:
		nop
		li $t2 4
		add $t1, $t1, $t2
		add $t0, $t0, $t1
		sw $s0, 0($t0)
		sle $t0, $s6, $s5
		beqz $t0 QS_Sort_L22
		li $t0 0
		move $s7 $t0
		b QS_Sort_L23
QS_Sort_L22:
		li $t0 1
		move $s7 $t0
QS_Sort_L23:
		nop
		b QS_Sort_L6
QS_Sort_L7:
		nop
		lw $v0, 4($s2)
		move $s4 $v0
		li $s7 4
		mul $s7, $s5, $s7
		lw $v0, 0($s4)
		move $t0 $v0
		li $t1 1
		li $t2 1
		sub $t0, $t0, $t2
		sle $t0, $s5, $t0
		sub $t0, $t1, $t0
		beqz $t0 QS_Sort_L24
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L24:
		nop
		li $t0 4
		add $s7, $s7, $t0
		add $s4, $s4, $s7
		lw $v0, 0($s4)
		move $s4 $v0
		lw $v0, 4($s2)
		move $s7 $v0
		li $t0 4
		mul $s6, $s6, $t0
		lw $v0, 0($s7)
		move $t0 $v0
		li $t1 1
		li $t2 1
		sub $t0, $t0, $t2
		sle $t0, $s6, $t0
		sub $t0, $t1, $t0
		beqz $t0 QS_Sort_L25
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L25:
		nop
		li $t0 4
		add $s6, $s6, $t0
		add $s6, $s7, $s6
		sw $s4, 0($s6)
		lw $v0, 4($s2)
		move $s4 $v0
		li $s6 4
		mul $s6, $s3, $s6
		lw $v0, 0($s4)
		move $s7 $v0
		li $t0 1
		li $t1 1
		sub $s7, $s7, $t1
		sle $s7, $s3, $s7
		sub $s7, $t0, $s7
		beqz $s7 QS_Sort_L26
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L26:
		nop
		li $s7 4
		add $s6, $s6, $s7
		add $s4, $s4, $s6
		lw $v0, 0($s4)
		move $s4 $v0
		lw $v0, 4($s2)
		move $s6 $v0
		li $s7 4
		mul $s7, $s5, $s7
		lw $v0, 0($s6)
		move $t0 $v0
		li $t1 1
		li $t2 1
		sub $t0, $t0, $t2
		sle $t0, $s7, $t0
		sub $t0, $t1, $t0
		beqz $t0 QS_Sort_L27
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L27:
		nop
		li $t0 4
		add $s7, $s7, $t0
		add $s6, $s6, $s7
		sw $s4, 0($s6)
		lw $v0, 4($s2)
		move $s4 $v0
		li $s6 4
		mul $s6, $s3, $s6
		lw $v0, 0($s4)
		move $s7 $v0
		li $t0 1
		li $t1 1
		sub $s7, $s7, $t1
		sle $s7, $s6, $s7
		sub $s7, $t0, $s7
		beqz $s7 QS_Sort_L28
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Sort_L28:
		nop
		li $s7 4
		add $s6, $s6, $s7
		add $s4, $s4, $s6
		sw $s0, 0($s4)
		move $s0 $s2
		lw $v0, 0($s0)
		move $s4 $v0
		lw $v0, 4($s4)
		move $s4 $v0
		li $s6 1
		sub $s6, $s5, $s6
		move $a0 $s0
		move $a1 $s1
		move $a2 $s6
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
		jalr $s4
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
		li $s2 1
		add $s2, $s5, $s2
		move $a0 $s0
		move $a1 $s2
		move $a2 $s3
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
		b QS_Sort_L3
QS_Sort_L2:
		li $s0 0
		move $v1 $s0
QS_Sort_L3:
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
		addu $sp, $sp, 80
		lw $ra, -4($fp)
		lw $fp, -8($sp)
		j $ra
		.text
		.globl  QS_Print
QS_Print:
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
		li $s0 0
		move $s0 $s0
QS_Print_L29:
		lw $v0, 8($s1)
		move $s2 $v0
		li $s3 1
		sub $s2, $s2, $s3
		sle $s2, $s0, $s2
		beqz $s2 QS_Print_L30
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
		beqz $s4 QS_Print_L31
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Print_L31:
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
		b QS_Print_L29
QS_Print_L30:
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
		.globl  QS_Init
QS_Init:
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
		move $s0 $a1
		sw $s0, 8($s1)
		li $s2 1
		add $s2, $s0, $s2
		li $s3 4
		mul $s2, $s2, $s3
		move $a0 $s2
		jal _halloc
		move $s2 $v0
		move $s2 $s2
		li $s3 4
		move $s3 $s3
QS_Init_L32:
		li $s4 1
		add $s4, $s0, $s4
		li $s5 4
		mul $s4, $s4, $s5
		li $s5 1
		sub $s4, $s4, $s5
		sle $s4, $s3, $s4
		beqz $s4 QS_Init_L33
		add $s4, $s2, $s3
		li $s5 0
		sw $s5, 0($s4)
		li $s4 4
		add $s4, $s3, $s4
		move $s3 $s4
		b QS_Init_L32
QS_Init_L33:
		li $s3 4
		mul $s0, $s0, $s3
		sw $s0, 0($s2)
		sw $s2, 4($s1)
		li $s0 0
		li $s2 20
		lw $v0, 4($s1)
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
		beqz $s4 QS_Init_L34
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Init_L34:
		nop
		li $s4 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0 1
		li $s2 7
		lw $v0, 4($s1)
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
		beqz $s4 QS_Init_L35
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Init_L35:
		nop
		li $s4 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0 2
		li $s2 12
		lw $v0, 4($s1)
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
		beqz $s4 QS_Init_L36
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Init_L36:
		nop
		li $s4 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0 3
		li $s2 18
		lw $v0, 4($s1)
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
		beqz $s4 QS_Init_L37
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Init_L37:
		nop
		li $s4 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0 4
		li $s2 2
		lw $v0, 4($s1)
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
		beqz $s4 QS_Init_L38
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Init_L38:
		nop
		li $s4 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0 5
		li $s2 11
		lw $v0, 4($s1)
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
		beqz $s4 QS_Init_L39
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Init_L39:
		nop
		li $s4 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0 6
		li $s2 6
		lw $v0, 4($s1)
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
		beqz $s4 QS_Init_L40
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Init_L40:
		nop
		li $s4 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0 7
		li $s2 9
		lw $v0, 4($s1)
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
		beqz $s4 QS_Init_L41
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Init_L41:
		nop
		li $s4 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0 8
		li $s2 19
		lw $v0, 4($s1)
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
		beqz $s4 QS_Init_L42
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Init_L42:
		nop
		li $s4 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0 9
		li $s2 5
		lw $v0, 4($s1)
		move $s1 $v0
		li $s3 4
		mul $s0, $s0, $s3
		lw $v0, 0($s1)
		move $s3 $v0
		li $s4 1
		li $s5 1
		sub $s3, $s3, $s5
		sle $s3, $s0, $s3
		sub $s3, $s4, $s3
		beqz $s3 QS_Init_L43
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
QS_Init_L43:
		nop
		li $s3 4
		add $s0, $s0, $s3
		add $s0, $s1, $s0
		sw $s2, 0($s0)
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
