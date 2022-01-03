#! /bin/bash

# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#                       THUMB Ultimate Mac Booter
#                               version 0.2
# Copyright (c) 2010 Florian Foinant-Willig Tous droits reserves
#
#     This program is free software; you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation; either version 2 of the License, or
#     (at your option) any later version.
#
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program; if not, write to the Free Software
#     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

clear
echo ------------ THUMB installation ------------

# Check privileges
if [[ `whoami` != "root" ]]
then
    echo "The THUMB installation requires the root privileges
so run \"sudo $0\"."
    exit
fi

# get install path
DEF_INSTALL_PATH="/thumb"
echo -n Install Path ? [$DEF_INSTALL_PATH]
read INSTALL_PATH
if [[ $INSTALL_PATH == "" ]]
then
    INSTALL_PATH=$DEF_INSTALL_PATH
fi

# get install OF device
DEF_OF_DEV="hd:3"
echo -n Coresponding Open-Firmware device ? [$DEF_OF_DEV]
read INSTALL_OF_DEV
if [[ $INSTALL_OF_DEV == "" ]]
then
    INSTALL_OF_DEV=$DEF_OF_DEV
fi

# convert slash to back-slash
INSTALL_OF_PATH=`tr "/" "\\\" <<<$INSTALL_PATH`

# current boot-device
CURRENT_BOOT_DEV=`nvram boot-device | egrep -o "([[:alnum:]]+\/*-*)+[[:alnum:]@\/]+:[[:digit:]]*"`

function do-nvram () {
    # nvram the booter
    echo "The current boot device is $CURRENT_BOOT_DEV
    Are you sure you want to replace it by THUMB ?"
    read -n 1 -p "[y,N]" GO_NVRAM
    if [[ $GO_NVRAM != "y" ]]
    then
        echo "Files are at $INSTALL_PATH but the NVRAM boot device is $CURRENT_BOOT_DEV"
        echo "You can try THUMB by typing \"boot $INSTALL_OF_DEV,$INSTALL_OF_PATH\\thumb.b\" on the Open-Firmware console."
    else
        echo "setting the NVRAM variables..."
        nvram boot-device=$INSTALL_OF_DEV,$INSTALL_OF_PATH\\thumb.b
    fi
}

function do-copy (){
    # Last confirm before copy
    echo "
    Do you realy want to copy the THUMB's files ?"
    read -n 1 -p "[Y,n]" GO_COPY

    if [[ $GO_COPY == "n" ]]
    then
        echo "User abort !"
        exit
    else
        # copy FORTH files
        echo "copying files ..."
        mkdir -p $INSTALL_PATH
        cp -r ./*.fth "$INSTALL_PATH//"

        # create "thumb.b"
        cp thumb.b.head thumb.b.tmp
        echo -n "$INSTALL_OF_DEV,$INSTALL_OF_PATH\\" >>thumb.b.tmp   #the include path
        cat thumb.b.tmp thumb.b.tail >"$INSTALL_PATH//thumb.b"
        rm thumb.b.tmp

        do-nvram

        echo "Install is OK."
    fi
}

if [[ $1 == "nvram" ]]
then
    do-nvram
else
    do-copy
fi
