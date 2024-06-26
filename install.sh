#!/bin/bash

# Installs dotfiles
PATHS_TO_LINK=(
  ".config/alacritty"
  ".config/bat"
  ".config/i3"
  ".config/i3status-rust"
  ".config/nvim"
  ".config/rofi"
  ".config/starship.toml"
  ".local/scripts"
  ".tmux.conf"
)

script_path() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

SCRIPT_PATH=`script_path $0`
SCRIPT_DIR=`dirname $SCRIPT_PATH`

link(){
    local src="$SCRIPT_DIR/$1"
    local dest="$HOME/$1"
    [ ! -e "$dest" ] && ln -sf "$src" "$dest"
}

for f in ${PATHS_TO_LINK[@]}; do
    link $f
done

