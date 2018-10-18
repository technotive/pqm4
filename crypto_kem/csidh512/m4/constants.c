
#include <params.h>


const uint32_t pbits = 511;

/* Had to rename this p in order to keep nice with stack.c */
const struct uint prime = {{
    0x1b81b905, 0x33c6c87b, 0xc2721bf4, 0x57aca835, 0x516730cc, 0x1f0b4f25, 0xa7aac6c5, 0x67f35507, 0x5afbfcc6, 0x9322c9cd, 0xb42d083a, 0xedc88c42, 0xfc8ab0d1, 0x5e3e4c4a, 0x65b48e8f, 0x740f89bf,
}};

const struct fp fp_0 = {{0}};

/* 2^512 mod p */
const struct fp fp_1 = {{
    0xc8fc8df5, 0x98726f0a, 0x7b1bc817, 0x50a6af95, 0x5d319e67, 0xc1e961b4, 0xb0aa7275, 0x301955f1, 0x4a080672, 0xd9ba6c64, 0x97a5ef8a, 0x246ee77b, 0x06ea9e5d, 0x4383676a, 0x3496e2e1, 0x17e0ec80,
}};

/* (2^512)^2 mod p */
const struct fp r_squared_mod_p = {{
    0x36905b57, 0x2ffc1724, 0x67086f45, 0x25f1f27d, 0x4faf3fbf, 0xd22370ca, 0x192ea214, 0xbcc584b1,0x5dae03ee, 0x2f5de3d0, 0x1e924873, 0x1776b371, 0xad5f166e, 0x20e4f52d, 0x4ed759ae, 0xa6f3917e,
}};

/* -p^-1 mod 2^64 */
const uint64_t inv_min_p_mod_r = 0x66c1301f632e294d;

/* p - 2 */
const struct uint p_minus_2 = {{
    0x1b81b905, 0x33c6c879, 0xc2721bf4, 0x57aca835, 0x516730cc, 0x1f0b4f25, 0xa7aac6c5, 0x67f35507, 0x5afbfcc6, 0x9322c9cd, 0xb42d083a, 0xedc88c42, 0xfc8ab0d1, 0x5e3e4c4a, 0x65b48e8f, 0x740f89bf,
}};

/* (p - 1) / 2 */
const struct uint p_minus_1_halves = {{
    0x8dc0dc82, 0x99e3643d, 0xe1390dfa, 0x2bd6541a, 0xa8b39866, 0x0f85a792, 0xd3d56362, 0xb3f9aa83, 0x2d7dfe63, 0x499164e6, 0x5a16841d, 0x76e44621, 0xfe455868, 0xaf1f2625, 0x32da4747, 0xba07c4df,
}};

/* floor(4 sqrt(p)) */
const struct uint four_sqrt_p = {{
    0x17895e71, 0xe1a20b3f, 0x38d0cd95, 0xf8636a56, 0x142b9541, 0xe59682cd, 0x856f1399, 0xd91d6592, 0x02,
}};
