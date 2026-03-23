.set MAGIC, 0x1badb002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM

.section .text
.extern kernelMain
.global loader

loader:
    mov kernel_stack, %esp

    #The bootloader(GRUB) stores the pointer to multiboot struct in AX register(it has info like size of your RAM)
    push %eax 

    #The bootloader(GRUB) stores the MAGIC number in BX register
    push %ebx

    call kernelMain

_stop:
    cli
    hlt
    jmp _stop

.section .bss
.space 2 * 1024 * 1024 #2MB
kernel_stack:
new_var:

