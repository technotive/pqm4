#include <stdbool.h>
#include "api.h"
#include "randombytes.h"
#include "csidh.h"

/* CSIDH function might return false for a failed verification */
int crypto_kem_keypair(unsigned char *pk, unsigned char *sk){
  csidh_private((private_key*)sk);
  return csidh((public_key*) pk, &base, (private_key*) sk);
}

int crypto_kem_enc(unsigned char *ct, unsigned char *ss, const unsigned char *pk){
  private_key skb;
  csidh_private(&skb);

  /* Might return false for a failed verification */
  bool res = csidh((public_key*) ct, &base, &skb);
  /* ss is the thing we want to share = H(skb*pka) <= skb*pka=ska*pkb */
  res = res && csidh((public_key*) ss, (public_key*) pk, &skb);
  return res;
}

int crypto_kem_dec(unsigned char *ss, const unsigned char *ct, const unsigned char *sk){
  /* ct = pkb, sk = ska */
  /* recreate ss = H(ska*pkb) <= skb*pka=ska*pkb */
  bool res =  csidh((public_key*) ss, (public_key*) ct, (private_key*) sk);
  return res;
}
