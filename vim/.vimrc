" vimrc
" author: bidong <liaoliaopro@gmail.com>


" Load external configuration before anything else {{{
if filereadable(expand("~/.vim/before.vim"))
    source ~/.vim/before.vimrc
endif
" }}}

if filereadable(expand("~/.vim/basic.vim"))
    source ~/.vim/basic.vim
endif

if filereadable(expand("~/.vim/filetypes.vim"))
    source ~/.vim/filetypes.vim
endif

if filereadable(expand("~/.vim/plugins.vim"))
    source ~/.vim/plugins.vim
endif

if filereadable(expand("~/.vim/extended.vim"))
    source ~/.vim/extended.vim
endif

" Load addidional configuration (ie to overwrite shorcuts) {{{
if filereadable(expand("~/.vim/after.vim"))
    source ~/.vim/after.vimrc
endif
" }}}

