#!/bin/bash

release_file=/etc/os-release

if grep -q "Arch" $release_file; then
    echo "Arch Linux"
    pacman -Syu
elif grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file; then
    echo "Ubuntu or Debian"
    apt update && apt dist-upgrade -y
elif grep -q "CentOS" $release_file; then
    echo "CentOS"
    yum update -y
else
    echo "Unsupported OS"
fi
