# Vi IMproved settings and addons

This repository contains Vim (version ≥ 8.1) settings and useful addons as Git
submodules. The settings are located in the `vimrc` file, whereas the addons
are located in folders that share names with the respective addons they
contain.

If your Git version is ≥ `2.13`, installation is done by cloning this
directory under `~/.vim` with
```sh
git clone --recurse-submodules -j8 uri/of/repository.git ~/.vim
```
or with `1.65` ≤ Git version < `2.13`
```sh
git clone --recursive uri/of/repository.git ~/.vim
```
and then creating a symbolic link to the file `~/.vim/vimrc` with
```sh
ln -s ~/.vim/vimrc ~/.vimrc
```

If you already cloned the repository non-recursively, downloading the
submodules is done with
```sh
git submodule update --init --recursive
```
The addons currently found in this repository under `pack` should then start
working automatically, once vim is restarted.
