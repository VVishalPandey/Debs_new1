Feature: Test Debenhams customer email change after enacting the customer

@automated @DEBD-2317
Scenario: Validate DSC user is view customer detail after enacting the customer
  Given I logout
  When I am enacting as a customer using DSC
  Then I validate email address change for DSC user

@notAutomated @DEBD-2317
Scenario Outline: Validate CSR user is view customer detail after enacting the customer
  Given I logout
  And I am logged in as CCC user
  When I enter "<email>" in "emailAddress" on "cccCustomerSearchPage"
  And I click on "Searchbutton" on "cccCustomerSearchPage"
  Then I should see "searchedtext" as "You have searched for [Field label] is [Field value]" on "cccCustomerSearchPage"
  And I click on "customerSelect" on "cccCustomerSearchPage"
  When I click on "enactCustomer" on "cccCustomerSearchPage"
  Then I should see "globalBanner" as "You have enacted a Registered Customer's account" on "ccchomePage"
  And I should see "DropCustomerSessionButton" exist on "ccchomePage"
  Then I should see "pageTitle" as "My account" on "myDetailsPage"
  And I should see "editDetailsButton" exist on "myDetailsPage"
  And I should not see "ManagePassword" on "myDetailsPage"
  And I should not see "myOrders" on "myDetailsPage"
  Examples:
    | email              |
    | raman.jha1907@gmail.com   |


@notAutomated @DEBD-2317
Scenario: Validate CSR user is able to change customer email after enacting the customer
  When I click on "editDetailsButton" on "myDetailsPage"
  Then I should see "editDetailsPageTitle" as "Change my details" on "myDetailsPage"
  And I validate "firstName" is not editable on "myDetailsPage"
  And I validate "lastName" is not editable on "myDetailsPage"
  And I validate "emailAddressInput" is editable on "myDetailsPage"
  And I validate "dateOfBirthInput" is not editable on "myDetailsPage"
  And I should see "newsletterSubscriptionCheckboxdisabled" exist on "myDetailsPage"
  And I should see "saveChangesButton" exist on "myDetailsPage"

@notAutomated @DEBD-2317
Scenario Outline: Navigate to CSR edit details page under my account and validate the error message of existing email
  When I enter "" in "emailfield" on "myDetailsPage"
  And I click on "saveChangesButton" on "myDetailsPage"
  Then I should see "emaillError" as "The Email address field cannot be empty." on "myDetailsPage"
  When I enter "<newEmail>" in "emailfield" on "myDetailsPage"
  And I click on "saveChangesButton" on "myDetailsPage"
  Then I should see "emaillError" as "<error>" on "myDetailsPage"


  Examples:
    | newEmail                |                          error                                                  |
    | raman.jha19071@gmail.com|The Logon ID you entered already exists. Type a different Logon ID and try again.|


@manual @DEBD-2317
Scenario Outline: Navigate to CSR edit details page under my account and validate the user information can be updated
  Then I enter "<newEmail>" in "emailfield" on "myDetailsPage"
  And I click on "saveChangesButton" on "myDetailsPage"
  Then I should see "email" as "<newEmail>" on "myDetailsPage"
  Examples:
    | newEmail  |
    | raman.jha19071@gmail.com|
