# Vi IMproved settings and addons

This repository contains Vim settings and useful addons as Git submodules. The
settings are located in the vimrc file, whereas the addons are located in
folders that share names with the respective addons they contain.

Installation is done by cloning this directory under `~/.vim` with
```sh
git clone uri/of/repository.git ~/.vim --recursive
cd ~/.vim
git submodule update --init --recursive
```
and then creating a symbolic link to the file `~/.vim/vimrc` with
```sh
ln -s ~/.vim/vimrc ~/.vimrc
```
The addons currently found in this repository under `pack`should then start
working automatically, once vim is restarted.
