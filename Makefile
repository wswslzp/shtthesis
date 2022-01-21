PKG         = shtthesis
SRC         = $(PKG).dtx
SCRIPT      = $(PKG).ins
EXAMPLE     = $(PKG)-example
EXAMPLE_SRC = $(EXAMPLE).tex

#.PHONY: all doc cls example release clean clean-all

all: run

run:
	latexmk -pdflua

#doc: cls
#	xelatex   -no-pdf $(SRC)
#	makeindex -s gglo.ist -o $(PKG).gls $(PKG).glo
#	makeindex -s gind.ist -o $(PKG).ind $(PKG).idx
#	biber     $(PKG).bcf
#	xelatex   -no-pdf $(SRC)
#	xelatex   $(SRC)
#
#example: cls $(EXAMPLE_SRC)
#	latexmk -pdfxe $(EXAMPLE_SRC)
#
#cls: $(SRC) $(SCRIPT)
#	xetex $(SCRIPT)
#
#release: cls doc example
#	rm    -rf $(PKG)/
#	mkdir -p  $(PKG)/
#	cp        $(SRC)         $(PKG)/
#	cp        $(SCRIPT)      $(PKG)/
#	cp        $(PKG).pdf     $(PKG)/
#	cp        $(EXAMPLE_SRC) $(PKG)/
#	cp        $(EXAMPLE).pdf $(PKG)/
#	cp        README.md      $(PKG)/
#	cp        LICENSE        $(PKG)/
#	cp        DEPENDS.txt    $(PKG)/
#	zip  -rq9 $(PKG).zip     $(PKG)/
#	rm   -rf  $(PKG)/
#
#clean-all: clean
#	rm -f $(PKG).cls $(PKG)-doc.sty $(PKG).pdf $(EXAMPLE).pdf $(PKG).zip
#
#clean:
#	latexmk -c $(SRC)
#	rm      -f $(PKG).bbl $(PKG).bib $(PKG).glo $(PKG).gls $(PKG).xdv $(PKG).run.xml
#	latexmk -c $(EXAMPLE_SRC)
#	rm      -f $(EXAMPLE).bbl $(EXAMPLE).bib $(EXAMPLE).xdv $(EXAMPLE).thm $(EXAMPLE).run.xml
