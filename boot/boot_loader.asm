[bits 16]
[org 0x7c00]
_start:
	mov [boot_disk],dl
	call load_disk
	jmp 0x7e00

%include "./print_service/print_service.asm"	
%include "./load_disk/load_disk.asm"
times 510 - ($ - $$) db 0
dw 0xaa55