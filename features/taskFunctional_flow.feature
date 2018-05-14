Feature: This feature file tests all the scenarios from taskFunctional_flow tab on fatfreecrm.xlsx

  Background:
    * I read the data from the "fatfreecrm.xlsx" and "taskFunctional_flow" tab
 
 @#1
 Scenario::Create and vefiry with getTask:: tasks.json,
    * execute "s_001"

 @#2
 Scenario::verify created task, capture date from headers:: tasks/"ID".json,
    * execute "s_002"

 @#3
 Scenario::updte all values, insert the date captured from headers into the name:: tasks/"ID".json,
    * execute "s_003"

 @#4
 Scenario::verify values updated:: tasks/"ID".json,
    * execute "s_004"

 @#5
 Scenario::delete task:: tasks/"ID".json,
    * execute "s_005"

 @#6
 Scenario::verify deleted task:: tasks/"ID".json,
    * execute "s_006"

 @#7
 Scenario::Create and vefiry with getTask:: tasks.json,
    * execute "s_007"

 @#8
 Scenario::Test without authorization:: tasks/"ID".json,
    * execute "s_008"

 @#9
 Scenario::Update task with data which is not available in DB:: tasks/"ID".json,
    * execute "s_009"

 @#10
 Scenario::update with null:: tasks/"ID".json,
    * execute "s_010"

 @#11
 Scenario::Test with assigned to and completed by same person:: tasks/"ID".json,
    * execute "s_011"
