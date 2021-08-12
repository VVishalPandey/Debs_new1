Feature: Test Agent login page for customer enactment

@automated @DEBD-1970
Scenario: Navigate to Debenhams customer enactment login page and validate the title and fields on CCCLogin page
  Given I logout
  Then I should see "cccheaderSignIn" as "CCC | DEBENHAMS.IE" on "cccLoginPage"
  And I should see "cccDebsLogoSignIn" exist on "cccLoginPage"
  And I should see "cccLoginlabel" as "Logon ID*" on "cccLoginPage"
  And I should see "cccLoginField" exist on "cccLoginPage"
  And I should see "cccPasswordField" exist on "cccLoginPage"
  And I should see "cccSignInButton" exist on "cccLoginPage"


@notAutomated @DEBD-1970
Scenario Outline: validate the error message with invalid email format
  When I enter "<email>" in "cccLoginField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "cccLoginPage"

  Examples:
    | email |
    | user1 |


@automated @DEBD-1970
Scenario Outline: Navigate to customer enactment login page and validate login with blank emailId
  Given I logout
  When I enter "" in "cccLoginField" on "cccLoginPage"
  And I enter "<password>" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should see "invalidLoginMessage" as "Type a Logon ID in the Logon ID field." on "cccLoginPage"

  Examples:
     | password |
     | pass1    |

@automated @DEBD-1970
Scenario: validate show/hide functionality  for password field
  Then I validate "type" of "cccPasswordField" as "password" on "cccLoginPage"
  When I click on "showHideButton" on "cccLoginPage"
  Then I validate "type" of "cccPasswordField" as "text" on "cccLoginPage"
  When I click on "showHideButton" on "cccLoginPage"
  Then I validate "type" of "cccPasswordField" as "password" on "cccLoginPage"


@automated @DEBD-1970
Scenario Outline: Navigate to Debenhams customer enactment login page and validate login with blank password
  Given I logout
  When I enter "<signin>" in "cccLoginField" on "cccLoginPage"
  And I enter "" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should see "invalidLoginMessage" as "Type a password in the Password field." on "cccLoginPage"


  Examples:
     | signin              |
     | ccctest@gmail.com   |

@automated @DEBD-1970
Scenario Outline: Navigate to Debenhams customer enactment login page and validate login with incorrect emailId
  Given I logout
  When I enter "<email>" in "cccLoginField" on "cccLoginPage"
  And I enter "<password>" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should see "errorNotification" as "We can't find an account with this email address. Please check your email address and try again or register for a new account." on "cccLoginPage"


  Examples:
    | email                    | password |
    | test123@yopmail.com | pass1    |
    |dk&*^*&^&*^^|pass1|

@automated @DEBD-1970
Scenario Outline: Navigate to Debenhams login page and validate login with correct email and incorrect password
  Given I logout
  When I enter "<email>" in "cccLoginField" on "cccLoginPage"
  And I enter "<password>" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should see "errorNotification" as "Either the Logon ID or the Password entered is incorrect." on "cccLoginPage"

  Examples:
    | email                    | password |
    | CSRUSER39 | Netflix@111    |

@automated @DEBD-1970
Scenario Outline: Navigate to Debenhams login page and validate login with correct credentials
  Given I logout
  When I enter "<email>" in "cccLoginField" on "cccLoginPage"
  And I enter "<password>" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should not see "cccSignInButton" on "cccLoginPage"
  And I should see "cccSignOutLink" exist on "cccCustomerSearchPage"
  And I should see "cccManagePassword" exist on "cccCustomerSearchPage"
  And I should see "employeeName" as "<name>" on "cccCustomerSearchPage"

  Examples:
    | email    | password   | name     |
    | CSRUSER39 | Netflix@110    |ses|

@manual @DEBD-1970
Scenario: Navigate to Debenhams login page and validate ui of the Login and password field
Given I logout
 When I enter "" in "cccLoginField" on "cccLoginPage"
 And I enter "password" in "cccPasswordField" on "cccLoginPage"
 And I should verify "border-top-color" of "cccLoginField" as "errorboxcolourRed" on "cccLoginPage"
 When I enter "test@email.com" in "cccLoginField" on "cccLoginPage"
 And I enter "" in "cccPasswordField" on "cccLoginPage"
 And I should verify "border-top-color" of "passwordField" as "errorboxcolourRed" on "cccLoginPage"

@manual @DEBD-297
Scenario: Navigate to Debenhams login page and validate automatic sign in on fresh browser if user has closed the logged in browser
  Given I logout
  And I provide valid credentials and login
  And I close browser
  When I logout again
  Then I should be logged in
