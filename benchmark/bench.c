#include <stdio.h>
#define N 100000
float x[N], y[N], vx[N], vy[N]; // SoA layout

int main() {
    for (int i = 0; i < 1000; i++) {
        for (int j = 0; j < N; j++) {
            x[j] += vx[j];
            y[j] += vy[j];
        }
    }
    return 0;
}