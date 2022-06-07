#!/bin/bash
set -e

echo "Installing required packages"
sudo apt install -y \
    black \
    build-essential \
    cmake \
    flake8 \
    fzf \
    git \
    neovim \
    python3-dev \
    silversearcher-ag

vim_config_dir="$HOME/.config/nvim"
vimrc_path="$vim_config_dir/init.vim"
bundle_dir="$HOME/.vim/bundle"

echo "Copying vimrc to $vimrc_path"
mkdir -p $vim_config_dir
if [ -f $vimrc_path ]; then
    echo "Vimrc already exists at $vimrc_path . Remove to continue"
    exit 1
fi

cp .vimrc $vim_config_dir/init.vim

echo "Cloning Vundle"
mkdir -p $bundle_dir
git clone https://github.com/VundleVim/Vundle.vim.git $bundle_dir/Vundle.vim

echo "Installing plugins"
nvim +PluginInstall +qall

echo "Setting up YouCompleteMe with C++ completion support"
python3 $bundle_dir/YouCompleteMe/install.py --clang-completer

echo "Done. Try using nvim."

