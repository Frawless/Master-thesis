# makefile pro preklad LaTeX verze Bc. prace
# makefile for compilation of the thesis
# Autori / Authors: 2008 Michal Bidlo, 2016 Jaroslav Dytrych
# E-mail: dytrych AT fit vutbr cz
#===========================================
# asi budete chtit prejmenovat / you will probably rename:
CO=xstejs24-DP-presentation

all: $(CO).pdf

pdf: $(CO).pdf

$(CO).ps: $(CO).dvi
	dvips $(CO)

draft: $(CO)*.tex
	pdflatex $(CO)

$(CO).pdf: clean
	pdflatex -draftmode $(CO)
	pdflatex $(CO)

$(CO).dvi: $(CO).tex
	latex $(CO)
	latex $(CO)

clean:
	rm -f *.dvi *.log $(CO).blg $(CO).bbl $(CO).toc *.aux $(CO).out $(CO).lof $(CO).ptc $(CO).nav $(CO).snm
	rm -f $(CO).pdf
	rm -f *~

pack:
	tar czvf $(CO).tar.gz *.tex *.bib *.bst ./template-fig/* ./bib-styles/* ./cls/* zadani.pdf $(CO).pdf Makefile Changelog

rename:
	mv $(CO).tex $(NAME).tex
	sed -i "s/$(CO)/$(NAME)/g" Makefile

# Pozor, vlna neresi vse (viz popis.txt) / Warning - vlna is not solving all problems (see description.txt)
vlna:
	vlna -l $(CO)-*.tex


evince: all
	evince $(CO).pdf
