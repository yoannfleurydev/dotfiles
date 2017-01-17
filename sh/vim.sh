#!/bin/bash

hash vim 2> /dev/null
if [ $? -ne 0 ]; then
    echo "Installing Vim"
    apt update
    apt install vim -y
fi
