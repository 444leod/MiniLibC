##
## EPITECH PROJECT, 2024
## MiniLibC
## File description:
## Makefile
##

NAME = libasm.so

SRC = src/strlen.asm \
		src/strchr.asm \
		src/memset.asm \
		src/memcpy.asm \
		src/strcmp.asm \
		src/strncmp.asm \
		src/strcasecmp.asm \
		src/strrchr.asm \
		src/strpbrk.asm \
		src/strstr.asm \
		src/strcspn.asm \

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

tests_run: all
	gcc -fno-builtin ./tests/test.c
	LD_PRELOAD=./libasm.so ./a.out > test.txt
	./a.out > test2.txt
	diff -q test.txt test2.txt >/dev/null 2>&1; \
    if [ $$? -eq 0 ]; then \
        echo "SUCCESS"; \
    else \
        diff test.txt test2.txt; \
    fi
	rm -f test.txt test2.txt
	rm -f ./a.out

run: all
	gcc -fno-builtin ./tests/test.c
	LD_PRELOAD=./libasm.so ./a.out

tests_run1: re $(NAME)
	cd test && gcc main.c tests.c -ldl -Wall -Wextra && ./a.out

.PHONY: all clean fclean re
.SILENT: run tests_run
