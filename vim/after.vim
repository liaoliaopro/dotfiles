" color scheme
colo gruvbox

" key mappings
tnoremap <Esc> <C-\><C-n>

" cursor shape
if &term == 'win32'
        let &t_ti.=" \e[1 q"
        let &t_SI.=" \e[5 q-- INSERT --"
        let &t_EI.=" \e[1 q"
        let &t_te.=" \e[0 q"
else
        let &t_ti.="\e[1 q"
        let &t_SI.="\e[5 q"
        let &t_EI.="\e[1 q"
        let &t_te.="\e[0 q"
endif
