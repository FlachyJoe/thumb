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

\ \\\\\\\\\ \
\ Interface


variable choice#number
: choice ( [$value $desc]*n n -- $choice)
    dup choice#number !         ( stock une copie de n dans la variable)
    0 do                        ( boucle sur les descriptions )
        i (.) "  : " tac rot $- tac print cr
        i choice#number @ 1- lesser-than? if
            i 1+ roll       ( passe la description suivante en debut de pile )
        then
    loop        ( stack : [svalue]*n )
    " Enter your choice :" print

    begin                       ( boucle sur les touches entrees )
        key
        dup ascii 0 dup choice#number @ + between dup if
            " " print over emit       ( dans la plage autorisee )
        else
            nip                 ( en dehors )
        then
    until

    ( copie la chaine de la valeur en debut de pile)
    ascii 0 -
    pick new$

    ( efface les autres valeurs)
    choice#number @ 0 do
        swap $drop
    loop
;

: thumb-banner ( -- )
    cls
    center
    " ________________________________________________________________________" print
    cr
    " THUMB Ultimate Mac Booter" print
    " ________________________________________________________________________" print
    continuous
;

: main ( -- )
    T_BACKGROUND T_FOREGROUND fb-colors
    thumb-banner

    all-bootable
    thumb-banner
    middle center

    dup 0= if
        ( aucun peripherique bootable)
        ." No bootable device found, switching to OpenFirmware (then type "" shut-down""  to stop)..." cr
        " " -$ boot|of
    else dup 1 = AUTO_BOOT and if
            ( un seul peripherique bootable )
            drop
            $- " Booting " cat print cr
            boot|of
        else
            OF_CHOICE if
                1+ " " -$ swap " Switch to OpenFirmware" -$ swap
            then

            center
              choice
            continuous

            boot|of
        then
    then
;
