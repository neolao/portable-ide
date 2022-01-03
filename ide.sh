#!/bin/bash

scriptPath="$( readlink -f "$( dirname "$0" )" )/$( basename "$0" )"
currentDirectory=$(dirname $scriptPath)

export VIMRUNTIME=$currentDirectory/runtime

./nvim.appimage -u $currentDirectory/config/vimrc.vim $@
#./squashfs-root/usr/bin/nvim -u $currentDirectory/config/vimrc.vim $@
