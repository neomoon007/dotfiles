# Environment
EDITOR=vim
BROWSER=librewolf
TERM=alacritty

# Setting custom prompt
PS1="\u in \W \n Â ";» »
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
