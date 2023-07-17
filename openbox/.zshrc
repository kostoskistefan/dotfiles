# Print new line after prompt
function precmd() {
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        print ""
    fi
}

# Set location for local npm packages
# NPM_PACKAGES="${HOME}/.npm-packages"
# export npm_config_prefix="$NPM_PACKAGES"
# export PATH="$NPM_PACKAGES/bin:$PATH"
# export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export TERMINAL=/usr/bin/alacritty
export EDITOR=/usr/bin/nvim
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$HOME/.zsh_history
export ZSH="$HOME/.oh-my-zsh"
export BROWSER=/usr/bin/firefox
# export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 # Needed for Unity

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY

ZSH_THEME="scythe/scythe"
DISABLE_AUTO_TITLE=true
ZSH_DISABLE_COMPFIX=true
DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias make='make -j4'
alias pacman='sudo pacman'
alias pg='ps aux | grep -i '
alias yay='yay --nodiffmenu --nocleanmenu'
alias ls='LC_COLLATE=C ls -lah --color --group-directories-first'
alias volume='amixer -c 1 -M -D pulse get Master | tail -1 | cut -d "[" -f2 | cut -d "]" -f1'
