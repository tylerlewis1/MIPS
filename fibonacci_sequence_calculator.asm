.data
prompt: .asciiz "Enter the number of itterations you want.\n"
.align 2
prompt1: .asciiz "would like to print the values as they are calculated?\n 1 = yes, 0 = no\n" 
.align 2
newline: .asciiz "\n"
.align 2
ittext: .asciiz "itteration "
.align 2
colon: .asciiz ": "
.align 2
final: .asciiz "The final answer is: "
.align 2
numbers: .word 0, 1
.text
la $s0, prompt			#loading prompt in to $s0
la $s1, prompt1		#loading prompt 1 in to $s1
la $s2, numbers		#loading numb var
addi $v0, $zero, 4		#setting syscall to print string
add $a0, $zero, $s0		#putting prompt into $a0
syscall				#print string
addi $v0, $zero, 5		#setting syscall to read int	
syscall				#getdata
addi $t0, $v0, 0		#max = itterations
addi $v0, $zero, 4		#setting syscall to print string
add $a0, $zero, $s1		#putting prompt1 into $a0
syscall				#print string
addi $v0, $zero, 5		#setting syscall to read int	
syscall				#getdata
add $t1, $zero, $v0		#print data true or false
addi $t2, $zero, 0		#i = 0
FOR:
	addi $t2, $t2, 1		#i++
	slt $t3, $t2, $t0	#i < max
	beq $t3, $zero, END #if i !< max -> end
	lw $t3, 0($s2)		#numbers[0] -> $t3
	lw $t4, 4($s2)		#numbers[1] -> $t4
	beq $t1, $zero, SKIP#if print = false skip code
	addi $v0, $zero, 4	#setting syscall to print string
	la $a0, ittext		#load ittext
	syscall			#print
	addi $v0, $zero, 1	#setting syscall to print int
	addi $a0, $t2, 	0	#load i  in $a0
	syscall			#print
	addi $v0, $zero, 4	#setting syscall to print string
	la $a0, colon		#load colon
	syscall			#print
	addi $v0, $zero, 1	#setting syscall to print int
	lw $a0, 4($s2)		#load number[1]
	syscall			#print
	addi $v0, $zero, 4	#setting syscall to print string
	la $a0, newline		#load newline
	syscall			#print
SKIP:
	add $t5, $t4, $t3 	#$t5 = numbers[0] + numbers[1]
	sw $t4, 0($s2)		#updata last number
	sw $t5, 4($s2)		#update new number
	j FOR			#jump to for loop
END:
	addi $v0, $zero, 4	#set syscall to print string
	la $a0, final		#load text into $a0
	syscall			#print
	addi $v0, $zero, 1	#setting syscall to print int
	lw $a0, 4($s2)		#loading answer
	syscall			#print
	addi $v0, $zero, 10	#clean up	
	syscall			#end program