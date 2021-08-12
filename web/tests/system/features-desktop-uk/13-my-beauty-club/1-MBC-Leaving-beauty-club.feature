Feature: Test Sprint 10 story DBNHST-1097

@manual @DBNHST-1097 @awsManual
Scenario: My Account - Page Setup :Senario-My payment cards displayed  :Existing User having saved beauty card details and tries to report lost card
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
  And I should see "reportLostCardLink" on "my-details"
  Then I click on "reportLostCardLink" on "my-details"
  And I should see "leaveBeautyClubTab" on "my-details"
  Then I click on "leaveBeautyClubTab" on "my-details"
  And I should see "tabHeading" as "Leave Beauty Club" on "my-details"
  And I should see "messageForLeavers" exist on "my-details"
  And I should validate the "href" of "getInTouchLink" as "https://www.debenhams.com/wcsstore/DebenhamsUKSite/faq/contact_us.html" on "my-details"
