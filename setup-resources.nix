{ pkgs ? import <nixpkgs> { } }:

pkgs.writeShellScriptBin "typy-cli-setup" ''
  BIN_NAME="typy"
  LOCAL_DIR="$HOME/.local/share"
  CONFIG_PATH="$LOCAL_DIR/$BIN_NAME/english.txt"
  GIT_TAG="v0.8.0"

  mkdir -p "$LOCAL_DIR/$BIN_NAME"

  ${pkgs.curl}/bin/curl \
    -L https://github.com/Pazl27/typy-cli/releases/download/$GIT_TAG/english.txt \
    -o "$CONFIG_PATH"
''
