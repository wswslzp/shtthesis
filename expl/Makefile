PKG    = shtthesis
SRC    = $(PKG).dtx
SCRIPT = $(PKG).ins
CLS    = $(PKG).cls $(PKG)-doc.sty
DOC    = $(PKG).pdf

.PHONY: all doc cls clean clean-all

all: doc cls

doc: $(DOC)

cls: $(CLS)

$(DOC): $(CLS)
	xelatex -no-pdf $(SRC)
	makeindex -s gglo.ist -o $(PKG).gls $(PKG).glo
	makeindex -s gind.ist -o $(PKG).ind $(PKG).idx
	xelatex $(SRC)

$(CLS): $(SRC) $(SCRIPT)
	xetex $(SCRIPT)

clean-all: clean
	rm -f $(DOC) $(CLS)

clean:
	latexmk -c $(SRC)
	rm -f $(PKG).gls $(PKG).glo $(PKG).xdv