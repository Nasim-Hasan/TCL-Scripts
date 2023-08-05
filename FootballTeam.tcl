#!/usr/bin/tclsh

tcl;
eval {

#Teams' Detailed Information
proc Team_Information {} {
set mqlCmd "mql print type 'Team_X' select *;"
puts [eval $mqlCmd]

set mqlCmd1 "mql print type 'Team_Y' select *;"
puts [eval $mqlCmd1]
}

#Calling Procedure Team_Information
Team_Information

#Teams' Detailed Statistics
proc Team_Statistics {} {
set mqlCmd "mql print bus 'Team_X' 'Team_X_BO' 1 select attribute.value;"
puts [eval $mqlCmd]

set mqlCmd1 "mql print bus 'Team_Y' 'Team_Y_BO' 1 select attribute.value;"
puts [eval $mqlCmd1]
}

#Calling Procedure Team_Statistics
Team_Statistics

#Most Winning Record
proc Team_Most_Winning_Record {} {
set mqlCmd [mql temp query bus 'Team_X' 'Team_X_BO' 1 select attribute\[Winning_Record\].value dump]
set mqlCmd1 [mql temp query bus 'Team_Y' 'Team_Y_BO' 1 select attribute\[Winning_Record\].value dump]

set team_X_feature [split $mqlCmd ","]
set team_Y_feature [split $mqlCmd1 ","]

set team_X_Win [lindex $team_X_feature 3]
set team_Y_Win [lindex $team_Y_feature 3]

if {$team_X_Win > $team_Y_Win} {

puts "Team_X has most winning record"

} else {

puts "Team_Y has most winning record"

}

}

#Calling Procedure Team_Most_Winning_Record
Team_Most_Winning_Record

#Max Goal Scorer
proc Max_Goal_Scorer {} {
set mqlCmd [mql temp query bus 'Team_X' 'Team_X_BO' 1 select attribute\[Max_Goal_Scorer\].value dump]
set mqlCmd1 [mql temp query bus 'Team_Y' 'Team_Y_BO' 1 select attribute\[Max_Goal_Scorer\].value dump]

set team_X_max_goal_scorer [split $mqlCmd ","]
set team_Y_max_goal_scorer [split $mqlCmd1 ","]

set team_X_max_goal_scorer_value [lindex $team_X_max_goal_scorer 3]
set team_Y_max_goal_scorer_value [lindex $team_Y_max_goal_scorer 3]

set team_X_max_goal_scorer_value [split $team_X_max_goal_scorer_value ":"]
set team_Y_max_goal_scorer_value [split $team_Y_max_goal_scorer_value ":"]

set team_X_max_goal_scorer_name [lindex $team_X_max_goal_scorer_value 0]
set team_Y_max_goal_scorer_name [lindex $team_Y_max_goal_scorer_value 0]

set team_X_num_max_goal_scored [lindex $team_X_max_goal_scorer_value 1] 
set team_Y_num_max_goal_scored [lindex $team_Y_max_goal_scorer_value 1]

if {$team_X_num_max_goal_scored > $team_Y_num_max_goal_scored} {

puts "Highest Goal Scorer:$team_X_max_goal_scorer_name"

} else {

puts "Highest Goal Scorer:$team_Y_max_goal_scorer_name"

}

}

#Calling Procedure Max_Goal_Scorer
Max_Goal_Scorer

}