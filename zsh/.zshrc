# Autoload zsh add-zsh-hook and vcs_info functions 
# (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info

# Enable substitution in the prompt.
setopt prompt_subst

# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true

# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'

# Set the format of the Git information for vcs_info (e.g. 'git:(main)')
zstyle ':vcs_info:git:*' formats       ' %F{blue}git:(%f%F{red}%b%u%c%f%F{blue})%f'
zstyle ':vcs_info:git:*' actionformats ' %F{blue}git:(%f%F{red}%b|%a%u%c%f%F{blue})%f'

# Prompt
PROMPT='%B%F{green}->%f %F{yellow}%2d%f${vcs_info_msg_0_} %# %b'

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Export VIMINIT variable
export VIMINIT='source ~/.vim/.vimrc'
export MYVIMRC='~/dotfiles/vim/.vimrc'

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
alias ev="cd && vim dotfiles/vim/.vimrc"
alias gs="git status"

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
