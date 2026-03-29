ASPARAMS = -f elf32
ELFPARAMS = -melf_i386
LINKER_SCRIPT = linker.ld

%.o: %.s
	nasm $(ASPARAMS) $< -o $@ 

kernel.elf: loader.o
	ld -T $(LINKER_SCRIPT) $(ELFPARAMS) $^ -o  $@

clean:
	rm kernel.elf loader.o
