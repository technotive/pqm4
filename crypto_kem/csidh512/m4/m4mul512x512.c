#include <stddef.h>
#include <string.h>
#include "params.h"
#include "uint.h"
#include "fp.h"
#include "m4mul256x256.h"
#include "m4mul512x512.h"
#include "m4mul512x512_asm.h"

void m4mul512x512(uint32_t* o, uint32_t* x, uint32_t* y) {
  multiply256x256_asm(&o[0], x, y); //L
  multiply256x256_asm(&o[16], &x[8], &y[8]); //H

  refine(&o[8]);

  // printbytes(&o[8], 32);
  uint32_t dx[8], dy[8];
  uint32_t na = difference(&x[0], &x[8], &dx[0]);
  uint32_t nb = difference(&y[0], &y[8], &dy[0]);
  //Merge above into function "sign"

  uint32_t m[16];
  multiply256x256_asm(&m, &dx, &dy); // M

  uint32_t n = na^nb; // Condition Byte

  M(&o[8], &m[0], n);
}
