#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "$SCRIPT_DIR"

function exists() {
    command -v "$1" &> /dev/null
}

# if [[ -f "$HOME/.bashrc" && ! $(exists git) ]]; then
echo "Trying to install pyenv..."
if [[ -f "$HOME/.bashrc" ]]; then

    type -p curl >/dev/null || sudo apt install curl -y
    curl https://pyenv.run | bash

    trap 'rm -f "$TMPFILE"' EXIT

    TMPFILE=$(mktemp) || exit 1 # create a secure temp file

    # touch "${SCRIPT_DIR}/home/standardio/repos/dot-files/pythonenv/test"

    # Saving a backup
    cat "$HOME/.bashrc" >| "$HOME/.pyenv_bashrc_backup"
    cat "$SCRIPT_DIR/pythonenv/test" "$HOME/.bashrc" >| "$TMPFILE"
    cat  "$TMPFILE"  >| "$SCRIPT_DIR/pythonenv/test"

    echo "pyenv correctly installed"
    echo "Restart the shell to load the modifications"
else
    echo "Something went wrong. The execution wasn't successful"
fi
