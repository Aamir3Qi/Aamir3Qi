Feature: This feature file tests all the scenarios from deleteTask_regression_new tab on Updated-fatfreecrm.xlsx

  Background:
    * I read the data from the "Updated-fatfreecrm.xlsx" and "deleteTask_regression_new" tab
 
 @#1
 Scenario:name:post an task:: tasks.json,
    * execute "s_001"

 @#8
 Scenario:name:get posted Task:: tasks/"ID".json,
    * execute "s_008"

 @#9
 Scenario:name:get posted Task:: tasks/"ID".json,
    * execute "s_009"

 @#10
 Scenario:name:get posted Task:: tasks/"ID".json,
    * execute "s_010"

 @#11
 Scenario::update all values, insert the date captured from headers into the last name:: tasks/"ID".json,
    * execute "s_011"

 @#2
 Scenario::delete an task:: tasks/"ID".json,
    * execute "s_002"

 @#3
 Scenario::invalid, delete an deleted task:: tasks/"ID".json,
    * execute "s_003"

 @#4
 Scenario::failed test, delete an deleted task and expect 204:: tasks/"ID".json,
    * execute "s_004"

 @#12
 Scenario::delete task with 0 Id:: tasks/0.json,
    * execute "s_012"

 @#13
 Scenario::delete task with negetive number:: tasks/-1.json,
    * execute "S_013"
