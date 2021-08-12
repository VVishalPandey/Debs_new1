Feature: Test Debenhams my details page

@automated @DEBD-302
Scenario Outline: Navigate to Debenhams my details page and validate details of user without DOB
  Given I logout
  Then I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  When I wait for "4000" milliseconds
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "fullName" as "<full_name>" on "myDetailsPage"
  And I should see "emailAddress" as "<email>" on "myDetailsPage"
  And I should see "newsletterMessage" as "<newsletter_message>" on "myDetailsPage"
  And I should see "editDetailsButton" exist on "myDetailsPage"
  And I should see "managePasswordButton" exist on "myDetailsPage"
  And I should see "myAddressBookButton" exist on "myDetailsPage"
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  And I should see "myOrderButton" exist on "myDetailsPage"
  And I should see "savedItemsButton" exist on "myDetailsPage"
  And I should see "beautyClubButton" exist on "myDetailsPage"


Examples:
  | email                      | password       | full_name    | newsletter_message                                |
  | testautomationd2@gmail.com | password2      | Mr Test Debs | No, please don't send me marketing communications |


@automated @DEBD-302 @DEBD-249
Scenario Outline: Navigate to Debenhams my details page and validate details of user with DOB and newsletter subscription as yes
  Given I logout
  Then I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "fullName" as "<full_name>" on "myDetailsPage"
  And I should see "emailAddress" as "<email>" on "myDetailsPage"
  And I should see "dateOfBirth" as "<dob>" on "myDetailsPage"
  And I should see "newsletterMessage" as "<newsletter_message>" on "myDetailsPage"
  And I should see "editDetailsButton" exist on "myDetailsPage"
  And I should see "managePasswordButton" exist on "myDetailsPage"
  And I should see "myAddressBookButton" exist on "myDetailsPage"
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  And I should see "myOrderButton" exist on "myDetailsPage"
  And I should see "savedItemsButton" exist on "myDetailsPage"
  And I should see "beautyClubButton" exist on "myDetailsPage"
  And I count number of "leftHandNavigation" to be "<max_count>" on "myDetailsPage"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I should see "homeBanner" exist on "commonPage"
   #scenario added due to defect
  And I click on "signInOptionDesktop" on "commonPage"
  And I should see "emailAddressFieldSignIn" exist on "loginPage"
  And I should see "passwordField" exist on "loginPage"
  And I should see "signInButton" exist on "loginPage"
  And I should not see "leftHandNavigation" on "myDetailsPage"

Examples:
  | email           | password  | full_name     | dob       | newsletter_message                            |  max_count|
  | testmy@debs.com | password2 | Mrs Test User | 11/11/1988|  YES, PLEASE SEND ME MARKETING COMMUNICATIONS | 7         |
