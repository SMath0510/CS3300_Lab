		.text
		.globl  main
main:
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 44
		li $s0 8
		move $a0 $s0
		jal _halloc
		move $s1 $v0
		li $s2 0
		sw $s2, 0($s1)
		sw $s2, 4($s1)
		li $s0 4
		move $a0 $s0
		jal _halloc
		move $s3 $v0
		la $s4 Test1_Start
		sw $s4, 0($s3)
		sw $s3, 0($s1)
		lw $v0, 0($s1)
		move $s4 $v0
		lw $v0, 0($s4)
		move $s4 $v0
		li $s0 5
		li $s2 1
		move $a0 $s1
		move $a1 $s0
		move $a2 $s2
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
		jalr $s4
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
		move $s3 $v0
		move $a0 $s3
		jal _print
		addu $sp, $sp, 44
		lw $ra, -4($fp)
		j $ra
		.text
		.globl  Test1_Start
Test1_Start:
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
		move $s0 $a1
		move $v1 $a2
		add $s1, $s0, 1
		mul $s0, $s1, 4
		move $a0 $s0
		jal _halloc
		move $s2 $v0
		sw $s1, 0($s2)
		li $s3 0
		li $s4 4
		sub $s0, $s0, 4
Test1_Start_L1:
		sle $s1, $s4, $s0
		beqz $s1 Test1_Start_L2
		add $s1, $s2, $s4
		sw $s3, 0($s1)
		add $s4, $s4, 4
		b Test1_Start_L1
Test1_Start_L2:
		nop
		move $s2 $s2
		li $s4 0
		mul $s0, $s4, 4
		add $s0, $s0, 4
		add $s0, $s0, $s2
		li $s1 0
		sw $s1, 0($s0)
		li $s0 0
		mul $s3, $s0, 4
		add $s3, $s3, 4
		add $s1, $s2, $s3
		lw $v0, 0($s1)
		move $s4 $v0
		move $s1 $s4
		move $a0 $s1
		jal _print
		li $s1 0
		mul $s1, $s1, 4
		add $s1, $s1, 4
		add $s1, $s2, $s1
		lw $v0, 0($s1)
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
