Feature: This feature file tests all the scenarios from getTaskByTaskID_DATA tab on fatfreecrm.xlsx

  Background:
    * I read the data from the "fatfreecrm.xlsx" and "getTaskByTaskID_DATA" tab
 
 @1
 Scenario::post a task:: tasks.json,
    * execute "s_001"

 @1
 Scenario::get posted task:: tasks/"ID".json,
    * execute "s_002"

 @3
 Scenario::invalid, get deleted task:: tasks/"ID".json,
    * execute "s_003"

 @4
 Scenario::invalid, use a string as ID:: tasks/a.json,
    * execute "s_004"

 @5
 Scenario::invalid, use null as ID:: tasks/.json,
    * execute "s_005"

 @6
 Scenario::invalid, use negative number as ID:: tasks/-1.json,
    * execute "s_006"

 @7
 Scenario::failed test, use negative number as ID but expect to receive 200:: tasks/-1.json,
    * execute "s_007"

 @8
 Scenario::Verify multiple responses:: tasks.json,
    * execute "s_008"
