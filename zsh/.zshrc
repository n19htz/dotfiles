# =============================================================================
#                          Pre-Plugin Configuration
# =============================================================================
#
# Automagically quote URLs. This obviates the need to quote them manually when
# pasting or typing URLs.
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
# =============================================================================
#                                   Plugins
# =============================================================================

# powerlevel9k prompt theme
DEFAULT_USER=$USER
POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{cyan}/%F{blue}"
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}╭─"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}╰─➤ "
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir_joined
                                   dir_writable_joined)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time virtualenv vcs
                                    background_jobs_joined time_joined
                                    user_joined os_icon_joined host_joined)
POWERLEVEL9K_VIRTUALENV_BACKGROUND="clear"
POWERLEVEL9K_VIRTUALENV_FOREGROUND="yellow"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="clear"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="cyan"
POWERLEVEL9K_DIR_ETC_BACKGROUND='none'
POWERLEVEL9K_DIR_ETC_FOREGROUND="blue"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="clear"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="red"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_FORMAT="%D{\uf073 %b %d \uf017 %H:%M}" #  Jun 15  09:32
POWERLEVEL9K_TIME_FOREGROUND="blue"
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="blue"
POWERLEVEL9K_TIME_ICON=''
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='clear'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='magenta'
POWERLEVEL9K_USER_DEFAULT_BACKGROUND='clear'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='cyan'
POWERLEVEL9K_USER_ROOT_BACKGROUND='clear'
POWERLEVEL9K_USER_ROOT_FOREGROUND='red'
POWERLEVEL9K_USER_ICON="\uf415" # 
POWERLEVEL9K_ROOT_ICON="\u26a1" # ⚡
POWERLEVEL9K_HOST_LOCAL_BACKGROUND='clear'
POWERLEVEL9K_HOST_LOCAL_FOREGROUND='cyan'
POWERLEVEL9K_HOST_REMOTE_BACKGROUND='clear'
POWERLEVEL9K_HOST_REMOTE_FOREGROUND='magenta'
POWERLEVEL9K_HOST_ICON="\uF109 " # 
POWERLEVEL9K_SSH_ICON="\uF489 "  # 
POWERLEVEL9K_OS_ICON_BACKGROUND="clear"
POWERLEVEL9K_OS_ICON_FOREGROUND="grey"
POWERLEVEL9L_ETC_ICON_BACKGROUND="clear"
POWERLEVEL9K_HOME_SUB_ICON=" "
POWERLEVEL9K_HOME_ICON=" "
POWERLEVEL9K_FOLDER_ICON=" "

# zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'

if [[ ! -d "${ZPLUG_HOME}" ]]; then
  if [[ ! -d ~/.zplug ]]; then
    #installer='raw.githubusercontent.com/zplug/installer/master/installer.zsh'
    #curl -sL --proto-redir -all,https "$installer" | zsh
    git clone https://github.com/zplug/zplug ~/.zplug
    # If we can't get zplug, it'll be a very sobering shell experience. To at
    # least complete the sourcing of this file, we'll define an always-false
    # returning zplug function.
    if [[ $? != 0 ]]; then
      function zplug() {
        return 1
      }
    fi
  fi
  export ZPLUG_HOME=~/.zplug
fi
if [[ -d "${ZPLUG_HOME}" ]]; then
  source "${ZPLUG_HOME}/init.zsh"
fi

zplug 'plugins/bundler', from:oh-my-zsh, if:'which bundle'
zplug 'plugins/colored-man-pages', from:oh-my-zsh
zplug 'plugins/completion', from:oh-my-zsh
zplug 'plugins/extract', from:oh-my-zsh
zplug 'plugins/fancy-ctrl-z', from:oh-my-zsh
zplug 'plugins/git', from:oh-my-zsh, if:'which git'
#zplug 'plugins/gpg-agent', from:oh-my-zsh, if:'which gpg-agent'
zplug 'plugins/httpie', from:oh-my-zsh, if:'which httpie'
zplug 'plugins/nanoc', from:oh-my-zsh, if:'which nanoc'
zplug 'plugins/nmap', from:oh-my-zsh, if:'which nmap'
zplug 'plugins/tmux', from:oh-my-zsh, if:'which tmux'

#zplug 'b4b4r07/enhancd', use:init.sh
zplug 'b4b4r07/zsh-vimode-visual', defer:3
# Using branch 'next' introduces a color regression, so we fall back to master
# ofr now. See https://github.com/bhilburn/powerlevel9k/pull/703 for details.
#zplug 'bhilburn/powerlevel9k', use:powerlevel9k.zsh-theme, at:next
#zplug 'bhilburn/powerlevel9k', use:powerlevel9k.zsh-theme
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf", frozen:1
zplug "junegunn/fzf", use:"shell/key-bindings.zsh"
zplug 'knu/zsh-manydots-magic', use:manydots-magic, defer:3
zplug 'romkatv/powerlevel10k', use:powerlevel10k.zsh-theme
zplug 'seebi/dircolors-solarized', ignore:"*", as:plugin
zplug 'Tarrasch/zsh-bd'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

