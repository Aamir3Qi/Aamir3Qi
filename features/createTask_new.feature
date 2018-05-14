Feature: This feature file tests all the scenarios from createTask_new tab on Updated-fatfreecrm.xlsx

  Background:
    * I read the data from the "Updated-fatfreecrm.xlsx" and "createTask_new" tab
 
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

 @#7
 Scenario:name:64 char max:: tasks.json,
    * execute "s_007"

 @#8
 Scenario:name:64 char max:: tasks.json,
    * execute "s_008"

 @#9
 Scenario:name:Capturing category:: tasks.json,
    * execute "s_009"

 @#10
 Scenario:name:Capturing category:: tasks.json,
    * execute "s_010"

 @#12
 Scenario:name:Capturing priority:: tasks.json,
    * execute "s_012"

 @#11
 Scenario:name:64 char max:: tasks.json,
    * execute "s_011"

 @#13
 Scenario:name:Creating task by using priority:: tasks.json,
    * execute "s_013"
