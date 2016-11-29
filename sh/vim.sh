#!/bin/bash

if !hash vim 2>/dev/null; then
    echo "Installing Vim"
    apt update
    apt install vim -y
fi
