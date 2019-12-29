#!/bin/bash
DOT_FILES=(.bashrc .bash_aliases)
DOT_FILES=(${DOT_FILES[@]} .bashrc.ros.groovy .bashrc.ros.hydro .bashrc.ros.indigo)
DOT_FILES=(${DOT_FILES[@]} .emacs .fd2rc .mg)
DOT_FILES=(${DOT_FILES[@]} .spacemacs)
DOT_FILES=(${DOT_FILES[@]} .gitconfig .gitignore)

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    echo "$file is already exist"
    mv $HOME/$file $HOME/$file.org
  fi
  echo "$file link to dotfiles/$file"
  ln -s $HOME/dotfiles/$file $HOME/$file
done
