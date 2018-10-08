#ifndef UINT_H
#define UINT_H

#include <stdbool.h>
#include <stdint.h>

#include "params.h"

extern const uint uint_1;

void uint_set(uint *x, uint32_t y);

bool uint_bit(uint const *x, uint32_t k);

bool uint_add3(uint *x, uint const *y, uint const *z); /* returns carry */
bool uint_sub3(uint *x, uint const *y, uint const *z); /* returns borrow */

void uint_mul3_64(uint *x, uint const *y, uint32_t z);

#endif
