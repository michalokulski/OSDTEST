#!/bin/bash

# Define variables
VENTOY_URL="https://github.com/ventoy/Ventoy/releases/download/v1.0.99/ventoy-1.0.99-linux.tar.gz"
HL_THEME_URL="https://github.com/michalokulski/OSDTEST/raw/main/themes.zip"
DOWNLOAD_DIR="$HOME/Downloads/Ventoy"
VENTOY_DIR="$DOWNLOAD_DIR/ventoy-1.0.99"

# Check if Ventoy is already downloaded and unpacked
if [ -d "$VENTOY_DIR" ]; then
    echo "Ventoy is already in the right place."
else
    # Step 1: Download Ventoy from Github
    mkdir -p "$DOWNLOAD_DIR"
    wget -O "$DOWNLOAD_DIR/ventoy.tar.gz" "$VENTOY_URL"

    # Step 2: Unpack archive into $home/downloads/Ventoy
    tar -xzf "$DOWNLOAD_DIR/ventoy.tar.gz" -C "$DOWNLOAD_DIR"
fi

# Step 3: Create menu with warning message and list USB drives
printf '%s\n' 'Hapag-Lloyd Digital Attack Resiliency Program' 'hlag-darp.com' '' 'In next step there is possibility to create bootable USB Drive' 'On provided USB Drive there will be Offline Windows 10 Image to reimage notebook' '' 'WARNING: All content of the selected USB stick will be removed!' 'Please select a USB drive from the list below:'

lsblk -o NAME,SIZE,MODEL | grep -E 'sd[a-z]'

read -p "Enter the device name (e.g., sda): " DEVICE

# Step 4: Run Ventoy2Disk.sh with option to select specific drive
sudo "$VENTOY_DIR/Ventoy2Disk.sh" -i /dev/"$DEVICE" -L HLAG_DARP -s

# Step 5: Mount the right partition for the selected USB device
MOUNT_POINT="/mnt/HLAG_DARP"
MOUNT_POINT2="/mnt/VTOYEFI"
sudo mkdir -p "$MOUNT_POINT"
sudo mkdir -p "$MOUNT_POINT2"
sudo mount /dev/"${DEVICE}1" "$MOUNT_POINT"
sudo mount /dev/"${DEVICE}2" "$MOUNT_POINT2"

# Step 6: Copy two files from AWS S3 into the right partition
#FILE1_URL="https://github.com/your-repo/file1"
#FILE2_URL="https://github.com/your-repo/file2"
#wget -O "$MOUNT_POINT/file1" "$FILE1_URL"
#wget -O "$MOUNT_POINT/file2" "$FILE2_URL"

#Step 7: Modification of Ventoy GUI
#Download of themes.zip (contains complete theme with HL background)
wget -O "$DOWNLOAD_DIR/themes.zip" "$HL_THEME_URL"
sudo unzip -o "$DOWNLOAD_DIR/themes" -d "/mnt/VTOYEFI/grub/"


# Unmount the partition
#sudo umount "$MOUNT_POINT"
#sudo umount "$MOUNT_POINT2"

echo "Ventoy installation and file copying completed successfully!"
