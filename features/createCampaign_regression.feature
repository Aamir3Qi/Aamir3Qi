Feature: This feature file tests all the scenarios from createCampaign_regression tab on fatfreecrm-with-contacts.xlsx

  Background:
    * I read the data from the "fatfreecrm-with-contacts.xlsx" and "createCampaign_regression" tab
 
 @#1
 Scenario:name:64 char max:: campaigns.json,
    * execute "s_001"

 @#2
 Scenario:name:invalid, 65 char more than max:: campaigns.json,
    * execute "s_002"

 @#3
 Scenario:name:with space:: campaigns.json,
    * execute "s_003"

 @#4
 Scenario:name:array:: campaigns.json,
    * execute "s_004"

 @#5
 Scenario:name:invalid type, empty string:: campaigns.json,
    * execute "s_005"

 @#6
 Scenario:name:invalid type, empty array:: campaigns.json,
    * execute "s_006"
