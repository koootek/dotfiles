# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kotek/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"

# zsh autocompletion
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias startphp=/srv/http/start.sh
alias stophp=/srv/http/stop.sh
alias bc="bc -q"
alias grep=rg
alias gnugrep=/usr/bin/grep
alias find=fd
alias gnufind=/usr/bin/find
alias disk=gdu

# Add local cargo installed binaries to PATH
export PATH=/home/kotek/.cargo/bin:$PATH
# Wayland
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export ELECTRON_OZONE_PLATFORM_HINT=auto
export _JAVA_AWT_WM_NONREPARENTING=1
# Terminal true colors
export TERM=xterm-256color
