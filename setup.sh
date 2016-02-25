#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install eslint to allow checking of JS code globally
# http://jshint.com/
npm install -g eslint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# install dotfiles as well
if [ -d $HOME/dotfiles/ ]; then
    mv $HOME/dotfiles $/HOME/dotfiles.old
fi

ln -sb dotfiles/.bash_profile $HOME
ln -sb dotfiles/.bashrc $HOME
ln -sb dotfiles/.bashrc_custom $HOME
ln -sb dotfiles/.eslintrc $HOME
ln -sb dotfiles/.gitconfig $HOME
ln -sb dotfiles/.gitignore_global $HOME
ln -sb dotfiles/.screenrc $HOME
ln -sb dotfiles/.vimrc $HOME
