.PHONY : usage conky fonts git bash vim tmux ipython

vim:

	ln -s $(LNSOPT) $(CURDIR)/vim ~/.vim
	ln -s $(LNSOPT) $(CURDIR)/vim/init.vim ~/.vimrc
	ln -s $(LNSOPT) $(CURDIR)/vim/ ~/.config/nvim

git:

	ln $(LNSOPT) $(CURDIR)/git/.gitconfig ~/.gitconfig

all: git vim

