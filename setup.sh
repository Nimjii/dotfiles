#!/usr/bin/env bash
set -e

# install brew
if ! command -v "brew" &> /dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install method that checks if package is already installed
install () {
    if ! command -v "$@" &> /dev/null; then
		brew install "$@"
    else
		echo "'$@' is already installed, you're set."
		sleep 1
    fi
}

# install git for cloning the repo
install "git"

# clone dotfiles
mkdir -p ~/projects/personal/dotfiles
	&& git clone https://github.com/Nimjii/dotfiles.git ~/projects/personal/dotfiles
	&& cd ~/projects/personal/dotfiles

# install stow for symlink management
install "stow"

# method for creating forced symlinks with stow
create_link () {
	stow $@ --adopt -t ~
		&& git reset --hard HEAD
}

# link zsh config
create_link "zsh"

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc

# install zsh theme
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# load zsh config
source ~/.zshrc

# install packages with brew
# install "ansible"
install "bat"
install "bob"
install "catimg"
install "composer"
install "ddev"
install "fd"
install "fzf"
install "gawk"
install "git-delta"
install "go"
install "lazydocker"
install "lazygit"
install "lftp"
install "lua"
install "make"
install "mkcert"
install "node@14"
install "php"
install "ranger"
install "ripgrep"
install "rubberband"
install "rust"
install "sketchybar"
install "skhd"
install "t3ll"
install "tmux"
install "tree-sitter"
install "volta"
install "yabai"
install "yarn"

# install casks
brew install --cask "1password"
brew install --cask "docker"
brew install --cask "firefox"
brew install --cask "font-overpass-nerd-font"
brew install --cask "google-chrome"
brew install --cask "karabiner-elements"
brew install --cask "keka"
brew install --cask "postman"
brew install --cask "sf-symbols"
brew install --cask "slack"
brew install --cask "sublime-text"

# install bat theme
mkdir -p "$(bat --config-dir)/themes"
	&& wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
	&& bat cache --build

# install nvim
bob install latest && bob use latest

# install tpm
mkdir ~/.config/tmux/plugins
	&& git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
	&& ~/.config/tmux/plugins/tpm/scripts/install_plugins.sh

# install nvm node versions
nvm install 16
nvm install 20.15.0

# symlink all config files
create_link "1Password"
create_link "bat"
create_link "git"
create_link "karabiner"
create_link "lazygit"
create_link "nvim"
create_link "sketchybar"
create_link "ssh"
create_link "starship"
create_link "tmux"
create_link "wezterm"
create_link "yabai"

# move font files to font directory
cp fonts/Library/Fonts/* ~/Library/Fonts/

# start sketchybar
brew services start sketchybar

# start skhd
skhd --start-service

# install fisher
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
# 	&& fisher install jorgebucaran/fisher
# 	&& fisher install jorgebucaran/nvm.fish
# 	&& nvm install lts

# install lazy and update everything
nvim --headless "+Lazy! sync" +qa
nvim --headless "+MasonUpdate" +qa
nvim --headless "+TSUpdate" +qa

