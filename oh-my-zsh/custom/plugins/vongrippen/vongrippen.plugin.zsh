unalias d
d() { cd ~/Development/$1; }
_d() { _files -W ~/Development -/; }
compdef _d d

unalias g
g() { cd ~/.gvm/pkgsets/$gvm_go_name/$gvm_pkgset_name/$1; }
_g() { _files -W ~/.gvm/pkgsets/$gvm_go_name/$gvm_pkgset_name -/; }
compdef _g g

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

# autocorrect is more annoying than helpful
unsetopt correct_all

# a few aliases I like
alias gs='git status'
alias gd='git diff'
alias tlog='tail -f log/development.log'

# my heroku aliases
alias hl='heroku logs'
alias hr='heroku run'
alias hc='heroku run rails console'
alias hb='heroku run bash'

# add plugin's bin directory to path
export PATH="$(dirname $0)/bin:$PATH"
