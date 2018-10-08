
#include <stddef.h>

#include "params.h"
#include "uint.h"
#include "m4.h"

/* assumes little-endian throughout. */

uint const uint_1 = {{1}};

void uint_set(uint *x, uint32_t y)
{
    x->c[0] = y;
    for (size_t i = 1; i < LIMBS; ++i)
        x->c[i] = 0;
}

bool uint_bit(uint const *x,  uint32_t k)
{
    return 1 & (x->c[k / 32] >> k % 32);
}

bool uint_add3(uint *x, uint const *y, uint const *z)
{
    bool c = 0;
    for (size_t i = 0; i < LIMBS; ++i) {
        uint32_t t;
        c = m4_add_overflow(y->c[i], c, &t);
        c |= m4_add_overflow(t, z->c[i], &x->c[i]);
    }
    return c;
}

bool uint_sub3(uint *x, uint const *y, uint const *z)
{
    bool b = 0;
    for (size_t i = 0; i < LIMBS; ++i) {
        uint32_t t;
        b = m4_sub_overflow(y->c[i], b, &t);
        b |= m4_sub_overflow(t, z->c[i], &x->c[i]);
    }
    return b;
}

void uint_mul3_64(uint *x, uint const *y, uint32_t z)
{
    uint32_t c = 0;
    for (size_t i = 0; i < LIMBS; ++i) {
        uint64_t t = y->c[i] * (uint64_t) z + c;
        c = t >> 32;
        x->c[i] = t;
    }
}
