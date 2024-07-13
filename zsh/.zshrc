# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

ENABLE_CORRECTION="true"

plugins=(copyfile git z zsh-autosuggestions zsh-nvm zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration
# Set up homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Extend path
path+=("/Library/Frameworks/Python.framework/Versions/2.7/bin")
path+=("/opt/homebrew/opt/node@14/bin")
path+=("~/Library/Python/3.11/bin")
path+=("~/.cargo/bin")
path+=("~/.local/share/bob/nvim-bin")

export PATH

# Environment variables
export NVM_COMPLETION=true
export SSH_AUTH_SOCK="~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"
export XDG_CONFIG_HOME="/Users/l.spreitzer/.config"

# Keybindings
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Aliases
alias sail="[ -f sail ] && bash sail || bash vendor/bin/sail"
alias timestamp="php -r 'echo (new \DateTime())->format(\"U\") . \"\n\";'"
alias convtime="php -r 'echo (new \DateTime())->setTimestamp(\$argv[1])->setTimezone(new \DateTimeZone(\"Europe/Vienna\"))->format(\"d.m.Y H:i:s\") . \"\n\";' $1"
alias rebase="git rebase -i HEAD~5"
alias lg="lazygit"
alias vi="nvim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

