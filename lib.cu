#include <cuda.h>
#include <cuda_runtime_api.h>
#include "lib.h"

__global__ void sum_gpu_kernel(int n, const float* a, const float* b,
                               float* c) {
  int idx = blockIdx.x * blockDim.x + threadIdx.x;
  if (idx < n) {
    c[idx] = a[idx] + b[idx];
  }
}

void sum_gpu(int n, const float* a, const float* b, float* c) {
  float *d_a, *d_b, *d_c;
  cudaMalloc(&d_a, sizeof(float) * n);
  cudaMalloc(&d_b, sizeof(float) * n);
  cudaMalloc(&d_c, sizeof(float) * n);

  cudaMemcpy(d_a, a, sizeof(float) * n, cudaMemcpyDefault);
  cudaMemcpy(d_b, b, sizeof(float) * n, cudaMemcpyDefault);

  sum_gpu_kernel<<<(n + 255) / 256, 256>>>(n, d_a, d_b, d_c);

  cudaMemcpy(c, d_c, sizeof(float) * n, cudaMemcpyDefault);

  cudaFree(d_a);
  cudaFree(d_b);
  cudaFree(d_c);
}
