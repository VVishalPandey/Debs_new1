Feature: Test Debenhams edit details page under my account

@automated @DBMTE-29
Scenario Outline: Navigate to Debenhams my details page and validate details of user
  Given I logout
  When I wait for "4000" milliseconds
  And I click on "menuIcon" on "commonPage"
  And I wait for "2000" milliseconds
  And I click on "signInOption" on "commonPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "pageTitle" as "My account" on "myDetailsPage"
  And I should see "editDetailsLink" exist on "myDetailsPage"
  And I store the "newsletterMessage" displayed on "myDetailsPage"

  Examples:
    | email              | password |
    | testvad2@gmail.com | test1234 |

@automated @DBMTE-29
Scenario: Navigate to Debenhams edit details page under my account and validate the user information is displayed to user
  Then I click on "editDetailsLink" on "myDetailsPage"
  And I should see "editDetailsPageTitle" as "Change my details" on "myDetailsPage"
  And I validate "firstName" is editable on "myDetailsPage"
  And I validate "lastName" is editable on "myDetailsPage"
  And I validate "emailAddressInput" is editable on "myDetailsPage"
  And I validate "dateOfBirthInput" is editable on "myDetailsPage"
  And I should see "newsletterSubscriptionCheckbox" exist on "myDetailsPage"
  And I should see "saveChangesButton" exist on "myDetailsPage"

@automated @DBMTE-29
Scenario: Navigate to Debenhams edit details page under my account and validate the user information can be updated
  #Then I enter "<first_name>" in "firstName" on "myDetailsPage"
  #And I enter "<last_name>" in "lastName" on "myDetailsPage"
  And I click on "newsletterSubscriptionCheckbox" on "myDetailsPage"
  And I click on "saveChangesButton" on "myDetailsPage"

@automated @DBMTE-29
Scenario: Navigate to Debenhams edit details page under my account and validate the updated information is displayed to user
  #Then I should see "fullName" as "<full_name>" on "myDetailsPage"
  And I verify that "newsletterMessage" is updated on "myDetailsPage"

@automated @DBMTE-29
Scenario: Navigate to Debenhams edit details page under my account and validate the back button functionality
  Then I click on "editDetailsLink" on "myDetailsPage"
  And I click on "backNavigationButton" on "myDetailsPage"
  Then I should see "pageTitle" as "My account" on "myDetailsPage"
  And I should see "editDetailsLink" exist on "myDetailsPage"

@manual @DBMTE-29
Scenario: Navigate to Debenhams edit details page under my account and validate the date of birth can be blank and saved

@manual @DBMTE-29
Scenario: Navigate to Debenhams edit details page under my account and validate that user lands on correct page for the journey Edit details page > My address book > My account

@manual @DBMTE-29
Scenario: Navigate to Debenhams edit details page under my account and validate that user lands on correct page for the journey Edit details page > Menu options > Any PSP page >My account
