# Makefile for install and distribute

PRIVATE_BIN=$(HOME)/.local/bin
DEST_PREFIX=$(XDG_DATA_HOME)
HELP2MAN=help2man
SCRIPTS=\
	kbdfix\
	tmuxs\
	wrap

FILES= $(SCRIPTS)\
	LICENSE\
	README.md

clean:
	$(RM) -r bin* man/*.gz

dist: clean
	mkdir -p bin
	cp -r ${FILES} bin
	tar cf bin.tar bin
	gzip bin.tar
	$(RM) -r bin

install: man
	mkdir -p $(PRIVATE_BIN) $(DEST_PREFIX)/man/man1
	cp -v ${SCRIPTS} $(PRIVATE_BIN)
	cp -v man/*.gz $(DEST_PREFIX)/man/man1

man:
	$(foreach i, $(SCRIPTS),\
		$(HELP2MAN) -N --output=./man/$i.1 --name='$i' ./$i;\
		gzip -k -f ./man/$i.1;)

.PHONY: clean dist install man
