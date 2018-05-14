Feature: This feature file tests all the scenarios from createTask_regression tab on fatfreecrm.xlsx

  Background:
    * I read the data from the "fatfreecrm.xlsx" and "createTask_regression" tab
 
 @#1
 Scenario:name:Verify field accept 64 char max:: tasks.json,
    * execute "s_001"

 @#2
 Scenario:name:Verify field should not accept 65 char:: tasks.json,
    * execute "s_002"

 @#3
 Scenario:name:Verify with space:: tasks.json,
    * execute "s_003"

 @#4
 Scenario:name:Verify with array:: tasks.json,
    * execute "s_004"

 @#5
 Scenario:name:invalid type, empty string:: tasks.json,
    * execute "s_005"

 @#6
 Scenario:name:invalid type, empty array:: tasks.json,
    * execute "s_006"

 @#8
 Scenario:Assigned To:Select value in assigned to:: tasks.json,
    * execute "s_008"

 @#9
 Scenario:Category:Select follow-up:: tasks.json,
    * execute "s_009"

 @#10
 Scenario:Category:Select Trip:: tasks.json,
    * execute "s_010"

 @#11
 Scenario:name:Create task with different user:: tasks.json,
    * execute "s_011"

 @#12
 Scenario:name:Use Previously generated Name and Category to create task:: tasks.json,
    * execute "s_012"

 @#13
 Scenario:name:Create task with mandatory field BLANK:: tasks.json,
    * execute "s_013"

 @#14
 Scenario:name:Test with Uppercase:: tasks.json,
    * execute "s_014"
