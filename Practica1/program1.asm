SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .data 

   msg1 db "Ingresa un numero: ", 0xA,0xD 
   len1 equ $- msg1 

   msg2 db "Ingresa un segundo numero: ", 0xA,0xD 
   len2 equ $- msg2 

   msg3 db "La suma dada es: "
   len3 equ $- msg3

   msg4 db 0xA,0xD,"La resta dada es: "
   len4 equ $- msg4

   msg5 db 0xA,0xD,"La multiplicacion dada es: "
   len5 equ $- msg5

   msg6 db 0xA,0xD,"La division dada es: "
   len6 equ $- msg6

   msg7 db 0xA,0xD,' '
   len7 equ $- msg7 

segment .bss
   num1 resb 2 
   num2 resb 2
   aux1 resb 2
   aux2 resb 2 
   res resb 2
   res1 resb 2
   res2 resb 2
   divi resb 1    

section	.text
   global _start
	
_start:             
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                

   mov eax, SYS_READ 
   mov ebx, STDIN  
   mov ecx, num1 
   mov edx, 2
   int 0x80            

   mov eax, SYS_WRITE        
   mov ebx, STDOUT         
   mov ecx, msg2          
   mov edx, len2         
   int 0x80

   mov eax, SYS_READ  
   mov ebx, STDIN  
   mov ecx, num2 
   mov edx, 2
   int 0x80        

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3          
   mov edx, len3         
   int 0x80

   ; moving the first number to eax register and second number to ebx
   ; and subtracting ascii '0' to convert it into a decimal number
	
   mov eax, [num1]
   sub eax, '0'
	
   mov ebx, [num2]
   sub ebx, '0'

   ; add eax and ebx
   add eax, ebx
   ; add '0' to to convert the sum from decimal to ASCII
   add eax, '0'

   ; storing the sum in memory location res
   mov [res], eax

   ; print resultado de la suma 
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, res         
   mov edx, 1        
   int 0x80

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg4          
   mov edx, len4         
   int 0x80

   mov eax, [num1]
   sub eax, '0'

   mov ebx, [num2]
   sub ebx, '0'

   sub eax, ebx
   add eax, '0'

   mov [res1], eax

   ; print resultado de la resta 
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, res1         
   mov edx, 1        
   int 0x80

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg5          
   mov edx, len5         
   int 0x80

    mov eax, [num1]
    sub eax, '0'

    mov ebx, [num2]
    sub ebx, '0'

    mul ebx
    add eax, '0'

    mov [res2], eax

   ; print resultado de la multiplicacion   
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, res2         
   mov edx, 1        
   int 0x80

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg6          
   mov edx, len6         
   int 0x80

   mov eax, [aux1]
   sub eax, '0'

   mov ebx, [aux2]
   sub ebx, '0'

   div ebx
   add eax, '0'

   mov [divi], eax

   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, divi         
   mov edx, 1        
   int 0x80

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg7          
   mov edx, len7         
   int 0x80

exit:    
   mov eax, SYS_EXIT   
   xor ebx, ebx 
   int 0x80

