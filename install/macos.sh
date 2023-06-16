

###############################################################################
# Dock                                                                      #
###############################################################################

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Turn off recent applications
defaults write com.apple.dock show-recents -bool FALSE

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

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
	"Opera" "Safari" "SystemUIServer" "iCal"; do
	killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
echo "Type \"killall Terminal\" when finished"
