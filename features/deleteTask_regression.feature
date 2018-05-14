Feature: This feature file tests all the scenarios from deleteTask_regression tab on fatfreecrm.xlsx

  Background:
    * I read the data from the "fatfreecrm.xlsx" and "deleteTask_regression" tab
 
 @#1
 Scenario:name:post an task:: tasks.json,
    * execute "s_001"

 @#2
 Scenario::delete an task:: tasks/"ID".json,
    * execute "s_002"

 @#3
 Scenario::invalid, delete an deleted task:: tasks/"ID".json,
    * execute "s_003"

 @#4
 Scenario::failed test, delete an deleted task and expect 204:: tasks/"ID".json,
    * execute "s_004"

 @#5
 Scenario:id:Get task:: tasks.json,
    * execute "s_005"

 @#6
 Scenario:id:delete existing task:: tasks/"TASK-ID".json,
    * execute "s_006"

 @#7
 Scenario:name:Stress Test: Create 10 task:: tasks.json,
    * execute "s_007"

 @#8
 Scenario:name:Stress Test: Create 10 task:: tasks.json,
    * execute "s_008"

 @#9
 Scenario:name:Stress Test: Create 10 task:: tasks.json,
    * execute "s_009"

 @#10
 Scenario:name:Stress Test: Create 10 task:: tasks.json,
    * execute "s_010"

 @#11
 Scenario:name:Stress Test: Create 10 task:: tasks.json,
    * execute "s_011"

 @#12
 Scenario:name:Stress Test: Create 10 task:: tasks.json,
    * execute "s_012"

 @#13
 Scenario:name:Stress Test: Create 10 task:: tasks.json,
    * execute "s_013"

 @#14
 Scenario:name:Stress Test: Create 10 task:: tasks.json,
    * execute "s_014"

 @#15
 Scenario:name:Stress Test: Create 10 task:: tasks.json,
    * execute "s_015"

 @#16
 Scenario:name:Stress Test: Create 10 task:: tasks.json,
    * execute "s_016"
