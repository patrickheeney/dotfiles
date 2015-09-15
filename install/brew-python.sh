#!/usr/bin/env bash

#
# Install tools using Homebrew
#
# Usage: ./install/brew-python.sh
#

# Ask for the administrator password upfront.
#sudo -v

# Install system python
brew install python

# Update system pip and setuptools
pip install --upgrade pip setuptools

# Install pyenv
brew install pyenv pyenv-virtualenv

# Install some python versions
pyenv install 2.7

# Set the global version
pyenv global 2.7

# # Install virtualenv
# sudo pip install virtualenv
# sudo pip install virtualenvwrapper
# mkdir "$HOME/.virtualenvs"
# sudo pip install autoenv

# mkvirtualenv ansiblesource
# pip install paramiko PyYAML Jinja2 httplib2 six
# git clone git://github.com/ansible/ansible.git --recursive $VIRTUAL_ENV/ansible
# source $VIRTUAL_ENV/ansible/hacking/env-setup
# pip install --upgrade --force-reinstall -r python/requirements-ansible-source.txt
# deactivate

# Uninstall
# sudo pip freeze | xargs sudo pip uninstall -y
