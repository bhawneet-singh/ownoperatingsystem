[bits 16]
[org 0x7e00]
_start:
	jmp start_protected_mode

start_protected_mode:
	cli
	call enable_A20_line
	lgdt [gdt_dis]
	mov eax,cr0
	or eax,1
	mov cr0,eax
	jmp codeseg:start_pm

enable_A20_line:
	in al,0x92
	or al,2
	out 0x92,al
	ret

[bits 32]
start_pm:
	mov ax,dataseg
	mov es,ax
	mov ds,ax
	mov ss,ax
	mov gs,ax
	mov fs,ax
	jmp 0x8000

%include "./kernal/gdt.asm"
times 512 - ($ - $$) db 0