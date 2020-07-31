#!/bin/bash
DOT_FILES=(.bashrc .bash_aliases)
DOT_FILES=(${DOT_FILES[@]} .bashrc.ros.melodic)
DOT_FILES=(${DOT_FILES[@]} .fd2rc .mg)
DOT_FILES=(${DOT_FILES[@]} .spacemacs)
DOT_FILES=(${DOT_FILES[@]} .gitconfig .gitignore)

for file in ${DOT_FILES[@]}
do
    if [ -L $HOME/$file ]; then
        echo "symbolic link $file is already exist."
    else
        if [ -a $HOME/$file ]; then
            echo "$file is already exist. backup to $HOME/$file.org"
            mv $HOME/$file $HOME/$file.org
        fi
        echo "$file link to dotfiles/$file"
        ln -s $HOME/dotfiles/$file $HOME/$file
    fi
done
