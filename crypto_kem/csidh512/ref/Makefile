HEADERS 			 = api.h csidh.h constants.h params.h uint.h mont.h fp.h rng.h

CC			= gcc
CFLAGS 	= -Wall -Wextra -O3 -std=c99
AR 			= gcc-ar

OBJECTS 			 = constants.o mont.o csidh.o uint.o fp.o kem.o rng.o

libpqm4.a:
	echo "Ignoring m4 target for ref."

libpqhost.a: $(OBJECTS)
	$(AR) rcs $@ $(OBJECTS)

%.o: %.c $(HEADERS)
	$(CC) -I$(INCPATH) -I./ $(CFLAGS) -c -o $@ $<

.PHONY: clean
.INTERMEDIATE: $(OBJECTS) $(OBJECTS_HOST)

clean:
	-rm -f libpqhost.a
	-rm -f *.o
