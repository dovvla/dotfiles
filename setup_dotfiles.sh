#!/bin/bash

create_symlinks() {
    find "$DOTFILES_DIR" -type f | while read -r file; do
        relative_path="${file#"$DOTFILES_DIR"/}"
        target="$TARGET/$relative_path"

        mkdir -p "$(dirname "$target")"

        echo "Managing file: $file -> $target"
        if [ -e "$target" ] || [ -L "$target" ]; then
            echo "Removing existing file or symlink: $target"
            rm -rf "$target"
        fi

        echo "Creating symlink: $file -> $target"
        ln -s "$file" "$target"
    done
}

DOTFILES_DIR="$(pwd)/src/HOME"
TARGET="$HOME"
create_symlinks "$DOTFILES_HOME_DIR" "$HOME"

DOTFILES_DIR="$(pwd)/src/etc"
TARGET="/etc"
create_symlinks "$DOTFILES_ETC_DIR" "/etc"

echo "Done!"
