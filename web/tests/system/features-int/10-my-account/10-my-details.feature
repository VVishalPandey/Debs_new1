Feature: Test Debenhams my details page

@automated  @DDAI-136
Scenario Outline: Navigate to Debenhams my details page and validate details of user
  Given I logout
  #Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I navigate to "loginUrl"
  #And I "validate & click" option is available in "mainMenuList" as "Create Account/Sign In" on "commonPage"
  And I wait for "4000" milliseconds
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "2000" milliseconds
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

  Examples:
    | email                       | password   | full_name     | newsletter_message                         |
    | testautomationd27@gmail.com | password27 | Mrs Test User | No, please don't send me email newsletters |

@automated  @DDAI-136 @Issue
Scenario Outline: Navigate to Debenhams my details page and validate details of user and newsletter subscription as yes
  Given I logout
  #Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I wait for "4000" milliseconds
  And I click on "menuIcon" on "commonPage"
  And I wait for "2000" milliseconds
  And I click on "signInOptionInt" on "commonPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
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

  Examples:
    | email                       | password   | full_name     | newsletter_message                                                                                           |
    | testautomationd28@gmail.com | password28 | Mrs Test User | Yes, I would like to receive Debenhams email newsletters informing me of promotions, offers and competitions |
