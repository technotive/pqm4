#ifndef M4MUL512X512
#define M4MUL512X512
#endif

#include <stdint.h>
#include <stdbool.h>
#include "m4mul512x512_asm.h"

void m4mul512x512(uint32_t* o, uint32_t* x, uint32_t* y);
void m4sqr512(uint32_t* o, uint32_t* x);
