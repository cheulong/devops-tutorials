#!/usr/bin/bash

# Check to make sure the user has provided a backup directory and a target directory
if [ $# -ne 2 ]; then
  echo "Usage: backup.sh <backup directory> <target directory>"
  echo "Please try again."
  exit 1
fi

#Check to see if rsync is installed
if ! command -v rsync > /dev/null 2>&1
then
  echo "rsync is not installed. Please install it and try again."
  echo "Please use your package manager to install rsync."
  exit 2
fi

# Capture the current date and store it in the format "YYYY-MM-DD"
current_date=$(date +%Y-%m-%d)

rsync_options="-avb --backup-dir $2/$current_date --delete --dry-run"

$(which rsync) $rsync_options $1 $2/current >> backup_$current_date.log