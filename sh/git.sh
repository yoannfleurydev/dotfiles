#!/bin/bash

if !hash git 2>/dev/null; then
    echo "Installing Git"
    apt update
    apt install gim -y
fi
