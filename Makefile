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
		src/memmove.asm \

TESTS_SRC	=	test2/test.c			\
				test2/test_strlen.c		\
				test2/test_strchr.c		\
				test2/test_strrchr.c	\
				test2/test_memset.c		\
				test2/test_memcpy.c		\
				test2/test_memmove.c	\
				test2/test_strcmp.c		\
				test2/test_strncmp.c	\
				test2/test_strcasecmp.c	\
				test2/test_strpbrk.c	\
				test2/test_strcspn.c	\
				test2/test_strstr.c

TESTS_FLAGS	=	-fno-builtin -I./test2/include/

TESTS_NAME	=	unit_tests

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
	rm -f $(TESTS_NAME)

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

tests_run2:	re $(TESTS_NAME)
	@./$(TESTS_NAME)

$(TESTS_NAME):
	@$(CC) $(FLAGS) $(TESTS_FLAGS) -o $(TESTS_NAME) $(TESTS_SRC)

.PHONY: all clean fclean re
.SILENT: run tests_run