if ! zplug check; then
  zplug install
fi

zplug load

if zplug check 'seebi/dircolors-solarized'; then
  if which gdircolors > /dev/null 2>&1; then
    alias dircolors='gdircolors'
  fi
  if which dircolors > /dev/null 2>&1; then
    scheme='dircolors.256dark'
    eval $(dircolors $ZPLUG_HOME/repos/seebi/dircolors-solarized/$scheme)
  fi
fi

if zplug check 'zsh-users/zsh-autosuggestions'; then
  # Enable asynchronous fetching of suggestions.
  ZSH_AUTOSUGGEST_USE_ASYNC=1
  # For some reason, the offered completion winds up having the same color as
  # the terminal background color (when using a dark profile). Therefore, we
  # switch to gray.
  # See https://github.com/zsh-users/zsh-autosuggestions/issues/182.
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=gray'
fi

# Our custom version of oh-my-zsh's globalias plugin. Unlike the OMZ version,
# we do not use the `expand-word' widget and only expand a few whitelisted
# aliases.
# See https://github.com/robbyrussell/oh-my-zsh/issues/6123 for discussion.
globalias() {
  # FIXME: the whitelist pattern should technically only be computed once, but
  # since it's cheap, we keep it local for now.
  local -a whitelist candidates
  whitelist=(ls git tmux)
  local pattern="^(${(j:|:)whitelist})"
  for k v in ${(kv)aliases}; do
    # We have a candidate unless the alias is an alias that begins with itself,
    # e.g., ls='ls --some-option'.
    if [[ $v =~ $pattern && ! $v =~ ^$k ]]; then
      candidates+=($k)
    fi
  done
  if [[ $LBUFFER =~ "(^|[;|&])\s*(${(j:|:)candidates})\s*($|[;|&])" ]]; then  
    zle _expand_alias
  fi
  zle self-insert
}
zle -N globalias
bindkey -M emacs ' ' globalias
bindkey -M viins ' ' globalias
bindkey -M isearch ' ' magic-space # normal space during searches


# =============================================================================
#                                   Options
# =============================================================================

# Watching other users
WATCHFMT='%n %a %l from %m at %t.'
watch=(notme)         # Report login/logout events for everybody except ourself.
LOGCHECK=60           # Time (seconds) between checks for login/logout activity.
REPORTTIME=5          # Display usage statistics for commands running > 5 sec.
WORDCHARS="\'*?_-.[]~=/&;!#$%^(){}<>\'"

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Do not overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Do not display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.

# Changing directories
setopt pushd_ignore_dups        # Do not push copies of the same dir on stack.
setopt pushd_minus              # Reference stack entries with '-'.

setopt extended_glob

# =============================================================================
#                                   Aliases
# =============================================================================
# Function to open Xcode projects from the command line, call with $ xcode
function xcode {

  proj=$(ls -d *.xcodeproj/ 2>/dev/null)
  workspace=$(ls -d *.xcworkspace/ 2>/dev/null)

  if [ -n "$workspace" ]; then
    open -a Xcode "$workspace"
  elif [ -n "$proj" ]; then
    open -a Xcode "$proj"
  else
    echo "No Xcode project detected."
  fi

}

# Swift editing and file display.
alias e="$EDITOR"
alias v="$VISUAL"

# Directory coloring
if which gls > /dev/null 2>&1; then
  # Prefer GNU version, since it respects dircolors.
  alias ls='gls --group-directories-first --color=auto'
elif [[ $OSTYPE = (darwin|freebsd)* ]]; then
  export CLICOLOR="YES" # Equivalent to passing -G to ls.
  export LSCOLORS="exgxdHdHcxaHaHhBhDeaec"
else
  alias ls='ls --group-directories-first --color=auto'
fi

# Directory management
alias la='ls -la'
alias ll='ls -l'
alias lal='ls -al'
alias dirs='dirs -v'
push() { pushd $1 > /dev/null 2>&1; dirs -v; }
pop() { popd > /dev/null 2>&1; dirs -v }

