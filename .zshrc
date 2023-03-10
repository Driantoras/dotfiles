# variables
ZSH_PLUGINS_PATH=/usr/share/zsh/plugins

# paths
export PATH=~/.cargo/bin:$PATH

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
compinit
_comp_options+=(globdots) # include hidden files.

# use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# aliases
alias c="clear"
alias code="codium"
alias grep="grep --color"

# autosuggestions based on histroy
source $ZSH_PLUGINS_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# syntax highlighting in the shell
source $ZSH_PLUGINS_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# history substring search with up and down key
source $ZSH_PLUGINS_PATH/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
bindkey '^[[A' history-substring-search-up # arrow up
bindkey '^[[B' history-substring-search-down # arrow down

# starship prompt
eval "$(starship init zsh)"
