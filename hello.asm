format ELF executable 3

segment readable executable

entry start

start:
  mov  eax,4
  mov  ebx,1
  mov  ecx,msg
  mov  edx,len
  int  0x80

  mov  eax,1
  xor  ebx,ebx
  int  0x80

segment readable writeable

msg db "Hello, World!",0x0a
len = $ - msg
