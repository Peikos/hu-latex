FILE=main

all: .CLEARPDF $(FILE).pdf

.CLEARPDF:
	rm -f $(FILE).pdf

clean:
	rm -f *.aux *.blg *.out *.bbl *.log *.bcf *.glo *.gls *.glg *.run.xml *.toc *.xdy

quick: .CLEARPDF
	xelatex $(FILE)

$(FILE).pdf: $(FILE).tex
	xelatex --synctex=-1 -src-specials -interaction=nonstopmode $(FILE)
	xelatex --synctex=-1 -src-specials -interaction=nonstopmode $(FILE)
