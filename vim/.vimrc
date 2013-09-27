" vimrc
" author: bidong <liaoliaopro@gmail.com>


" Load external configuration before anything else {{{
if filereadable(expand("~/.vim/before.vimrc"))
    source ~/.vim/before.vimrc
endif
" }}}


" Vundle plugins {{{
let mapleader = ","
let maplocalleader = "\\"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

" vundle itself
Bundle 'gmarik/vundle'

" trying this 
"Bundle "thinca/vim-quickrun"
Bundle 'spolu/dwm.vim'

" python
Bundle 'davidhalter/jedi-vim'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'hdima/python-syntax'

" javascript
Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'

" c/c++
"Bundle 'vim-scripts/a.vim'
Bundle 'Rip-Rip/clang_complete'
"Bundle 'vim-scripts/c.vim'

" html/xml/css
Bundle 'mattn/emmet-vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/html5.vim'

" syntax
Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" color
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'

" utility
Bundle 'Townk/vim-autoclose'
Bundle 'rking/ag.vim'
map <silent> <leader>a :Ag<cr>

Bundle 'godlygeek/tabular'
if exists(":Tabularize")
    nmap <leader>a= :Tabularize /=<CR>
    vmap <leader>a= :Tabularize /=<CR>
    nmap <leader>a: :Tabularize /:\zs<CR>
    vmap <leader>a: :Tabularize /:\zs<CR>
endif
Bundle 'kien/ctrlp.vim'
Bundle 'Spaceghost/vim-matchit'
Bundle "YankRing.vim"
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
let g:yankring_history_dir = '~/.vim/tmp'
nmap <leader>y :YRShow<cr>

" neocomplcache {{{
Bundle 'Shougo/neocomplcache'  

let g:neocomplcache_enable_at_startup = 1 " Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_smart_case = 1 " Use smartcase.
let g:neocomplcache_enable_camel_case_completion = 1 " Use camel case completion.
let g:neocomplcache_enable_underbar_completion = 1 " Use underscore completion.
let g:neocomplcache_min_syntax_length = 3 " Sets minimum char length of syntax keyword.

if !exists('g:neocomplcache_keyword_patterns') " Define keyword, for minor languages
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>" " <CR>: close popup and save indent.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" " <TAB>: completion.

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=jedi#complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions['python'] = 'jedi#complete'
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0

" Working with clang_complete
if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library=1
let g:clang_library_path="/usr/lib/"
" }}}

Bundle 'SirVer/ultisnips'
Bundle 'JazzCore/neocomplcache-ultisnips'

Bundle 'kana/vim-fakeclip'
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:minikufExplModSelTarget = 1

Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'sjl/gundo.vim'
map <leader>gd :GundoToggle<CR>

Bundle 'majutsushi/tagbar'
nmap <leader>t :TagbarToggle<CR>

Bundle 'scrooloose/nerdtree'
nmap <leader>e :NERDTreeToggle<CR>
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L
Bundle 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

" os
"Bundle 'zaiste/tmux.vim'
"Bundle 'benmills/vimux'
"map <Leader>rp :VimuxPromptCommand<CR>
"map <Leader>rl :VimuxRunLastCommand<CR>
"map <LocalLeader>d :call VimuxRunCommand(@v, 0)<CR>

" fancy
Bundle 'Lokaltog/vim-powerline'
"Bundle 'Lokaltog/powerline'
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" git
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
nmap <leader>g :Ggrep
" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

" misc

" }}}


" General "{{{
set nocompatible  " disable vi compatibility.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set autoread  
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed  " Yanks go on clipboard instead.
set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard
set tags=./tags;$HOME " walk directory tree upto $HOME looking for tags
" Modeline
set modeline
set modelines=5 " default numbers of lines to read for modeline instructions
" Backup
set nowritebackup
set nobackup
set noswapfile
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
" Buffers
set hidden " The current buffer can be put to the background without writing to disk
" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase		" be sensitive when there's a capital letter
set incsearch   "
" "}}}


