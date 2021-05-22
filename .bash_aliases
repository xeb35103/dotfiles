#echo ".bash_aliases"

#echo $PATH | sed -e "s/:/\n/g"

# alias
alias rm='rm -i'
alias cp='cp -i'
alias e='emacs -nw'
alias git_diff='git difftool --dir-dif'
alias git_diff_remote='git difftool --dir-dif remotes/origin/master'
alias git_merge='git mergetool'
alias ssh='ssh -X' 
alias ros_remote='source ~/bin/ros_remote.source'
alias ros_local='source ~/bin/ros_local.source'
alias qtcreator='/opt/Qt/Tools/QtCreator/bin/qtcreator.sh'

# User
. ~/dotfiles/.bash_user


