.model small
.stack 100h
.data
	str1 db 10,13, 'myStr: $'
	str2 db 10,13,'ch: $'
	str3 db 10,13,'Modified String: $'
	arr1 db 100 dup('?')
	arr2 db 100 dup('?')
	var1 dw 0
	var2 dw 0
.code
	main proc
		mov ax,@data
		mov ds,ax
		mov es,ax
		lea dx,str1
		mov ah,9
		int 21h
		
		lea di,arr1
		cld
		
again: mov ah,1
	int 21h
	
	cmp al,13
	je aa
	
	stosb
	
	inc var1
	jmp again
	
aa:	lea dx,str2
	mov ah,9
	int 21h
	
	mov ah,1
	int 21h
	
	lea si,arr1
	lea di,arr2
	
	mov cx,var1
	
	cld
	
cc:	mov bh,[si]
	cmp bh,al
	
	je d1
	
	
	movsb
	inc var2
	jmp bb
d1: inc si	
bb:loop cc

lea dx,str3
mov ah,9
int 21h

lea si,arr2
cld
mov cx,var2

ee:lodsb
mov dl,al
mov ah,2
int 21h

loop ee

mov ah,4ch 
int 21h

main endp
end main
	
		