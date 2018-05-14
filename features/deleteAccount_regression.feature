Feature: This feature file tests all the scenarios from deleteAccount_regression tab on Updated-fatfreecrm.xlsx

  Background:
    * I read the data from the "Updated-fatfreecrm.xlsx" and "deleteAccount_regression" tab
 
 @#1
 Scenario:name:post an account:: accounts.json,
    * execute "s_001"

 @#2
 Scenario::delete an account:: accounts/"ID".json,
    * execute "s_002"

 @#3
 Scenario::invalid, delete an deleted account:: accounts/"ID".json,
    * execute "s_003"

 @#4
 Scenario::failed test, delete an deleted account and expect 204:: accounts/"ID".json,
    * execute "s_004"
