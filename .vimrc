set nocompatible
set colorcolumn=80
highlight ColorColumn ctermbg=15
set expandtab
set tabstop=4
set autoindent
set number
set guifont=Courier_New:h12
map <F2> :tabnew<CR>
map <F3> :vsp<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
set backspace=2
syntax on
color darkblue
set autochdir
"autocmd FileType java let b:jcommenter_class_author='jve4' 
"autocmd FileType java let b:jcommenter_file_author='jve6' 
"autocmd FileType java source $VIM/vim74/macros/jcommenter.vim 
"autocmd FileType java nmap <silent> <A-m> :call JCommentWriter()<CR> vim: set et sw=2 ts=2:
"map <C-c> :call JCommentWriter()<CR>
"if has("autocmd")
"  filetype plugin indent on
"endif
"map <F4> :silent !ctags '%:t'<CR>
function! WriteAndUpdateCtags()
    execute ":w"
    execute ":silent !ctags '%'"
    execute ":redraw!"
endfunction
map <C-w> :call WriteAndUpdateCtags()<CR>
map <C-S-p> <C-x><C-]><CR>
function! CompileJava()
    execute ":! javac '%'"
    execute ":! java '%:r'"
endfunction
map <F4> :call CompileJava()<CR>
""inoremap { {}
inoremap <expr> <CR> getchar() == "{" ? ':call TabCurly()' : '<CR>'

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i
inoremap <C-J> Jahziel Villasana-Espinoza

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
    endif
endfunction

function! RemoveComments()
    let fileType = &ft
    if fileType ==? "java" || fileType ==? "c"
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
        call feedkeys("\<ESC>")
    endif
endfunction

function! TabCurly()
    call feedkeys("\<CR>")
    call feedkeys("\<ESC>")
    call feedkeys("ko")
    call feedkeys("\<TAB>")

endfunction

nnoremap <C-S-I> :call InsertComments()<CR>
nnoremap <C-S-O> :call RemoveComments()<CR>

