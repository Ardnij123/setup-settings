" Sample config for pb071 students, available at fi.muni.cz/pb071
" ===============================================================
" Requires VIM-8.0 to enable linting, on aisa run:
"   $ module add vim-8.0
" However, the linting will fail silently, if version is older.
"
" Comes with plugin manager Plug: we added 2 colorschemes
" and linting plugin ALE, which uses clang-tidy and gcc
" to highlight some syntax errors.
"
" Install Plug first in bash:
"   $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then run vim and install the plugins using command in normal mode:
"   :PlugInstall
"
" Most of the settings come from vimconfig.com. 
" We added few handy key mappings:
"
" Ctrl+Up/Down	    Move line or a block of selected lines  
" Ctrl+j/k	
" <leader>pp	    Toggle paste mode on and off
" <leader><cr>	    Disable search highlight
"
" <cr> is carriage return, "Enter"
" <leader> is backspace, "\", complete the combination in 1 second

set nocompatible
set encoding=utf-8

"""""
""""" Plugin manager Plug from https://github.com/junegunn/vim-plug
"""""
call plug#begin('~/.vim/plugged')
" Plug 'vim-airline/vim-airline' " status bar mod
    Plug 'tomasiser/vim-code-dark'  " colorscheme codedark
    Plug 'romainl/Apprentice'	    " colorscheme apprentice
    Plug 'w0rp/ale'
    Plug 'romainl/vim-cool'
    Plug 'StanAngeloff/php.vim'
call plug#end()

" Setup linting for c99
let g:ale_completion_enabled = 1
let g:ale_linters = {'c': ['gcc', 'clangtidy', 'clang-format'], 'cpp': ['cpp', 'clangtidy']}
let g:ale_c_gcc_executable = 'gcc'
let g:ale_c_gcc_options = '-std=c99 -Wall -Wextra -pedantic'
let g:ale_c_clang_executable = 'gcc'
let g:ale_c_clang_options = '-std=c99 -Wall -Wextra -pedantic'
let g:ale_c_clangtidy_executable = 'clang-tidy'
let g:ale_c_clangtidy_options = '-std=c99 -Wall -Wextra -pedantic'

let g:ale_cpp_cpp_executable = 'c++'
let g:ale_cpp_cpp_options = '-std=c++20 -Wall -Wextra -Werror -gdwarf-4 -MD -MP'
let g:ale_cpp_clangtidy_executable = '/packages/run.64/llvm-15.0.7/bin/clang-tidy'
let g:ale_cpp_clangtidy_options = '-std=c++20'

"""""

"""""
""""" Colors
"""""
syntax on

" Color schemes belong to ~/.vim/colors
" Find yours at https://vimcolors.com
" colorscheme codedark

" If using plugin vim-airline
" let g:airline_theme = 'codedark'

if &term =~ '256color'
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif 

" If you happen to still have a problem on some terminal, uncomment:
" set t_Co=256
" set t_ut=

highlight SignColumn ctermbg=233
highlight ColorColumn ctermbg=magenta
highlight ALEErrorSign ctermbg=233 ctermfg=red
highlight ALEWarningSign ctermbg=233 ctermfg=red
highlight AleStyleErrorSign ctermbg=233 ctermfg=red
highlight AleStyleWarningSign ctermbg=233 ctermfg=red
highlight LineNr ctermbg=233 ctermfg=240

highlight Comment ctermfg=27

highlight ALEError ctermbg=88

" let g:ale_change_sign_column_color=1
call matchadd('ColorColumn', '\%81v', 100)
"""""
""""" General
"""""
set number		" Show line numbers
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch		" Highlight matching brace
set showcmd	    	" Show last command on right
" set cursorline 		" Highlight current line
 
set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set ignorecase		" Always case-insensitive
set incsearch		" Searches for strings incrementally
 
set autoindent		" Auto-indent new lines
set cindent		" Use 'C' style program indenting
set shiftwidth=4	" Number of auto-indent spaces
set tabstop=4
set expandtab
set smartindent		" Enable smart-indent
set smarttab		" Enable smart-tabs
" set softtabstop=4 noexpandtab	" Number of spaces per Tab
set wrap 		" Wrap lines
"""""
""""" Advanced
"""""
set ruler			" Show row and column ruler information
set undolevels=1000		" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

"""""
""""" Key mapping
"""""
" Move lines using Ctrl+Up/Down in normal, insert and visual modes
nnoremap <C-Up> :m-2<CR>
nnoremap <C-Down> :m+<CR>
inoremap <C-Up> <Esc>:m-2<CR>
inoremap <C-Down> <Esc>:m+<CR>
vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv
" or Ctrl+j/k
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Toggle paste mode on and off
" \ + pp
map <leader>pp :setlocal paste!<cr>

" Disable search highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

map <ESC>[1;5C <C-Right>
map <ESC>[1;5D <C-Left>
map 1;5C <C-Right>
map 1;5D <C-Left>
