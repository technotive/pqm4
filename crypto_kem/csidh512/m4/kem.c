#include "api.h"
#include "randombytes.h"
#include "csidh.h"

int crypto_kem_keypair(unsigned char *pk, unsigned char *sk){
  csidh_private((private_key*) sk);
  pk = (unsigned char*) &base;
  (void) pk;
  return 0;
}

int crypto_kem_enc(unsigned char *ct, unsigned char *ss, const unsigned char *pk){
  public_key* pub = (public_key *) pk;
  /* ss is the thing we want to share */
  /* ct is where we drop the cipher text = csidh_enc(ss) */
  return 0;
}

int crypto_kem_dec(unsigned char *ss, const unsigned char *ct, const unsigned char *sk){
  /* retrieve ss from ct using sk*/
  return 0;
}
