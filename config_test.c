#include <rules_autoconf/config.h>

#if __has_include(<stdio.h>)
#ifndef HAVE_STDIO_H
#error "HAVE_STDIO_H must be defined when the target can include stdio.h"
#endif
#elif defined(HAVE_STDIO_H)
#error "HAVE_STDIO_H must not be defined when the target cannot include stdio.h"
#endif

int main() { return 0; }
