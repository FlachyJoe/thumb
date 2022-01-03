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

\ \\\\\\\\\\\\\\ \
\ Initialisation

base @ constant old-base
decimal

" screen" output
dev screen
" "(0000000000aa00aa0000aaaaaa0000aa00aaaa5500aaaaaa)" drop 0  7 set-colors
" "(5555555555ff55ff5555ffffff5555ff55ffffff55ffffff)" drop 8 15 set-colors
device-end
0 constant BLACK 1 constant NAVY 2 constant GREEN 3 constant TAEL 4 constant MARRON 5 constant PURPLE 6 constant OLIVE 7 constant SILVER
8 constant GRAY 9 constant BLUE 10 constant LIME 11 constant AQUA 12 constant RED 13 constant FUSHIA 14 constant YELLOW 15 constant WHITE

: ending ( -- )
    old-base base !
    load-base release-load-area
;
