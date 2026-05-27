#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

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

void free_string(char* s) {
    if (s) free(s);
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

void string_set_char_at(char* s, long long index, long long c) {
    if (s) s[index] = (char)c;
}

char* float_to_string(double value) {
    char* buffer = (char*)malloc(64);
    if (buffer) { snprintf(buffer, 64, "%f", value); }
    return buffer;
}

char* bool_to_string(bool value) {
    return value ? "true" : "false";
}

bool string_starts_with(const char* s, const char* prefix) {
    if (!s || !prefix) return false;
    return strncmp(s, prefix, strlen(prefix)) == 0;
}

bool string_contains(const char* s, const char* sub) {
    if (!s || !sub) return false;
    return strstr(s, sub) != NULL;
}

bool string_equals(const char* s1, const char* s2) {
    if (s1 == NULL || s2 == NULL) {
        return s1 == s2;
    }
    return strcmp(s1, s2) == 0;
}

char* string_concat(const char* a, const char* b) {
    if (!a) a = "";
    if (!b) b = "";
    size_t la = strlen(a), lb = strlen(b);
    char* buf = (char*)malloc(la + lb + 1);
    if (buf) { memcpy(buf, a, la); memcpy(buf + la, b, lb); buf[la + lb] = '\0'; }
    return buf;
}

char* string_substring(const char* s, long long start, long long end) {
    if (!s) return "";
    long long len = strlen(s);
    if (start < 0) start = 0;
    if (end < 0 || end > len) end = len;
    if (start > end) start = end;
    long long sub_len = end - start;
    char* buffer = (char*)malloc(sub_len + 1);
    if (buffer) {
        strncpy(buffer, s + start, sub_len);
        buffer[sub_len] = '\0';
    }
    return buffer;
}

char* string_replace(const char* s, const char* old_str, const char* new_str) {
    if (!s || !old_str || !new_str) return "";
    size_t old_len = strlen(old_str);
    if (old_len == 0) return (char*)s;
    size_t new_len = strlen(new_str);
    
    int count = 0;
    const char* tmp = s;
    while((tmp = strstr(tmp, old_str))) { count++; tmp += old_len; }
    
    size_t result_len = strlen(s) + count * (new_len - old_len);
    char* result = (char*)malloc(result_len + 1);
    if (!result) return "";
    
    char* out = result;
    tmp = s;
    const char* next;
    while((next = strstr(tmp, old_str))) {
        size_t diff = next - tmp;
        strncpy(out, tmp, diff);
        out += diff;
        strcpy(out, new_str);
        out += new_len;
        tmp = next + old_len;
    }
    strcpy(out, tmp);
    return result;
}

long long char_to_int(char c) {
    return (long long)c; 
}

// Bootstrapping functions have been ported to Nera's standard library.
bool is_null(void* ptr) {
    return ptr == NULL;
}
