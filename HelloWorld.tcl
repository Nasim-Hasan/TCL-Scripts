#!/usr/bin/tclsh

puts "Hello World!" 

set a 56

puts $a

set b $a+10

puts $b

set b {[expr $a+10]}

puts $b