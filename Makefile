TeX ?= xelatex -interaction=nonstopmode
MYNAME ?= Phoebe_Goldman
ASSIGNMENT ?= Final_Paper
JOBNAME := $(MYNAME)_$(ASSIGNMENT)

$(JOBNAME).pdf: main.tex
	$(TeX) -jobname=$(JOBNAME) $<
	$(TeX) -jobname=$(JOBNAME) $<
	biber $(JOBNAME)
	$(TeX) -jobname=$(JOBNAME) $<

.PHONY: clean open
clean:
	rm -rf $(wildcard *.aux) \
		$(wildcard *.out) \
		$(wildcard *.js) \
		$(wildcard *.log) \
		$(wildcard *.pdf) \
		$(wildcard *.toc) \
		$(wildcard *.bbl) \
		$(wildcard *.bcf) \
		$(wildcard *.blg) \
		$(wildcard *.dvi) \
		$(wildcard *.xml) \
		$(wildcard *.gz)

open: $(JOBNAME).pdf
	open $<
