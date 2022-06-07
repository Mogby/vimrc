" ---------- Vundle settings ----------

" Required for Vundle to work
set nocompatible
filetype off

" Vundle plugins list
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugin manager
Plugin 'VundleVim/Vundle.vim'

" Custom color scheme
Plugin 'michalbachowski/vim-wombat256mod'

" File system explorer
Plugin 'scrooloose/nerdtree'

" Autocomplete for Python, C++ and other languages
Plugin 'Valloric/YouCompleteMe'

" Formatter
Plugin 'psf/black'

" Linter
Plugin 'neomake/neomake'

" Search
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on

" ---------- Plugin settings ----------

" wombat256mod
colorscheme wombat256mod

" NERDTree
map <F2> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>

" YouCompleteMe
nnoremap <F12> :YcmCompleter GoTo<CR>
map <F6>  :YcmRestartServer<CR>
let g:ycm_python_binary_path='/usr/bin/python3'

" Black
let g:black_linelength = 120
let g:black_skip_string_normalization = 1
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

" neomake
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore= E203,E741,W605,W503,W504,H306,H238,H301,H202', '--max-complexity= 10', '--max-line-length= 120']
    \ }
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nw')

" fzf
map <leader>f :Files<CR>

" ---------- My custom settings ----------

set mouse=a

set number

set tabstop=4
set shiftwidth=4
set expandtab

syntax on

set incsearch
set hlsearch

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Highlight 121st column in python files
autocmd Filetype python setlocal colorcolumn=121
