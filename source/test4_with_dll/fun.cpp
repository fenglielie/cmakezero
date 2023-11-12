#include "fun_s.h"
#include <cstdio>

#ifdef WIN32
__declspec(dllexport) void fun_s() {
    printf("this is function fun_s\n");
}

#endif

#ifndef WIN32
void fun_s() {
    printf("this is function fun_s\n");
}
#endif
