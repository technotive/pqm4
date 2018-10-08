#include <stdint.h>
#include "m4.h"

bool m4_add_overflow(uint32_t a, uint32_t b, uint32_t* result) {
  (*result) = a+b;
  return (b > (UINT32_MAX ^ a));
}
bool m4_sub_overflow(uint32_t a, uint32_t b, uint32_t* result){
  (*result) = ~(a-b);
  return (b > a);
}
