#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_int(long long value) {
    printf("%lld\n", value);
}

void print_float(double value) {
    printf("%f\n", value);
}

int global_argc = 0;
char** global_argv = NULL;

extern int nera_main();

int main(int argc, char** argv) {
    global_argc = argc;
    global_argv = argv;
    return nera_main();
}

long long get_arg_count() {
    return (long long)global_argc;
}

char* get_arg(long long index) {
    if (index >= 0 && index < global_argc) {
        return global_argv[index];
    }
    return NULL;
}

char* int_to_string(long long value) {
    char* buffer = (char*)malloc(32);
    if (buffer) {
        snprintf(buffer, 32, "%lld", value);
    }
    return buffer;
}

char* concat_strings(const char* s1, const char* s2) {
    if (!s1) s1 = "";
    if (!s2) s2 = "";
    
    size_t len1 = strlen(s1);
    size_t len2 = strlen(s2);
    
    char* buffer = (char*)malloc(len1 + len2 + 1);
    if (buffer) {
        strcpy(buffer, s1);
        strcat(buffer, s2);
    }
    return buffer;
}
