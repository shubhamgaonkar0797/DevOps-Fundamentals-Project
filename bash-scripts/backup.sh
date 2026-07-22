#!/bin/bash

# Source directory (website files)
SOURCE_DIR="/var/www/html"

# Backup directory
BACKUP_DIR="$HOME/Backup"

# Create Backup folder if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup file name
BACKUP_FILE="website_backup_$TIMESTAMP.tar.gz"

# Compress website files
tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

# Display success message
echo "Backup completed successfully."
echo "Backup saved as: $BACKUP_DIR/$BACKUP_FILE"
