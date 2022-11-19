#https://devhints.io/makefile
#https://tech.davis-hansson.com/p/make/
#https://www.gnu.org/software/make/manual/html_node/index.html
#https://www.gnu.org/software/make/manual/html_node/Quick-Reference.html#Quick-Referencee

.PHONY: ALL Base Advanced LaTeX Info PrintInfo Settings Printer BASHCFG PYTHON i915 bpm

APTCALL = @sudo apt-get --quiet install

ALL: Base Advanced LaTeX Info PrintInfo BASHCFG PYTHON i915 bpm

bpm:
	sudo apt install bpm-tools sox libsox-fmt-all

#/lib/firmware/i915/dg2_dmc_ver2_06.bin:
#	dg2_dmc_ver2_06.bin

/lib/firmware/i915/%.bin:
	$*.bin

i915: /lib/firmware/i915/dg2_dmc_ver2_06.bin /lib/firmware/i915/skl_guc_62.0.0.bin /lib/firmware/i915/bxt_guc_62.0.0.bin /lib/firmware/i915/kbl_guc_62.0.0.bin /lib/firmware/i915/glk_guc_62.0.0.bin /lib/firmware/i915/kbl_guc_62.0.0.bin /lib/firmware/i915/kbl_guc_62.0.0.bin /lib/firmware/i915/cml_guc_62.0.0.bin /lib/firmware/i915/icl_guc_62.0.0.bin /lib/firmware/i915/ehl_guc_62.0.0.bin /lib/firmware/i915/ehl_guc_62.0.0.bin /lib/firmware/i915/tgl_huc_7.9.3.bin /lib/firmware/i915/tgl_guc_62.0.0.bin /lib/firmware/i915/tgl_huc_7.9.3.bin /lib/firmware/i915/tgl_guc_62.0.0.bin /lib/firmware/i915/dg1_huc_7.9.3.bin /lib/firmware/i915/dg1_guc_62.0.0.bin /lib/firmware/i915/tgl_huc_7.9.3.bin /lib/firmware/i915/tgl_guc_62.0.0.bin /lib/firmware/i915/tgl_huc_7.9.3.bin /lib/firmware/i915/adlp_guc_62.0.3.bin /lib/firmware/i915/tgl_dmc_ver2_12.bin /lib/firmware/i915/rkl_dmc_ver2_03.bin /lib/firmware/i915/adlp_dmc_ver2_12.bin /lib/firmware/i915/skl_guc_69.0.3.bin /lib/firmware/i915/bxt_guc_69.0.3.bin /lib/firmware/i915/kbl_guc_69.0.3.bin /lib/firmware/i915/glk_guc_69.0.3.bin /lib/firmware/i915/kbl_guc_69.0.3.bin /lib/firmware/i915/kbl_guc_69.0.3.bin /lib/firmware/i915/cml_guc_69.0.3.bin /lib/firmware/i915/icl_guc_69.0.3.bin /lib/firmware/i915/ehl_guc_69.0.3.bin /lib/firmware/i915/ehl_guc_69.0.3.bin /lib/firmware/i915/tgl_guc_69.0.3.bin /lib/firmware/i915/tgl_guc_69.0.3.bin /lib/firmware/i915/dg1_guc_69.0.3.bin /lib/firmware/i915/tgl_guc_69.0.3.bin /lib/firmware/i915/adlp_guc_69.0.3.bin /lib/firmware/i915/adlp_dmc_ver2_14.bin /lib/firmware/i915/skl_guc_70.1.1.bin /lib/firmware/i915/bxt_guc_70.1.1.bin /lib/firmware/i915/kbl_guc_70.1.1.bin /lib/firmware/i915/glk_guc_70.1.1.bin /lib/firmware/i915/kbl_guc_70.1.1.bin /lib/firmware/i915/kbl_guc_70.1.1.bin /lib/firmware/i915/cml_guc_70.1.1.bin /lib/firmware/i915/icl_guc_70.1.1.bin /lib/firmware/i915/ehl_guc_70.1.1.bin /lib/firmware/i915/ehl_guc_70.1.1.bin /lib/firmware/i915/tgl_guc_70.1.1.bin /lib/firmware/i915/tgl_guc_70.1.1.bin /lib/firmware/i915/dg1_guc_70.1.1.bin /lib/firmware/i915/tgl_guc_70.1.1.bin /lib/firmware/i915/adlp_guc_70.1.1.bin /lib/firmware/i915/dg2_guc_70.1.2.bin /lib/firmware/i915/adlp_dmc_ver2_16.bin
	sudo update-initramfs -u -k all

PYTHON:
	$(APTCALL) \
		pypy3
		rustc
		pypy3-dev
		python3
		python3-dev

pandoc:
	@grep --quiet "pandoc --bash-completion" ~/.bashrc || echo 'eval "$(pandoc --bash-completion)"' >> ~/.bashrc

pyenv:
	curl https://pyenv.run | bash
	@grep --quiet PYENV_ROOT ~/.bashrc || echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
	@grep --quiet "command -v pyenv" ~/.bashrc || echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
	@grep --quiet "pyenv init -" ~/.bashrc || echo 'eval "$(pyenv init -)"' >> ~/.bashrc
	pyenv update
	sudo apt-get update
	$(APTCALL) \
		build-essential \
		curl \
		libbz2-dev \
		libffi-dev \
		liblzma-dev \
		libncursesw5-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		libxml2-dev \
		libxmlsec1-dev \
		llvm \
		make \
		tk-dev \
		wget \
		xz-utils \
		zlib1g-dev \

	pyenv doctor
	pyenv versions
	pyenv install --list

BASHCFG:
	@grep --quiet neofetch ~/.bashrc || echo neofetch >>~/.bashrc;
	@grep --quiet inxi ~/.bashrc || echo inxi >>~/.bashrc;

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
		nala \
		needrestart \
		needrestart-session \
		package-update-indicator \
		parallel \
		shellcheck \
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

#https://tldp.org/LDP/abs/html/here-docs.html
