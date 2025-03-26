.data
numbers:	.space 2
prompt1: .asciiz "Enter int 1 \n"
.align 2
prompt2: .asciiz "Enter int 2 \n"
.align 2
extras: .asciiz " + ", " = "
.align 2
.text
la $s0, numbers		#moving vars to registers
la $s1, prompt1		#moving vars to registers
la $s2, prompt2		#moving vars to registers
la $s3, extras			#moving vars to registers
addi $v0, $zero, 4		#setting it to print string
add $a0, $zero, $s1		#moveing data into print var
syscall				#print
addi $v0, $zero, 5		#setting up syscall to read int
syscall				#reading
add $t0, $zero, $v0		#storing the data in a temp registry
sw $t0, 0($s0)			#moving data to numbers[0]
addi $v0, $zero, 4		#setting it to print string
add $a0, $zero, $s2		#moveing data into print var
syscall				#print
addi $v0, $zero, 5		#setting up syscall to read int
syscall				#reading
add $t0, $zero, $v0		#storing the data in a temp registry
sw $t0, 4($s0)			#moving data to numbers[1]
lw $t0, 0($s0)			#putting numbers[0] in temp register 0
lw $t1, 4($s0)			#putting numbers[1] in temp register 1
add $t2, $t0, $t1		#adding values
add $a0, $zero, $t0		#numbers[0] in $a0
addi $v0, $zero, 1		#setting syscall to print int
syscall				#print
la $t0, 0($s3)			#puts extras[0] in $t0
add $a0, $zero, $t0		#extras[0] in $a0
addi $v0, $zero, 4		#setting syscall to print string
syscall				#print
add $a0, $zero, $t1		#numbers[1] in $a0
addi $v0, $zero, 1		#setting syscall to print int
syscall				#print
la $t0, 4($s3)			#puts extras[1] in $t0
add $a0, $zero, $t0		#extras[1] in $a0
addi $v0, $zero, 4		#setting syscall to print string
syscall				#print
add $a0, $zero, $t2		#answer in $a0
addi $v0, $zero, 1		#setting syscall to print int
syscall				#print
addi $v0, $zero, 10		#cleaning out syscall
syscall				#end of program