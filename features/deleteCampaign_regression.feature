Feature: This feature file tests all the scenarios from deleteCampaign_regression tab on fatfreecrm-with-contacts.xlsx

  Background:
    * I read the data from the "fatfreecrm-with-contacts.xlsx" and "deleteCampaign_regression" tab
 
 @#1
 Scenario:name:post an campaign:: campaigns.json,
    * execute "s_001"

 @#2
 Scenario::delete an campaign:: campaigns/"ID".json,
    * execute "s_002"

 @#3
 Scenario::invalid, delete an deleted campaign:: campaigns/"ID".json,
    * execute "s_003"

 @#4
 Scenario::failed test, delete an deleted campaign and expect 204:: campaigns/"ID".json,
    * execute "s_004"
