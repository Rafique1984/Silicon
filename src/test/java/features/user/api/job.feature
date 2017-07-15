Feature: User API: job endpoint test

  Scenario: Use all valid data in required options and make sure you get status code 200 and proper response
  Given My api base URL is "http://user.qa.elitecareer.net"
  
  When My request method is "Get"
  And I set header "fusion-api-key" as "fusionqateam"
  And I set header "Content-Type" as "application/json"
  
  And I set path parameter "jobid" as "5000"
  
  And I make a request to "/api/v1/job/{jobid}"
  Then I expect status code as "200"
  And I want to print response body
  And I expect "[0].JobNewsID" equals "5000" in response body
 # And I expect "node" contains "value" in response body
 
 

  Scenario: for missing fusion-api-key and  make sure you get status code 401 and proper error massaage
  
  Given My api base URL is "http://user.qa.elitecareer.net"
  When My request method is "GET"
  And I set path parameter "jobid" as "500"
  And I make a request to "/api/v1/job/{jobid}"
  Then I expect status code as "401"
  And I want to print response body
  And I expect "data.detail" equals "The specified headers are missing" in response body
 # And I expect "data.detail" contains "value" in response body
  
  