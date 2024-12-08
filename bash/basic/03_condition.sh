#!/usr/bin/bash

read -p "Enter your name: " NAME

# if [ "$NAME" == "John" ]; then
#     echo "Hello JONH"
# else
#     echo "Hello $NAME"
# fi

if [ "$NAME" == "John" ]; then
    echo "Hello JONH"
elif [ "$NAME" == "Jane" ]; then
    echo "Hello JANE"
else
    echo "Hello $NAME"
fi

