# 1 "C:/FPGAJosieVivian/HLS_Multiplier/hls_multiplier/hls_multiplier.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/FPGAJosieVivian/HLS_Multiplier/hls_multiplier/hls_multiplier.cpp"
unsigned int hls_multiplier(unsigned short int a, unsigned short int b) {
#pragma HLS INTERFACe s_axilite port=return bundle=CRTLS
#pragma HLS INTERFACe s_axilite port=a bundle=CRTLS
#pragma HLS INTERFACe s_axilite port=b bundle=CRTLS
    unsigned int p;
    p = a * b;
    return p;
}