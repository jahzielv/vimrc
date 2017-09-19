""================================
"" Author: Jahziel Villasana-Espinoza
"" Date Revised: 9/19/17
""================================

""================================
""          SETTINGS
""================================

set nocompatible
set colorcolumn=80
highlight ColorColumn ctermbg=15
set expandtab
set tabstop=4
set autoindent
set number
set guifont=Courier_New:h12
set backspace=2
syntax on
color darkblue
set autochdir

""================================
""            MAPS
""================================

map <F2> :tabnew<CR>
map <F3> :vsp<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
map <C-w> :call WriteAndUpdateCtags()<CR>
map <C-S-p> <C-x><C-]><CR>
autocmd FileType java map <F4> :call CompileJava()<CR>
inoremap <silent> { {}<ESC>:call TabCurly()<CR>
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i
nnoremap <C-S-I> :call InsertComments()<CR>
nnoremap <C-S-O> :call RemoveComments()<CR>
inoremap <C-J> Jahziel Villasana-Espinoza


""================================
""uncomment if you have the jcommenter plugin installed
""================================
"autocmd FileType java let b:jcommenter_class_author='jve4' 
"autocmd FileType java let b:jcommenter_file_author='jve6' 
"autocmd FileType java source $VIM/vim74/macros/jcommenter.vim 
"autocmd FileType java nmap <silent> <A-m> :call JCommentWriter()<CR> vim: set et sw=2 ts=2:
"map <C-c> :call JCommentWriter()<CR>
"if has("autocmd")
"  filetype plugin indent on
"endif
"map <F4> :silent !ctags '%:t'<CR>



""================================
""          FUNCTIONS
""================================

" function for use with ctags program; updates ctags file when writing
function! WriteAndUpdateCtags()
    execute ":w"
    execute ":silent !ctags '%'"
    execute ":redraw!"
endfunction

" function for compiling Java source without leaving Vim
function! CompileJava()
    execute ":! javac '%'"
    execute ":! java '%:r'"
endfunction

" function for inserting comments in various different languages.
function! InsertComments()
    let phileType = &ft
    if phileType ==? "vb"
        call feedkeys("I")
        call feedkeys("'")
        call feedkeys("\<ESC>")
    elseif phileType ==? "java" || phileType ==? "c"
        call feedkeys("I")
        call feedkeys("//")
        call feedkeys("\<ESC>")
    elseif phileType ==? "py"
        call feedkeys("I")
        call feedkeys("#")
        call feedkeys("\<ESC>")
    elseif phileType ==? "vim"
        call feedkeys("I")
        call feedkeys("\"")
        call feedkeys("\<ESC>")
    endif
endfunction

" function for removing comments in various different languages.
function! RemoveComments()
    let fileType = &ft
    if fileType ==? "java" || fileType ==? "c" || fileType ==? "vim"
        call feedkeys("I")
        call feedkeys("\<Right>")
        call feedkeys("\<Right>")
        call feedkeys("\<C-H>")
        call feedkeys("\<C-H>")
        call feedkeys("\<ESC>")
    else
        call feedkeys("I")
        call feedkeys("\<Right>")
        call feedkeys("\<C-H>")
        call feedkeys("\<C-H>")
        call feedkeys("\<ESC>")
    endif
endfunction

" function for automating curly brace indentation
function! TabCurly()
    let curl = getchar()
    if curl == 13
        call feedkeys("i")
        call feedkeys("\<CR>")
        call feedkeys("\<ESC>")
        call feedkeys("ko")
        call feedkeys("\<TAB>")
    else
        call feedkeys("i")
        call feedkeys(nr2char(curl))
    endif
endfunction
