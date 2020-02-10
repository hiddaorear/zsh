export https_proxy="$http_proxy"
export no_proxy="git.code.oa.com,r.tnpm.oa.com,*.mnet2.com"
export http_proxy=http://127.0.0.1:12639
export https_proxy=http://127.0.0.1:12639

#-----------------------#
#-----------------------#
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

plugins=(git zsh-syntax-highlighting z fzf)
#-----------------------#
#-----------------------#

export ZSH=/Users/wang/.oh-my-zsh

ZSH_THEME="ys" #bira ys robbyrussell sunrise  ys agnoster
DEFAULT_USER="W"
export TERM="xterm-256color"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi



EDITOR=vim
alias ll="ls -al"
alias myhabit="history | awk '{CMD[$2]++;count++;} END { for (a in CMD )print CMD[a] " " CMD[a]/count*100 "% " a }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10"

# skywind3000/z.lua
export _ZL_MATCH_MODE=1
alias zc='z -c'      # 严格匹配当前路径的子路径
alias zz='z -i'      # 使用交互式选择模式
alias zf='cd "$(z -l -s | fzf --reverse --height 35%)"'

# fzf
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"



PATH="$PATH":/usr/local/mysql/bin
export PATH="~/.config/cheat/conf.yml":$PATH

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

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# opam configuration
test -r /Users/wang/.opam/opam-init/init.zsh && . /Users/wang/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# ssh之后，自动执行source，更改bash
if test -f .bashrc ; then
source .bashrc
fi

# v2en 翻译
v2() {
  declare q="$*";
  curl --user-agent curl "https://v2en.co/${q// /%20}";
}

v2-sh() {
  while echo -n "v2en> ";
  read -r input;
  [[ -n "$input" ]];
  do v2 "$input";
  done;
}
