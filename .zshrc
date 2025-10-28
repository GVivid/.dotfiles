# Enables CLICOLORS
export CLICOLOR=1

export XDG_CONFIG_HOME="$HOME/.config"

# Colorful Prompt
PS1="%F{cyan}%n%F{red}@%F{yellow}%m %F{green}%1~ %#%f "

# This allows you to type `mark <name of path>` to create a environment
# variable for that path. Then you can do things like `cd $<name of path>`
# https://stackoverflow.com/questions/13275013/save-current-directory-in-variable-using-bash
function mark {
    export $1="`pwd`";
}

# export LC_ALL=en_US.UTF-8

# File Location Aliases
source ~/.aliases

# Export path that is specific to a device 
source ~/.paths

# Things to source for a terminal like tmux.
source ~/.modules
