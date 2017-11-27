DATE := $(shell date +%Y-%m-%d)

SRC_FILES := preamble.tex report.tex thesis_defense.tex chap/*.tex figures/*.tex figures/*.jpg figures/*.dat misc/*.tex app/*.tex
IMG_DIR := img/*
PUBLICATIONS_DIR :=  ref/*.bib

COMPLIER := pdflatex

report:
	$(COMPLIER) report.tex
	bibtex report.aux
	#makeglossaries report
	$(COMPLIER) report.tex
	$(COMPLIER) report.tex

defense:
	$(COMPLIER) thesis_defense.tex
	$(COMPLIER) thesis_defense.tex	
tarball: 
	tar -cvzf report_$(DATE).tgz .gitignore .git/ Makefile $(SRC_FILES) $(IMG_DIR) $(PUBLICATIONS_DIR)

open:
	evince report.pdf

clean:
	rm -f *.log *.aux *.out *.pdf *.toc *.lof *.lot *.blg *.bbl *.bcf *.dvi *.xml *.bib *.snm *.nav *.gls *.acr *.glg *.glo *.ist *.alg *.acn 
