PAPER = template
TEX = $(wildcard *.tex)
BIB = references.bib
FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)

.PHONY: all clean

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS) acm_proc_article-sp.cls
	echo $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)
	open -a Preview $(PAPER).pdf
	#sudo cp $(PAPER).pdf /var/www/

clean:
	rm -f *.aux *.bbl *.blg *.log *.out $(PAPER).pdf


