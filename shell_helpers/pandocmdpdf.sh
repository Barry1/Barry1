#!/bin/sh

USE_KROKI=1

set -- --output "${1%.md}.pdf" "$@"

PANDOC_DIR=$(pandoc -v | grep "User data directory" | awk --field-separator : '{print $2}')
## remove leading spaces
PANDOC_DIR=${PANDOC_DIR## }

set -- "--pdf-engine=xelatex" "$@"
set -- "--variable=author:Dr. Bastian Ebeling" "$@"
set -- "--variable=papersize:a4" "$@"
set -- "--variable=colorlinks" "$@"
set -- "--variable=documentclass:scrartcl" "$@"
set -- "--table-of-contents" "$@"
set -- "--from=markdown+smart+auto_identifiers+fancy_lists+task_lists+definition_lists+definition_lists+table_captions+pipe_tables+yaml_metadata_block+footnotes+citations+emoji+abbreviations+autolink_bare_uris" "$@"

if [ "$USE_KROKI" = 1 ]; then
	set -- "--filter=pandoc-kroki" "$@"
else
	set -- "--metadata=plantumlPath:/usr/share/plantuml/plantuml.jar" "$@"
	set -- "--lua-filter=${PANDOC_DIR}/filters/diagram-generator.lua" "$@"
	set -- "--filter=mermaid-filter" "$@"
	# not needed as better in lua-filter
	# set -- "--filter=pandoc-plantuml" "$@"
fi

prepare() {
	sudo apt-get install --upgrade pandoc-plantuml-filter librsvg2-bin
	sudo npm install --global mermaid-filter
	#pip install "git+https://gitlab.com/myriacore/pandoc-kroki-filter.git"
	#https://medium.com/geekculture/2022-fork-a-repository-from-gilab-to-github-58690ee5df1c
	#echo "CHANGE NEEDED"
	#echo 'Add "vega-lite": "vegalite" to DIAGRAM_SYNONYMNS'
	pip install "git+https://github.com/Barry1/pandoc-kroki-filter.git"
	#https://github.com/pandoc/lua-filters#installation
	#pandoc -v
	PANDOC_DIR=/home/ebeling/.local/share/pandoc
	RELEASE_URL=https://github.com/pandoc/lua-filters/releases/latest
	curl -LSs $RELEASE_URL/download/lua-filters.tar.gz |
		tar --strip-components=1 --one-top-level=$PANDOC_DIR -zvxf -
}

pandoc "$@"
