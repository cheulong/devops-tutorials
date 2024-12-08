#!/usr/bin/bash

read -p "Are you John?: " ANSWER

case "$ANSWER" in
    [yy] | [yY][eE][sS])
        echo "Hello JOHN"
        ;;
    [nN] | [nN][oO])
        echo "Hello JANE"
        ;;
    *)
        echo "Hello $ANSWER"
        ;;
esac