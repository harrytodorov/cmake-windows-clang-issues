#include <iostream>
#include <vector>
#include "lib.h"

const int N = 1000;

int main(int argc, char* argv[]) {
  std::vector<float> a(N, 1);
  std::vector<float> b(N, 2);
  std::vector<float> c(N, 0);

  sum_cpu(N, &a[0], &b[0], &c[0]);

  for (int i = 0; i < N; ++i) {
    if (c[i] != 3) {
      std::cerr << "Error" << std::endl;
      return -1;
    }
  }

  for (int i = 0; i < N; ++i) c[i] = 0;

  sum_gpu(N, &a[0], &b[0], &c[0]);

  for (int i = 0; i < N; ++i) {
    if (c[i] != 3) {
      std::cerr << "Error" << std::endl;
      return -1;
    }
  }

  return 0;
}