#!/bin/bash
#----------------------------------------------------------------------------
# Find and delete all but the newest USB Backup
DIR="/mnt/user/backups/USB/"
ls -t $DIR | tail -n +2 | xargs -r -I {} rm -f $DIR{}

##backup app data backups
rclone sync "/mnt/user/backups/" onedrive:backups/IAMSYS/[NAME]

#Mount HomeAssistant backup drive
mkdir /mnt/remotes/HOMEASSISTANT_backup
sudo mount.cifs //HOMEASSISTANT/backup /mnt/remotes/HOMEASSISTANT_backup -o username=homeassistant,password=theumbrellacorp

#Backup HA Config from VM
rclone sync "/mnt/remotes/HOMEASSISTANT_backup/" onedrive:backups/IAMSYS/[NAME]/haos

#Unmount HomeAssistant backup drive
fusermount -u /mnt/remotes/HOMEASSISTANT_backup
