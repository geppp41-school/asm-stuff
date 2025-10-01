section	.data
msg db 'Hello, world!', 0xa  ;string to be printed
len equ $ - msg     ;length of the string
num int 10
count int 0

section	.text
   global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
   mov	edx,len     ;message length
   mov	ecx,msg     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   mov eax, 3
   mov ebx, 2
   mov ecx, input_buffer
   mov edx, 256
   int 0x80 
	
   jmp main_loop
   int 0x80
   

print:
   mov eax, 4
   mov ebx, 1
   mov ecx, msg
   mov edx, len
   int 0x80



main_loop:
   mov eax, count
   mov ebx, num
   cmp eax, ebx
   jle exit
   int 0x80

   mov eax, 4
   mov ebx, 1
   mov ecx, msg
   mov edx, len
   int 0x80

   mov eax, count
   inc eax
   mov [count], eax
   int 0x80

   mov eax, 4
   mov ebx, 1
   mov ecx, [count]
   mov edx, 8
   int 0x80

   jmp main_loop
   int 0x80

exit:
   mov eax, 1 
   mov ebx, 0
   int 0x80

section .bss
   input_buffer resb 256