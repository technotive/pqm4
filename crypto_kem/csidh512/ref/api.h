#ifndef API_CSIDH20180826_H
#define API_CSIDH20180826_H

#define CRYPTO_ALGNAME "csidh-20180826"

#define CRYPTO_SECRETKEYBYTES   37 //=floor((primes+1)/2)=floor(75/2)
#define CRYPTO_PUBLICKEYBYTES   64 // =fp=4*limbs=4*16=64
#define CRYPTO_CIPHERTEXTBYTES  64 // Same as public key
#define CRYPTO_BYTES 64            // Same as public key OR SHA512 (

int crypto_kem_keypair(unsigned char *pk, unsigned char *sk);

int crypto_kem_enc(unsigned char *ct, unsigned char *ss, const unsigned char *pk);

int crypto_kem_dec(unsigned char *ss, const unsigned char *ct, const unsigned char *sk);

#endif
