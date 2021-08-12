Feature: Test Sprint 10 story DBNHST-1088

@manual @DBNHST-1088 @awsManual
Scenario: My Account - MBC :Senario-Manage account :Existing User having saved beauty card and has done some point transaction
  Given I logout
  And I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I click on "rememberMe" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "myBeautyClub" exist on "my-details"
  And I click on "myBeautyClub" on "my-details"
  Then I should see "titleOfPage" as "Helllo firstname" on "my-details"
  And I should see "manageAccount" exist on "my-details"
  Then I click on "manageAccount" on "my-details"
  And I should see "transcationHistoryLink" exist on "my-details"
  Then I click on "transcationHistoryLink" on "my-details"
  And I should see "myTranctionHistory" on "my-details"
  And I should see "backButton" on "my-details"
  And I should see "viewPointTranscationDefault" on "my-details"
  And I should see "currentPointBalance" on "my-details"
  And I should see "descriptionColumn" on "my-details"
  And I should see "pointsColumn" on "my-details"

@manual @DBNHST-1088 @awsManual
Scenario: My Account - MBC :Senario-Manage account :Existing User having saved beauty card and selects to view balance transaction which are not done
  When I click on "viewBalanceTranscation" on "my-details"
  Then I should see "totalBalance" on "my-details"
  And I should see "balanceMessage" as "You don't currently have any transactions" on "my-details"
  And I should see startShoppinglink" on "my-details"
  