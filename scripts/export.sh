#!/bin/bash

DEST="$HOME/Documents/My_Rice/dotfiles"
mkdir -p "$DEST"

# Folders to copy completely
folders=("hypr" "caelestia" "kitty" "cava" "spicetify" "btop" "fastfetch" "fish" "fuzzel")

for folder in "${folders[@]}"; do
    if [ -d "$HOME/.config/$folder" ]; then
        mkdir -p "$DEST/$folder"
        cp -r "$HOME/.config/$folder/"* "$DEST/$folder/" 2>/dev/null || true
    fi
done

# Single files
files=(".bashrc" ".zshrc" ".gitconfig" ".config/starship.toml")
for file in "${files[@]}"; do
    if [ -f "$HOME/$file" ]; then
        cp "$HOME/$file" "$DEST/$(basename "$file")"
    fi
done

# Scrubbing personal information
echo "Scrubbing /home/$USER from files..."
find "$DEST" -type f -exec sed -i "s|/home/$USER|~|g" {} +

echo "Scrubbing .gitconfig..."
if [ -f "$DEST/.gitconfig" ]; then
    sed -i 's/name = .*/name = Your Name/' "$DEST/.gitconfig"
    sed -i 's/email = .*/email = your.email@example.com/' "$DEST/.gitconfig"
fi

echo "Scrubbing spicetify config..."
if [ -f "$DEST/spicetify/config-xpui.ini" ]; then
    sed -i 's|prefs_path.*|prefs_path = ~/.config/spotify/prefs|g' "$DEST/spicetify/config-xpui.ini"
    sed -i 's|spotify_path.*|spotify_path = /opt/spotify|g' "$DEST/spicetify/config-xpui.ini"
fi

echo "Scrubbing done."
