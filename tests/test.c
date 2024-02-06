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

    // Test for memset with zero length
    char str_zero[50] = "This is a test string for memset";
    memset(str_zero, 'e', 0);
    printf("Memset zero length result: %s\n", str_zero);

    // Test for strchr
    char my_str[50] = "This is a test string for strchr";
    char *ret = strchr(my_str, 's');
    printf("Strchr result: Found '%c' at position: %ld\n", 's', ret - my_str + 1);

    // Test for strchr with non-existing character
    ret = strchr(my_str, 'z');
    if (ret == NULL) {
        printf("Strchr result: 'z' not found\n");
    }

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

    // Test for strcmp with equal strings
    char str3[15] = "Hello";
    char str4[15] = "Hello";
    result = strcmp(str3, str4);
    if(result == 0) {
        printf("Strcmp result: str3 is equal to str4\n");
    }

    // Test for strlen
    char strlen_str[50] = "This is a test string for strlen";
    printf("Strlen result: %zu\n", strlen(strlen_str));

    // Test for strlen with empty string
    char strlen_empty[50] = "";
    printf("Strlen result for empty string: %zu\n", strlen(strlen_empty));

        // Test for strncmp
    char str5[15] = "Hello";
    char str6[15] = "Hello, World!";
    result = strncmp(str5, str6, 5);
    if(result < 0) {
        printf("Strncmp result: str5 is less than str6\n");
    } else if(result > 0) {
        printf("Strncmp result: str5 is greater than str6\n");
    } else {
        printf("Strncmp result: str5 is equal to str6\n");
    }

    // Test for strncmp with equal strings
    char str7[15] = "Hello";
    char str8[15] = "Hello";
    result = strncmp(str7, str8, 5);
    if(result == 0) {
        printf("Strncmp result: str7 is equal to str8\n");
    }

    // Test for strncmp with non-equal strings
    char str9[15] = "Hello";
    char str10[15] = "World";
    result = strncmp(str9, str10, 5);
    if(result < 0) {
        printf("Strncmp result: str9 is less than str10\n");
    } else if(result > 0) {
        printf("Strncmp result: str9 is greater than str10\n");
    } else {
        printf("Strncmp result: str9 is equal to str10\n");
    }

    // Test for strncmp with strings of different lengths
    char str11[15] = "Hello";
    char str12[15] = "Hello, World!";
    result = strncmp(str11, str12, 15);
    if(result < 0) {
        printf("Strncmp result: str11 is less than str12\n");
    } else if(result > 0) {
        printf("Strncmp result: str11 is greater than str12\n");
    } else {
        printf("Strncmp result: str11 is equal to str12\n");
    }

        // Test for strcasecmp with equal strings
    char str13[15] = "Hello";
    char str14[15] = "HELLO";
    result = strcasecmp(str13, str14);
    if(result == 0) {
        printf("Strcasecmp result: str13 is equal to str14\n");
    }

    // Test for strcasecmp with non-equal strings
    char str15[15] = "Hello";
    char str16[15] = "World";
    result = strcasecmp(str15, str16);
    if(result < 0) {
        printf("Strcasecmp result: str15 is less than str16\n");
    } else if(result > 0) {
        printf("Strcasecmp result: str15 is greater than str16\n");
    } else {
        printf("Strcasecmp result: str15 is equal to str16\n");
    }

    // Test for strcasecmp with strings of different lengths
    char str17[15] = "Hello";
    char str18[15] = "HELLO, WORLD!";
    result = strcasecmp(str17, str18);
    if(result < 0) {
        printf("Strcasecmp result: str17 is less than str18\n");
    } else if(result > 0) {
        printf("Strcasecmp result: str17 is greater than str18\n");
    } else {
        printf("Strcasecmp result: str17 is equal to str18\n");
    }

    return 0;
}
