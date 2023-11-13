		.text
		.globl  main
main:
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 44
		li $s0 4
		move $a0 $s0
		jal _halloc
		move $s0 $v0
		move $s0 $s0
		li $s1 4
		move $a0 $s1
		jal _halloc
		move $s1 $v0
		move $s1 $s1
		la $s2 Test_Start
		sw $s2, 0($s0)
		sw $s0, 0($s1)
		move $s0 $s1
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 0($s1)
		move $s1 $v0
		move $a0 $s0
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
		.globl  Base_set
Base_set:
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
		sw $s0, 4($s1)
		lw $v0, 4($s1)
		move $s0 $v0
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
		.globl  Base_get
Base_get:
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
		move $s0 $a0
		lw $v0, 4($s0)
		move $s1 $v0
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
		.globl  Derived_set
Derived_set:
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
		move $s0 $a1
		li $s1 2
		mul $s0, $s0, $s1
		sw $s0, 4($s2)
		lw $v0, 4($s2)
		move $s0 $v0
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
		.globl  Test_Start
Test_Start:
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
		move $v1 $a0
		li $s0 0
		move $v1 $s0
		li $s0 0
		move $v1 $s0
		li $s0 8
		move $a0 $s0
		jal _halloc
		move $s0 $v0
		move $s0 $s0
		li $s1 8
		move $a0 $s1
		jal _halloc
		move $s1 $v0
		move $s1 $s1
		la $s2 Base_set
		sw $s2, 0($s0)
		la $s2 Base_get
		sw $s2, 4($s0)
		sw $s0, 0($s1)
		move $v1 $s1
		li $s0 12
		move $a0 $s0
		jal _halloc
		move $s0 $v0
		move $s0 $s0
		li $s1 12
		move $a0 $s1
		jal _halloc
		move $s1 $v0
		move $s1 $s1
		la $s2 Derived_set
		sw $s2, 0($s0)
		la $s2 Base_get
		sw $s2, 4($s0)
		la $s2 Derived_set
		sw $s2, 8($s0)
		li $s2 8
		move $s2 $s2
Test_Start_L4:
		li $s3 11
		sle $s3, $s2, $s3
		beqz $s3 Test_Start_L5
		add $s3, $s1, $s2
		li $s4 0
		sw $s4, 0($s3)
		li $s3 4
		add $s3, $s2, $s3
		move $s2 $s3
		b Test_Start_L4
Test_Start_L5:
		sw $s0, 0($s1)
		move $s0 $s1
		move $s1 $s0
		move $s2 $s1
		lw $v0, 0($s2)
		move $s3 $v0
		lw $v0, 0($s3)
		move $s3 $v0
		li $s4 1
		move $a0 $s2
		move $a1 $s4
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
		move $s2 $v0
		move $a0 $s2
		jal _print
		move $s1 $s1
		lw $v0, 0($s1)
		move $s2 $v0
		lw $v0, 0($s2)
		move $s2 $v0
		li $s3 3
		move $a0 $s1
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
		jalr $s2
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
		move $s1 $v0
		move $a0 $s1
		jal _print
		move $s1 $s0
		lw $v0, 0($s1)
		move $s2 $v0
		lw $v0, 8($s2)
		move $s2 $v0
		li $s3 1
		move $a0 $s1
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
		jalr $s2
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
		move $s1 $v0
		move $a0 $s1
		jal _print
		move $s0 $s0
		lw $v0, 0($s0)
		move $s1 $v0
		lw $v0, 8($s1)
		move $s1 $v0
		li $s2 3
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
		li $s0 1
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
