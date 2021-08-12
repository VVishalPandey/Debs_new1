Feature: Test Sprint 10 story DBNHST-1090

@manual @DBNHST-1090 @awsManual
Scenario: My Account - MBC :Senario-Manage account :Existing User clicks on "Balance expiry dates" link
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
  And I should see "balanceExpiryDateLink" exist on "my-details"
  Then I click on "balanceExpiryDateLink" on "my-details"
  And I should see "balanceExpiryDateTab" on "my-details"

@manual @DBNHST-1090 @awsManual
Scenario: My Account - MBC :Senario-Manage account :Existing User :Balance expiry page validation with transcation history
  Given I am signed in to my beauty club
  When I am on the balance expiry dates tab
  Then I can see my balance expiry dates highlighted
  And a back to my beauty club link (https://www.debenhams.com/webapp/wcs/stores/servlet/BeautyClubDashboard?catalogId=10001&langId=-1&storeId=10701#)
  And the total balance
  And a list of rewards
  And their respective expiry dates in order of expiry (closest to expiry at the end)

@manual @DBNHST-1090 @awsManual
Scenario: My Account - MBC :Senario-Manage account :Existing User :Balance expiry page validation | Without transcation
  Given I am on the balance expiry dates tab
  When I have no rewards
  Then I will see the no transactions messaging (see designs)
  And the start shopping link will point to the beauty TCAT (http://www.debenhams.com/beauty)
