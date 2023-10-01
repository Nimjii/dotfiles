#!/usr/bin/env bash

# symlink all config files
stow fish -t ~
stow nvim -t ~
stow starship -t ~
stow tmux -t ~
stow wezterm -t ~

# install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
	&& fisher install jorgebucaran/fisher
	&& fisher install jorgebucaran/nvm.fish
	&& nvm install lts

# install tpm
mkdir ~/.config/tmux/plugins &&
	git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm &&
	~/.config/tmux/plugins/tpm/scripts/install_plugins.sh

# install lazy and update everything
mkdir ~/.local/nvim	&&
	git clone --filter=blob:none --single-branch https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy
nvim --headless "+Lazy! sync" +qa
nvim --headless "+MasonUpdate" +qa
nvim --headless "+TSUpdate" +qa
