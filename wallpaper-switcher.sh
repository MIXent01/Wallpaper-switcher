#!/bin/bash

# Your wallpapers dir
DIR="$HOME/Documents/Wallpapers"

# Files
CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"
COLORS="$HOME/.config/wofi/colors"

# Wofi Command

wofi_args=(
  "wofi"
  "--show" "dmenu"
  "--conf" "$CONFIG"
  "--style" "$STYLE"
  "--width=400"
  "--height=500"
  "--cache-file=/dev/null"
  "--no-actions"
  "--hide-scroll"
  "--allow-images"
)

menu(){
  for file in $DIR/*; do 
    filename=$(basename "$file")
    echo "$filename"
  done
}


main() {
  choice=$(menu | "${wofi_args[@]}")
  swww img "$DIR/$choice" --transition-fps 120 --transition-duration 1 --transition-type any
}

main
