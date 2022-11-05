#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "$SCRIPT_DIR"

function exists() {
    command -v "$1" &> /dev/null
}

function install-gh() {
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    apt update 
    sudo apt install gh -y
}
# installing curl
type -p curl >/dev/null || apt install curl -y

# if [[ -f "$HOME/.bashrc" && ! $(exists git) ]]; then
echo "Trying to install pyenv..."
if [[ -f "$HOME/.bashrc" ]]; then

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
    echo "Something went wrong. \
    The pyenv installation wasn't successful"
fi

echo "installing Github CLI"
if "$(install-gh)"; then
    echo "installed correctly"
else
    echo "The Github installation wasn't succesfull"
fi


echo "succesfull"