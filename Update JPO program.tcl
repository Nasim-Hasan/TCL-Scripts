tcl;
set fp [open "Program.txt" r];
set code_data [read $fp];
set program "ODI.java"
set execute [ catch { mql modify program $program code $code_data } errorMessage ]
if { $execute == 0 } {
	puts "Successful"
} else {
	puts errorMessage is $errorMessage
}
close $fp;
exit;
