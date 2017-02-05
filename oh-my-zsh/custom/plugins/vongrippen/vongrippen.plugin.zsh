unalias d
d() { cd ~/Development/$1; }
_d() { _files -W ~/Development -/; }
compdef _d d

unalias g
g() { cd ~/.gvm/pkgsets/$gvm_go_name/$gvm_pkgset_name/$1; }
_g() { _files -W ~/.gvm/pkgsets/$gvm_go_name/$gvm_pkgset_name -/; }
compdef _g g

v() { cd ~/Development/$1; vim; cd $OLDPWD }
_v() { _files -W ~/Development -/; }
compdef _v v

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

function vg_git_info() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && echo "git" && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || (echo "git" && return)
  fi
  echo "\u2325 ${ref#refs/heads/}"
}

function vg_update_git_info() {
  $ZSH/custom/plugins/vongrippen/bin/it2touch.sh set F1 "$(vg_git_info)"
}

function git_prompt_info() {
  local ref
  vg_update_git_info
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# autocorrect is more annoying than helpful
unsetopt correct_all

# a few aliases I like
alias gs='git status'
alias gd='git diff'
alias tlog='tail -f log/development.log'

alias c=clear

# my heroku aliases
alias hl='heroku logs'
alias hr='heroku run'
alias hc='heroku run rails console'
alias hb='heroku run bash'

alias rake=`noglob rake`
alias rails=`noglob rails`

# add plugin's bin directory to path
export PATH="$(dirname $0)/bin:$PATH"
