Feature: This feature file tests all the scenarios from Smoke_test tab on Updated-fatfreecrm.xlsx

  Background:
    * I read the data from the "Updated-fatfreecrm.xlsx" and "Smoke_test" tab
 
  Scenario:::: accounts.json,
    * execute "createAccount"

  Scenario:::: accounts/"ID".json,
    * execute "getAccountByAccountId"

  Scenario:::: accounts.json,
    * execute "getAccounts"

  Scenario:::: accounts/"ID".json,
    * execute "updateAccount"

  Scenario:::: accounts/"ID".json,
    * execute "deleteAccount"

  Scenario:::: tasks.json,
    * execute "createTask"

  Scenario:::: tasks/"ID".json,
    * execute "getTaskByTaskId"

  Scenario:::: tasks.json,
    * execute "getTasks"

  Scenario:::: tasks/"ID".json,
    * execute "updateTask"

  Scenario:::: tasks/"ID".json,
    * execute "deleteTask"

  Scenario:::: campaigns.json,
    * execute "createCampaign"

  Scenario:::: campaigns/"ID".json,
    * execute "getCampaignByCampaignId"

  Scenario:::: campaigns.json,
    * execute "getCampaigns"

  Scenario:::: campaigns/"ID".json,
    * execute "updateCampaign"

  Scenario:::: campaigns/"ID".json,
    * execute "deleteCampaign"

  Scenario:::: leads.json,
    * execute "createLead"

  Scenario:::: leads/"ID".json,
    * execute "getLeadByLeadId"

  Scenario:::: leads.json,
    * execute "getLeads"

  Scenario:::: leads/"ID".json,
    * execute "updateLead"

  Scenario:::: leads/"ID".json,
    * execute "deleteLead"

  Scenario:::: contacts.json,
    * execute "getContacts"

  Scenario:::: opportunities.json,
    * execute "getOpportunities"
