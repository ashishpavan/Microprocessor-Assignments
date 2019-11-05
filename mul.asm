data segment
msg1 db 0dh,0ah,"enter the multiplicand :$"
msg2 db 0dh,0ah,"enter the multiplier :$"
result db 0dh,0ah,"the multiplication is :$"
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
call input
add bl,al

int ah,01h
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
call input
add dl,al


int ah,01h
int 21h

mul dl
mov bl,dl
call output

;result 
mov dx,offset result
mov ah,09h
int 21h

mov dl,ah
and dl,0f0h
ror dl,04h
call output
mov ah,02h
int 21h

mov dl,ah
and dl,0fh
call output
mov ah,02h
int 21h

mov dl,al
and dl,0f0h
ror dl,04h
call output
mov ah,02h
int 21h

mov dl,al
and dl,0fh
call output
mov ah,02h
int 21h

int ah,4ch
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
cmp bl,0ah
jc b
add bl,07h
b:
add bl,30h
ret 
endp



code ends
end start







