Feature: Test Debenhams edit details page under my account

@automated @DEBD-300 @DEBD-156
Scenario Outline: Navigate to Debenhams my details page and validate my details page
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  When I wait for "4000" milliseconds
  Then I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "pageTitle" as "My account" on "myDetailsPage"
  And I should see "editDetailsButton" exist on "myDetailsPage"
  And I store the "newsletterMessage" displayed on "myDetailsPage"
  And I should see "delieverybanner" exist on "commonPage"
  And I should see "headerMenuSection" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should see "leftHandNavigation" exist on "myDetailsPage"
  And I count number of "leftHandNavigation" to be "<max_count>" on "myDetailsPage"
  And I should not see "beautyClubButton" on "myDetailsPage"
  And I should not see "rewardCardButton" on "myDetailsPage"

  Examples:
    | email              | password |max_count|
    | testrm2@debs.com   | password2|      6  |

@automated @DEBD-300
Scenario: Navigate to Debenhams edit details page under my account and validate the user information is displayed to user
  Then I click on "editDetailsButton" on "myDetailsPage"
  And I should see "editDetailsPageTitle" as "Change my details" on "myDetailsPage"
  And I validate "firstName" is editable on "myDetailsPage"
  And I validate "lastName" is editable on "myDetailsPage"
  And I validate "emailAddressInput" is editable on "myDetailsPage"
  And I validate "dateOfBirthInput" is editable on "myDetailsPage"
  And I should see "newsletterSubscriptionCheckbox" exist on "myDetailsPage"
  And I should see "saveChangesButton" exist on "myDetailsPage"

@automated @DEBD-300
Scenario Outline: Navigate to Debenhams edit details page under my account and validate the user information can be updated
  Then I enter "<first_name>" in "firstName" on "myDetailsPage"
  And I enter "<last_name>" in "lastName" on "myDetailsPage"
  And I click on "newsletterSubscriptionCheckbox" on "myDetailsPage"
  And I click on "saveChangesButton" on "myDetailsPage"
  Then I should see "fullName" as "<full_name>" on "myDetailsPage"
  Then I should see "newsletterMessage" as "No, please don't send me marketing communications" on "myDetailsPage"
  Then I click on "editDetailsButton" on "myDetailsPage"
  Then I enter "<first_name1>" in "firstName" on "myDetailsPage"
  And I enter "<last_name1>" in "lastName" on "myDetailsPage"
  And I click on "newsletterSubscriptionCheckbox" on "myDetailsPage"
  And I click on "saveChangesButton" on "myDetailsPage"
  Then I should see "fullName" as "<full_name1>" on "myDetailsPage"
  Then I should see "newsletterMessage" as "Yes, please send me marketing communications" on "myDetailsPage"
  Examples:
    | first_name  | last_name |full_name     |   first_name1  | last_name1 |full_name1   |
    | Test        | Debs      | Mrs Test Debs| DebsT          | Test      | Mrs DebsT Test |

@automated @DEBD-300
Scenario: Navigate to Debenhams edit details page under my account and validate the back button functionality
  Then I click on "editDetailsButton" on "myDetailsPage"
  And I click on "backNavigationButton" on "myDetailsPage"
  Then I should see "pageTitle" as "My account" on "myDetailsPage"
  And I should see "editDetailsButton" exist on "myDetailsPage"

@manual @DEBD-300
Scenario: Navigate to Debenhams edit details/newsletterpreferences page under my account
 Given I navigate to "MyAccountPage"
 And validate the date of birth can be blank and saved
 And Validate the functionality of the backButton on edit detail page
 And I validate newsletterpreferences functionality on "my acoount Page"

@manual @DEBD-312
Scenario: Navigate to Debenhams my account page and validate that LHN options on my account pages are sticky when we scroll the page
