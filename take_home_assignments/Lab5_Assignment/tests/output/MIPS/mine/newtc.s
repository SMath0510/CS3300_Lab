		.text
		.globl  main
main:
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 64
		li $s0 4
		move $a0 $s0
		jal _halloc
		move $s1 $v0
		li $s2 0
		sw $s2, 0($s1)
		li $s0 4
		move $a0 $s0
		jal _halloc
		move $s3 $v0
		la $s4 hmm_mo
		sw $s4, 0($s3)
		sw $s3, 0($s1)
		lw $v0, 0($s1)
		move $s4 $v0
		lw $v0, 0($s4)
		move $s4 $v0
		li $s0 1
		li $s2 2
		li $s5 3
		li $s6 4
		li $s7 5
		li $t0 6
		li $t1 7
		li $t2 8
		move $a0 $s1
		move $a1 $s0
		move $a2 $s2
		move $a3 $s5
		sw $s6, 0($sp)
		sw $s7, 4($sp)
		sw $t0, 8($sp)
		sw $t1, 12($sp)
		sw $t2, 16($sp)
		sw $t0, 20($sp)
		sw $t1, 24($sp)
		sw $t2, 28($sp)
		sw $t3, 32($sp)
		sw $t4, 36($sp)
		sw $t5, 40($sp)
		sw $t6, 44($sp)
		sw $t7, 48($sp)
		sw $t8, 52($sp)
		sw $t9, 56($sp)
		jalr $s4
		lw $t9, 56($sp)
		lw $t8, 52($sp)
		lw $t7, 48($sp)
		lw $t6, 44($sp)
		lw $t5, 40($sp)
		lw $t4, 36($sp)
		lw $t3, 32($sp)
		lw $t2, 28($sp)
		lw $t1, 24($sp)
		lw $t0, 20($sp)
		move $s3 $v0
		move $a0 $s3
		jal _print
		addu $sp, $sp, 64
		lw $ra, -4($fp)
		j $ra
		.text
		.globl  hmm_mo
