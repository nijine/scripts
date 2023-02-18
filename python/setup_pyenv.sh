INSTALL_DIR=$1

read -p "Installing pyenv to $INSTALL_DIR , continue?"

git clone https://github.com/pyenv/pyenv.git $INSTALL_DIR
git clone https://github.com/pyenv/pyenv-doctor.git $INSTALL_DIR/plugins/pyenv-doctor
git clone https://github.com/pyenv/pyenv-installer.git $INSTALL_DIR/plugins/pyenv-installer
git clone https://github.com/pyenv/pyenv-update.git $INSTALL_DIR/plugins/pyenv-update
git clone https://github.com/pyenv/pyenv-virtualenv.git $INSTALL_DIR/plugins/pyenv-virtualenv
git clone https://github.com/pyenv/pyenv-which-ext.git $INSTALL_DIR/plugins/pyenv-which-ext
