#############################################################
# @Name: add new attribute Approval status
# @Version: 1.0
# @Created By: BJIT Ltd.
# @Release: 5.6
#############################################################

tcl;
eval {
	set listAttributes [split [ mql list attribute ] "\n" ]
	set fp_LogFile [ open "3_18727_create_attribute_approval_status.log" "a"]
	set newAttribute "Approval status"
	set authorDate [clock format [clock seconds] -format "20%y-%d-%m"]

	proc writeLog { fp_LogFile message } {
		set currenttime [clock format [clock seconds] -format "%m/%d/20%y %A %I:%M:%S %p"]
		set outputmessage [ append "Time : " $currenttime " : " $message]
		puts $fp_LogFile $outputmessage
		flush $fp_LogFile
	}

	if { [lsearch $listAttributes $newAttribute] == -1} {
		puts "Attribute $newAttribute is going to create"
		writeLog $fp_LogFile "Attribute $newAttribute is going to create"
		set execution [catch {mql add attribute $newAttribute property Version value "1.0" property Author value "BJIT Ltd" property AuthorDate value $authorDate description "Attribute for showing localization request approval status" type string default "Approved" range = "Requested" range = "In work" range = "Approved" range = "Rejected" range = "Comment" !hidden } errorMessage ]
		if { $execution ==0 } {
			puts "New attribute created successfully"
			writeLog $fp_LogFile "Attribute $newAttribute created sucessfully"

		} else {
			writeLog $fp_LogFile $errorMessage
			puts $errorMessage
		}
	} else {
		puts "Attribute $newAttribute still exists"
		writeLog $fp_LogFile "Attribute $newAttribute still exists"
	}
	
	close $fp_LogFile;

}