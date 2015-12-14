" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1


let mapleader=";"

nnoremap <leader>g :silent exe "grep! -R " . shellescape(expand("<cWORD>")) . " ." <cr>:copen<cr>


inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
:inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type==#'v':
        execute "normal! `<v`>y"
    elseif a:type==#'char':
        execute "normal! `[v`]y"
    else
        return
    endif
    echo @@
endfunction


inoremap { {<CR>}<Esc>O
