#!/usr/bin/tclsh

tcl;
eval {

proc Update_Attribute {} {

#Reading from a Sample.txt File
set fp [open "Sample.txt" r]
set seq 0
set typeList {"Country_X" "Country_Y"}
set businessObjectList {"Country_X_BO" "Country_Y_BO"}
set populationList {}

while { [gets $fp data] >= 0 } {
   
   if { $seq!=0 } {
       puts $data
	   set row [split $data "\t"]
	   #Removing Leading & Trailing Spaces
	   set modrow [string map {" " ""} [lindex $row 3]] 
	   #puts $modrow
	   lappend populationList $modrow  
   }
   
set seq [incr seq]

}

#Traversing through the List
set seq 0
foreach tmp $populationList {
set typeListValue [lindex $typeList $seq]
set businessObjectValue [lindex $businessObjectList $seq]
set populationListValue [lindex $populationList $seq]

#MQL Commands
set mqlCmd [mql modify bus '$typeListValue' '$businessObjectValue' 1 'Population' '$populationListValue']
eval $mqlCmd

set mqlCmd1 "mql print bus '$typeListValue' '$businessObjectValue' 1 select attribute.value;"
puts [eval $mqlCmd1]

set seq [incr seq]
}

close $fp

}

#Calling the Method Update_Attribute
Update_Attribute
}

