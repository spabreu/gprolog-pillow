PROGRAM = pillow
LIBFILE = $(PROGRAM).o
SOURCE = $(PROGRAM).pl

PREFIX = /usr/local

LIBDIR=$(PREFIX)/lib/isco
BINDIR=$(PREFIX)/bin

GPLC = gplc

all: $(LIBFILE) $(PROGRAM)

install: $(LIBFILE) $(PROGRAM)
	install -c -m 444 $(LIBFILE) $(LIBDIR)
	install -c -m 755 $(PROGRAM) $(BINDIR)

clean:
	rm -f $(PROGRAM) $(LIBFILE) *~

$(LIBFILE): $(SOURCE)
	$(GPLC) -c $<

$(PROGRAM): $(LIBFILE)
	$(GPLC) -o $@ $<
