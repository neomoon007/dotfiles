# Environment
EDITOR=vim
BROWSER=librewolf
TERM=alacritty

# PS1 Colors
NOCOLOR="\[\033[00m\]"
BCYAN="\[\033[1;36m\]"
BBLACK="\[\033[1;34m\]"



# Setting custom prompt
PS1="$BCYAN\u$NOCOLOR in $BBLACK\W $NOCOLOR\n-> ";
export PS1;

# Aliases
alias ..="cd .."
alias ll="exa -la --color=always"
alias ls="exa --color=always"
alias la="exa -a --color=always"
alias grep="grep --color=auto"
alias rm="rm -i"
alias e="exit"
alias c="clear"
alias ta="tree -aL"
alias tor="cd tor-browser_en-US/ && ./start-tor-browser.desktop && cd "
