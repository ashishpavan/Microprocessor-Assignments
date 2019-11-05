data segment
msg db 0dh,0ah,"enter the number:$"
msg1 db 0dh,0ah,"the 2's complement is :$"
data ends
code segment
assume cs:code,ds:data
start:

mov ax,data
mov ds,ax;

mov dx,offset msg
mov ah,09h
int 21h

mov ah,01h
int 21h
call input
mov dl,al;
shl dl,04h;

mov ah,01h
int 21h
call input
add dl,al;


neg dl;
mov bl,dl;

mov dx,offset msg1
mov ah,09h
int 21h

mov dl,bl;
shr dl,04h;
call output
mov ah,02h
int 21h

mov dl,bl;
and dl,0fh
int 21h
call output
mov ah,02h
int 21h

mov ah,4ch
int 21h

input proc
cmp al,41h
jc a1
sub al,07h
a1:
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

