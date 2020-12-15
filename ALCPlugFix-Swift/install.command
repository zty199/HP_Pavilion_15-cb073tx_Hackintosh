#!/bin/bash

#  install.command
#  ALCPlugFix-Swift
#  
#  Created by zty199 on 12/15/20, based on install.sh created by Nick.
#  
 
## Clean up old installs

# Remove codec commander based ALCPlugFix
sudo launchctl unload /Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo rm /Library/LaunchAgents/good.win.ALCPlugFix.plist
    
# Remove any existing alc-verb install
sudo launchctl unload /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist
sudo rm /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist
sudo rm /Library/Preferences/com.black-dragon74.ALCPlugFix.config.plist

sudo rm /usr/local/bin/ALCPlugFix
sudo rm /usr/local/bin/hda-verb
sudo rm /usr/local/bin/alc-verb

## Copy new files

# Get hold of actual directory
cd $(dirname $0)

sudo cp ALCPlugFix-Swift /usr/local/bin/ALCPlugFix
sudo cp com.black-dragon74.ALCPlugFix.plist /Library/LaunchAgents
sudo cp com.black-dragon74.ALCPlugFix.config.plist /Library/Preferences

sudo chmod 755 /usr/local/bin/ALCPlugFix
sudo chmod 644 /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist
sudo chmod 644 /Library/Preferences/com.black-dragon74.ALCPlugFix.config.plist

sudo chown root:wheel /usr/local/bin/ALCPlugFix
sudo chown root:wheel /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist
sudo chown root:wheel /Library/Preferences/com.black-dragon74.ALCPlugFix.config.plist

sudo launchctl load /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist
