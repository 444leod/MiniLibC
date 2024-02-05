#include <stddef.h>

void	*memcpy(void *dest, const void *src, size_t n);
void	*memmove(void *dest, const void *src, size_t n);
void	*memset(void *s, int c, size_t n);
char	*rindex(const char *s, int c);
int	strcasecmp(const char *s1, const char *s2);
char	*strchr(const char *s, int c);
int	strcmp(const char *s1, const char *s2);
size_t	strcspn(const char *s, const char *reject);
size_t	strlen(const char *s);
int	strncmp(const char *s1, const char *s2, size_t n);
char	*strpbrk(const char *s, const char *accept);
