HEADERS 			 = api.h csidh.h params.h uint.h mont.h fp.h fix128.h

CC_HOST 			= gcc
CFLAGS_HOST 	= -Wall -Wextra -O3 -std=c99 -I$(INCPATH) -I./
AR_HOST 			= gcc-ar

OBJECTS 			 = constants.o mont.o csidh.o uint.o fp.o kem.o
OBJECTS_HOST 	 = $(patsubst %.o,%_host.o,$(OBJECTS))

libpqm4.a: $(OBJECTS)
	$(AR) rcs $@ $(OBJECTS)

libpqhost.a: $(OBJECTS_HOST)
	$(AR_HOST) rcs $@ $(OBJECTS_HOST)

%_host.o: %.c $(HEADERS_HOST)
	$(CC_HOST) $(EXT_INC_HOST) $(CFLAGS_HOST) -c -o $@ $<

%.o: %.c $(HEADERS)
	$(CC) $(EXT_INC) $(CFLAGS)-c -o $@ $<

.PHONY: clean
.INTERMEDIATE: $(OBJECTS) $(OBJECTS_HOST)

clean:
	-rm -f libpqm4.a
	-rm -f *.o
	-rm -f libpqhost.a
