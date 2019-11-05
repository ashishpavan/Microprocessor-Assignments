data segment
msg db 0dh,0ah,'enter the length of the array: $'
msg1 db 0dh,0ah,'enter the numbers:$'
result db 0dh,0ah,'the minimum number is :$'
len db ?
min db ?
data ends

code segment
	assume cs:code,ds:data
start:

mov ax,data
mov ds,ax

mov dx,offset msg
mov ah,09h
int 21h

mov ah,01h
int 21h

call inp

mov len,al

mov cl,len;
mov ch,00h;

mov si,4000h

mov min,0ffh


mov dx,offset msg1
mov ah,09h
int 21h


a:

	mov ah,01h
	int 21h
	call inp

	mov bl,al
	rol bl,04h

	mov ah,01h
	int 21h

	call inp
	add bl,al
	cmp min,bl
	jc b
	mov min,bl
	
    b:
	mov [si],bl
	
	inc si
	
	mov ah,01h
	int 21h

loop a

mov dx,offset result
mov ah,09h
int 21h

mov bl,min;
and bl,0f0h;
ror bl,04h
call op;

mov dl,bl;
mov ah,02h
int 21h

mov bl,min
and bl,0fh
call op;

mov dl,bl
mov ah,02h
int 21h


mov ah,4ch
int 21h

inp proc
cmp al,41h
jc label1
sub al,07h
label1:
sub al,30h
ret 
endp

op proc
cmp bl,0ah
jc label2
add bl,07h
label2:
add bl,30h
ret 
endp


code ends
end start




