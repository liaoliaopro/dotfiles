# vim:set noet: 
.PHONY : usage conky fonts git bash vim tmux ipython

usage:

	@echo "Usage: "
	@echo "  make item(s) force=1/0"
	@echo "items can be:"
	@echo "  vim fonts conky git tmux sakura bash"
	@echo "make vim conky force=1   to force setup vim,conky"
	@echo "make all                 to setup all."

LNSOPT=-s

ifdef force
	ifeq ($(force),1)
		LNSOPT=-fs
	endif
endif

submodule:

	@echo "Update submodules .. "
	git submodule init
	git submodule update 

fonts:

	mkdir -p ~/.fonts
	cp $(CURDIR)/fonts/.fonts/*  ~/.fonts
	fc-cache -vf ~/.fonts 

powerline: fonts submodule

	cd plugins/powerline; git checkout develop; git pull ; python setup.py install
	mkdir -p ~/.config/powerline/themes
	mkdir -p ~/.config/powerline/colorschemes
	ln $(LNSOPT) $(CURDIR)/powerline/config.json ~/.config/powerline/

#vim: powerline submodule
vim: submodule

	mv ~/.vim ~/.vim_bakcup
	mv ~/.vimrc ~/.vimrc_bakcup
	ln $(LNSOPT) $(CURDIR)/vim ~/.vim
	ln $(LNSOPT) $(CURDIR)/vim/.vimrc ~/.vimrc
	vim -c "BundleInstall"

tmux: powerline

	mkdir -p ~/.config/powerline/themes/tmux
	ln $(LNSOPT) $(CURDIR)/powerline/themes/tmux/default.json  ~/.config/powerline/themes/tmux/default.json
	ln $(LNSOPT) $(CURDIR)/tmux/.tmux.conf  ~/.tmux.conf

conky:

	ln $(LNSOPT) $(CURDIR)/conky/.conkyrc ~/.conkyrc
	ln $(LNSOPT) $(CURDIR)/conky/.conky ~/.conky

git:

	ln $(LNSOPT) $(CURDIR)/git/.gitconfig ~/.gitconfig

dircolors-solarized:  submodule

	cd plugins/dircolors-solarized; git checkout master ; git pull ;
	ln $(LNSOPT) $(CURDIR)/plugins/dircolors-solarized/dircolors.256dark ~/dircolors.256dark
	
powerline-shell: submodule

	cd plugins/powerline-shell; git checkout master; git pull ; python setup.py install

bash: fonts dircolors-solarized powerline-shell

	ln $(LNSOPT) $(CURDIR)/bash/.bashrc ~/.bashrc

ipython: powerline 

	ln $(LNSOPT) $(CURDIR)/ipython/ipython_config.py ~/.ipython/profile_default/

all: git conky bash tmux vim