hmm_mo:
		sw $fp, -8($sp)
		move $fp, $sp
		sw $ra, -4($fp)
		subu $sp, $sp, 404
		sw $s0, 364($sp)
		sw $s1, 368($sp)
		sw $s2, 372($sp)
		sw $s3, 376($sp)
		sw $s4, 380($sp)
		sw $s5, 384($sp)
		sw $s6, 388($sp)
		sw $s7, 392($sp)
		move $v1 $a0
		move $s1 $a1
		move $s2 $a2
		move $s3 $a3
		lw $v0, 0($fp)
		move $s4 $v0
		lw $v0, 4($fp)
		move $s5 $v0
		lw $v0, 8($fp)
		move $s6 $v0
		lw $v0, 12($fp)
		move $s7 $v0
		lw $v0, 16($fp)
		move $t0 $v0
		li $s0 10
		move $s0 $s0
		li $t1 11
		move $t1 $t1
		li $t2 12
		move $t2 $t2
		li $t3 13
		move $t3 $t3
		li $t4 14
		move $t4 $t4
		li $t5 15
		move $t5 $t5
		li $t6 16
		move $t6 $t6
		li $t7 17
		move $t7 $t7
		li $t8 18
		move $t8 $t8
		li $t9 19
		move $v0 $t9
		sw $v0, 20($sp)
		li $t9 20
		move $v0 $t9
		sw $v0, 24($sp)
		li $t9 21
		move $v0 $t9
		sw $v0, 28($sp)
		li $t9 22
		move $v0 $t9
		sw $v0, 32($sp)
		li $t9 23
		move $v0 $t9
		sw $v0, 36($sp)
		li $t9 24
		move $v0 $t9
		sw $v0, 40($sp)
		li $t9 25
		move $v0 $t9
		sw $v0, 44($sp)
		li $t9 26
		move $v0 $t9
		sw $v0, 48($sp)
		li $t9 27
		move $v0 $t9
		sw $v0, 52($sp)
		li $t9 28
		move $v0 $t9
		sw $v0, 56($sp)
		li $t9 29
		move $v0 $t9
		sw $v0, 60($sp)
		li $t9 30
		move $v0 $t9
		sw $v0, 64($sp)
		li $t9 31
		move $v0 $t9
		sw $v0, 68($sp)
		li $t9 32
		move $v0 $t9
		sw $v0, 72($sp)
		li $t9 33
		move $v0 $t9
		sw $v0, 76($sp)
		li $t9 34
		move $v0 $t9
		sw $v0, 80($sp)
		li $t9 35
		move $v0 $t9
		sw $v0, 84($sp)
		li $t9 36
		move $v0 $t9
		sw $v0, 88($sp)
		li $t9 37
		move $v0 $t9
		sw $v0, 92($sp)
		li $t9 38
		move $v0 $t9
		sw $v0, 96($sp)
		li $t9 39
		move $v0 $t9
		sw $v0, 100($sp)
		li $t9 40
		move $v0 $t9
		sw $v0, 104($sp)
		li $t9 41
		move $v0 $t9
		sw $v0, 108($sp)
		li $t9 42
		move $v0 $t9
		sw $v0, 112($sp)
		li $t9 43
		move $v0 $t9
		sw $v0, 116($sp)
		li $t9 44
		move $v0 $t9
		sw $v0, 120($sp)
		li $t9 45
		move $v0 $t9
		sw $v0, 124($sp)
		li $t9 46
		move $v0 $t9
		sw $v0, 128($sp)
		li $t9 47
		move $v0 $t9
		sw $v0, 132($sp)
		li $t9 48
		move $v0 $t9
		sw $v0, 136($sp)
		li $t9 49
		move $v0 $t9
		sw $v0, 140($sp)
		li $t9 50
		move $v0 $t9
		sw $v0, 144($sp)
		li $t9 51
		move $v0 $t9
		sw $v0, 148($sp)
		li $t9 52
		move $v0 $t9
		sw $v0, 152($sp)
		li $t9 53
		move $v0 $t9
		sw $v0, 156($sp)
		li $t9 54
		move $v0 $t9
		sw $v0, 160($sp)
		li $t9 55
		move $v0 $t9
		sw $v0, 164($sp)
		li $t9 56
		move $v0 $t9
		sw $v0, 168($sp)
		li $t9 57
		move $v0 $t9
		sw $v0, 172($sp)
		li $t9 58
		move $v0 $t9
		sw $v0, 176($sp)
		li $t9 59
		move $v0 $t9
		sw $v0, 180($sp)
		li $t9 60
		move $v0 $t9
		sw $v0, 184($sp)
		li $t9 61
		move $v0 $t9
		sw $v0, 188($sp)
		li $t9 62
		move $v0 $t9
		sw $v0, 192($sp)
		li $t9 63
		move $v0 $t9
		sw $v0, 196($sp)
		li $t9 64
		move $v0 $t9
		sw $v0, 200($sp)
		li $t9 65
		move $v0 $t9
		sw $v0, 204($sp)
		li $t9 66
		move $v0 $t9
		sw $v0, 208($sp)
		li $t9 67
		move $v0 $t9
		sw $v0, 212($sp)
		li $t9 68
		move $v0 $t9
		sw $v0, 216($sp)
		li $t9 69
		move $v0 $t9
		sw $v0, 220($sp)
		li $t9 70
		move $v0 $t9
		sw $v0, 224($sp)
		li $t9 71
		move $v0 $t9
		sw $v0, 228($sp)
		li $t9 72
		move $v0 $t9
		sw $v0, 232($sp)
		li $t9 73
		move $v0 $t9
		sw $v0, 236($sp)
		li $t9 74
		move $v0 $t9
		sw $v0, 240($sp)
		li $t9 75
		move $v0 $t9
		sw $v0, 244($sp)
		li $t9 76
		move $v0 $t9
		sw $v0, 248($sp)
		li $t9 77
		move $v0 $t9
		sw $v0, 252($sp)
		li $t9 78
		move $v0 $t9
		sw $v0, 256($sp)
		li $t9 79
		move $v0 $t9
		sw $v0, 260($sp)
		li $t9 80
		move $v0 $t9
		sw $v0, 264($sp)
		li $t9 81
		move $v0 $t9
		sw $v0, 268($sp)
		li $t9 82
		move $v0 $t9
		sw $v0, 272($sp)
		li $t9 83
		move $v0 $t9
		sw $v0, 276($sp)
		li $t9 84
		move $v0 $t9
		sw $v0, 280($sp)
		li $t9 85
		move $v0 $t9
		sw $v0, 284($sp)
		li $t9 86
		move $v0 $t9
		sw $v0, 288($sp)
		li $t9 87
		move $v0 $t9
		sw $v0, 292($sp)
		li $t9 88
		move $v0 $t9
		sw $v0, 296($sp)
		li $t9 89
		move $v0 $t9
		sw $v0, 300($sp)
		li $t9 90
		move $v0 $t9
		sw $v0, 304($sp)
		li $t9 91
		move $v0 $t9
		sw $v0, 308($sp)
		li $t9 92
		move $v0 $t9
		sw $v0, 312($sp)
		li $t9 93
		move $v0 $t9
		sw $v0, 316($sp)
		li $t9 94
		move $v0 $t9
		sw $v0, 320($sp)
		li $t9 95
		move $v0 $t9
		sw $v0, 324($sp)
		li $t9 96
		move $v0 $t9
		sw $v0, 328($sp)
		li $t9 97
		move $v0 $t9
		sw $v0, 332($sp)
		li $t9 98
		move $v0 $t9
		sw $v0, 336($sp)
		li $t9 99
		move $v0 $t9
		sw $v0, 340($sp)
		li $t9 100
		move $v0 $t9
		sw $v0, 344($sp)
		li $t9 101
		move $v0 $t9
		sw $v0, 348($sp)
		li $t9 102
		move $v0 $t9
		sw $v0, 352($sp)
		li $t9 103
		move $v0 $t9
		sw $v0, 356($sp)
		li $t9 104
		move $v0 $t9
		sw $v0, 360($sp)
		li $t9 105
		move $t9 $t9
		move $a0 $s1
		jal _print
		move $a0 $s2
		jal _print
		move $a0 $s3
		jal _print
		move $a0 $s4
		jal _print
		move $a0 $s5
		jal _print
		move $a0 $s6
		jal _print
		move $a0 $s7
		jal _print
		move $a0 $t0
		jal _print
		move $a0 $s0
		jal _print
		move $a0 $t1
		jal _print
		move $a0 $t2
		jal _print
		move $a0 $t3
		jal _print
		move $a0 $t4
		jal _print
		move $a0 $t5
		jal _print
		move $a0 $t6
		jal _print
		move $a0 $t7
		jal _print
		move $a0 $t8
		jal _print
		lw $v0, 20($sp)
		move $a0 $v0
		jal _print
		lw $v0, 24($sp)
		move $a0 $v0
		jal _print
		lw $v0, 28($sp)
		move $a0 $v0
		jal _print
		lw $v0, 32($sp)
		move $a0 $v0
		jal _print
		lw $v0, 36($sp)
		move $a0 $v0
		jal _print
		lw $v0, 40($sp)
		move $a0 $v0
		jal _print
		lw $v0, 44($sp)
		move $a0 $v0
		jal _print
		lw $v0, 48($sp)
		move $a0 $v0
		jal _print
		lw $v0, 52($sp)
		move $a0 $v0
		jal _print
		lw $v0, 56($sp)
		move $a0 $v0
		jal _print
		lw $v0, 60($sp)
		move $a0 $v0
		jal _print
		lw $v0, 64($sp)
		move $a0 $v0
		jal _print
		lw $v0, 68($sp)
		move $a0 $v0
		jal _print
		lw $v0, 72($sp)
		move $a0 $v0
		jal _print
		lw $v0, 76($sp)
		move $a0 $v0
		jal _print
		lw $v0, 80($sp)
		move $a0 $v0
		jal _print
		lw $v0, 84($sp)
		move $a0 $v0
		jal _print
		lw $v0, 88($sp)
		move $a0 $v0
		jal _print
		lw $v0, 92($sp)
		move $a0 $v0
		jal _print
		lw $v0, 96($sp)
		move $a0 $v0
		jal _print
		lw $v0, 100($sp)
		move $a0 $v0
		jal _print
		lw $v0, 104($sp)
		move $a0 $v0
		jal _print
		lw $v0, 108($sp)
		move $a0 $v0
		jal _print
		lw $v0, 112($sp)
		move $a0 $v0
		jal _print
		lw $v0, 116($sp)
		move $a0 $v0
		jal _print
		lw $v0, 120($sp)
		move $a0 $v0
		jal _print
		lw $v0, 124($sp)
		move $a0 $v0
		jal _print
		lw $v0, 128($sp)
		move $a0 $v0
		jal _print
		lw $v0, 132($sp)
		move $a0 $v0
		jal _print
		lw $v0, 136($sp)
		move $a0 $v0
		jal _print
		lw $v0, 140($sp)
		move $a0 $v0
		jal _print
		lw $v0, 144($sp)
		move $a0 $v0
		jal _print
		lw $v0, 148($sp)
		move $a0 $v0
		jal _print
		lw $v0, 152($sp)
		move $a0 $v0
		jal _print
		lw $v0, 156($sp)
		move $a0 $v0
		jal _print
		lw $v0, 160($sp)
		move $a0 $v0
		jal _print
		lw $v0, 164($sp)
		move $a0 $v0
		jal _print
		lw $v0, 168($sp)
		move $a0 $v0
		jal _print
		lw $v0, 172($sp)
		move $a0 $v0
		jal _print
		lw $v0, 176($sp)
		move $a0 $v0
		jal _print
		lw $v0, 180($sp)
		move $a0 $v0
		jal _print
		lw $v0, 184($sp)
		move $a0 $v0
		jal _print
		lw $v0, 188($sp)
		move $a0 $v0
		jal _print
		lw $v0, 192($sp)
		move $a0 $v0
		jal _print
		lw $v0, 196($sp)
		move $a0 $v0
		jal _print
		lw $v0, 200($sp)
		move $a0 $v0
		jal _print
		lw $v0, 204($sp)
		move $a0 $v0
		jal _print
		lw $v0, 208($sp)
		move $a0 $v0
		jal _print
		lw $v0, 212($sp)
		move $a0 $v0
		jal _print
		lw $v0, 216($sp)
		move $a0 $v0
		jal _print
		lw $v0, 220($sp)
		move $a0 $v0
		jal _print
		lw $v0, 224($sp)
		move $a0 $v0
		jal _print
		lw $v0, 228($sp)
		move $a0 $v0
		jal _print
		lw $v0, 232($sp)
		move $a0 $v0
		jal _print
		lw $v0, 236($sp)
		move $a0 $v0
		jal _print
		lw $v0, 240($sp)
		move $a0 $v0
		jal _print
		lw $v0, 244($sp)
		move $a0 $v0
		jal _print
		lw $v0, 248($sp)
		move $a0 $v0
		jal _print
		lw $v0, 252($sp)
		move $a0 $v0
		jal _print
		lw $v0, 256($sp)
		move $a0 $v0
		jal _print
		lw $v0, 260($sp)
		move $a0 $v0
		jal _print
		lw $v0, 264($sp)
		move $a0 $v0
		jal _print
		lw $v0, 268($sp)
		move $a0 $v0
		jal _print
		lw $v0, 272($sp)
		move $a0 $v0
		jal _print
		lw $v0, 276($sp)
		move $a0 $v0
		jal _print
		lw $v0, 280($sp)
		move $a0 $v0
		jal _print
		lw $v0, 284($sp)
		move $a0 $v0
		jal _print
		lw $v0, 288($sp)
		move $a0 $v0
		jal _print
		lw $v0, 292($sp)
		move $a0 $v0
		jal _print
		lw $v0, 296($sp)
		move $a0 $v0
		jal _print
		lw $v0, 300($sp)
		move $a0 $v0
		jal _print
		lw $v0, 304($sp)
		move $a0 $v0
		jal _print
		lw $v0, 308($sp)
		move $a0 $v0
		jal _print
		lw $v0, 312($sp)
		move $a0 $v0
		jal _print
		lw $v0, 316($sp)
		move $a0 $v0
		jal _print
		lw $v0, 320($sp)
		move $a0 $v0
		jal _print
		lw $v0, 324($sp)
		move $a0 $v0
		jal _print
		lw $v0, 328($sp)
		move $a0 $v0
		jal _print
		lw $v0, 332($sp)
		move $a0 $v0
		jal _print
		lw $v0, 336($sp)
		move $a0 $v0
		jal _print
		lw $v0, 340($sp)
		move $a0 $v0
		jal _print
		lw $v0, 344($sp)
		move $a0 $v0
		jal _print
		lw $v0, 348($sp)
		move $a0 $v0
		jal _print
		lw $v0, 352($sp)
		move $a0 $v0
		jal _print
		lw $v0, 356($sp)
		move $a0 $v0
		jal _print
		lw $v0, 360($sp)
		move $a0 $v0
		jal _print
		move $a0 $t9
		jal _print
		li $s0 0
		move $v0 $s0
		lw $s7, 392($sp)
		lw $s6, 388($sp)
		lw $s5, 384($sp)
		lw $s4, 380($sp)
		lw $s3, 376($sp)
		lw $s2, 372($sp)
		lw $s1, 368($sp)
		lw $s0, 364($sp)
		addu $sp, $sp, 404
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
