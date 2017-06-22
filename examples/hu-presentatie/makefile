
.PHONY: all view

all : main.pdf

main.pdf :
	xelatex main.tex
	xelatex main.tex
	xelatex main.tex
	xelatex main.tex

clean: 
	rm -rf *.aux *.log *.out *.snm *.toc *.nav 

clean-all : clean
	rm -rf *.pdf

run: all
	pdfpc main.pdf -Ss
