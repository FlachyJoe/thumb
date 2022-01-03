<CHRP-BOOT>
<COMPATIBLE>
MacRISC MacRISC3 MacRISC4
</COMPATIBLE>
<DESCRIPTION>
THUMB Ultimate Mac Booter
</DESCRIPTION>
<BOOT-SCRIPT>
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


: INCLUDE_PATH "hd:3,\thumb" ;     \ End of the INCLUDE_PATH definition

\ \\\\ \
\ SGML : translation of unauthorized chars
: not-equal? &lt;&gt; ;
: greater-than? &gt; ;
: lesser-than? &lt; ;
: greater-or-equal? &gt;= ;


\ \\\\\\\\ \
\ Files IO : Basic files and strings function

: read-file ( sfile -- adr len | false )
    2dup ['] open-dev catch drop dup 0= if
        -rot cr ." WARNINGG : [Read-File] Unable to find " type cr
    else
        -rot 2drop
        h# 4000 ['] alloc-mem catch drop dup 0= if
            ."  WARNINGG : [Read-File] Memory allocation failed" cr
        else
            swap 2dup
            h# 4000 swap " read" rot $call-method
            swap
        then
        close-dev
    then
;
: global-include ( sfile -- )
    \ evaluate the content of a Forth file
    2dup read-file ?dup if
        2dup evaluate free-mem 2drop
    else
        cr ." WARNING : [Include] Unable to read " type cr
   then
;
: cat ( s1 s2 -- s21) \ concatenate 2 strings
    2dup
    pad swap move
    dup 3 pick +
    rot drop
    2swap
    3 pick pad +
    swap move
    nip
    dup alloc-mem
    swap 2dup pad
    -rot move
;
: cat2
    " " pad swqp move
    $padcat $padcat
    pad strlen dup alloc-mem swap
    2dup pad -rot move
;

: include ( sfile -- )
    INCLUDE_PATH cat global-include
;


\ \\\\\\\\ \
\ INCLUDES : order carefuly !

" init.fth"     include
" config.fth"   include
" extra.fth"    include
" text.fth"     include
" screen.fth"   include
" boot.fth"     include
" gui.fth"      include

\ \\\\\\\\\\\\\ \
\ Load the prog
main

\ \\\\\\ \
\ Finish
ending

</BOOT-SCRIPT>
<OS-BADGE-ICONS>
1010
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
0000FFFFFFFFFFFFFFFFFFFFFFF00000
0000FFFFFFFFFFFFFFFFFFFFFFF00000
0000000000000000FF00000000000000
0000000000000000FF00000000000000
0000000000000000FF00000000000000
0000000000000000FF00000000000000
0000000000000000FF00000000000000
0000000000000000FF00000000000000
0000000000000000FF00000000000000
0000000000000000FF00000000000000
0000000000000000FF00000000000000
0000000000000000FF00000000000000
0000000000000000FF00000000000000
0000F00000000000FF00000000F00000
0000F00000000000FF00000000F00000
0000F00000000000FF00000000F00000
0000F00000000000FF00000000F00000
0000F00000000000FF00000000F00000
0000F00000000000FF00000000F00000
0000F00000000000FF00000000F00000
0000F00000000000FF00000000F00000
0000F00000000000FF00000000F00000
0000F00000000000FF00000000F00000
0000F00000000000FF00000000F00000
0000FFFFFFFFFFFFFFFFFFFFFFF00000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
</OS-BADGE-ICONS>
</CHRP-BOOT>
