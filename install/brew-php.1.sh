#!/usr/bin/env bash

#
# Install tools using Homebrew
# https://gist.github.com/benlinton/d24471729ed6c2ace731
#
# Usage: ./install/brew-mysql.sh
#
# Start server:
# $ mysql.server start
#
# Stop server:
# $ mysql.server stop
#

# Install
brew install mysql
mysql.server restart
mysql_secure_installation
mysql.server stop

# Start agent for current version of mysql (including on login)
# ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
# launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

#
# New Database
#

# mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
# mysqld -initialize --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

# Create symlink

# sudo mkdir /var/mysql
# sudo chmod 755 /var/mysql
# sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock

#
# Install older versions
#

# Find older mysql versions
# brew search mysql

# Install older mysql version
# brew install homebrew/versions/mysql56

# Start agent for older version of mysql (including on login)
# ln -sfv /usr/local/opt/mysql56/*.plist ~/Library/LaunchAgents
# launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql56.plist

#
# Switch to older version
#

# Unlink current mysql version
# brew unlink mysql

# Check older mysql version
# ls /usr/local/Cellar/mysql56 # => 5.6.27

# Link the older version
# brew switch mysql56 5.6.27

#
# Switch back
#

# Unlink older mysql version
# brew unlink mysql56

# Check current mysql version
# ls /usr/local/Cellar/mysql # => 5.7.10

# Link the current version
# brew switch mysql 5.7.10

#
# Verify version
#

# Check which version of mysql is currently symlinked
# ls -l /usr/local/bin/mysql # => /usr/local/bin/mysql@ -> ../Cellar/mysql56/5.6.27/bin/mysql

# Or using the mysql command
# mysql --version
