Feature: Test Debenhams Customer Enactment end to end journey number 5 for DSC Users

@automatedSanity @e2e @preprodSanity
Scenario: Validate DSC user is able to change the email address on My Account Page
  Given I logout
  When I am enacting as a customer using DSC
  Then I validate email address change for DSC user
