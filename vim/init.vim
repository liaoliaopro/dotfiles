" vimrc
" author: bidong <liaoliaopro@gmail.com>


" Load external configuration before anything else
if filereadable(expand("~/.vim/before.vim"))
    source ~/.vim/before.vim
endif

if filereadable(expand("~/.vim/general.vim"))
    source ~/.vim/general.vim
endif

if filereadable(expand("~/.vim/plugins.vim"))
    source ~/.vim/plugins.vim
endif

" Load addidional configuration (ie to overwrite shorcuts)
if filereadable(expand("~/.vim/after.vimrc"))
    source ~/.vim/after.vimrc
endif
