#!/usr/bin/env bash

# 
# Install tools using Homebrew
# 
# Usage: ./install-python.sh
# 

# Ask for the administrator password upfront.
sudo -v

# Install pip
sudo easy_install pip

# # Install virtualenv
# sudo pip install virtualenv
# sudo pip install virtualenvwrapper
# mkdir "$HOME/.virtualenvs"
# sudo pip install autoenv

# # Create ansible environment
# mkvirtualenv ansible19
# pip install --upgrade --force-reinstall -r python/requirements-ansible19.txt
# deactivate

# mkvirtualenv ansible2
# pip install --upgrade --force-reinstall -r python/requirements-ansible2.txt
# deactivate

# mkvirtualenv ansiblesource
# pip install paramiko PyYAML Jinja2 httplib2 six
# git clone git://github.com/ansible/ansible.git --recursive $VIRTUAL_ENV/ansible
# source $VIRTUAL_ENV/ansible/hacking/env-setup
# pip install --upgrade --force-reinstall -r python/requirements-ansible-source.txt
# deactivate
