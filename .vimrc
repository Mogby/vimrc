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

" Autocomplete for Java
Plugin 'artur-shaik/vim-javacomplete2'

" Linter
Plugin 'neomake/neomake'

call vundle#end()
filetype plugin indent on

" ---------- Plugin settings ----------

" wombat256mod
colorscheme wombat256mod

" NERDTree
autocmd vimenter * NERDTree
map <F2> :NERDTreeToggle<CR>

" YouCompleteMe
nnoremap <F12> :YcmCompleter GoTo<CR>
map <F6>  :YcmRestartServer<CR>
let g:ycm_python_binary_path='/usr/bin/python3'

" javacomplete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

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

" Highlight 80th column in python files
autocmd Filetype python setlocal colorcolumn=80