# Generic command adaptations.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# OS-specific aliases
if [[ $OSTYPE = darwin* ]]; then
  # Lock screen (e.g., when leaving computer).
  alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
  # Hide/show all desktop icons (useful when presenting)
  alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false \
    && killall Finder"
  alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true \
    && killall Finder"
  # Combine PDFs on the command line.
  pdfcat() {
    if [[ $# -lt 2 ]]; then
      echo "usage: $0 merged.pdf input0.pdf [input1.pdf ...]" > /dev/stderr
      return 1
    fi
    local output="$1"
    shift
    # Try pdfunite first (from Homebrew package poppler), because it's much
    # faster and doesn't perform stupid page rotations.
    if which pdfunite > /dev/null 2>&1; then
      pdfunite "$@" "$output"
    else
      local join='/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py'
      "$join" -o "$output" "$@" && open "$output"
    fi
  }
fi

# Git aliases
alias git='hub'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit -S -m '
alias gd='git diff'
alias gk='gitk --all&'
alias gx='gitx --all'

alias cat='bat'

alias vihosts="vim /usr/local/etc/httpd/extra/httpd-vhosts.conf"
alias downloads="cd ~/Downloads"
alias projects="cd /Volumes/Data\ HD/Projects"
alias datahd="cd /Volumes/Data\ HD/"

## a quick way to get out of current directory ##
alias cd/='cd /'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# VLC
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'

# Mount
alias mount='mount |column -t'

# Date and PATH
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ports='netstat -tulanp'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -i'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias mkdir='mkdir -pv'

alias wget='wget -c'
alias diff='colordiff'

# handy short cuts #
alias h='history'
alias j='jobs -l'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'

# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

alias bc='bc -l'
alias meminfo='free -m -l -t'

alias reload='source ~/.zshrc'
alias zshrc='vim ~/.zshrc'
alias mtr='sudo mtr'

#Apache
alias apachestart='sudo apachectl start'
alias apachestop='sudo apachectl stop'
alias apacherestart='sudo apachectl -k restart'

#HTTPD
alias findhttpd='ps -aef | grep httpd'
alias httpdstart='brew services start httpd'
alias httpdstop='brew services stop httpd'
alias httpdrestart='brew services restart httpd'

#MYSQL
alias mysqlstart='brew services start mariadb'
alias mysqlrestart='brew services restart mariadb'
alias mysqlstop='brew services stop mariadb'

#PGSQL
alias pgstart='brew services start postgresql'
alias pgrestart='brew services restart postgresql'
alias pgstop='brew services stop postgresql'

#REDIS
alias redisstart='brew services start redis'
alias redisrestart='brew services restart redis'
alias redisstop='brew services stop redis'

#CHUNKWM
alias chunkwmstart='brew services start chunkwm'
alias chunkwmrestart='brew services restart chunkwm'
alias chunkwmstop='brew services stop chunkwm'

# Web restart
alias webstart='brew services start httpd && sphp 7.4  && sudo brew services start dnsmasq && brew services start mariadb && brew services start proftpd'

alias webrestart='brew services restart httpd && sphp 7.4 && sudo brew services restart dnsmasq && brew services restart mariadb && brew services restart proftpd'

alias webstop='brew services stop httpd && sudo brew services stop dnsmasq && brew services stop mariadb && brew services stop proftpd'

#make dir and navigate to it
mkcd() { mkdir -p $1; cd $1 }

#vagrant
function homestead() {
    ( cd /Volumes/Data\ HD/Virtual\ Machines/Homestead && vagrant $* )
}
function kali() {
    ( cd /Volumes/Data\ HD/Virtual\ Machines/vagrant/boxes/offensive-security-VAGRANTSLASH-kali-linux/2018.3.1/virtualbox && vagrant $* )
}

function gulpinit() {
    ( wget https://github.com/n19htz/gulp4/archive/master.zip && extract master.zip && mv gulp4-master/bootstrap.sh . && rm -rf master.zip gulp4-master && chmod +x bootstrap.sh && ./bootstrap.sh && rm -rf bootstrap.sh .DS_Store )
}

function webpackinit() {
    ( wget https://github.com/n19htz/webpack/archive/master.zip && extract master.zip && mv webpack-master/* . && rm -rf master.zip webpack-master )
}

# create .tar.gz
targz() { tar -zcvf $1.tar.gz $1; rm -rf $1; }
# extra .tar.gz
untargz() { tar -zxvf $1; rm -rf $1; }

#number of files in directory
numfiles() {
    N="$(ls $1 | wc -l)";
    echo "$N files in $1";
}

clearNodeModules() { find . -name 'node_modules' -type d -prune -exec rm -rf '{}' + }
clearDsStore() { find . -name '.DS_Store' -type f -delete }

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

jcurl() {
  curl "$@" | json | pygmentize -l json
}

xcurl() {
  curl "$@" | xml_pp | pygmentize -l xml
}

auth-jcurl() {
    curl -H "Accept: application/json" -H "Content-Type: application/json" -H "X-User-Email: $1" -H "X-User-Token: $2" ${@:3} | json | pygmentize -l json
}

cdf () {
  # cd into whatever is the forefront Finder window.
  local path=$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
  echo "$path"
  cd "$path"
}

# =============================================================================
#                                Key Bindings
# =============================================================================

bindkey -v

# Common CTRL bindings.
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^f' forward-word
bindkey '^b' backward-word
bindkey '^k' kill-line
bindkey '^d' delete-char
bindkey '^y' accept-and-hold
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^u' backward-kill-line

# More convenient acceptance of suggested command line.
if zplug check 'zsh-users/zsh-autosuggestions'; then
  bindkey '^ ' autosuggest-execute
fi

# History
if zplug check 'zsh-users/zsh-history-substring-search'; then
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
  bindkey '^p' history-substring-search-up
  bindkey '^n' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
fi

# Do not require a space when attempting to tab-complete.
bindkey '^i' expand-or-complete-prefix

# FZF
if zplug check 'junegunn/fzf'; then
  export FZF_DEFAULT_OPTS='--height 30%
      --color fg:223,bg:235,hl:208,fg+:229,bg+:237,hl+:167,border:237
      --color info:246,prompt:214,pointer:214,marker:142,spinner:246,header:214'
fi

# =============================================================================
#                                 Completions
# =============================================================================

# case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# When doing `cd ../<TAB>`, don't offer the current directory as an option.
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Show a menu (with arrow keys) to select the process to kill.
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# =============================================================================
#                                    Other
# =============================================================================

# Utility that prints out lines that are common among $# files.
intersect() {
  local sort='sort -S 1G'
  case $# in
    (0) true;;
    (2) $sort -u "$1"; $sort -u "$2";;
    (*) $sort -u "$1"; shift; intersection "$@";;
  esac | $sort | uniq -d
}

# Changes an iTerm profile by sending a proprietary escape code that iTerm
# intercepts. This function additionally updates ITERM_PROFILE environment
# variable.
iterm-profile() {
  echo -ne "\033]50;SetProfile=$1\a"
  export ITERM_PROFILE="$1"
}

# Convenience function to update system applications and user packages.
update() {
  # sudoe once
  if ! sudo -n true 2> /dev/null; then
    sudo -v
    while true; do
      sudo -n true
      sleep 60
      kill -0 "$$" || exit
    done 2>/dev/null &
  fi
  if [[ $OSTYPE = linux* ]]; then
    sudo apt-get update
    sudo apt-get -y upgrade
    sudo apt-get clean
    sudo apt -y autoremove
  elif [[ $OSTYPE = darwin* ]]; then
    # System
    sudo softwareupdate -i -a
  fi
  # Homebrew
  brew update	
  brew upgrade
#  if [[ $OSTYPE = darwin* ]]; then
#    brew cu 
#  fi  
  brew cleanup
  # Python
  # ln -sf $(brew --cellar Python@3.9)/* ~/.pyenv/versions/
  # ln -sf $(brew --cellar Python)/* ~/.pyenv/versions/
  # pyenv global $(python --version 2>&1 | awk '{print $2}') $(/usr/local/bin/python3.9 --version 2>&1 | awk '{print $2}')
  # pyenv local $(python --version 2>&1 | awk '{print $2}') $(/usr/local/bin/python3.9 --version 2>&1 | awk '{print $2}')
  # Ruby
  gem update --system
  gem update
  gem cleanup
  # Java
  sdk update
  #nvm
  #cd $NVM_DIR 
  #git fetch -p
  #git checkout $(git describe --tags `git rev-list --tags --max-count=1`)
  #source $NVM_DIR/nvm.sh
  #cd $OLDPWD
  nvm install node --latest-npm --reinstall-packages-from=node 
  #nvm use default
  # npm
  npm install npm -g
  npm update -g
  # Shell plugin management
  zplug update
  .tmux/plugins/tpm/bin/update_plugins all
  vim +PlugUpgrade +PlugUpdate +PlugCLean! +qa
}

# =============================================================================
#                                   Startup
# =============================================================================

# Load SSH and GPG agents via keychain.
#setup_agents() {
#  if [[ $UID -eq 0 ]]; then
#    return
#  fi
#  local -a ssh_keys gpg_keys
#  ssh_keys=(~/.ssh/**/*pub(.N:r))
#  gpg_keys=$(gpg -K --with-colons 2>/dev/null \
#               | awk -F : '$1 == "sec" { print $5 }')
#  if which keychain > /dev/null 2>&1; then
#    if (( $#ssh_keys > 0 )) || (( $#gpg_keys > 0 )); then
#      eval $(keychain -q --nogui --eval --host fix \
#        --agents ssh,gpg $ssh_keys ${(f)gpg_keys})
#    fi
#  fi
#}
#setup_agents
#unfunction setup_agents

# Source local customizations.
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

###-tns-completion-start-###
if [ -f /Users/n19htz/.tnsrc ]; then 
    source /Users/n19htz/.tnsrc 
fi
###-tns-completion-end-###

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/n19htz/.sdkman"
[[ -s "/Users/n19htz/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/n19htz/.sdkman/bin/sdkman-init.sh"
