#!/bin/bash

rm -f ~/.zshrc && cp ~/dotfiles/.zshrc ~/.zshrc
rm -f ~/.zshrc.pre-oh-my-zsh && cp ~/dotfiles/.zshrc.pre-oh-my-zsh ~/.zshrc.pre-oh-my-zsh
rm -rf ~/.config/nvim && cp -r ~/dotfiles/nvim ~/.config/nvim
rm -rf ~/.config/ghostty && cp -r ~/dotfiles/ghostty ~/.config/ghostty
