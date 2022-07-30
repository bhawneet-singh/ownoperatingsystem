print_string:
	pusha

_init_str:
	mov al,[bx]
	cmp al,0
	je done
	mov ah,0x0e
	int 0x10
	inc bx
	jmp _init_str

done:
	popa
	ret
	