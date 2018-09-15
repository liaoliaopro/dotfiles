.PHONY : usage conky fonts git bash vim tmux ipython

vim:

	ln $(LNSOPT) $(CURDIR)/vim ~/.vim
	ln $(LNSOPT) $(CURDIR)/vim/.vimrc ~/.vimrc
	ln $(LNSOPT) $(CURDIR)/vim/ ~/.config/nvim
	ln $(LNSOPT) $(CURDIR)/vim/.vimrc ~/.config/nvim/init.vim

git:

	ln $(LNSOPT) $(CURDIR)/git/.gitconfig ~/.gitconfig

all: git vim

