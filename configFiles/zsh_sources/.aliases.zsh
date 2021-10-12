alias userpackages="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"
alias pip="pip3"
#alias cfi3="vi $HOME/.config/i3/config"
#alias dot="$HOME/repos/dotfiles/"

# fast find
ff() {
    find . -name "$1"
}

# copy
alias cp="cp -rfv"

# move
alias mv="mv -fv"

# copy
alias cp="cp -rfv"

# move
alias mv="mv -fv"
#alias mvi="mv -fvi"

# History directory navigation
d='dirs -v | head -10'
1='cd -'
2='cd -2'
3='cd -3'
4='cd -4'
5='cd -5'
6='cd -6'
7='cd -7'
8='cd -8'
9='cd -9'

wal-tile() {
    wal -n -i "$@"
    feh --bg-tile "$(<"${HOME}/.cache/wal/wal")"
}

# Open files with zathura and disown
za() {
    zathura $1 &
    disown
    kill $PPID
}

# alias for cd up a directory
alias ..="cd .."
