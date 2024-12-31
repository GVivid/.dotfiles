# https://zsh.sourceforge.io/Doc/Release/ for documentation
export JAVA_HOME="usr/bin/java"

# Enables CLICOLORS
export CLICOLOR=1

export XDG_CONFIG_HOME="$HOME/.config"

# This is if you use doom emacs.
# export PATH="$HOME/.emacs.d/bin:$PATH"

export PATH=:$PATH.
# export LC_ALL=en_US.UTF-8

# File Location Aliases
source ~/.aliases

# This was needed for kitty colors to work correctly, but not on Alacritty
# export TERM=xterm-256color
# export COLORTERM=24bit

# Colorful Prompt
PS1="%F{cyan}%n%F{red}@%F{yellow}%m %F{green}%1~ %#%f "

# This makes it so that homebrew does not decided to update at inconvenient
# times.
export HOMEBREW_NO_AUTO_UPDATE=1

# Open tmux by default if it is available
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

# set -o vi
# Default
# PS1="%n@%m %1~ %# "

# This makes node work; I have it disabled because it makes the terminal load slower.
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
