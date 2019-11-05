
data segment
msg1 db 0dh,0ah,"enter the dividend:$" 
msg2 db 0dh,0ah,"enter the divisor:$"
result1 db 0dh,0ah,"the quotient is :$"
result2 db 0dh,0ah,"the remainder is :$"
value dw ?
var1 db ?
var2 db ?
data ends
code segment
assume cs:code,ds:data
start:

mov ax,data
mov ds,ax

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

;second input

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

;division logic var1:quotient var2:remainder

mov bh,00h;
mov value,bx;
mov dh,00h;
a:

sub value,dx;
inc var1
cmp value,dx
jb label1
jmp a
label1:

;print the output
mov dx,value
mov var2,dl;

mov dx,offset result1
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

mov dx,offset result2
mov ah,09h
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
