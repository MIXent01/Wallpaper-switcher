#!/bin/bash

# Files
CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"
COLORS="$HOME/.config/wofi/colors"

# Your wallpapers directory
DIR=$HOME/Documents/wallpapers/

if [[ $(pidof swaybg) ]]; then
  pkill swaybg
fi

## Wofi Command
wofi_command="wofi --show dmenu \
			--conf ${CONFIG} --style ${STYLE} --color ${COLORS} \
			--width=300 --height=400 \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--define=matching=fuzzy"

menu(){
  for file in $HOME/Documents/wallpapers/*; do
    filename="${file%.*}"
    filename="${filename:34}"  # Change 34 to the length of your wallpaper dir
    printf "%s\n" "$filename"
  done
}

swww query || swww init

main() {
choice=$(menu | ${wofi_command})
swww img ${DIR}/${choice}.png --transition-fps 60 --transition-type any --transition-duration 1
}

killall -f || main
