# Environment
EDITOR=vim
BROWSER=firefox
TERM=alacritty

# Export VIMINIT variable
export VIMINIT='source ~/.vim/.vimrc'
export MYVIMRC='~/dotfiles/vim/.vimrc'
# PS1 Colors
NOCOLOR="\[\033[00\]"
BCYAN="\[\033[1;36\]" 
BBBLACK="\[\033[1;34\]"

# Setting custom prompt
PS1="\u in \W \n-> ";
export PS1;

# Aliases
alias ..="cd .."
alias la="exa -la"
alias ta="tree -aL"
alias ev="vim dotfiles/vim/.vimrc"
