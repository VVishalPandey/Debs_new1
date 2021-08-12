Feature: Test Sprint 10 story DBNHST-295

@manual @DBNHST-295
Scenario: My Account - Page Setup :Senario-My payment cards displayed  :Existing User having no saved cards
  Given I logout
  Then I navigate to "loginUrl"
  When I click on "tab2" on "loginPage"
  And I enter "email" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I should see "headerText" as "Create an account" on "registerPage"
  Then I enter "firstName" in "firstNameField" on "registerPage"
  And I enter "lastname" in "lastNamefield" on "registerPage"
  And I enter "password" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "continueShoppingButton" exist on "newUserPage"
  When I click on "menuIcon" on "commonPage"
  And I click on "My Account" position "6"
  And I should see "titleOfPage" as "My details" on "my-details"
  And I should see "myPaymentCards" exist on "my-details"
  And I click on "myPaymentCards" on "my-details"
  Then I should see "titleOfPage" as "My payment cards" on "my-details"
  And I should see "backNavigationButton" exist on "my-details"
  And I should see "addNewPaymentCardButton" exist on "my-details"

@manual @DBNHST-295
Scenario: My Account - Page Setup :Senario-My payment cards displayed  :Existing User having saved cards
  Given I logout
  And I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I click on "rememberMe" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "titleOfPage" as "My details" on "my-details"
  And I should see "myPaymentCards" exist on "my-details"
  And I click on "myPaymentCards" on "my-details"
  Then I should see "titleOfPage" as "My payment cards" on "my-details"
  And I should see "backNavigationButton" exist on "my-details"
  And I should see "addNewPaymentCardButton" exist on "my-details"
  And I should see "existingPaymentCardDetails" exist on "my-details"
  And I should see "editPaymentCardLink" exist on "my-details"
  And I should see "removePaymentCardLink" exist on "my-details"

@manual @DBNHST-295
Scenario: My Account - Page Setup :Senario-My payment cards displayed  :Existing User having saved address clicks on remove card button
  When I click on "removeAddressLink" on "my-details"
  Then I should see "popup" exist on "my-details"
  And I click on "closeButton" on "my-details"
