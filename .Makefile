#~/.Makefile
#Best use pattern rules only

SHELL = /usr/bin/nice
.SHELLFLAGS = -n 15 /usr/bin/sh -c
NUMCPUS ?= $(shell grep "core id" /proc/cpuinfo  | uniq | wc -l)
MAKEFLAGS += --jobs
MAKEFLAGS += --load-average=$(NUMCPUS)
MAKEFLAGS += --output-sync=target

############ What to do with .md #################################
#mdSOURCES := $(shell find . -iname "*.md")
mdSOURCES := $(wildcard *.md)
%.quarto.pdf: %.md
	quarto render $< --to pdf --output $@
%.pandoc.pdf: %.md
	pandoc \
	    --variable=papersize:a4 \
	    --variable=colorlinks \
	    --from=markdown+smart+auto_identifiers+fancy_lists+task_lists+definition_lists+definition_lists+table_captions+pipe_tables+yaml_metadata_block+footnotes+citations+emoji+abbreviations+autolink_bare_uris \
	    --variable=documentclass:scrartcl \
	    --table-of-contents \
	    --pdf-engine=xelatex \
	    --to=pdf $< --output=$@
$(mdSOURCES:.md=.quarto.pdf) $(mdSOURCES:.md=.pandoc.pdf) :
####################END .md ##################################
############ What to do with .tex #################################
texSOURCES := $(wildcard *.tex)
%.pdf: %.tex
	latexmk -xelatex -auxdir=latexmk.aux.tmp $<
$(texSOURCES:.tex=.pdf) :
####################END .tex ##################################
