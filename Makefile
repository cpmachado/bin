# Makefile for install and distribute

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
	$(RM) -r bin*

dist: clean
	mkdir -p bin
	cp -r ${FILES} bin
	tar cf bin.tar bin
	gzip bin.tar
	$(RM) -r bin

install: man
	mkdir -p $(DESTINATION_FOLDER)
	cp -v ${SCRIPTS} $(DEST_PREFIX)/bin
	cp -v man/* $(DEST_PREFIX)/man

man:
	$(foreach i, $(SCRIPTS),\
		$(HELP2MAN) -N --output=./man/$i.1 --name='$i' ./$i;)

.PHONY: clean dist install man
