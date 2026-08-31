#~/.Makefile
#Best use pattern rules only

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
