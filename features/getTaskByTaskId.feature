Feature: This feature file tests all the scenarios from getTaskByTaskId tab on Updated-fatfreecrm.xlsx

  Background:
    * I read the data from the "Updated-fatfreecrm.xlsx" and "getTaskByTaskId" tab
 
 @#1
 Scenario:name:post a Task:: tasks.json,
    * execute "s_001"

 @#2
 Scenario:name:get posted Task:: tasks/"ID".json,
    * execute "s_002"

 @#3
 Scenario:name:invalid, get deleted Task:: tasks/"ID".json,
    * execute "s_003"

 @#4
 Scenario:name:invalid, use a string as ID:: tasks/a.json,
    * execute "s_004"

 @#5
 Scenario:name:invalid, use null as ID:: tasks/.json,
    * execute "s_005"

 @#6
 Scenario:name:invalid, use negative number as ID:: tasks/-1.json,
    * execute "s_006"

 @#7
 Scenario:name:failed test, use negative number as ID but expect to receive 200:: tasks/-1.json,
    * execute "s_007"
