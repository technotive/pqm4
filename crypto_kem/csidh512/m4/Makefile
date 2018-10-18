HEADERS 			 = constants.h params.h api.h csidh.h uint.h mont.h fp.h m4.h rng.h

CC     				= arm-none-eabi-gcc
CFLAGS 				= -Wall -Wextra -O3 -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -std=c99
AR     				= arm-none-eabi-gcc-ar

OBJECTS 			 = constants.o mont.o csidh.o uint.o fp.o kem.o m4.o rng.o

libpqm4.a: $(OBJECTS)
	$(AR) rcs $@ $(OBJECTS)

%.o: %.c $(HEADERS)
	$(CC) -I$(INCPATH) -I./ $(CFLAGS) -c -o $@ $<

.PHONY: clean
.INTERMEDIATE: $(OBJECTS) $(OBJECTS_HOST)

clean:
	-rm -f libpqm4.a
	-rm -f *.o
	-rm -f libpqhost.a
