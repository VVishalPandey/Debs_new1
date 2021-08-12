Feature: Test Debenhams My Address Book page

@manual @DBMTE-31 @DBMTE-347
Scenario Outline: Navigate to Debenhams and verify My address book is highlighted when we perform click
  Given I logout
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "pageTitle" as "My account" on "myDetailsPage"
  And I should verify "selectedMyAccMenuOption" "My details" to be highlighted "font-weight" on "myDetailsPage"
  Then I click on "myAddressBookButton" on "myDetailsPage"
  And I should verify "selectedMyAccMenuOption" "My address book" to be highlighted "font-weight" on "myDetailsPage"

  Examples:
    | email                         | password   |
    | testautomatione2e21@gmail.com | password21 |

@manual @DBMTE-31 @DBMTE-347
Scenario: Verify My address book page
  #Then I should see "title" as "My address book" on "addressBookPage"
  And I should see "addNewAddressLink" exist on "addressBookPage"
  And I should see "existingAddresses" exist on "addressBookPage"
  And I should see "preferredDeliveryAddress" exist on "addressBookPage"
  And I should see "editAddressLink" exist on "addressBookPage"
  And I should see "removeLink" exist on "addressBookPage"

@manual @DBMTE-31 @DBMTE-347
Scenario: Verify My address book page remove button validation
  Then I click on "removeLink" on "addressBookPage"
  And I should see "removePopUpMessage" as "Do you want to remove this address?" on "addressBookPage"
  And I should see "removeYesLabel" as "Yes, remove it" on "addressBookPage"
  And I should see "removeCancelLabel" as "Cancel" on "addressBookPage"
  Then I validate that the address is removed after clicking "removeYesLabel" on "addressBookPage"

@manual @DBMTE-31 @DBMTE-347
Scenario: Verify that user is able to remove the saved address and the removed address should not be in the list

@manual @DBMTE-347
Scenario: Verify the prefered address functionality on My address book page for international user

@manual @DBMTE-347
Scenario: Verify the edit an existing address functionality on My address book page for international user

@manual @DBMTE-347
Scenario: Verify the add new address functionality on My address book page for international user
