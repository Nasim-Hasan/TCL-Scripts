#!/usr/bin/tclsh

set str "BAT-CAT, DOG,ELEPHANT ,LION & MOUSE-ANT , MONKEY , DONKEY"
set modstr [regsub -all { } $str ""]
puts $modstr