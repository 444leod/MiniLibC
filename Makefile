##
## EPITECH PROJECT,2024
## MiniLibC
## File description:
## Makefile
##

NAME = libasm.so

SRC = src/strlen.asm \
		src/strchr.asm \
		src/memset.asm \
		src/memcpy.asm \
		src/strcmp.asm

OBJ = $(SRC:.asm=.o)

ASM = nasm
ASMFLAGS = -f elf64

LD = ld
LDFLAGS = -shared

all: $(NAME)

$(NAME): $(OBJ)
	$(LD) $(LDFLAGS) -o $(NAME) $(OBJ)

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

run: all
	gcc -fno-builtin ./tests/test.c
	LD_PRELOAD=./libasm.so ./a.out

.PHONY: all clean fclean re
.SILENT: run

