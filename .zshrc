# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export SSH_AUTH_SOCK=~/.ssh/ykpiv-sock   # For ykpiv-ssh-agent
export EDITOR=nvim
export VISUAL=nvim
export PATH=/Users/zweglarz/src/trustedpath/ddi:/opt/homebrew/bin:/opt/homebrew/opt/python@3.12/libexec/bin:$PATH
export NVM_DIR=/Users/zweglarz/.nvm
export DDI_PYENV=true  # Duo DDI python environment
export NODE_OPTIONS=--use-system-ca  # Needed to handle Cisco CA for copilot extension

alias branches='git branch -v'
alias ls='gls --color=auto'
alias status='git status'
alias tp-venv='source ~/src/trustedpath/.venv/bin/activate'
alias vim=nvim
alias which-command=whence

# oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="agnoster"
plugins=(git)

source $ZSH/oh-my-zsh.sh

fpath+=("$(brew --prefix)/share/zsh/site-functions")
# end oh-my-zsh setup

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Claude config
export CLAUDE_CODE_USE_BEDROCK=1
export ANTHROPIC_DEFAULT_SONNET_MODEL="global.anthropic.claude-sonnet-4-5-20250929-v1:0"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="global.anthropic.claude-haiku-4-5-20251001-v1:0"
export AWS_PROFILE="default"


# zsh theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
