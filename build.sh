nasm ./boot/boot_loader.asm -o boot.bin
nasm ./kernal/kernal_entry.asm -o kernal_entry.bin
nasm ./kernal/kernal_sector.asm -f elf -o kernal_sector.o
x86_64-elf-gcc ./kernal/kernal.c -m32 --freestanding -c -o kernal.o
x86_64-elf-ld --oformat binary --Ttext 0x8000 -melf_i386 --entry main kernal_sector.o kernal.o -o kernal.bin
dd if=/dev/zero of=image.bin bs=512 count=1
dd if=kernal.bin of=image.bin conv=notrunc
cat boot.bin kernal_entry.bin > image.tmp
cat image.tmp image.bin >image.img
rm boot.bin kernal_entry.bin 
rm kernal_sector.o kernal.o
rm kernal.bin image.bin
rm image.tmp