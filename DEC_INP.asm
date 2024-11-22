.model small
.stack 100h
.data
str1 db "Enter operand 1: $"
str2 db 10,13,"Enter operand 2: $"
str3 db 10,13, "Enter operator: $"
str4 db 10,13,"Answer is: $"
.code
main proc
mov ax,@data
mov ds,ax

mov dx,offset str1
mov ah,9
int 21h
again:mov ah,1
int 21h
cmp al,13
je op2

 sub al,48
mov cl,al
mov bx,0

mov ch,0

mov ax,bx
mov bx,10

mul bx

add ax,cx

mov bx,ax

jmp again


push bx


op2:mov dx,offset str2
mov ah,9
int 21h

again1:mov ah,1
int 21h
cmp al,13
je op3

 sub al,48
mov cl,al

mov ch,0
mov bx,0

mov ax,bx
mov bx,10

mul bx

add ax,cx

mov bx,ax

jmp again1

push bx


op3: mov dx,offset str3

mov ah,9
int 21h
pop bx
pop cx
mov ah,1
int 21h



cmp al,'+'
je plus

cmp al,'-'
je subt

cmp al,'*'
je mult

cmp al,'%'
je mm

plus: add cx,bx


mov dl,ch
mov ah,2
int 21h






mov dl,cl
mov ah,2
int 21h
jmp exit

subt:sub cx,bx
add cx,48

mov dl,ch
mov ah,2
int 21h

mov cl,bl
mov ah,2
int 21h
jmp exit


mult: mov ax,cx
mul bx

sub ax,48


mov dl,ah
mov ah,2
int 21h

mov dl,al
mov ah,2
int 21h
jmp exit

mm: mov dx,0
mov ax,cx
div bx
sub bx,48
mov dl,bh
mov ah,2h
int 21h
mov dl,bl
mov ah,2
int 21h

exit:mov ah,4ch
int 21h






main endp
end main
