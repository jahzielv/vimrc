set nocompatible
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#000000
set expandtab
set tabstop=4
set autoindent
set number
set guifont=Courier_New:h9
map <F2> :tabnew<CR>
map <F3> :vsp<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
set backspace=2
syntax on
color darkblue
autocmd FileType java let b:jcommenter_class_author='jve6' 
autocmd FileType java let b:jcommenter_file_author='jve6' 
autocmd FileType java source $VIM/vim74/macros/jcommenter.vim 
"autocmd FileType java nmap <silent> <A-m> :call JCommentWriter()<CR> vim: set et sw=2 ts=2:
map <C-c> :call JCommentWriter()<CR>
if has("autocmd")
  filetype plugin indent on
endif
