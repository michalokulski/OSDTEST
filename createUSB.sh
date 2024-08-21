#!/bin/bash

# Step 1: Download Ventoy from Github
VENTOY_URL="https://github.com/ventoy/Ventoy/releases/download/v1.0.99/ventoy-1.0.99-linux.tar.gz"
DOWNLOAD_DIR="$HOME/downloads/Ventoy"
mkdir -p "$DOWNLOAD_DIR"
wget -O "$DOWNLOAD_DIR/ventoy.tar.gz" "$VENTOY_URL"

# Step 2: Unpack archive into $home/downloads/Ventoy
tar -xzf "$DOWNLOAD_DIR/ventoy.tar.gz" -C "$DOWNLOAD_DIR"

# Step 3: Create menu with warning message and list USB drives
echo "WARNING: All content of the selected USB stick will be removed!"
echo "Please select a USB drive from the list below:"
lsblk -o NAME,SIZE,MODEL | grep -E 'sd[b-z]$'

read -p "Enter the device name (e.g., sdb): " DEVICE

# Step 4: Run Ventoy2Disk.sh with option to select specific drive
sudo "$DOWNLOAD_DIR/ventoy-1.0.99/Ventoy2Disk.sh" -i /dev/"$DEVICE"

# Step 5: Mount the right partition for the selected USB device
MOUNT_POINT="/mnt/ventoy"
sudo mkdir -p "$MOUNT_POINT"
sudo mount /dev/"${DEVICE}2" "$MOUNT_POINT"

# Step 6: Copy two files from Github into the right partition
FILE1_URL="https://github.com/your-repo/file1"
FILE2_URL="https://github.com/your-repo/file2"
wget -O "$MOUNT_POINT/file1" "$FILE1_URL"
wget -O "$MOUNT_POINT/file2" "$FILE2_URL"

# Unmount the partition
sudo umount "$MOUNT_POINT"

echo "Ventoy installation and file copying completed successfully!"
