MAGIC_NUMBER equ 0x1BADB002           ; need this in multiboot section to let GRUB know this is kernel
FLAGS equ 0x0                         ; multiboot flags
CHECKSUM equ -(MAGIC_NUMBER + FLAGS)  ; calculating checksum -> checksum + MAGIC + FLAGS = 0

section .multiboot:
align 4                               ; we need to align all labels to addresses divisible by 4
    dd MAGIC_NUMBER                   ; we want GRUB to know that this is multiboot loader, and for that it needs MAGIC NUMBER
    dd FLAGS
    dd CHECKSUM


section .text
global loader                         ; entry symbol for ELF. Makes loader available outside the file
loader:
    mov eax, 0xCAFEBABE               ; AX register is loaded with this

.loop:
    jmp .loop                         ; loop forever



