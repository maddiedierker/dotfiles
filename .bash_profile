# Aliases
alias o="open"
alias gs="git status"
alias gp="git push"

# Git branch parsing
parse_git_dirty() {
  if [[ -z $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
    echo ""
  else
    echo "*"
  fi
}

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

# PS1
export PS1="\[$(tput setaf 5)\]\W\[$(tput setaf 6)\]@\[$(tput setaf 5)\]\T \[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput setaf 6)\]///\[$(tput sgr0)\] "

# Editor
export EDITOR="code"

# Git Bash Autocomplete
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Rbenv
eval "$(rbenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
source $(brew --prefix nvm)/nvm.sh

# Increase ulimit
ulimit -n 8192

# Code.org Chef Username
export CDO_CHEF_NODE_NAME="maddie"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
