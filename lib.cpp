#include "lib.h"

void sum_cpu(int n, const float* a, const float* b, float* c) {
  for (int i = 0; i < n; ++i) {
    c[i] = a[i] + b[i];
  }
}
