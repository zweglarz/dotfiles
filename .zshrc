# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export SSH_AUTH_SOCK=~/.ssh/ykpiv-sock   # For ykpiv-ssh-agent

export EDITOR=nvim
export VISUAL=nvim
export PATH=/Users/zweglarz/src/trustedpath/ddi:/opt/homebrew/bin:$PATH

# Python version manager
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export DDI_PYENV=true

# Node version manager
export NVM_DIR=/Users/zweglarz/.nvm
export NODE_OPTIONS=--use-system-ca  # Needed to handle Cisco CA for copilot extension
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias branches='git branch -v'
alias ls='gls --color=auto'
alias status='git status'
alias tp-venv='source ~/src/trustedpath/.venv/bin/activate'
alias vim=nvim
alias which-command=whence

# oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

fpath+=("$(brew --prefix)/share/zsh/site-functions")

# Claude config
export CLAUDE_CODE_USE_BEDROCK=1
export ANTHROPIC_DEFAULT_SONNET_MODEL="global.anthropic.claude-sonnet-4-5-20250929-v1:0"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="global.anthropic.claude-haiku-4-5-20251001-v1:0"
export AWS_PROFILE="default"

# zsh theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


enable-json-logging () {
    flavor=$1

    # Configure JSON logging to be on by default for the flavor
    initial_overlays=$(ddi config get trustedpath.flavor.$flavor.initial_overlays)
    if [[ $initial_overlays == *"00-local-log-filtering.toml"* ]]; then
        echo "JSON logging already set as default overlay for $flavor"
    else
        ddi config set trustedpath.flavor.$flavor.initial_overlays ddi/targets/trustedpath/overlays/00-local-log-filtering.toml $initial_overlays
    fi

    # And enable it now without having to reset the conf
    ddi duo-conf $flavor import ~/src/trustedpath/ddi/targets/trustedpath/overlays/00-local-log-filtering.toml
}
