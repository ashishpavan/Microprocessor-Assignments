data segment
msg1 db 0dh,0ah,"enter the divisor :$"
msg2 db 0dh,0ah,"enter the dividend :$"
result db 0dh,0ah,"the division is :$"
data ends
code segment
assume cs:code,ds:data
start
mov ax,data
mov ds,ax

mov dx,offset msg1
mov ah,09h
int 21h

mov ah,01h
int 21h

call input
mov 

mov dx,offset msg2
mov sh,09h
int 21h 