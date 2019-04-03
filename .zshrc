"export http_proxy="http://web-proxy.tencent.com:8080"
"export https_proxy="$http_proxy"

source ~/antigen.zsh

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-apple-touchbar

antigen bundle skywind3000/z.lua

# Tell Antigen that you're done.
antigen apply

export ZSH=/Users/wang/.oh-my-zsh

ZSH_THEME="ys" #bira ys robbyrussell sunrise  ys agnoster
DEFAULT_USER="W"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi



plugins=(git zsh-syntax-highlighting z)
EDITOR=vim
alias ll="ls -al"
alias myhabit="history | awk '{CMD[$2]++;count++;} END { for (a in CMD )print CMD[a] " " CMD[a]/count*100 "% " a }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10"

# skywind3000/z.lua
export _ZL_MATCH_MODE=1
alias zc='z -c'      # 严格匹配当前路径的子路径
alias zz='z -i'      # 使用交互式选择模式
alias zf='cd "$(z -l -s | fzf --reverse --height 35%)"'

# fzf
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
