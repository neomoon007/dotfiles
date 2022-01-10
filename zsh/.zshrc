# Neomoon's zsh config

# Prompt
PS1="%F{blue}%n%f %Bin%b %F{yellow}%2d%f
%B~> %b"

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Export VIMINIT variable
export VIMINIT='source ~/.vim/.vimrc'
export MYVIMRC='~/.vim/.vimrc'

# Autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Aliases
alias la="exa -la"
alias e="exit"
alias c="clear"
alias ta="tree -aL"
alias ..="cd .."
alias ev="vim dotfiles/vim/.vimrc"

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
