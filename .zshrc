# ~/.zshrc

bindkey -v

export HISTFILE=~/.zsh_history
export SAVEHIST=1000

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt MENU_COMPLETE
setopt CORRECT

# Lazy-load antidote from its functions directory.
fpath=(~/.antidote/functions $fpath)
autoload -Uz antidote
autoload -U compinit && compinit

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
    antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

eval "$(starship init zsh)"
