Data segment
msg1 db 0dh,0ah,"Enter the first string - $"
msg2 db 0dh,0ah,"Enter the second string - $"
msg3 db 0dh,0ah,"The concatenation is  - $"
len1 db ?
len2 db ?
Data ends  

Code segment
assume CS:Code,DS:Data
start:
mov ax,Data
mov DS,ax
;
mov dx,offset msg1
mov ah,09h
int 21h
;accept1
mov si,1000h
mov di,1000h
mov cx,0000h
label1:
mov ah,01h
int 21h

cmp al,0dh
je skip
mov [si],al
mov [di],al
inc si
inc di
inc cx
jmp label1
skip:mov len1,cl
;
mov dx,offset msg2
mov ah,09h
int 21h
;accept2
mov si,2000h
mov di,2000h
mov cx,0000h
label2:
mov ah,01h
int 21h

cmp al,0dh
je skip2
mov [si],al
mov [di],al
inc si
inc di
inc cx
jmp label2
skip2:mov len2,cl
;
mov dx,offset msg3
mov ah,09h
int 21h
;concat
mov di,2000h
mov si,1000h
mov bl,len1
mov bh,00h
add si,bx
mov ch,00h
mov cl,len2

label3:
mov bl,[di]
mov [si],bl
inc si
inc di
loop label3
;display
mov bl,len2
add len1,bl
mov si,1000h
mov ch,00h
mov cl,len1
label4:
mov dl,[si]
mov ah,02h
int 21h
inc si
loop label4
;
mov ah,4ch
int 21h

Code ends
end start








