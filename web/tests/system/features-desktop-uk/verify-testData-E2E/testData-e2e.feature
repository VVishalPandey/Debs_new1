
Feature: Test data validation

@automatedTestData @e2e
Scenario: Validate the test data
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage

@automatedTestData @e2e
Scenario: Validate the test data
  When I navigate to "freeGiftPdpURL"
  And I select available size enter quantity as "3" and add to bag on pdpPage

@automatedTestData @e2e
Scenario: Validate the test data  
  When I navigate to "knickerPdpUrl"
  And I select available size enter quantity as "3" and add to bag on pdpPage

@automatedTestData @e2e
Scenario: Validate the test data  
  When I navigate to "testDress2PdpURL"
  And I select available size and add to bag on pdpPage

@automatedTestData @e2e
Scenario: Validate the test data 
  When I navigate to "testChannelPdpURL"
  And I select available size and add to bag on pdpPage
  
@automatedTestData @e2e
Scenario: Validate the test data
  When I navigate to "testChanelPerfPdpURL"
  When I add to bag quantity "2" and go to my bag page