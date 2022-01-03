\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \
\                       THUMB Ultimate Mac Booter
\                               version 0.1
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
\ Affichage

: fb-colors ( bg fg -- )
    to foreground-color
    to background-color
;

: hidden ( -- )
    T_BACKGROUND to foreground-color
;
: visible ( -- )
    T_FOREGROUND to foreground-color
;

: set-line  ( line -- ) 0 max  #lines 1- min  to line# ;
: set-column  ( column -- ) 0 max  #columns  1- min  to column# ;
: cls ( -- )
    ( clear the screen)
    h# 0C emit
;


\ \\\\\\\\\\\\ \
\ Mise en page

defer print
['] type to print
: _lined ( s -- )
    type cr
;
: _center ( s -- )
    dup #columns swap - 2 / set-column
    _lined
;
: _left ( s -- )
    0 set-column
    _lined
;
: _right ( s -- )
    dup #columns swap - set-column
    _lined
;
: center ( -- )     ['] _center to print ;
: left ( -- )       ['] _left to print ;
: right ( -- )      ['] _right to print ;
: lined ( -- )      ['] _lined to print ;
: continuous ( -- ) ['] type to print ;
: middle ( -- )
    #lines 2 / set-line
;
: top ( -- )
    0 set-line
;
: $print ( pstr -- )
    dup $- print
    $drop  \ libère la mémoire
;

\ "moulin" d'avancement
variable thumb-spin#v 0 thumb-spin#v !
: thumb-spin ( -- )
    center middle
      " Loading..." print
      thumb-spin#v @ 0= if
        " -" print
      else thumb-spin#v @ 1 = if
                " \" print
            else thumb-spin#v @ 2 = if
                    " |" print
                else
                    " /" print
                    -1 thumb-spin#v !
                then
            then
      then
      1 thumb-spin#v +!
    continuous
;

\ \\\\\\\\\\ \
\ Debug info

: log ( s -- )
    DEBUG if
        type
    else
        2drop
    then
;
: llog ( s -- )
    DEBUG if
        type cr
    else
        2drop
    then
;
: stack ( -- )
    DEBUG if
        ." STACK : "
        .s
    then
;
