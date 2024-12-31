#!/bin/bash

release_file=/etc/os-release
log_file=/var/log/update-packages.log
error_file=/var/log/update-packages-error.log

if grep -q "Arch" $release_file; then
    echo "Arch Linux"
    pacman -Syu -y >> $log_file 2>> $error_file
    if [ $? -ne 0 ]; then
        echo "pacman update failed, please check $error_file file"
        exit 1
    fi
elif grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file; then
    echo "Ubuntu or Debian"
    apt update -y >> $log_file 2>> $error_file
    if [ $? -ne 0 ]; then
        echo "apt update failed, please check $error_file file"
        exit 1
    fi
    apt dist-upgrade -y >> $log_file 2>> $error_file
    if [ $? -ne 0 ]; then
        echo "apt dist-upgrade failed, please check $error_file file"
        exit 1
    fi
elif grep -q "CentOS" $release_file; then
    echo "CentOS"
    yum update -y >> $log_file 2>> $error_file
    if [ $? -ne 0 ]; then
        echo "yum update failed, please check $error_file file"
        exit 1
    fi
else
    echo "Unsupported OS"
fi
