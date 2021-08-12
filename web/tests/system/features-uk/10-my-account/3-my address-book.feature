Feature: Test Sprint 10 story DBNHST-279

@manual @DBNHST-279
Scenario Outline: My Address Book - Page Setup :Scenario-No saved addresses :New User
  Given I logout
  Then I navigate to "loginUrl"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I should see "headerText" as "Create an account" on "registerPage"
  Then I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "continueShoppingButton" exist on "newUserPage"
  When I click on "menuIcon" on "commonPage"
  And I click on "My Account" position "6"
  And I should see "titleOfPage" as "My details" on "my-details"
  And I should see "myAddressBook" exist on "my-details"
  And I click on "myAddressBook" on "my-details"
  And I should see "titleOfPage" as "My address book" on "my-details"
  Then I should see "savedAddress" as "You have no saved addresses" on "my-details"
  And I should see "addNewAddressButton" exist on "my-details"
  And I should see "backNavigationButton" exist on "my-details"

  Examples:
    | email          | firstName | lastname | password |
    | cba2@gmail.com | Test1     | User1    | abcd123  |

@manual @DBNHST-279
Scenario: My Address Book - Page Setup :Senario-Saved Address :Existing User having saved address
  Given I logout
  And I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I click on "rememberMe" on "loginPage"
  And I enter "email" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "password" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "titleOfPage" as "My details" on "my-details"
  And I should see "myAddressBook" exist on "my-details"
  And I click on "myAddressBook" on "my-details"
  And I should see "titleOfPage" as "My address book" on "my-details"
  And I should see "addNewAddressButton" exist on "my-details"
  And I should see "existingAddressDetails" exist on "my-details"
  And I should see "preferredaddressButton" exist on "my-details"
  And I should see "editAddressLink" exist on "my-details"
  And I should see "removeAddressLink" exist on "my-details"
  And I should see "backNavigationButton" exist on "my-details"
  And I click on "removeAddressLink" on "my-details"
  Then I should see "popup" exist on "my-details"
  And I click on "closeButton" on "my-details"

@manual @DBNHST-279
Scenario: My Address Book - Page Setup :Senario-Saved Address :Existing User add new address on My Address Page and verify the new feature added for remove button

@manual @DBNHST-279
Scenario: My Address Book - Page Setup :Senario-Saved Address :Existing User add new address on Delivery Page -Delivery address and verify the new feature added for remove button

@manual @DBNHST-279
Scenario: My Address Book - Page Setup :Senario-Saved Address :Existing User add new address on Payment Page-Billing address and verify the new feature added for remove button

@manual @DBNHST-279
Scenario: My Address Book - Page Setup :Senario-Saved Address :Existing User add new address on Beauty Club Add Card Page and verify the new feature added for remove button.
