Feature: Test Debenhams my details page

@automated @DBMTE-28
Scenario Outline: Navigate to Debenhams my details page and validate details of user without DOB
  Given I logout
  When I wait for "4000" milliseconds
  And I click on "menuIcon" on "commonPage"
  And I wait for "2000" milliseconds
  And I click on "signInOption" on "commonPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  #Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "fullName" as "<full_name>" on "myDetailsPage"
  And I should see "emailAddress" as "<email>" on "myDetailsPage"
  And I should see "newsletterMessage" as "<newsletter_message>" on "myDetailsPage"
  And I should see "editDetailsLink" exist on "myDetailsPage"
  And I should see "managePasswordButton" exist on "myDetailsPage"
  And I should see "myAddressBookButton" exist on "myDetailsPage"
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  And I should see "myOrderButton" exist on "myDetailsPage"
  And I should see "savedItemsButton" exist on "myDetailsPage"
  And I should see "beautyClubButton" exist on "myDetailsPage"

Examples:
  | email                      | password       | full_name    | newsletter_message                         |
  | testautomationd2@gmail.com | password2      | Mr Test User | No, please don't send me email newsletters |


@automated @DBMTE-28
Scenario Outline: Navigate to Debenhams my details page and validate details of user with DOB and newsletter subscription as yes
  Given I logout
  When I wait for "4000" milliseconds
  And I click on "menuIcon" on "commonPage"
  And I wait for "2000" milliseconds
  And I click on "signInOption" on "commonPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  #Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "fullName" as "<full_name>" on "myDetailsPage"
  And I should see "emailAddress" as "<email>" on "myDetailsPage"
  And I should see "dateOfBirth" as "<dob>" on "myDetailsPage"
  And I should see "newsletterMessage" as "<newsletter_message>" on "myDetailsPage"
  And I should see "editDetailsLink" exist on "myDetailsPage"
  And I should see "managePasswordButton" exist on "myDetailsPage"
  And I should see "myAddressBookButton" exist on "myDetailsPage"
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  And I should see "myOrderButton" exist on "myDetailsPage"
  And I should see "savedItemsButton" exist on "myDetailsPage"
  And I should see "beautyClubButton" exist on "myDetailsPage"

Examples:
  | email                       | password   | full_name         | dob       | newsletter_message                                                                                            |
  | testmy@debs.com | password2 | Mrs Test User| 11/11/1988|  Yes, I would like to receive Debenhams email newsletters informing me of promotions, offers and competitions |
