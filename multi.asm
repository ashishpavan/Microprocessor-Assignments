data segment
msg1 db 0dh,0ah,"enter the multiplicand :$"
msg2 db 0dh,0ah,"enter the multiplier :$"
result db 0dh,0ah,"the multiplication is :$"
var1 db ?
var2 db ?

data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

;first input
mov dx,offset msg1
mov ah,09h
int 21h

mov ah,01h
int 21h

call input

mov bl,al
rol bl,04h

mov ah,01h
int 21h
call input
add bl,al

mov ah,01h
int 21h


; second input
mov dx,offset msg2
mov ah,09h
int 21h 

mov ah,01h
int 21h

call input
mov dl,al
rol dl,04h

mov ah,01h
int 21h
call input
add dl,al

mov ah,01h
int 21h

mov al,bl;
mul dl
mov var1,ah;
mov var2,al;

;result 
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







