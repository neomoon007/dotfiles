# Environment
EDITOR=vim
BROWSER=librewolf
TERM=alacritty

# Function that display a simple prompt if I'm not in a graphical environment
is_qtile_running() {
	if [ "$(ps aux | sed -n /qtile/p | sed '/sed/d'): -0" == "" ]; then
		echo "\u in \W" 
	else
	 	echo "\[\e[40m\]\[\e[1;37m\] \u \[\e[00m\]\[\e[30m\]\[\e[44m\] \[\e[30m\]\W \[\e[00m\]\[\e[34m\] \[\e[00m\]"
	fi

}

# Setting custom prompt
PS1="$(is_qtile_running)";
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
