" Vundle

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'michalbachowski/vim-wombat256mod'

Plugin 'scrooloose/nerdtree'

Plugin 'Valloric/YouCompleteMe'

Plugin 'artur-shaik/vim-javacomplete2'

Plugin 'neomake/neomake'

call vundle#end()
filetype plugin indent on

" My settings

set mouse=a

colorscheme wombat256mod
syntax on

set incsearch
set hlsearch

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


set number

set tabstop=4
set shiftwidth=4
set expandtab

autocmd vimenter * NERDTree
map <F2> :NERDTreeToggle<CR>

nnoremap <F12> :YcmCompleter GoTo<CR>
map <F6>  :YcmRestartServer<CR>
let g:ycm_python_binary_path='/usr/bin/python3'

autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype python setlocal colorcolumn=80
