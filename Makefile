# <https://www.oreilly.com/openbook/make3/book/ch07.pdf>
# <https://github.com/jaykrell/w3/blob/master/Makefile>
# <https://makefiletutorial.com/>
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

updatepip:
	$(PYCALL) -m pip install --upgrade pip setuptools
	$(PYCALL) -m piptools compile --rebuild
	$(PYCALL) -m pip install --upgrade -r requirements.txt
