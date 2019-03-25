#ifndef M4MUL512X512_ASM
#define M4MUL512X512_ASM
#endif

//Karatsuba operations
uint32_t difference(uint32_t* io, uint32_t* b, uint32_t* out);
void refine(uint32_t* o);
void M(uint32_t* o, uint32_t* m, uint32_t n);
void mmul(uint32_t* t, uint32_t* p, uint32_t pp, uint32_t* o);
