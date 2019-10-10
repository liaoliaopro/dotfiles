" vimrc
" author: bidong <liaoliaopro@gmail.com>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include plugins and initialize
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" autocomplete
if has("win32")
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1
else
    Plug 'Valloric/YouCompleteMe'
    " disable preview window while autocomplete
    set completeopt-=preview
    let g:ycm_add_preview_to_completeopt = 0
endif

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_types = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <leader>tc <Plug>(go-coverage)
"au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Split or join struct
Plug 'AndrewRadev/splitjoin.vim'

" python
Plug 'google/yapf'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'

" html/xml/css
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

" extend % to support jump between html tag
Plug 'vim-scripts/matchit.zip'

" syntax check
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_python_checkers=['flake8']
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']

" asynchronous lint engine
Plug 'dense-analysis/ale'

" color
Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1

Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }

" edit utility
Plug 'Raimondi/delimitMate'
Plug 'mileszs/ack.vim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-j>"

" fancy
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"Plug 'Shougo/denite.nvim'
Plug 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:minikufExplModSelTarget = 1

Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-multiple-cursors'

Plug 'majutsushi/tagbar'
nmap <leader>tb :TagbarToggle<CR>

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nmap <leader>e :NERDTreeToggle<CR>

Plug 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" misc: csv/protobuf/toml/yamml
Plug 'chrisbra/csv.vim'
Plug 'uarun/vim-protobuf'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugs must be added before the following line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
