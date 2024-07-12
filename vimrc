call plug#begin()

" Plugin 'potion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'sheerun/vim-polyglot'
" Plugin 'vuejs/vue-syntax-highlight'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
" Plugin 'davidhalter/jedi-vim'
Plug 'mattn/emmet-vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'alvan/vim-closetag'
Plug 'python-mode/python-mode',  { 'for': 'python', 'branch': 'develop' }

call plug#end()
" au FileType python Plug 'neoclide/coc.nvim', {'on': []}

syntax enable
filetype plugin indent on    " required
set completeopt-=preview
set number

" set ts=4

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

autocmd! bufwritepost .vimrc source %

let mapleader=";"
let g:jedi#completions_command="<C-X>"

" command R !./%
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap jk <ESC>

"jump out [], ()
inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

nnoremap <leader>nt :NERDTreeToggle<CR>


nnoremap <leader>gp :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>gp :<c-u>call <SID>GrepOperator(visualmode())<cr>
function! s:GrepOperator(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    silent execute "grep! -R " . shellescape(@@) . " ."
    copen
    let @@ = saved_unnamed_register
endfunction

"inoremap { {<CR>}<Esc>O
let g:pymode_rope = 1
let g:pymode_options_max_line_length = 100
let g:pymode_lint_ignore = ['E722', 'E501']
let g:pymode_python = 'python3'
let g:pymode_folding = 0
let g:pymode_preview_position = 'topleft'
let g:coc_disabled_servers = ['python']
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
autocmd FileType vue setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
