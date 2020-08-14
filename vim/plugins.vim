" vimrc
" author: bidong <liaoliaopro@gmail.com>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include plugins and initialize
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_auto_type_info = 1

" rust
Plug 'rust-lang/rust.vim'

" javascript
Plug 'pangloss/vim-javascript'

" html/xml/css
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'maxmellon/vim-jsx-pretty'

" search&view sombols
Plug 'majutsushi/tagbar'
let g:tagbar_left = 1

Plug 'liuchengxu/vista.vim'
let g:vista_sidebar_position = 'vertical topleft'
let g:vista_sidebar_width = 40

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" split or join struct
Plug 'AndrewRadev/splitjoin.vim'

" fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"let g:Lf_GtagsAutoGenerate = 1
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "BufTag":    [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" asynchronous lint engine
Plug 'dense-analysis/ale'
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
" not work here! check coc-python format
let g:ale_fixers = {
    \ 'python': ['yapf', 'isort'],
    \ }
let g:ale_fix_on_save = 1
let g:ale_linters = {'rust': ['analyzer']}


" color
Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1

Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }

" edit utility
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-dirvish'
nmap <leader>e :Dirvish<CR>

Plug 'andymass/vim-matchup'
Plug 'Raimondi/delimitMate'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'

Plug 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:minikufExplModSelTarget = 1

Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-visual-multi'

Plug 'scrooloose/nerdcommenter'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" misc: csv/protobuf/toml/yamml
Plug 'chrisbra/csv.vim'
Plug 'uarun/vim-protobuf'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'

" text objects
Plug 'jeetsukumaran/vim-pythonsense'

" fancy
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
"let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'


" fancy start screen
Plug 'mhinz/vim-startify'

" window resizer
Plug 'simeji/winresizer'

" terminal
Plug 'voldikss/vim-floaterm'

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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using CoC 
" ----------------------------------------------------------
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using coc-snippets
" ----------------------------------------------------------
" Use <C-l> for expand
"imap <C-l> <Plug>(coc-snippets-expand)

" Using CocList
" ----------------------------------------------------------
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Using Leaderf
" ----------------------------------------------------------
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
noremap <C-F>f :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search word under cursor, the pattern is treated as regex,
" append the result to previous search results.
noremap <C-F>g :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>
" search word under cursor literally only in current buffer
noremap <C-F>b :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>
" search word under cursor literally in all listed buffers
noremap <C-F>d :<C-U><C-R>=printf("Leaderf! rg -F --all-buffers -e %s ", expand("<cword>"))<CR>
" recall last search. If the result window is closed, reopen it.
noremap <C-F>t :<C-U>Leaderf! rg --recall<CR>

" F2 function list
noremap <F2> :LeaderfFunction<CR>
" F3 tag list
noremap <F3> :LeaderfBufTag<CR>
" F4
noremap <F4> :call Build()<CR>
" F5 run
noremap <F5> :call Execute()<CR>
" F6 test
noremap <F6> :call Test()<CR>
" F10 
noremap <F10> :Vista!!<CR>
" F8 
noremap <F8> :TagbarToggle<CR>

nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

" <leader>f All files
" <leader>m MRU files 
noremap <leader>m :LeaderfMru<CR>


" Functions
" ----------------------------------------------------------
func! Execute()
    if &filetype == 'python'
        call CocActionAsync('runCommand','python.execInTerminal')
    elseif &filetype == 'rust'
        :Cargo run
    elseif &filetype == 'go'
        :GoRun
    endif
endfunc

func! Build()
    if &filetype == 'python'
    elseif &filetype == 'rust'
        :Cargo build
    elseif &filetype == 'go'
        :GoBuild
    endif
endfunc

func! Test()
    if &filetype == 'python'
    elseif &filetype == 'rust'
        :Cargo test
    elseif &filetype == 'go'
        :GoTest
    endif
endfunc
