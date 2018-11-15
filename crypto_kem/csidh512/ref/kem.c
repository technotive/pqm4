#include <stdbool.h>
#include <stdio.h>
#include "api.h"
#include "randombytes.h"
#include "csidh.h"
#include "crypto_hash_sha512.h"

/* CSIDH function might return false for a failed verification */
int crypto_kem_keypair(unsigned char *pk, unsigned char *sk){
  csidh_private((private_key*)sk);
  if(!csidh((public_key*) pk, &base, (private_key*) sk))
  {
    while(!csidh((public_key*) pk, (public_key*) pk, (private_key*) sk));
  }
  return 0;
}

/* ss is the thing we want to share = H(skb*pka) <= skb*pka=ska*pkb */
int crypto_kem_enc(unsigned char *ct, unsigned char *ss, const unsigned char *pk){
  private_key skb;
  csidh_private(&skb);
  if(!csidh((public_key*) ct, &base, &skb))
  {
    while(!csidh((public_key*) ct, (public_key*) ct, &skb));
  }
  if(!csidh((public_key*) ss, (public_key*) pk, &skb))
  {
    printf("Could not generate shared secret.");
    return -1;
  }
  crypto_hash_sha512((unsigned char*) ss, (unsigned char*) ss, 64);
  return 0;
}

/* ct = pkb, sk = ska; Recreate ss = H(ska*pkb) <= skb*pka=ska*pkb */
int crypto_kem_dec(unsigned char *ss, const unsigned char *ct, const unsigned char *sk){
  if(!csidh((public_key*) ss, (public_key*) ct, (private_key*) sk))
  {
    printf("Could not re-generate shared secret.");
    return -1;
  }
  crypto_hash_sha512((unsigned char*) ss, (unsigned char*) ss, 64);
  return 0;
}
