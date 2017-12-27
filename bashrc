# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

. /usr/share/git-core/contrib/completion/git-prompt.sh
. /usr/share/bash-completion/completions/git

shopt -s globstar
shopt -s histappend

# my bin
export PATH="$HOME/bin"
export PYTHONPATH="$HOME/lib:$HOME/git/koschei:$HOME/javapackages/java-utils:$HOME/javapackages/python:$PYTHONPATH"
export KOSCHEI_CONFIG="$HOME/git/koschei/config.cfg.template:$HOME/git/koschei/aux/test-config.cfg:$HOME/git/koschei/config.cfg"
export PGDATABASE=koschei
export DE="mate" # for xdg-open
export NAME="Michael Simacek"
export FASNAME="msimacek"
export EMAIL="msimacek@redhat.com"
export RPM_PACKAGER="$NAME <$EMAIL>"
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less -SR"
export PYTHONDONTWRITEBYTECODE=1
export FZF_DEFAULT_COMMAND='ag -g ""'

alias xcd='sleep 2 && cd `xcwd`'
alias xf='rpmdev-extract'
alias gco='git checkout'
__git_complete gco _git_checkout
alias ll='ls -hla'
alias spec='if [ -f *.spec ]; then vim *.spec; else echo "No spec"; fi'
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias rkinit='kinit msimacek@REDHAT.COM'
alias fkinit='kinit msimacek@FEDORAPROJECT.ORG'

alias anaconda2='export PATH="$HOME/tools/anaconda2/bin:$PATH"'
alias anaconda3='export PATH="$HOME/tools/anaconda3/bin:$PATH"'

alias kclang='/home/msimacek/llvm34/bin/clang -O0 -I/home/msimacek/git/klee/include -c -g -emit-llvm'
alias kclangl='/home/msimacek/llvm34/bin/clang -O0 -I/home/msimacek/git/klee/include -S -emit-llvm'

gs() {
    if [ "$#" -gt 0 ]; then
        git show "$@"
    else
        commit=`xclip -o`
        if [[ "$commit" =~ ^[a-f0-9]*$ ]]; then
            git show "$commit"
        else
            echo 'Clipboard content is not a valid commit id'
        fi
    fi
}

pcd() {
    local DIR=$(pcd.py "$@")
    if [ -d "$DIR" ]; then
        cd "$DIR"
    else
        echo "$DIR"
        return 1
    fi
}
src() {
    local DIR=$(src.py "$@")
    if [ -d "$DIR" ]; then
        cd "$DIR"
    else
        echo "$DIR"
        return 1
    fi
}

   RED='\[\033[01;31m\]'
 GREEN='\[\033[01;32m\]'
YELLOW='\[\033[01;33m\]'
  BLUE='\[\033[01;34m\]'
PURPLE='\[\033[01;35m\]'
  CYAN='\[\033[01;36m\]'
 WHITE='\[\033[01;37m\]'

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
_GIT_STATUS='$(es=$?;__git_ps1|sed "s/ \(.\+\)/\1 /";exit $es)'
_RETVAL='$(es=$?; test $es -ne 0 && echo "$es ")'
PS1="${GREEN}\u ${BLUE}\w ${YELLOW}${_GIT_STATUS}${RED}${_RETVAL}${BLUE}\$\[\033[00m\] "

export SSH_AUTH_SOCK="$(ls --sort time /run/user/`id -u`/keyring*/ssh|head -n1)"
export GTK_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE=ibus
