#https://devhints.io/makefile
#https://tech.davis-hansson.com/p/make/
#https://www.gnu.org/software/make/manual/html_node/index.html
#https://www.gnu.org/software/make/manual/html_node/Quick-Reference.html#Quick-Referencee

.PHONY: ALL Base Advanced LaTeX Info PrintInfo Settings Printer BASHCFG

APTCALL = @sudo apt-get --quiet install

ALL: Base Advanced LaTeX Info PrintInfo BASHCFG

BASHCFG:
	@grep --quiet neofetch ~/.bashrc || echo neofetch >>~/.bashrc;

Base:
	$(APTCALL) \
		bash-completion \
		chrony \
		firmware-linux \
		firmware-linux-free \
		firmware-linux-nonfree \
		g++ \
		gcc \
		git \
		make \
		net-tools \
		sudo \

Advanced: 
	$(APTCALL) \
		and \
		aptitude \
		bpytop \
		conky-all \
		cron-apt \
		needrestart \
		needrestart-session \
		package-update-indicator \
		parallel \
		tldr \

LaTex:
	$(APTCALL) \
		chktex \
		gummy \
		lacheck \
		latexmk \
		lyx \
		rubber \
		textlive-lang-german

Info:
	@$(APTCALL) \
		cpuinfo \
		freeipmi \
		inxi \
		ipmitool \
		ipmiutil \
		neofetch \
		smartmontools \

PrintInfo:
	@neofetch

Settings:
	git config --global user.name "Dr. Bastian Ebeling"
	git config --global credential.helper store
	poetry config virtualenvs.in-project true

Printer:
	echo "Drucker XP 202"
	@$(APTCALL) libcanberra-gtk-module libqtgui4 libqtcore4 printer-driver-escpr
	#printer-driver-gutenprint geht nicht
