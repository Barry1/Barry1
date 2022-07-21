python_base_dir!=pyenv prefix

beautify:
	$(python_base_dir)/bin/isort --profile=black --py=310 *.py 
	$(python_base_dir)/bin/black --target-version=py310 *.py
	$(python_base_dir)/bin/pylama --linters mccabe,pycodestyle,pydocstyle,pyflakes,pylint,isort *.py

typing:
#pyre
	$(python_base_dir)/bin/pytype --keep-going --jobs=auto python_verions=3.10 *.py
	$(python_base_dir)/bin/pyright *.py

vermin:
	$(python_base_dir)/bin/vermin --backport typing *.py
 