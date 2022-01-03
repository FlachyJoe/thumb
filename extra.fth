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

\ \\\\\\\\\\ \
\ Raccourcis

: 2pick ( Xn+1 Xn...X0 n -- Xn+1 Xn..X0 Xn+1 Xn )
     dup 2+ pick swap 1+ pick
;
: 2roll ( Xn+1 Xn...X0 n -- Xn-1...X0 Xn+1 Xn )
    dup 2+ roll swap 1+ roll
;
: 2-rot ( n1 n2 n3 n4 n5 n6 -- n5 n6 n1 n2 n3 n4 )
    2rot 2rot
;
: mark-roll ( false Un Un-1 ... U0 -- Un-1 ... U0 Un)
    1
    begin
        dup 1+ pick ( ... Ui+1)
        0= if
            dup 1+ roll drop
            1- roll true
        else
            1+ false
        then
    until
;
: mark-2roll ( false Un Un-1 Un-2 ... U0 -- Un-2 ... U0 Un Un-1)
    2
    begin
        dup 1+ pick ( ... Ui+1)
        0= if
            dup 1+ roll drop    \ supprime la marque
            2 - 2roll true      \ ramène devant
        else
            1+ false
        then
    until
;
: (bool) 0= 0= ;
