
#include "rng.h"
#include "randombytes.h"

#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

void randombytes_mask(void *x, size_t l)
{
    randombytes(x, l);
}
