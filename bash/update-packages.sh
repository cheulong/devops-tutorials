#!/bin/bash

release_file=/etc/os-release
log_file=/var/log/update-packages.log
error_file=/var/log/update-packages-error.log

check_exit_status() {
    if [ $? -ne 0 ]; then
        echo "update-packages failed, please check $error_file file"
        exit 1
    fi
}

if grep -q "Arch" $release_file; then
    echo "Arch Linux"
    pacman -Syu -y >> $log_file 2>> $error_file
    check_exit_status
elif grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file; then
    echo "Ubuntu or Debian"
    apt update -y >> $log_file 2>> $error_file
    check_exit_status

    apt dist-upgrade -y >> $log_file 2>> $error_file
    check_exit_status
elif grep -q "CentOS" $release_file; then
    echo "CentOS"
    yum update -y >> $log_file 2>> $error_file
    check_exit_status
else
    echo "Unsupported OS"
fi
