\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \
\                       THUMB Ultimate Mac Booter
\                               version 0.2
\ Copyright (c) 2010 Florian Foinant-Willig Tous droits reserves
\
\     This program is free software; you can redistribute it and/or modify
\     it under the terms of the GNU General Public License as published by
\     the Free Software Foundation; either version 2 of the License, or
\     (at your option) any later version.
\
\     This program is distributed in the hope that it will be useful,
\     but WITHOUT ANY WARRANTY; without even the implied warranty of
\     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
\     GNU General Public License for more details.
\
\     You should have received a copy of the GNU General Public License
\     along with this program; if not, write to the Free Software
\     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
\
\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \

\ \\\ \
\ USB
: +disk ( $adr -- $dev)
    $- " /disk" tac -$
;
: +hub ( $adr -- $dev)
    $- " /hub" tac -$
;
: usb-no ( n -- $adr)
    (.) " usb" cat -$
;
: detectusb ( $dev -- f)
    " Searching drive at " log $- 2dup log
    ['] open-dev catch drop dup if
        "  Drive found." llog
        true
    else
        "  No Drive." llog
        false
    then
    swap close-dev
;

\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \
\ Recherche des partitions bootables
: file-exists ( $file -- $file true | false)
    dup $- " [file-exists] Checking " log llog

    thumb-spin

    hidden
    dup $- ['] open-dev catch drop dup 0= if
        2drop
        false
    else
        close-dev
        true
    then
    visible
;
: part-ok ( $dev -- flag)
    $- ['] open-dev catch drop dup 0= if
       \ Device doesn't exists  ( 0)
    else
        dup " open" rot ['] $call-method catch drop
        swap close-dev
    then
;
: is-linux-bootable ( $drive -- $boot true | false)
    $dup $- " ,\yaboot" tac -$
    file-exists ?dup 0= if
        $dup $- " ,\boot\yaboot" tac -$
        file-exists ?dup 0= if
            $- " ,\install\yaboot" tac -$
            file-exists
        then
    then
;
: is-osx-bootable ( $drive -- $boot true | false)
    $- " ,\\:tbxi" tac -$
    file-exists
;
variable find-boot#num
: find-boot ( $device root-search? -- [$boot $desc]*n n | false)
    0 find-boot#num !
    ( root-search? ) if 0 else 1 then
    PARTS_TO_TEST swap do
        $dup
        $- i (z.) " :" cat tac -$
        $dup part-ok if
            $dup is-linux-bootable if
                swap
                $- " Linux on " cat -$
                rot
                1 find-boot#num +!
            else
                $dup is-osx-bootable if
                    swap
                    $- " OS X on " cat -$
                    rot
                    1 find-boot#num +!
                else
                    $drop
                then
            then
        else
            $drop
        then
    loop
    $drop
    find-boot#num @
;

defer hub-find-boot
: _hub-find-boot ( n0 $dev -- [$boot $desc]*n n+n0 $dev | n0 $dev )
    $dup +hub detectusb if
        false swap $dup +hub hub-find-boot mark-roll
    then
    false swap $dup +disk true find-boot mark-roll
;
['] _hub-find-boot to hub-find-boot

: usb-find-boot ( no -- [$boot $desc]*n n | false)
    dup usb-no detectusb if
        usb-no +disk true find-boot
    else
        drop false
    then
;

variable all-bootable#num
: all-bootable ( -- [$boot $desc]*n n | false)
    0 all-bootable#num !
    INTERNAL_TEST if
        " hd" -$ false find-boot all-bootable#num +!
        " cd" -$ false find-boot all-bootable#num +!
    then
    USB_TEST if
        2 0 do
            i usb-find-boot all-bootable#num +!
        loop
    then
    FW_TEST if
        " fw/node/sbp-2/disk" -$ false find-boot all-bootable#num +!
        " fwx/node/sbp-2/disk" -$ false find-boot all-bootable#num +!
    then
    all-bootable#num @
;

: boot|of ( $boot -- )
    ( Boot ou passe sur l'OpenFirmware )
    ending
    $-
    ?dup 0= if
        ." Switch to OF" 2000 ms
        cls clear quit
    else
        DEBUG PRINT_ONLY or if
            ." Boot string : " print cr
        else
            $boot
        then
    then
;
