Feature: This feature file tests all the scenarios from deleteTask_regression_DATA1 tab on Updated-fatfreecrm.xlsx

  Background:
    * I read the data from the "Updated-fatfreecrm.xlsx" and "deleteTask_regression_DATA1" tab
 
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
