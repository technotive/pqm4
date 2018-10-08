HEADERS 			 = api.h csidh.h params.h uint.h mont.h fp.h fix128.h m4.h

CC     				= arm-none-eabi-gcc
CFLAGS 				= -Wall -Wextra -O3 -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -std=c99 -I$(INCPATH) -I./
AR     				= arm-none-eabi-gcc-ar

OBJECTS 			 = constants.o mont.o csidh.o uint.o fp.o kem.o

libpqm4.a: $(OBJECTS)
	$(AR) rcs $@ $(OBJECTS)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS)-c -o $@ $<

.PHONY: clean
.INTERMEDIATE: $(OBJECTS) $(OBJECTS_HOST)

clean:
	-rm -f libpqm4.a
	-rm -f *.o
	-rm -f libpqhost.a
