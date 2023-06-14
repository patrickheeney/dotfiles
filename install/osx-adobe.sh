#!/bin/bash
# =============================================================================
# @file    GitHub gist
# @brief   stop Adobe Creative Cloud app from auto-launching on login on macOS
# @author  Michael Hucka <mhucka@caltech.edu>
# @created 2021-08-12
# @website https://gist.github.com/mhucka/59e785a315d813d14cd0258b89a2fcac
#
# I find Adobe Creative Cloud absolutely infuriating.  It installs auto
# launchers that are not in the user's login app list, and the services are
# hard to find and hard to stop.  This is a script to try to unload and kill
# off the services on a macOS system.  Tested on Mojave (10.14).
#
# USE AT YOUR OWN RISK.  I'm not responsible for anthing that may happen if
# you use this.
# =============================================================================

# From https://apple.stackexchange.com/a/356217/6489

launchctl unload -w {,~}/Library/LaunchAgents/com.adobe.*.plist        > /dev/null 2>&1
sudo launchctl unload -w /Library/LaunchDaemons/com.adobe.*.plist      > /dev/null 2>&1

# From https://apple.stackexchange.com/a/366252/6489
# https://gist.github.com/mhucka/59e785a315d813d14cd0258b89a2fcac

sudo launchctl disable system/com.adobe.acc.installer.v2               > /dev/null 2>&1
sudo launchctl disable system/com.adobe.acc.installer                  > /dev/null 2>&1
sudo launchctl disable system/Adobe_Genuine_Software_Integrity_Service > /dev/null 2>&1
sudo launchctl disable system/com.adobe.AdobeCreativeCloud             > /dev/null 2>&1
sudo launchctl disable system/com.adobe.agsservice                     > /dev/null 2>&1
launchctl disable gui/$(id -u)/com.adobe.acc.AdobeCreativeCloud.2416   > /dev/null 2>&1
launchctl disable gui/$(id -u)/com.adobe.accmac.2256                   > /dev/null 2>&1
launchctl disable gui/$(id -u)/com.adobe.CCXProcess.2252               > /dev/null 2>&1
launchctl disable gui/$(id -u)/com.adobe.CreativeCloud                 > /dev/null 2>&1
launchctl disable gui/$(id -u)/com.adobe.CCLibrary.4032                > /dev/null 2>&1
launchctl disable gui/$(id -u)/com.adobe.AdobeCreativeCloud            > /dev/null 2>&1

# Additional things found necessary on my 10.14 system:

killall Adobe\ Desktop\ Service                                        > /dev/null 2>&1
