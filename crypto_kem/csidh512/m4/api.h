#ifndef API_CSIDH20180826_H
#define API_CSIDH20180826_H

#define CRYPTO_ALGNAME "csidh-20180826"

#define CRYPTO_SECRETKEYBYTES   65 //=floor((primes+1)/2)
#define CRYPTO_PUBLICKEYBYTES   128
#define CRYPTO_CIPHERTEXTBYTES  128
#define CRYPTO_BYTES 128

int crypto_kem_keypair(unsigned char *pk, unsigned char *sk);

int crypto_kem_enc(unsigned char *ct, unsigned char *ss, const unsigned char *pk);

int crypto_kem_dec(unsigned char *ss, const unsigned char *ct, const unsigned char *sk);

#endif
