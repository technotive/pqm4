HEADERS 			 = api.h csidh.h params.h uint.h mont.h fp.h fix128.h

CC			= gcc
CFLAGS 	= -Wall -Wextra -O3 -std=c99 -I$(INCPATH) -I./
AR 			= gcc-ar

OBJECTS 			 = constants.o mont.o csidh.o uint.o fp.o kem.o

libpqhost.a: $(OBJECTS)
	$(AR) rcs $@ $(OBJECTS)

%.o: %.c $(HEADERS)
	$(CC) $(EXT_INC) $(CFLAGS)-c -o $@ $<

.PHONY: clean
.INTERMEDIATE: $(OBJECTS) $(OBJECTS_HOST)

clean:
	-rm -f libpqm4.a
	-rm -f *.o
