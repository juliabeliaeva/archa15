all: archa.pdf

vc.tex: .git/logs/HEAD
	echo "%%% This file is generated by Makefile." > vc.tex
	echo "%%% Do not edit this file!\n%%%" >> vc.tex
	./date.sh >> vc.tex

%.pdf: %.tex %.bib textbook.sty images/*.jpg vc.tex
	pdflatex -interaction batchmode $*.tex
	bibtex $*.aux
	pdflatex -interaction batchmode $*.tex
	pdflatex -interaction batchmode $*.tex

.PHONY: clean

clean:
	rm *.bbl *.blg *.log *.out *.aux *.pdf vc.tex
