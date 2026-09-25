#~/.Makefile
#Best use pattern rules only

SHELL = /usr/bin/nice
.SHELLFLAGS = -n 15 /usr/bin/sh -c
#NUMCPUS ?= $(shell grep "core id" /proc/cpuinfo  | uniq | wc -l)
#nicht so portabel
NUMCPUS ?= $(shell nproc)
JOBS ?= $(shell expr $(NUMCPUS) \* 2)
MAKEFLAGS += --jobs=$(JOBS)
MAKEFLAGS += --load-average=$(NUMCPUS)
MAKEFLAGS += --output-sync=target
.DELETE_ON_ERROR:
############ What to do with .md #################################
##########PANDOC SETUP ###########################
PANDOC_FORMAT := \
	markdown+smart+auto_identifiers+fancy_lists+task_lists+definition_lists+table_captions+pipe_tables+yaml_metadata_block+footnotes+citations+emoji+abbreviations+autolink_bare_uris
# Optionale Pandoc-Filter
PANDOC_FILTERS :=
PANDOC_OPTIONAL_FILTERS := \
	pandoc-plantuml \
	pandoc-mermaid \
	pandoc-kroki \
	pandoc-crossref
define add_filter_if_exists
ifneq ($(shell command -v $(1) 2>/dev/null),)
PANDOC_FILTERS += --filter=$(1)
endif
endef
$(foreach F,$(PANDOC_OPTIONAL_FILTERS),$(eval $(call add_filter_if_exists,$(F))))
#####################################################################
#mdSOURCES := $(shell find . -iname "*.md")
mdSOURCES := $(wildcard *.md)
%.quarto.pdf: %.md
	quarto render $< --to pdf --output $@
%.pandoc.pdf: %.md
	pandoc \
	    --variable=papersize:a4 \
	    --variable=colorlinks \
	    --variable=documentclass:scrartcl \
	    --from=$(PANDOC_FORMAT) \
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
