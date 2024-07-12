eval "$(/opt/homebrew/bin/brew shellenv)"

set -gx PATH /Library/Frameworks/Python.framework/Versions/2.7/bin $PATH
set -gx PATH /opt/homebrew/opt/node@14/bin $PATH
set -gx PATH ~/Library/Python/3.11/bin $PATH
set -gx PATH $PATH ~/Library/Application\ Support/JetBrains/Toolbox/scripts
set -gx PATH $PATH ~/.cargo/bin
set -gx PATH $PATH ~/.local/share/bob/nvim-bin
set -gx XDG_CONFIG_HOME ~/.config
set -gx NVM_DIR ~/.nvm
set -gx SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

if status is-interactive
	starship init fish | source

	alias sail "[ -f sail ] && bash sail || bash vendor/bin/sail"
	alias timestamp "php -r 'echo (new \DateTime())->format(\"U\") . \"\n\";'"
	alias convtime "php -r 'echo (new \DateTime())->setTimestamp(\$argv[1])->setTimezone(new \DateTimeZone(\"Europe/Vienna\"))->format(\"d.m.Y H:i:s\") . \"\n\";' $1"
	alias rebase "git rebase -i HEAD~5"
	alias lg "lazygit"
	alias vi "nvim"
	fish_default_key_bindings
end

