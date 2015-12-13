all: archa.pdf

vc.tex: .git/logs/HEAD
	echo "%%% This file is generated by Makefile." > vc.tex
	echo "%%% Do not edit this file!\n%%%" >> vc.tex
	./date.sh >> vc.tex

archa.pdf: archa.tex archa.bib textbook.sty images/*.jpg vc.tex
	pdflatex -interaction batchmode archa.tex
	bibtex archa.aux
	pdflatex -interaction batchmode archa.tex
	pdflatex -interaction batchmode archa.tex

.PHONY: clean

clean:
	rm *.bbl *.blg *.log *.out *.aux *.pdf vc.tex
