#!/bin/bash
#DOT_FILES=(.bashrc)
DOT_FILES=(${DOT_FILES[@]} .bash_aliases)
#DOT_FILES=(${DOT_FILES[@]} .bashrc.ros.melodic)
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

if grep -q bash_user $HOME/.bashrc; then
    echo 'bash_user.$USER is already exist in .bashrc'
else
    echo 'source $HOME/dotfiles/.bash_user.$USER' >> $HOME/.bashrc
fi

