GIT_VER := $(shell git describe --tags --always --long --dirty --broken)

.PHONY: all clean version

all: clean version format-print.pdf format-ebook.pdf
	rm -f version.tex

clean: 
	rm -f *.pdf version.tex

version:
	printf "$(GIT_VER)" > version.tex 

%.pdf: %.tex
	latexmk -xelatex -silent $<
	latexmk -c
	rm -f *.xdv 