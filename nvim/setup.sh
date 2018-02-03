#!/bin/sh
#variables
DEIN_INSTALL_LOC="${HOME}/.local/share/dein"
#install config
mkdir -p ~/.config/nvim
ln -s ${PWD}/init.vim ~/.config/nvim/init.vim
# install dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $DEIN_INSTALL_LOC
