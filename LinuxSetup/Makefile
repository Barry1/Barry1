#https://devhints.io/makefile
#https://tech.davis-hansson.com/p/make/
#https://www.gnu.org/software/make/manual/html_node/index.html
#https://www.gnu.org/software/make/manual/html_node/Quick-Reference.html#Quick-Referencee

.PHONY: ALL Base Advanced LaTeX Info PrintInfo Settings Printer BASHCFG PYTHON i915

APTCALL = @sudo apt-get --quiet install

ALL: Base Advanced LaTeX Info PrintInfo BASHCFG PYTHON i915

i915:
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/skl_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/bxt_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/kbl_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/glk_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/kbl_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/kbl_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/cml_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/icl_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/ehl_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/ehl_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/tgl_huc_7.9.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/tgl_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/tgl_huc_7.9.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/tgl_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/dg1_huc_7.9.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/dg1_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/tgl_huc_7.9.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/tgl_guc_62.0.0.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/tgl_huc_7.9.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/adlp_guc_62.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/tgl_dmc_ver2_12.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/rkl_dmc_ver2_03.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/adlp_dmc_ver2_12.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/skl_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/bxt_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/kbl_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/glk_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/kbl_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/kbl_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/cml_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/icl_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/ehl_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/ehl_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/tgl_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/tgl_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/dg1_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/tgl_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/adlp_guc_69.0.3.bin
	sudo wget --directory-prefix=/lib/firmware/i915/  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/adlp_dmc_ver2_14.bin
	sudo update-initramfs -u -k all

PYTHON:
	$(APTCALL) \
		pypy3
		rustc
		pypy3-dev
		python3
		python3-dev

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
