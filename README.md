# Vim 8.x configuration

Simple and useful configuration for Vim 8.x

## Installation

```
$ git clone https://github.com/bsnux/vim8-conf
$ cd vim8-conf
$ git submodule init
$ git submodule update
$ mkdir ~/.vim
$ ln -s vim8-conf/vimrc ~/.vimrc
$ ln -s vim8-conf/gvimrc ~/.gvimrc
$ ln -s vim8-conf/pack ~/.vim/pack
```

## Updating plugins

```
git submodule update --remote --merge
```

## Deleting a plugin

```
git submodule deinit vim/pack/plugins/start/<name>
git rm vim/pack/plugins/start/<name>
rm -Rf .git/modules/vim/pack/plugins/start/<name>
```
