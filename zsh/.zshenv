# Unless -f is specified, .zshenv is sourced on all shell invocations.
# Consequently, there should be only critical commands environment in this file.

umask 022

# Set $PATH.
if [[ -f ~/.zpath ]]; then
  source ~/.zpath
fi
if [[ -f ~/.zpath_local ]]; then
  source ~/.zpath_local
fi

# Editor
if which vim &> /dev/null; then
  export EDITOR="vim"
elif which vi &> /dev/null; then
  export EDITOR="vi"
fi
export VISUAL=$EDITOR

#Vagrant home
export VAGRANT_HOME=/Volumes/Data\ HD/Virtual\ Machines/vagrant

# Pager.
export PAGER="less -S"

# NVM 
if [[ -f ~/.nvm/.nvmrc ]]; then
  source ~/.nvm/.nvmrc
fi

# Version control software.
export CVS_RSH="ssh"
export CVSEDITOR="vim"
export RSYNC_RSH="ssh"

# Setup GPG.
export GPG_TTY=$(tty);
if which gpgconf > /dev/null 2>&1; then
  export GPG_AGENT_INFO=$(gpgconf --list-dirs agent-socket)
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  gpg-connect-agent updatestartuptty /bye > /dev/null
fi

# OS-specific environment.
case $OSTYPE in
  linux*)
    [[ -d ~/.linuxbrew ]] && eval $(~/.linuxbrew/bin/brew shellenv)
    [[ -d /home/linuxbrew/.linuxbrew ]] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    ;;
  darwin*)
    # Ignore reading of /etc/profile, which messes with $PATH. We re-enable
    # reading other system-wide zsh files in ~/.zprofile. See
    # http://www.zsh.org/mla/users/2015/msg00725.html for details.
    setopt no_global_rcs
    # Opt out of Homebrew analytics.
    export HOMEBREW_NO_ANALYTICS=1
    # On OSX, we install zplug via Homebrew.
    export ZPLUG_HOME=/usr/local/opt/zplug
    ;;
esac

# Set UTF-8 locale.
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Source local environment.
if [[ -f ~/.zshenv.local ]]; then
  source ~/.zshenv.local
fi

# vim: ft=zsh
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null; then 
  eval "$(pyenv virtualenv-init -)"; 
fi
