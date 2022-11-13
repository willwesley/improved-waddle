filename=paper
SHELL=/bin/bash

.PHONY: all
all: ${filename}.pdf

${filename}.aux:
	xelatex ${filename}

${filename}.bbl: ${filename}.bib | ${filename}.aux
	bibtex ${filename}||true
	xelatex ${filename}

${filename}.pdf: ${filename}.bbl ${filename}.tex
	xelatex ${filename}

.PHONY: clean
clean:
	rm -f ${filename}.{log,aux,out,bbl,blg}

.PHONY: veryclean
veryclean: clean
	rm -f ${filename}.pdf

