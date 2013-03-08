#!/bin/bash
basepath=$(cd $(dirname $0);pwd)

cd $basepath

# Create symlink
vimrc_symlink=$HOME/.vimrc
if [ ! -L $vimrc_symlink ]
then
    ln -s $basepath/.vimrc $vimrc_symlink
fi

vim_symlink=$HOME/.vim
if [ ! -L $vim_symlink ]
then
    ln -s $basepath/.vim $vim_symlink
fi

# Install Vundle
git submodule init
git submodule update

# Install Bundles
vim +BundleInstall +qall
