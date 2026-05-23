#include <stdio.h>
#include <stdlib.h>

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
