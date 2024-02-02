# paths
export PATH=~/.cargo/bin:$PATH
export GOPATH=$HOME/.go

# enable colors
autoload -U colors && colors

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh_history

# basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # case insensitive
zmodload zsh/complist
fpath+=~/.zfunc
compinit
_comp_options+=(globdots) # include hidden files.

# aliases
alias c="clear"
alias code="codium"
alias grep="grep --color"

# autosuggestions based on histroy
source $HOME/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# syntax highlighting in the shell
source $HOME/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# history substring search with up and down key
source $HOME/.local/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
bindkey '^[[A' history-substring-search-up # arrow up
bindkey '^[[B' history-substring-search-down # arrow down

# starship prompt https://starship.rs/
eval "$(starship init zsh)"
