#!/usr/bin/tclsh
tcl;
eval {
	proc helloWorld {} {
	   puts "Hello, World!"
	}

	#Calling Procedure with No Argument
	helloWorld 

	proc add {a b} {
	   return [expr $a+$b]
	}

	#Calling Procedure with Multiple Arguments
	puts "Multiple Arguments:[add 10 30]"

	proc avg {numbers} {
	   set sum 0
	   foreach number $numbers {
		  set sum  [expr $sum + $number]
	   }
	   set average [expr $sum/[llength $numbers]]
	   return $average
	}
	#Calling Procedure with Variable Arguments (An Array)
	puts "Average:[avg {70 80 50 60}]"
	puts "Average:[avg {70 80 50}]"

	#Calling Procedure with Default Argument (Value)
	proc add {a {b 100} } {
	   return [expr $a+$b]
	}
	puts "Default Argument Result:[add 10 30]"
	puts "Default Argument Result:[add 10]"

	proc factorial {number} {
	   if {$number <= 1} {
		  return 1
	   } 
	   return [expr $number * [factorial [expr $number - 1]]]

	}
	#Calling Procedure for Determining the Factorial (Recursive Calling)
	puts "Factorial Result:[factorial 3]"
	puts "Factorial Result:[factorial 5]"
}

