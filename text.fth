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

\ \\\\\ \
\ Texte
: tac ( s1 s2 -- s12) 2swap cat ;
: (z.) ( u -- " u") \ zero is nothing else give str
    ?dup 0= if
        " "
    else
        (.)
    then
;

: $- ( pstr -- adr len )
    count
;
: -$ ( adr len -- pstr )
    dup 1+ alloc-mem pack
;
: $dup ( pstr -- pstr pstr1 )
    dup $- -$
;
: $drop ( pstr -- )
    dup count 1+ nip free-mem
;
: new$ ( pstr -- npstr )
    $dup nip
;
