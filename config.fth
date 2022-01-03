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

\    _____________________________________________________________________________
\    |                                                                           |
\   |                              CONFIGURATION                                  |
\  |                               -------------                                   |

false   constant DEBUG            \ affiche des informations d'etat
true    constant OF_CHOICE        \ propose l'OpenFirmware dans le menu
false   constant AUTO_BOOT        \ N'affiche pas de menu pour 1 peripherique de demarrage
false   constant PRINT_ONLY       \ Ne fait qu'afficher le parametre de boot choisi
4       constant PARTS_TO_TEST    \ Nombre de partitions ˆ tester sur chacun des disques

SILVER  constant T_BACKGROUND     \
BLACK   constant T_FOREGROUND     \

\ Interfaces to test for bootable
true    constant USB_TEST
true    constant FW_TEST
true    constant INTERNAL_TEST

\  |                                                                               |
\   |                                                                             |
\    |___________________________________________________________________________|
