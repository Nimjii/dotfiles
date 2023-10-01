eval "$(/opt/homebrew/bin/brew shellenv)"

set -gx PATH /Library/Frameworks/Python.framework/Versions/2.7/bin $PATH
set -gx PATH /Users/l.spreitzer/Library/Python/3.11/bin $PATH
set -gx PATH $PATH /Users/l.spreitzer/Library/Application Support/JetBrains/Toolbox/scripts
set -gx PATH $PATH /Users/l.spreitzer/.cargo/bin
set -gx XDG_CONFIG_HOME /Users/l.spreitzer/.config
set -gx NVM_DIR /Users/l.spreitzer/.nvm

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
