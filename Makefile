# Makefile for install and distribute

DESTINATION_FOLDER= $(HOME)/bin
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

install:
	mkdir -p $(DESTINATION_FOLDER)
	cp -v ${SCRIPTS} $(DESTINATION_FOLDER)

.PHONY: dist install
