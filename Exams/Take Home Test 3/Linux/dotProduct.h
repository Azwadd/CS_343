#pragma once

float dotProduct(float a[], float b[], int N) {
    float x = 0;
    for (int i = 0; i < N; i++) {
        x = x + (a[i] * b[i]);
    }
    return x;
}

void manualDotProduct(float* a, float* b, int N, float* result) {
    __asm (
        // arguments are stored in RDI, RSI, RDX, RCX (This is done automatically  by Linux)
        "vpxor %ymm0, %ymm0, %ymm0\n" 
        "vpxor %ymm3, %ymm3, %ymm3\n" 
        ".mainloop:\n"
        "vmovups 0x0(%rdi), %ymm1\n"
        "vmovups 0x0(%rsi), %ymm2\n"
        "vmulps %ymm1, %ymm2, %ymm3\n"
        "vaddps %ymm0, %ymm3, %ymm0\n"
        "add $32, %rdi\n" 
        "add $32, %rsi\n" 
        "sub $8, %rdx\n" 
        "jnz .mainloop\n" 
        "vhaddps %ymm0, %ymm0, %ymm0\n"
        "vhaddps %ymm0, %ymm0, %ymm0\n"
        "vhaddps %ymm0, %ymm0, %ymm0\n"
        "vmovups %ymm0, (%rcx)\n"
    );
}


void DPPSdotProduct(float* a, float* b, int N, float* result) {
    __asm (
        "vpxor %ymm3, %ymm3, %ymm3\n"
        ".main:\n"
        "vmovups 0x0(%rdi), %ymm1\n" 
        "vmovups 0x0(%rsi), %ymm2\n" 
        "vdpps $0xFF, %ymm1, %ymm2, %ymm0\n" 
        "vaddps %ymm0, %ymm3, %ymm3\n"
        "add $32, %rdi\n" 
        "add $32, %rsi\n" 
        "sub $8, %rdx\n" 
        "jnz .main\n" 
        "vhaddps %ymm3, %ymm3, %ymm3\n"
        "vmovups %ymm3, (%rcx)\n" 
    );
}