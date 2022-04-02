if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export EDITOR=/usr/bin/nvim
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$HOME/.zsh_history
export ZSH="$HOME/.oh-my-zsh"
export BROWSER=/usr/bin/google-chrome-stable
export LESS='-RiF --mouse --wheel-lines=3'

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY

ZSH_DISABLE_COMPFIX=true
ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

alias ls='LC_COLLATE=C ls -lah --color --group-directories-first'
alias mylocalip='sudo ifconfig | grep wlan0 -A 1 | grep inet | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | grep 192 -m 1'
alias myip='curl https://ipinfo.io/ip'
alias vim='nvim'
alias pg='ps aux | grep '
alias yay='yay --nodiffmenu --nocleanmenu'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
