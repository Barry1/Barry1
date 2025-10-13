# <https://www.oreilly.com/openbook/make3/book/ch07.pdf>
# <https://github.com/jaykrell/w3/blob/master/Makefile>
# <https://makefiletutorial.com/>
.PHONY = pyre pytype mypy

PYOBJS!=tree -if|egrep \.pyi?$

all: updatepip

# differentiation between `nmake` and `make` borrowed from <https://stackoverflow.com/a/66311071>

ifdef MAKEDIR: # gmake: false; nmake: unused target
!ifdef MAKEDIR # gmake: not seen; nmake: true

# Microsoft nmake.
PYCALL = python

!else # and now the other
else

# GNU (Posix?) make.
PYCALL = sudo python3

endif    # gmake: close condition; nmake: not seen
!endif : # gmake: unused target; nmake close conditional

PYCALL = poetry run python3

act_install:
	curl --proto '=https' --tlsv1.2 -sSf  https://raw.githubusercontent.com/nektos/act/master/install.sh | bash -s -- -b ~/.local/bin

pyre:
	poetry run pyre

mypy:
	poetry run  mypy --install-types --non-interactive `find . -name \*\.py|grep -v \.venv`

pytype:
	poetry run pytype --jobs auto --precise-return --protocols --bind-properties $(PYOBJS)

updatepip:
	poetry update
#	$(PYCALL) -m pip install --upgrade pip setuptools
#	$(PYCALL) -m piptools compile --rebuild
#	$(PYCALL) -m pip install --upgrade -r requirements.txt

showpipconf:
	$(PYCALL) -m pip config debug

vermin:
	poetry run vermin -vv --backport typing --no-parse-comments .

FullGlossary.pdf: FullGlossary.tex Glossary.tex /home/ebeling/.latexmkrc
#	xelatex FullGlossary.tex
#	makeglossaries FullGlossary
#	xelatex FullGlossary.tex
#	makeglossaries FullGlossary
#	xelatex FullGlossary.tex
	latexmk -xelatex -auxdir=latexmk.aux FullGlossary.tex
#   remove helpfiles latexmk -xelatex FullGlossary.tex -C
#   needs https://www.ctan.org/tex-archive/support/latexmk/example_rcfiles

define latexmkheredocscript
cat <<'EOF' > $@
add_cus_dep( 'acn', 'acr', 0, 'makeglossaries' );
add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
add_cus_dep( 'syg', 'syi', 0, 'makeglossaries' );
$$clean_ext .= " acr acn alg glo gls glg syg syi slg xdy";
sub makeglossaries {
    my ($$base_name, $$path) = fileparse( $$_[0] );
    my @args = ( "-q", "-d", $$path, $$base_name );
    if ($$silent) { unshift @args, "-q"; }
        return system "makeglossaries", "-d", $$path, $$base_name; 
}
EOF
endef
export latexmkheredocscript

/home/ebeling/.latexmkrc:; @ eval "$$latexmkheredocscript"

