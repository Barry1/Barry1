.PHONY: ALL LaTeX Info

APTCALL = @sudo apt install

ALL: Base Advanced LaTeX Info

Base:
	$(APTCALL) \
		bash-completion \
		chrony \
		g++ \
		gcc \
		git \
		make \
		net-tools \
		sudo \

Advanced: 
	$(APTCALL) \
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
		lyx \
		rubber \
		textlive-lang-german

Info:
	@$(APTCALL) \
		cpuinfo \
		freeipmi \
		inxi \
		ipmitool \
		neofetch \
		smartmontools \
