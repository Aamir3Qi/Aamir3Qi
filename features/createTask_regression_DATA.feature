Feature: This feature file tests all the scenarios from createTask_regression_DATA tab on Updated-fatfreecrm.xlsx

  Background:
    * I read the data from the "Updated-fatfreecrm.xlsx" and "createTask_regression_DATA" tab
 
 @#1
 Scenario:name:64 char max:: tasks.json,
    * execute "s_001"

 @#2
 Scenario:name:invalid, 65 char more than max:: tasks.json,
    * execute "s_002"

 @#3
 Scenario:name:with space:: tasks.json,
    * execute "s_003"

 @#4
 Scenario:name:array:: tasks.json,
    * execute "s_004"

 @#5
 Scenario:name:invalid type, empty string:: tasks.json,
    * execute "s_005"

 @#6
 Scenario:name:invalid type, empty array:: tasks.json,
    * execute "s_006"
