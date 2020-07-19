PKG    = shtthesis
TEX    = xetex
IDX    = makeindex
BIB    = biber
LATEX  = $(TEX) -fmt=xelatex
SRC    = $(PKG).dtx
BCF    = $(PKG).bcf
SCRIPT = $(PKG).ins
CLS    = $(PKG).cls $(PKG)-doc.sty
DOC    = $(PKG).pdf

.PHONY: all doc cls clean clean-all

all: doc cls

doc: $(DOC)

cls: $(CLS)

$(DOC): $(CLS)
	$(LATEX) -no-pdf $(SRC)
	$(IDX)   -s gglo.ist -o $(PKG).gls $(PKG).glo
	$(IDX)   -s gind.ist -o $(PKG).ind $(PKG).idx
	$(BIB)   $(BCF)
	$(LATEX) -no-pdf $(SRC)
	$(LATEX) $(SRC)

$(CLS): $(SRC) $(SCRIPT)
	$(TEX) $(SCRIPT)

clean-all: clean
	rm -f $(DOC) $(CLS)

clean:
	latexmk -c $(SRC)
	rm -f $(PKG).gls $(PKG).glo $(PKG).xdv