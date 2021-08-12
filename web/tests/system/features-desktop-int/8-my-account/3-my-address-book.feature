Feature: Test Debenhams My Address Book page

@notAutomated @DBED-1193
Scenario Outline: Navigate to Debenhams and verify My address book is highlighted when we perform click
  Given I logout
  And I click on "menuIcon" on "commonPage"
  And I wait for "2000" milliseconds
  And I click on "signInOption" on "commonPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "pageTitle" as "My account" on "myDetailsPage"
  And I should verify "selectedMyAccMenuOption" "My details" to be highlighted "font-weight" on "myDetailsPage"
  Then I click on "myAddressBookButton" on "myDetailsPage"
  And I should verify "selectedMyAccMenuOption" "My address book" to be highlighted "font-weight" on "myDetailsPage"

  Examples:
    | email           | password  |
    | testmy@debs.com | password2 |

@notAutomated @DBED-1193
Scenario: Verify My address book page
  #Then I should see "title" as "My address book" on "addressBookPage"
  And I should see "addNewAddressLink" exist on "addressBookPage"
  And I should see "existingAddresses" exist on "addressBookPage"
  And I should see "preferredDeliveryAddress" exist on "addressBookPage"
  And I should see "editAddressLink" exist on "addressBookPage"
  And I should see "removeLink" exist on "addressBookPage"

@notAutomated @DBED-1193
Scenario: Verify My address book page remove button validation
  Then I click on "removeLink" on "addressBookPage"
  And I should see "removePopUpMessage" as "Do you want to remove this address?" on "addressBookPage"
  And I should see "removeYesLabel" as "Yes, remove it" on "addressBookPage"
  And I should see "removeCancelLabel" as "Cancel" on "addressBookPage"
  Then I validate that the address is removed after clicking "removeYesLabel" on "addressBookPage"

@manual @DBED-1193
Scenario: Verify that user is able to remove the saved address and the removed address should not be in the list
