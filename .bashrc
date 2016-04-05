# .bashrc

# User specific aliases and functions
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

PATH=/Applications/MacVim.app/Contents/MacOS:$PATH:/home/username/bin:/usr/local/homebrew
export PATH
