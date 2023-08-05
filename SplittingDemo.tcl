#!/usr/bin/tclsh

set s "a=1\nb=2\nc=3\nd=4"
puts "Before Splitting:\n$s"
set s [split $s "\n"]
puts "After Splitting:$s"
foreach e $s {
    set e [split $e "="]
    lappend l1 [lindex $e 0]
    lappend l2 [lindex $e 1]
}
puts "List-1:$l1\n"
puts "List-2:$l2"
