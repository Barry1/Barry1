#!/bin/sh

prepare() {
	sudo apt-get install --upgrade pandoc-plantuml-filter
	sudo npm install --global mermaid-filter
}

pandoc --pdf-engine=xelatex \
	--variable=author:"Dr. Bastian Ebeling" --variable=papersize:a4 --variable=colorlinks \
	--variable=documentclass:scrartcl --table-of-contents --listings \
	--filter pandoc-plantuml \
	--filter mermaid-filter \
	--output="${1%.md}.pdf" "$1"
