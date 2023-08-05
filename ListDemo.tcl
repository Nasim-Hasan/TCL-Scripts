#!/usr/bin/tclsh

#Initializing a List
set colorList {"red" "green" "blue"}
puts $colorList

#Appending an Item in the List
lappend colorList "orange"
puts $colorList

#Length of a List
puts [llength $colorList]

#Selecting Item from a Specific Index
puts [lindex $colorList 0]

#Inserting Item in a Specific Index
set colorList [linsert $colorList 2 "purple"]
puts $colorList

#Replacing Items in a List
set colorList [lreplace $colorList 0 2 "purple" "red"]
puts $colorList

#Transforming List into Variables
lassign $colorList var1 var2 var3
puts "$var1\n$var2\n$var3"

#Sorting a List
set sortedList [lsort $colorList]
puts $sortedList