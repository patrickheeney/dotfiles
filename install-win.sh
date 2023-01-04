#
# Clone the repo: 
# git clone https://github.com/patrickheeney/dotfiles.git %userprofile%\dotfiles
#

# Change Restriction Policy
# Get-ExecutionPolicy = Restricted by default
# Windows Powershell > Run as Administrator
# Set-ExecutionPolicy Unrestricted use as last resort
Set-ExecutionPolicy RemoteSigned 


# Enable Developer Mode on Windows 11
# Settings > Privacy & Security > For Developers
# Enabled Developer Mode = On

# Settings > Privacy & Security > Activity History. Uncheck store my activity
# Settings > Privacy & Security > Search Permissions. Uncheck everything

# Windows Defender Firewall with Advanced Security
# Windows Defender Firewall Properties
# Set Domain Profile > Outbound Connections = Block
# Set Private Profile > Outbound Connections = Block
# Set Public Profile > Outbound Connections = Block
# https://superuser.com/questions/1182658/how-to-block-everything-all-incoming-and-outgoing-internet-access-except-those

# Settings > Storage > Storage Sense. Enable

# Sleep Schedule
# https://www.makeuseof.com/windows-11-shuts-down-instead-of-sleep-fix/
# Control Panel > Hardware and Sound > Power Options > Change when computer sleeps > Change advanced power settings
#	Hard disk > Turn off hard disk after: 360 minutes
#	Hibernate after: Never

# Static IP
# https://windowsreport.com/how-to-set-static-ip-windows-11/

# Remote Desktop
# Turn off exclusive Microsoft Hello sign in to use account password instead
# Logout and Log back in
# https://superuser.com/questions/1026277/windows-10-remote-desktop-credentials

# Turn on Remote Desktop
# https://support.microsoft.com/en-us/windows/how-to-use-remote-desktop-5fe128d5-8fb1-7a23-3b8a-41e636865e8c

# Open Microsoft Store
# Install App Installer
# If installed: Open Microsoft Store > Library > Update

# 
# Search > Command Prompt
# Right click > Run as Administrator
#

# Install WSL
# https://docs.microsoft.com/en-us/windows/wsl/about

wsl --install

sudo apt install rsync openssh-client

# Install winget
# https://docs.microsoft.com/en-us/training/modules/explore-windows-package-manager-tool/
# winget search [name]

# System

winget install -e --id Git.Git
winget install -e --id Henry++.simplewall
winget install -e --id Microsoft.PowerToys
winget install -e --id RealVNC.VNCViewer

# keepass dependency - https://github.com/keepassxreboot/keepassxc/issues/7564
winget install -e --id Microsoft.VC++2017Redist-x64
winget install -e --id KeePassXCTeam.KeePassXC

winget install -e --id 7zip.7zip
winget install -e --id RARLab.WinRar
winget install -e --id VideoLan.VLC
winget install -e --id AntibodySoftware.WizTree
winget install -e --id Klocman.BulkCrapUninstaller

winget install -e --id Mozilla.Firefox
winget install -e --id Google.Chrome

# Work

# onenote

winget install -e --id TablePlus.TablePlus
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id BlenderFoundation.Blender

# Affinity Photo
# Affinity Designer
# Affinity Publisher

# Media

winget install -e --id Valve.Steam
winget install -e --id XBMCFoundation.Kodi
winget install -e --id DolphinEmulator.Dolphin
winget install -e --id ElectronicArts.EADesktop
# Origin
# PCSX2
# RPCS3
# Launchbox

# some sort of airplay or casting?

