#include "api.h"
#include "randombytes.h"
#include "csidh.h"

int crypto_kem_keypair(unsigned char *pk, unsigned char *sk){
  csidh_private((private_key*) sk);
  pk = (unsigned char*) &base;
  (void) pk; //Suppress pk not used
  return 0;
}

int crypto_kem_enc(unsigned char *ct, unsigned char *ss, const unsigned char *pk){
  return 0;
}

int crypto_kem_dec(unsigned char *ss, const unsigned char *ct, const unsigned char *sk){
  return 0;
}
