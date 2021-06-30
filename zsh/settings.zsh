# Initialize completion
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select=4
zmodload zsh/complist
# Use vim style navigation keys in menu completion

# Initialize editing command line
autoload -U edit-command-line && zle -N edit-command-line

# Enable interactive comments (# on the command line)
setopt interactivecomments

# Nicer history
HISTSIZE=2097152
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE

setopt extendedglob
setopt sharehistory
setopt completeinword
setopt completealiases
setopt appendhistory
setopt incappendhistory
setopt extendedhistory
setopt rmstarsilent
setopt autocd
setopt nocaseglob

# Use vim as the editor
export EDITOR=nano
