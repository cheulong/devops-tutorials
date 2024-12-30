#!/bin/bash

package_name=$1

if command -v $package_name; then
    echo "$package_name is exist, running..."
    sleep 2
else
    echo "$package_name is not exist, downloading..."
    apt update && apt install -y $package_name
    sleep 2
fi

$package_name