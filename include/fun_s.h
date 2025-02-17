#ifdef _WIN32
#ifndef DLL_IMPORT
__declspec(dllexport) void fun_s();
#endif

#ifdef DLL_IMPORT
__declspec(dllimport) void fun_s();
#endif
#endif

#ifndef _WIN32
void fun_s();
#endif
