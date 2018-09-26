
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH="$HOME/bin:$HOME/git/my-scripts/bin:$HOME/.local/bin:$PATH"

ZSH_THEME="robbyrussell"

# Completion options
# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"

# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    git-prompt
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line

setopt inc_append_history

export PATH="$HOME/bin:$HOME/git/my-scripts/bin:$PATH"
export PYTHONPATH="$HOME/lib:$HOME/git/my-scripts/lib:$PYTHONPATH"
export REQUESTS_CA_BUNDLE="/etc/pki/tls/certs/ca-bundle.crt"
export KOSCHEI_CONFIG="$HOME/git/koschei/config.cfg.template:$HOME/git/koschei/aux/test-config.cfg:$HOME/git/koschei/config.cfg"
export PGDATABASE=pelc
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
export SSH_AUTH_SOCK="$(ls --sort time /run/user/`id -u`/keyring*/ssh 2> /dev/null | head -n1)"
export GTK_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE=ibus

alias gco='git checkout'

alias ll='ls -hla'
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

function _virtualenv_status() {
    echo "%F{35}${VIRTUAL_ENV+venv:$(basename "$VIRTUAL_ENV") }"
}

export VIRTUAL_ENV_DISABLE_PROMPT=1
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{yellow}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%B%F{yellow}) "
ZSH_THEME_GIT_PROMPT_SEPARATOR="%B|"
ZSH_THEME_GIT_PROMPT_BRANCH="%B%F{yellow}"
ZSH_THEME_GIT_PROMPT_STAGED="%B%F{red}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%B%F{red}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%B%F{yellow}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%B%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%B%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%B%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%B%F{green}%{✔%G%}"
export PROMPT='%B%F{green}%n %F{blue}%~ $(_virtualenv_status)$(git_super_status)%F{red}%F{blue}%#%b%f '
unset RPROMPT
