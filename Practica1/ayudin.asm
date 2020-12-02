section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point
   mov eax, 4
   mov ebx, 1
   mov ecx, input1
   mov edx, len1
   int 0x80

   mov eax, 3
   mov ebx, 0
   mov ecx, num1
   mov edx, 2
   int 0x80

   mov eax, 4
   mov ebx, 1
   mov ecx, input2
   mov edx, len2
   int 0x80

   mov eax, 3
   mov ebx, 0
   mov ecx, num2
   mov edx, 2
   int 0x80
 
   mov eax,[num1]
   sub eax, '0'

   mov ebx,[num2]
   sub ebx, '0'

   div ebx
   add eax, '0'

   mov [res],eax 
   mov	ecx,msg	
   mov	edx, len
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
	
   mov	ecx,res
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
	
   mov	eax,1	;system call number (sys_exit)
   int	0x80	;call kernel
	
section .data
  input1 db "Ingresa un numero: "
  len1 equ $- input1

  input2 db "Ingresa un segundo numero: "
  len2 equ $- input2
  
  msg db "The result is:", 0xA,0xD 
  len equ $- msg   
segment .bss
  num1 resb 2
  num2 resb 2
  res resb 1	