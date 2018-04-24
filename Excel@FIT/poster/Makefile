# makefile pro preklad LaTeX verze Bc. prace
# makefile for compilation of the thesis
# Autori / Authors: 2008 Michal Bidlo, 2016 Jaroslav Dytrych
# E-mail: dytrych AT fit vutbr cz
#===========================================
# asi budete chtit prejmenovat / you will probably rename:
CO=2018-ExcelFIT-MaestroPerformance-poster

all: $(CO).pdf sub-clean

pdf: $(CO).pdf sub-clean

$(CO).ps: $(CO).dvi
	dvips $(CO)

draft: $(CO)*.tex
	pdflatex $(CO)

$(CO).pdf: clean
	pdflatex  $(CO)
	pdflatex $(CO)
	pdflatex $(CO)

$(CO).dvi: $(CO).tex
	latex $(CO)
	latex $(CO)
	latex $(CO)

clean:
	rm -f *.dvi *.log $(CO).blg $(CO).bbl $(CO).toc *.aux $(CO).out $(CO).lof $(CO).ptc
	rm -f $(CO).pdf
	rm -f *~

sub-clean:
	rm -f *.dvi *.log $(CO).blg $(CO).bbl $(CO).toc *.aux $(CO).out $(CO).lof $(CO).ptc
	rm -f *~

pack:
	tar czvf $(CO).tar.gz *.tex *.bib ./images/* ExcelAtFIT.cls VUT-FIT-logo.pdf ExcelAtFIT-logo.pdf $(CO).pdf Makefile

rename:
	mv $(CO).tex $(NAME).tex
	mv $(CO)-bib.bib $(NAME)-bib.bib
	mv $(CO).bib $(NAME).bib

# Pozor, vlna neresi vse (viz popis.txt) / Warning - vlna is not solving all problems (see description.txt)
vlna:
	vlna -l $(CO)-*.tex

# Spocita normostrany / Count of standard pages
normostrany:
	echo "scale=2; `detex $(CO)*.tex | wc -c`/1800;" | bc


show: all
	evince $(CO).pdf
	make normostrany

evince: show sub-clean
