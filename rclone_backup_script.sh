#!/bin/bash
#----------------------------------------------------------------------------
USBDIR="/mnt/user/backups/USB/"
SERVERNAME="IAM-SERVER"

# Find and delete all but the newest USB Backup
ls -t $USBDIR | tail -n +2 | xargs -r -I {} rm -f $DIR{}

##backup app data backups
rclone sync "/mnt/user/backups/" onedrive:backups/IAMSYS/$SERVERNAME

#Mount HomeAssistant backup drive
mkdir /mnt/remotes/HOMEASSISTANT_backup
sudo mount.cifs //HOMEASSISTANT/backup /mnt/remotes/HOMEASSISTANT_backup -o username=homeassistant,password=theumbrellacorp

#Backup HA Config from VM
rclone sync "/mnt/remotes/HOMEASSISTANT_backup/" onedrive:backups/IAMSYS/$SERVERNAME/haos

#Unmount HomeAssistant backup drive
fusermount -u /mnt/remotes/HOMEASSISTANT_backup
