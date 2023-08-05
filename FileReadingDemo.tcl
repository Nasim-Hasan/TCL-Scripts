#!/usr/bin/tclsh

#Reading from a Sample.txt File
set fp [open "Sample.txt" r]

while { [gets $fp data] >= 0 } {
   puts $data
}
close $fp

#Reading from a Sample.csv File
package require csv
package require struct::queue

struct::queue q
set fd [open "Sample.csv" r]
csv::read2queue $fd q
#set seq 0

foreach row [q get [q size]] {
#puts "Row [incr seq]: $row"
puts $row
}

close $fd