" Formatting "{{{
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0		" Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start	" more powerful backspacing

set tabstop=4    " Set the default tabstop
set softtabstop=4
set shiftwidth=4 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set cursorline
set smartindent
set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

syntax on               " enable syntax
filetype plugin indent on             " Automatically detect file types.
" "}}}


" Visual "{{{
set nonumber  " Line numbers off
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set vb t_vb= " disable any beeps or flashes on error
set laststatus=2  " Always show status line.
set noshowmode " Hide the default mode text
set ruler  " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages

set nolist " Display unprintable characters f12 - switches
"set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping

set number " Show line number
set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 

set mouse-=a   " Disable mouse
set mousehide  " Hide mouse after chars typed

set splitbelow
set splitright

autocmd GUIEnter * set vb t_vb= " disable both bell and visual flash
autocmd VimEnter * set vb t_vb=

" font settings
if has('gui_gtk2')
    set gfn=Yahei\ Consolas\ Hybrid\ 12       " set font
elseif has('gui_win32')
    set gfn=Consolas:h12       " set font
elseif has('gui_macvim')
    set gfn=Yahei\ Consolas\ Hybrid:h12       " set font
endif

" gui/gui settings
if has('gui_running')
    set guioptions-=T              " hide toolbar
    colo molokai
    "set background=light
    "colo solarized
else
    set t_Co=256                  " let termianl support 16 colors.
    "set t_Co=16                  " let termianl support 256 colors.
    colo molokai
    "set background=dark
    "colo solarized
endif

" support chinese display
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,default,ucs-bom,latin1
set ambiwidth=double
" "}}}


" Command and Auto commands " {{{
" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!

"Auto commands
au BufRead,BufNewFile {*.py,*.pyw,*.pyx}                              set ft=python
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file
" " }}}


" Key mappings " {{{
nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>rt :tabnew ~/.vim/.vimrc<CR>
nnoremap <silent> <LocalLeader>re :e ~/.vim/.vimrc<CR>
nnoremap <silent> <LocalLeader>rd :e ~/.vim/ <CR>

" Tabs 
nnoremap <silent> <LocalLeader>[ :tabprev<CR>
nnoremap <silent> <LocalLeader>] :tabnext<CR>
" Duplication 
vnoremap <silent> <LocalLeader>= yP
nnoremap <silent> <LocalLeader>= YP
" Buffers
nnoremap <silent> <LocalLeader>- :bd<CR>
" Split line(opposite to S-J joining line) 
nnoremap <silent> <C-J> gEa<CR><ESC>ew 

" map <silent> <C-W>v :vnew<CR>
" map <silent> <C-W>s :snew<CR>

nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

map <S-CR> A<CR><ESC>

" Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" show/Hide hidden Chars
map <silent> <F9> :set invlist<CR>     

" generate HTML version current buffer using current color scheme
map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR> 

" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" better ESC
inoremap jk <Esc>

nmap <silent> <leader>hh :set invhlsearch<CR>
nmap <silent> <leader>ll :set invlist<CR>
nmap <silent> <leader>nn :set invnumber<CR>
nmap <silent> <leader>pp :set invpaste<CR>
nmap <silent> <leader>ii :set invrelativenumber<CR>

" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>
noremap <leader>bd :bdelete<cr>

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Shortcut for [] motion
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[

" include mswin.vim to make vim be compatible with MS editor's conventions
"source $VIMRUNTIME/mswin.vim

" format source code
map <F12> :call FormartSrc()<CR>
" define FormartSrc
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi  -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'|| &filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    endif
    exec "e! %"
endfunc

" preview html
map <Leader>p :!google-chrome %<CR><CR>

" exec python code of current buffer
map <silent> <leader>x :!python "%"<cr>

" css tidy
autocmd filetype css setlocal equalprg=csstidy\ -\ --silent=true

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" " }}}


" Load addidional configuration (ie to overwrite shorcuts) {{{
if filereadable(expand("~/.vim/after.vimrc"))
    source ~/.vim/after.vimrc
endif
" }}}

