# THUMB Ultimate Mac Booter

 1. LICENSE
        Copyright (c) 2010 Florian Foinant-Willig Tous droits reserves

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

 2. WHAT IS IT
        The THUMB Ultimate Mac Booter is a startup script for Open-Firmware.
    It automaticaly detect OSX and *NIX installation on internal and external (USB and Firewire) drives and let you choice the OS to boot.

 3. HOW TO USE / INSTALL
        First, unzip the tar.gz file in a working directory.
    "cd" to it and run "./nstall.sh". You must know the disk partitionning of your system to give the good values.
    Typicaly you will copy THUMB's files to a well named root sub-directory (i.e. /thumb/).
    The Open-Firmware device name is made whith the alias of the drive (hd for the first, cd for the second) and the index of the partition (3 for a basic OSX install)
        When the install process ask you for replace the nvram boot-device, press N or enter.

        Then, you must try to run THUMB from Open-Firmware command line.
    Restart your computer whith Alt+Command+O+F keys down, release them whem the prompt appear.
    Type "boot hd:3,\thumb\thumb.b" (Replace with your own OF device and install path) and press Enter.
    You must see the THUMB banner and a loading spin, then the OS choice menu appear or (if it's alone) your OS start.
    If not, send me all the messages you can get, else you can run your OS to set the nvram boot-device.

        To set the nvram boot device, cd to the unzip directory and run "./install.sh nvram",
    you have to give the same information as for the copy process and press Y when asked.

        THUMB wil now scan your drives at each start, enjoy !

 4. CONFIGURATION OPTIONS
        The options can be set in the (install-path)/config.fth file.
    Available options are:
    - DEBUG             [FALSE, true]       Print informations when thumb load.
    - OF_CHOICE         [FALSE, true]       You can switch to the Open-Firmware prompt from the OS choice menu.
    - AUTO_BOOT         [TRUE, false]       If only one OS is found load it without menu.
    - PRINT_ONLY        [FALSE, true]       After the OS is choose give the boot command and switch to the Open-Firmware prompt.
    - PARTS_TO_TEST     [4 ; number]        Number of partitions to test in each drives, if any installation is not found try to increase.

    - T_BACKGROUND      [SILVER ; color]    Background color of the THUMB screen.
    - T_FOREGROUND      [GRAY ; color]      Foreground color of the THUMB screen.

    - INTERNAL_TEST     [TRUE, false]       Search installation on internal drives
    - USB_TEST          [TRUE, false]       Search installation on USB drives
    - FW_TEST           [TRUE, false]       Search installation on FireWire drives

    Available colors are :
        BLACK, NAVY, GREEN, TAEL, MARRON, PURPLE, OLIVE, SILVER, GRAY, BLUE, LIME, AQUA, RED, FUSHIA, YELLOW, WHITE and any color index from 0 to 255.

 5. KNOWN BUGS
        To be tested.
    Please report bugs to florian(dot)ffoinant(at)olympe-network(dot)com

 6. TODO
        USB hubs have to be supported.
    Many tests must be done as :
    - Drive acces in a FireWire string
    - Other arch testing (currently it's only tested in an Apple Cube G4)

 A. WHERE CAN I FIND MORE INFORMATION ABOUT OPEN-FIRMWARE SCRIPTING
        About Open-Firmware/ :
    - http://www.openfirmware.org/1275/mejohnson/
    - http://www.firmworks.com/QuickRef.html
    - http://www.dialectronics.com/Words/OF_Part_I.shtml

        About FCode :
    - http://docs.sun.com/app/docs/doc/802-5895/6i9kef60m?l=en&a=view&q=fcode

        About Forth :
    - http://www.complang.tuwien.ac.at/forth/gforth/Docs-html/index.html#Top

    The "words" command on the Open-Firmware console give the list of all available commands. Use the "see" command follow by a word to know the content of this function.
