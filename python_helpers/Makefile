
beautify:
	python -m isort --profile=black --py=310 *.py 
	python -m black --target-version=py310 *.py
	python -m pylama --linters mccabe,pycodestyle,pydocstyle,pyflakes,pylint,isort *.py
 