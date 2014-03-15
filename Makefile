generuoti:
	pdflatex master.tex
	bibtex master
	pdflatex master.tex
	pdflatex master.tex
	open master.pdf || xdg-open master.pdf
