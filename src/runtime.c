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
    char* buffer = (char*)malloc(6);
    strcpy(buffer, value ? "true" : "false");
    return buffer;
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
    if (!s) return (char*)calloc(1, 1);
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
    if (!s || !old_str || !new_str) return (char*)calloc(1, 1);
    size_t old_len = strlen(old_str);
    if (old_len == 0) {
        char* copy = (char*)malloc(strlen(s) + 1);
        strcpy(copy, s);
        return copy;
    }
    size_t new_len = strlen(new_str);
    
    int count = 0;
    const char* tmp = s;
    while((tmp = strstr(tmp, old_str))) { count++; tmp += old_len; }
    
    long long diff = (long long)new_len - (long long)old_len;
    size_t result_len = strlen(s) + count * diff;

    char* result = (char*)malloc(result_len + 1);
    if (!result) return (char*)calloc(1, 1);
    
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

void* alloc_array(long long capacity, void* dummy) {
    // 8 bytes (64-bits) per element com a norma general del compilador
    return calloc(capacity, 8); 
}

void free_array(void* ptr) {
    if (ptr) free(ptr);
}

void ptr_write(void** ptr, long long offset, void* val) {
    if (ptr) ptr[offset] = val;
}

void* ptr_read(void** ptr, long long offset) {
    return ptr ? ptr[offset] : NULL;
}

long long get_choice_tag(void* ptr) {
    if (!ptr) return -1;
    void* heap_ptr = *(void**)ptr;
    if (!heap_ptr) return -2;
    return *(long long*)heap_ptr;
}

long long get_choice_tag_ir(void* ptr) {
    return get_choice_tag(ptr);
}

void print_address(char* name, void* ptr) {
    printf("DEBUG: %s pointer value = %p\n", name, ptr);
}

void print_long(char* name, long long val) {
    printf("DEBUG: %s long value = %lld\n", name, val);
}