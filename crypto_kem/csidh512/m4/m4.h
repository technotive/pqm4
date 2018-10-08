#ifndef M4
#define M4

/* m4-specific replacements for __builtin functcions */

bool m4_add_overflow(uint32_t a, uint32_t b, uint32_t* result);
bool m4_sub_overflow(uint32_t a, uint32_t b, uint32_t* result);

#endif
