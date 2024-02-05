/*
** EPITECH PROJECT,2024
** MiniLibC
** File description:
** test
*/

#include "libasm.h"
#include <stdio.h>
#include <string.h>

int main(int argc, char const *argv[])
{
    // Test for memcpy
    char src[50] = "This is a test string for memcpy";
    char dest[50];
    memcpy(dest, src, strlen(src)+1);
    printf("Memcpy result: %s\n", dest);

    // Test for memset
    char str[50] = "This is a test string for memset";
    memset(str, 'e', 7);
    printf("Memset result: %s\n", str);

    // Test for strchr
    char my_str[50] = "This is a test string for strchr";
    char *ret = strchr(my_str, 's');
    printf("Strchr result: Found '%c' at position: %ld\n", 's', ret - my_str + 1);

    // Test for strcmp
    char str1[15] = "Hello";
    char str2[15] = "World";
    int result = strcmp(str1, str2);
    if(result < 0) {
        printf("Strcmp result: str1 is less than str2\n");
    } else if(result > 0) {
        printf("Strcmp result: str1 is greater than str2\n");
    } else {
        printf("Strcmp result: str1 is equal to str2\n");
    }

    // Test for strlen
    char strlen_str[50] = "This is a test string for strlen";
    printf("Strlen result: %zu\n", strlen(strlen_str));

    return 0;
}
