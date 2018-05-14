Feature: This feature file tests all the scenarios from createAccount_regression tab on Updated-fatfreecrm.xlsx

  Background:
    * I read the data from the "Updated-fatfreecrm.xlsx" and "createAccount_regression" tab
 
 @#1
 Scenario:name:64 char max:: accounts.json,
    * execute "s_001"

 @#2
 Scenario:name:invalid, 65 char more than max:: accounts.json,
    * execute "s_002"

 @#3
 Scenario:name:with space:: accounts.json,
    * execute "s_003"

 @#4
 Scenario:name:array:: accounts.json,
    * execute "s_004"

 @#5
 Scenario:name:invalid type, empty string:: accounts.json,
    * execute "s_005"

 @#6
 Scenario:name:invalid type, empty array:: accounts.json,
    * execute "s_006"
