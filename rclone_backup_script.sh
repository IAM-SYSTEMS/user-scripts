#!/bin/bash
#----------------------------------------------------------------------------
##backup app data backups
rclone sync "/mnt/user/backups/" onedrive:backups/[SERVER_NAME]/apps
