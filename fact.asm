data segment 
msg db 0dh,0ah,"enter the single digit number:$"
result db 0dh,0ah,"the factorial is:$"
var1 db ?
var2 db ?
data ends
code segment
assume cs:code,ds:data
start:
 mov ax,data
 mov ds,ax;
 
 mov dx,offset msg
 mov ah,09h
 int 21h
 
 ;taking input
 mov ah,01h
 int 21h
 
 sub al,30h
 mov dl,al
 mov cl,al
 mov ah,01h;
 mov al,01h;
 
 a1:
 mul cl
 loop a1
 
mov var1,ah;
mov var2,al;
 
mov dx,offset result
mov ah,09h
int 21h


mov dl,var1;
and dl,0f0h
ror dl,04h
call output
mov ah,02h
int 21h

mov dl,var1;
and dl,0fh
call output
mov ah,02h
int 21h

mov dl,var2;
and dl,0f0h
ror dl,04h
call output
mov ah,02h
int 21h

mov dl,var2;
and dl,0fh
call output
mov ah,02h
int 21h

mov ah,4ch
int 21h

input proc
cmp al,41h
jc a
sub al,07h
a:
sub al,30h
ret 
endp


output proc
cmp dl,0ah
jc b
add dl,07h
b:
add dl,30h
ret 
endp

code ends
end start









