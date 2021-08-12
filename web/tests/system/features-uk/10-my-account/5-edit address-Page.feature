Feature: Validate add/Update address on my account page

@notAutomated @DEBD-2879 @DBNHST-281
Scenario Outline: My Address Book - Adding New Address Pages :Scenario-New User - Add new address:Find Address -Case1:Recognized for 1 address
  Given I logout
  Then I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I remove "address" address on My Account Page
  And I should see "titleOfPage" as "My Account" on "myDetailsPage"
  And I should see "myAddressBook" exist on "myDetailsPage"
  And I click on "myAddressBookButton" on "myDetailsPage"
  And I should see "titleOfPage" as "My address book" on "myDetailsPage"
  When I should see "addNewAddressButton" exist on "myDetailsPage"
  And I click on "addNewAddressButton" on "myDetailsPage"
  And I should see "titleOfPage" as "Add a new address" on "myDetailsPage"
  And I should see "title" exist on "myDetailsPage"
  And I should see "firstName" exist on "myDetailsPage"
  And I should see "lastName" exist on "myDetailsPage"
  And I should see "phoneNumber" exist on "myDetailsPage"
  And I should see "emailAddressField" exist on "myDetailsPage"
  And I should see "countryDropDown" exist on "myDetailsPage"
  And I should see "houseNumber" exist on "myDetailsPage"
  And I should see "addressLine1" exist on "myDetailsPage"
  And I should see "addressLine2" exist on "myDetailsPage"
  And I should see "city" exist on "myDetailsPage"
  And I should see "postcode" exist on "myDetailsPage"
  And I should see "clearAddressLink" exist on "myDetailsPage"
  And I should see "BFPOAddressLink" exist on "myDetailsPage"
  And I should not see "findAddButton" on "myDetailsPage"
  And I should see "addAddressButton" exist on "myDetailsPage"
Examples:
    | email          | password   |firstName|lastname|
    | test8d@dbm.com | password2   |Test    |Nightwatch|

@manual @DEBD-2879  @DBNHST-281
Scenario Outline: My Address Book - Adding New Address Pages :Scenario-Add new address:Manual Address entry
  When I should see "addNewAddressButton" exist on "myDetailsPage"
  And I click on "addNewAddressButton" on "myDetailsPage"
  And I should see "titleOfPage" as "Add a new address" on "myDetailsPage"
  Then I enter "<firstName>" in "firstName" on "myDetailsPage"
  And I enter "<lastname>" in "lastName" on "myDetailsPage"
  Then I enter "<email>" in "emailAddressField" on "myDetailsPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "myDetailsPage"
  And I enter "<housenumber>" in "houseNumber" on "myDetailsPage"
  And I enter "<addressLine1>" in "addressLine1" on "myDetailsPage"
  And I enter "<addressLine2>" in "addressLine2" on "myDetailsPage"
  And I enter "<city>" in "city" on "myDetailsPage"
  And I enter "<postcode>" in "postcode" on "myDetailsPage"
  And I should not see "findAnotherAddressLink" on "myDetailsPage"
  And I should see "bfpoLink" exist on "myDetailsPage"
  And I should see "clearAddressButton" exist on "myDetailsPage"
  Then I click on "bfpoLink" on "myDetailsPage"
  And I should see "bfpoPopUp" exist on "myDetailsPage"
  And I click on "closebutton" on "myDetailsPage"
  Then I click on "addAddressButton" on "myDetailsPage"
  And I should see "addedAddress" as "FullAddress" on "myDetailsPage"
  Examples:
      | email          | password  | firstName | lastname   | phoneNumber | housenumber | addressLine1 | addressLine2   | city   | postcode | FullAddress                                                         |
      | test8d@dbm.com | password2 | Test      | Nightwatch | 07789799999 | Flat 19     | 4            | Steward Street | London | E1 6FQ   | Mrs. Test Nightwatch, Flat 19, 4 Steward Street, London, E1 6FQ, GB |



@manual @DEBD-2879  @DBNHST-281
Scenario: My Address Book - Adding New Address Pages :Scenario-Add new address page:Clear address functionality
  When I should see "addNewAddressButton" exist on "myDetailsPage"
  And I click on "addNewAddressButton" on "myDetailsPage"
  And I should see "titleOfPage" as "Add a new address" on "myDetailsPage"
  Then I enter "<firstName>" in "firstName" on "myDetailsPage"
  And I enter "<lastname>" in "lastName" on "myDetailsPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "myDetailsPage"
  And I enter "<housenumber>" in "houseNumber" on "myDetailsPage"
  And I should see "addressLine1" exist on "myDetailsPage"
  And I should see "addressLine2" exist on "myDetailsPage"
  And I should see "city" exist on "myDetailsPage"
  And I should see "county" exist on "myDetailsPage"
  And I should see "postcode" exist on "myDetailsPage"
  Then I click on "clearAddressButton" on "myDetailsPage"
  And I should see "clearAddresspopUp" as "Are you sure you want to reset / clear all information ?" on "myDetailsPage"
  And I click on "yesButton" on "myDetailsPage"
  Then I should see "firstName" as "null" on "myDetailsPage"
  And I should see "lastName" as "null" on "myDetailsPage"
  And I should see "phoneNumber" as "null" on "myDetailsPage"
  And I should see "houseNumber" as "null" on "myDetailsPage"


@manual @DEBD-2879  @DBNHST-281
Scenario: My Address Book - Adding New Address Pages :Scenario-Edit existing address address page
 When I should see "backbutton" exist on "myDetailsPage"
 And I click on "backbutton" on "myDetailsPage"
 And I click on "editAddressButton" on "myDetailsPage"
 And I should see "titleOfPage" as "Add a new address" on "myDetailsPage"
  And I should see "title" exist on "myDetailsPage"
  And I should see "firstName" exist on "myDetailsPage"
  And I should see "lastName" exist on "myDetailsPage"
  And I should see "phoneNumber" exist on "myDetailsPage"
  And I should see "emailAddressField" exist on "myDetailsPage"
  And I should see "countryDropDown" exist on "myDetailsPage"
  And I should see "houseNumber" exist on "myDetailsPage"
  And I should see "addressLine1" exist on "myDetailsPage"
  And I should see "addressLine2" exist on "myDetailsPage"
  And I should see "city" exist on "myDetailsPage"
  And I should see "postcode" exist on "myDetailsPage"
  And I should see "clearAddressLink" exist on "myDetailsPage"
  And I should see "BFPOAddressLink" exist on "myDetailsPage"
  And I should not see "findAddButton" on "myDetailsPage"
  And I should see "changeAddress" exist on "myDetailsPage"


