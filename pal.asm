data segment
msg1 db 0dh,0ah,"enter the string: $";
msg2 db 0dh,0ah,"it is a palindrome: $";
msg3 db 0dh,0ah,"it is a not palindrome: $";
len db ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

mov dx,offset msg1
mov ah,09h
int 21h

mov si,2000h
mov cl,00h;

a:

mov ah,01h
int 21h


cmp al,24h
je b
call input
mov [si],al
inc si
inc cl
jmp a

b:

mov [si],al;
mov dl,cl;
call output;
mov ah,02h
int 21h;

mov si,2000h
mov len,cl;

var:
mov dl,[si]
call output
mov ah,02h
int 21h
inc si
loop var


mov ah,4ch
int 21h

input proc
cmp al,41h
jc am
sub al,07h
am:
sub al,30h
ret 
endp


output proc
cmp dl,0ah
jc b1
add dl,07h
b1:
add dl,30h
ret 
endp


code ends
end start
