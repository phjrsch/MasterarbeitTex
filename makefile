# type "make" command in Unix to compile

all:
	pdflatex --shell-escape Projektarbeit.tex
	bibtex Projektarbeit
	pdflatex --shell-escape Projektarbeit.tex
	pdflatex --shell-escape Projektarbeit.tex

clean:
	(rm -rf *.ps *.log *.dvi *.aux *.*% *.lof *.lop *.lot *.toc *.idx *.ilg *.ind *.bbl *blg)
