#!/bin/bash
#----------------------------------------------------------------------------
#Mount HomeAssistant backup drive
mkdir /mnt/remotes/HOMEASSISTANT_backup
sudo mount.cifs //HOMEASSISTANT/backup /mnt/remotes/HOMEASSISTANT_backup -o username=admin,password=
rclone sync "/mnt/remotes/HOMEASSISTANT_backup/" onedrive:backups/[SERVER_NAME]/havm
rclone sync "/mnt/user/backups/" onedrive:backups/[SERVER_NAME]/apps
fusermount -u /mnt/remotes/HOMEASSISTANT_backup
