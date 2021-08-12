
Feature: Test data validation

@automatedTestData @e2e
Scenario: Validate the test data
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  
@automatedTestData @e2e
Scenario: Validate the test data  
  When I navigate to "testDress2PdpURL"
  And I select available size and add to bag on pdpPage