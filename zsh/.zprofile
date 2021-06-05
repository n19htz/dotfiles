# Re-enable sourcing of system files, which we disabled in  ~/.zshenv. See
# http://www.zsh.org/mla/users/2015/msg00725.html for details.
setopt global_rcs
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export ANDROID_HOME=/usr/local/share/android-sdk

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

if which pyenv-virtualenv-init > /dev/null; then 
  eval "$(pyenv virtualenv-init --path)"; 
fi
