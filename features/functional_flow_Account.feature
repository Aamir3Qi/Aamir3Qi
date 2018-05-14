Feature: This feature file tests all the scenarios from functional_flow_Account tab on Updated-fatfreecrm.xlsx

  Background:
    * I read the data from the "Updated-fatfreecrm.xlsx" and "functional_flow_Account" tab
 
 @#1_
 Scenario::Create/update/delete and vefiry with getUser:: accounts.json,
    * execute "s_001"

 @#1_
 Scenario::verify created user, capture date from headers:: accounts/"ID".json,
    * execute "s_002"

 @#1_
 Scenario::updte all values, insert the date captured from headers into the last name:: accounts/"ID".json,
    * execute "s_003"

 @#1_
 Scenario::verify values updated:: accounts/"ID".json,
    * execute "s_004"

 @#1_
 Scenario::delete user:: accounts/"ID".json,
    * execute "s_005"

 @#1_
 Scenario::verify deleted user:: accounts/"ID".json,
    * execute "s_006"
