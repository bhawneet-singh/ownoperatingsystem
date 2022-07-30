load_disk:
	pusha

_init_disk:
	mov al,0x03
	mov ah,0x02
	mov dh,0x00
	mov ch,0x00
	mov cl,0x02
	mov dl,[boot_disk]
	mov bx,space
	int 0x13
	jc disk_error

	popa 
	ret
boot_disk:
	db 0

disk_error:
	mov bx,err_msg
	call print_string 
	popa
	ret

space equ 0x7e00

err_msg:
	db "something went wrong while reading sector...",0