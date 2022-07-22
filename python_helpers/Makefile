python_base_dir!=pyenv prefix
python_bin_dir=$(python_base_dir)/bin/

beautify:
	$(python_bin_dir)isort --profile=black --py=310 *.py 
	$(python_bin_dir)black --target-version=py310 *.py
	$(python_bin_dir)pylama --linters mccabe,pycodestyle,pydocstyle,pyflakes,pylint,isort *.py

typing:
#pyre
	$(python_bin_dir)pytype --keep-going --jobs=auto python_verions=3.10 *.py
	$(python_bin_dir)pyright *.py

vermin:
	$(python_bin_dir)vermin --backport typing *.py

pyre:
	$(python_bin_dir)pyre --noninteractive