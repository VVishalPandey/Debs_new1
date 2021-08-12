Feature: Test Debenhams Ireland edit details page under my account

@manual @DDAI-136
Scenario: Navigate to Debenhams Ireland edit details page under my account and validate the user information is displayed to user

@manual @DDAI-136
Scenario: Navigate to Debenhams Ireland edit details page under my account and validate the user information can be updated

@manual @DDAI-136
Scenario: Navigate to Debenhams Ireland edit details page under my account and validate the updated information is displayed to user

@manual @DDAI-136
Scenario: Navigate to Debenhams Ireland edit details page under my account and validate the date of birth can be blank and saved

@manual @DDAI-436
Scenario: Navigate to Debenhams My Account Page>Validate Edit Details link for ROI
  Given I am signed in
  And I am on my account
  Then I will see a edit details link
  And When I click the edit details link
  Then I am taken to the edit details page
