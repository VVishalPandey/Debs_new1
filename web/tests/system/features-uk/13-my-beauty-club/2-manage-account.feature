Feature: Test Sprint 10 story DBNHST-1087

@manual @DBNHST-1087
Scenario: My Account - MBC :Senario-Manage account :Existing User having saved beauty card
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
  And I should see "myBeautyClubDashboardLink" exist on "my-details"
  And I should validate "href" of "myBeautyClubDashboardLink" as "https://www.debenhams.com/webapp/wcs/stores/servlet/BeautyClubDashboard" on "my-details"
  And I should see "myDetailsLink" exist on "my-details"
  And I should validate "href" of "myDetailsLink" as "https://www.debenhams.com/webapp/wcs/stores/servlet/AjaxLogonForm?langId=-1&storeId=10701&catalogId=10001&myAcctMain=1" on "my-details"
  And I should see "marketingPrefernecesLink" exist on "my-details"
  And I should validate "href" of "marketingPrefernecesLink" as "https://www.debenhams.com/webapp/wcs/stores/servlet/AjaxLogonForm?langId=-1&storeId=10701&catalogId=10001&myAcctMain=1" on "my-details"
  And I should see "transcationHistoryLink" exist on "my-details"
  And I should validate "href" of "transcationHistoryLink" as "https://www.debenhams.com/#/transactions" on "my-details"
  And I should see "balanceExpireyDateLink" exist on "my-details"
  And I should validate "href" of "balanceExpireyDateLink" as "https://www.debenhams.com/#/transactions/balance" on "my-details"
  And I should see "reportLostLink" exist on "my-details"
  And I should validate "href" of "reportLostLink" as "https://www.debenhams.com/#/manage-account" on "my-details"
  And I should see "removeCardLink" exist on "my-details"
  And I should validate "href" of "removeCardLink" as "https://www.debenhams.com/webapp/Remove card from account" on "my-details"

@manual @DBNHST-1087
Scenario: My Account - MBC :Senario-Manage account :Existing User having no saved beauty card
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
  And I should see "myBeautyClubDashboardLink" exist on "my-details"
  And I should validate "href" of "myBeautyClubDashboardLink" as "https://www.debenhams.com/webapp/wcs/stores/servlet/BeautyClubDashboard" on "my-details"
  And I should see "myDetailsLink" exist on "my-details"
  And I should validate "href" of "myDetailsLink" as "https://www.debenhams.com/webapp/wcs/stores/servlet/AjaxLogonForm?langId=-1&storeId=10701&catalogId=10001&myAcctMain=1" on "my-details"
  And I should see "marketingPrefernecesLink" exist on "my-details"
  And I should validate "href" of "marketingPrefernecesLink" as "https://www.debenhams.com/webapp/wcs/stores/servlet/AjaxLogonForm?langId=-1&storeId=10701&catalogId=10001&myAcctMain=1" on "my-details"
  And I should see "transcationHistoryLink" exist on "my-details"
  And I verify that "transcationHistoryLink" is disabled
  And I should see "balanceExpireyDateLink" exist on "my-details"
  And I verify that "balanceExpireyDateLink" is disabled
  And I should see "reportLostLink" exist on "my-details"
  And I verify that "reportLostLink" is disabled
  And I should see "removeCardLink" exist on "my-details"
  And I verify that "removeCardLink" is disabled
