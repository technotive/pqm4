HEADERS 			= params.h constants.h api.h csidh.h uint.h mont.h fp.h m4mul256x256.h m4mul512x512.h m4mul512x512_asm.h rng.h

CC     				= arm-none-eabi-gcc
CFLAGS 				= -Wall -Wextra -O3 -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -std=c99
AR     				= arm-none-eabi-gcc-ar

OBJECTS 			= constants.o mont.o csidh.o fp.o m4mul256x256.o m4mul512x512.o m4mul512x512_asm.o rng.o kem.o uint.o

libpqm4.a: $(OBJECTS)
	$(AR) rcs $@ $(OBJECTS)

%.o: %.s
	$(CC) -I$(INCPATH) $(CFLAGS) -c -o $@ $<

%.o: %.c
	$(CC) -I$(INCPATH) $(CFLAGS) -c -o $@ $<

.PHONY: clean
.INTERMEDIATE: $(OBJECTS) $(OBJECTS_HOST)

clean:
	-rm -f libpqm4.a
	-rm -f *.o
