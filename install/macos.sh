
###############################################################################
# iterm2                                                                      #
###############################################################################

# Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${HOME}/dotfiles/iterm2"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Install the Solarized Dark theme for iTerm
# open "${HOME}/dotfiles/iterm2/Solarized Dark.itermcolors"
