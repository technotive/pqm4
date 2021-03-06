
#include <stddef.h>
#include <string.h>
#include "m4mul512x512.h"
#include "params.h"
#include "uint.h"
#include "fp.h"
#include "rng.h"

void fp_set(fp *x, uint32_t y)
{
    uint_set((uint *) x, y);
    fp_enc(x, (uint *) x);
}

static void reduce_once(uint *x)
{
    uint t;
    if (!uint_sub3(&t, x, &prime))
        *x = t;
}

void fp_add3(fp *x, fp const *y, fp const *z)
{
    uint_add3((uint *) x, (uint *) y, (uint *) z);
    reduce_once((uint *) x);
}

void fp_add2(fp *x, fp const *y)
{
    fp_add3(x, x, y);
}

void fp_sub3(fp *x, fp const *y, fp const *z)
{
    if (uint_sub3((uint *) x, (uint *) y, (uint *) z))
        uint_add3((uint *) x, (uint *) x, &prime);
}

void fp_sub2(fp *x, fp const *y)
{
    fp_sub3(x, x, y);
}


/* Montgomery arithmetic */

void fp_enc(fp *x, uint const *y)
{
    fp_mul3(x, (fp *) y, &r_squared_mod_p);
}

void fp_dec(uint *x, fp const *y)
{
    fp_mul3((fp *) x, y, (fp *) &uint_1);
}

void fp_mul3(fp *x, fp const *y, fp const *z)
{
  uint32_t t[32];
  m4mul512x512(t, (uint32_t*)&y->c, (uint32_t*)&z->c);

  //Now we have to reduce t so that it fits in x.
  //prime p of size n
  //big number t of size 2n

  mmul(t, &prime.c, inv_min_p_mod_r, &x->c);

  reduce_once((uint*)x);
}


void fp_mul2(fp *x, fp const *y)
{
    fp_mul3(x, x, y);
}

void fp_sq2(fp *x, fp const *y)
{
  uint32_t t[32];
  m4sqr512(t, (uint32_t*)&y->c);

  //Now we have to reduce t so that it fits in x.
  //prime p of size n
  //big number t of size 2n

  mmul(t, &prime.c, inv_min_p_mod_r, &x->c);

  reduce_once((uint*)x);
}

void fp_sq1(fp *x)
{
    fp_sq2(x, x);
}

/* (obviously) not constant time in the exponent */
static void fp_pow(fp *x, uint const *e)
{
    fp y = *x;
    *x = fp_1;
    for (size_t k = 0; k < LIMBS; ++k) {
        uint32_t t = e->c[k];
        for (size_t i = 0; i < 32; ++i, t >>= 1) {
            if (t & 1)
                fp_mul2(x, &y);
            fp_sq1(&y);
        }
    }
}

void fp_inv(fp *x)
{
    fp_pow(x, &p_minus_2);
}

bool fp_issquare(fp *x)
{
    fp_pow(x, &p_minus_1_halves);
    return !memcmp(x, &fp_1, sizeof(fp));
}

void fp_random(fp *x)
{
    while (1) {
        randombytes_mask(x, sizeof(fp));
        uint32_t m = ((uint32_t) 1 << pbits % 32) - 1;
        x->c[LIMBS - 1] &= m;

        for (size_t i = LIMBS - 1; i < LIMBS; --i)
            if (x->c[i] < prime.c[i])
                return;
            else if (x->c[i] > prime.c[i])
                break;
    }
}
