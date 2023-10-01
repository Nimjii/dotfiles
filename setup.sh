#!/usr/bin/env bash

# symlink all config files
stow fish -t ~
stow starship -t ~
stow tmux -t ~
stow wezterm -t ~

# install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
	&& fisher install jorgebucaran/fisher
	&& fisher install jorgebucaran/nvm.fish
	&& nvm install lts
