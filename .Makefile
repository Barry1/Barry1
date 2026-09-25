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
# Optionale Pandoc-Filter
PANDOC_FILTERS :=
# PlantUML-Filter nur aktivieren, wenn installiert
ifneq ($(shell command -v pandoc-plantuml 2>/dev/null),)
PANDOC_FILTERS += --filter=pandoc-plantuml
endif
# PlantUML-Filter nur aktivieren, wenn installiert
ifneq ($(shell command -v pandoc-kroki 2>/dev/null),)
PANDOC_FILTERS += --filter=pandoc-kroki
endif
# PlantUML-Filter nur aktivieren, wenn installiert
ifneq ($(shell command -v pandoc-mermaid 2>/dev/null),)
PANDOC_FILTERS += --filter=pandoc-mermaid
endif
# Weitere optionale Filter können später ergänzt werden
ifneq ($(shell command -v pandoc-crossref 2>/dev/null),)
PANDOC_FILTERS += --filter=pandoc-crossref
endif
mdSOURCES := $(wildcard *.md)
%.quarto.pdf: %.md
	quarto render $< --to pdf --output $@
%.pandoc.pdf: %.md
	pandoc \
	    --variable=papersize:a4 \
	    --variable=colorlinks \
	    --variable=documentclass:scrartcl \
	    --from=markdown+smart+auto_identifiers+fancy_lists+task_lists+definition_lists+definition_lists+table_captions+pipe_tables+yaml_metadata_block+footnotes+citations+emoji+abbreviations+autolink_bare_uris \
	    $(PANDOC_FILTERS) \
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
############ What to do with .svg #################################
svgSOURCES := $(wildcard *.svg)
%.pdf: %.svg
	rsvg-convert --format pdf --output $@ $<
$(svgSOURCES:.svg=.pdf) :
####################END .tex ##################################
