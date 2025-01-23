#!/bin/bash
#----------------------------------------------------------------------------
##backup app data backups
rclone sync "/mnt/user/backups/" onedrive:backups/IAMSYS/[SERVER_NAME]/apps

#Mount HomeAssistant backup drive
#mkdir /mnt/remotes/HOMEASSISTANT_backup
#sudo mount.cifs //HOMEASSISTANT/backup /mnt/remotes/HOMEASSISTANT_backup -o username=admin,password=

#Backup HA Config from VM
#rclone sync "/mnt/remotes/HOMEASSISTANT_backup/" onedrive:backups/IAMSYS/[SERVER_NAME]/havm

#Unmount HomeAssistant backup drive
#fusermount -u /mnt/remotes/HOMEASSISTANT_backup
