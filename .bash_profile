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
export EDITOR="atom"

# Rbenv
eval "$(rbenv init -)"
