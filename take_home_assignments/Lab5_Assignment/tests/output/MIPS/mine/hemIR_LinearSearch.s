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
		la $s2 LS_Print
		sw $s2, 4($s0)
		la $s2 LS_Init
		sw $s2, 12($s0)
		la $s2 LS_Start
		sw $s2, 0($s0)
		la $s2 LS_Search
		sw $s2, 8($s0)
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
		.globl  LS_Start
LS_Start:
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
		lw $v0, 4($s1)
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
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 8($s1)
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
		move $a0 $s0
		jal _print
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 8($s1)
		move $s1 $v0
		li $s3 12
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
		move $a0 $s0
		jal _print
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 8($s1)
		move $s1 $v0
		li $s3 17
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
		move $a0 $s0
		jal _print
		move $s0 $s2
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 8($s1)
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
		move $a0 $s0
		jal _print
		li $s0 55
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
		.globl  LS_Print
LS_Print:
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
LS_Print_L2:
		lw $v0, 8($s1)
		move $s2 $v0
		li $s3 1
		sub $s2, $s2, $s3
		sle $s2, $s0, $s2
		beqz $s2 LS_Print_L3
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
		beqz $s4 LS_Print_L4
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
LS_Print_L4:
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
		b LS_Print_L2
LS_Print_L3:
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
		.globl  LS_Search
LS_Search:
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
		li $s0 1
		move $s0 $s0
		li $s3 0
		move $v1 $s3
		li $s3 0
		move $s3 $s3
LS_Search_L5:
		lw $v0, 8($s1)
		move $s4 $v0
		li $s5 1
		sub $s4, $s4, $s5
		sle $s4, $s0, $s4
		beqz $s4 LS_Search_L6
		lw $v0, 4($s1)
		move $s4 $v0
		li $s5 4
		mul $s5, $s0, $s5
		lw $v0, 0($s4)
		move $s6 $v0
		li $s7 1
		li $t0 1
		sub $s6, $s6, $t0
		sle $s6, $s0, $s6
		sub $s6, $s7, $s6
		beqz $s6 LS_Search_L7
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
LS_Search_L7:
		nop
		li $s6 4
		add $s5, $s5, $s6
		add $s4, $s4, $s5
		lw $v0, 0($s4)
		move $s4 $v0
		move $s4 $s4
		li $s5 1
		add $s5, $s2, $s5
		move $s5 $s5
		li $s6 0
		move $s6 $s6
		sle $s7, $s4, $s2
		beqz $s7 LS_Search_L10
		sne $s7, $s4, $s2
		beqz $s7 LS_Search_L10
		li $s7 1
		move $s6 $s7
LS_Search_L10:
		nop
		beqz $s6 LS_Search_L8
		li $s6 0
		move $v1 $s6
		b LS_Search_L9
LS_Search_L8:
		li $s6 1
		li $s7 1
		sub $s5, $s5, $s7
		sle $s4, $s4, $s5
		sub $s4, $s6, $s4
		beqz $s4 LS_Search_L11
		li $s4 0
		move $v1 $s4
		b LS_Search_L12
LS_Search_L11:
		li $s4 1
		move $v1 $s4
		li $s4 1
		move $s3 $s4
		lw $v0, 8($s1)
		move $s4 $v0
		move $s0 $s4
LS_Search_L12:
		nop
LS_Search_L9:
		nop
		li $s4 1
		add $s4, $s0, $s4
		move $s0 $s4
		b LS_Search_L5
LS_Search_L6:
		nop
		move $v0 $s3
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
		.globl  LS_Init
LS_Init:
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
LS_Init_L13:
		li $s4 1
		add $s4, $s1, $s4
		li $s5 4
		mul $s4, $s4, $s5
		li $s5 1
		sub $s4, $s4, $s5
		sle $s4, $s3, $s4
		beqz $s4 LS_Init_L14
		add $s4, $s0, $s3
		li $s5 0
		sw $s5, 0($s4)
		li $s4 4
		add $s4, $s3, $s4
		move $s3 $s4
		b LS_Init_L13
LS_Init_L14:
		li $s3 4
		mul $s1, $s1, $s3
		sw $s1, 0($s0)
		sw $s0, 4($s2)
		li $s0 1
		move $s0 $s0
		lw $v0, 8($s2)
		move $s1 $v0
		li $s3 1
		add $s1, $s1, $s3
		move $s1 $s1
LS_Init_L15:
		lw $v0, 8($s2)
		move $s3 $v0
		li $s4 1
		sub $s3, $s3, $s4
		sle $s3, $s0, $s3
		beqz $s3 LS_Init_L16
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
		beqz $s6 LS_Init_L17
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
LS_Init_L17:
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
		b LS_Init_L15
LS_Init_L16:
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
