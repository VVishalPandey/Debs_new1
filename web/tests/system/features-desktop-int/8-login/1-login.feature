Feature: Test Debenhams login page

@automated @DEBD-297
Scenario: Navigate to Debenhams login page and validate the title and tabs on page
  Given I logout
  When I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "signInOptionDesktop" on "commonPage"
  And I should see "headerText" as "My Account" on "loginPage"
  And I should see "tab1" as "Sign In" on "loginPage"
  And I should see "tab2" as "Create an account" on "loginPage"

@automated @DEBD-297
Scenario: Navigate to Debenhams login page and validate Sign In section of login page
  Then I should see "emailAddressFieldSignIn" exist on "loginPage"
  And I should see "passwordField" exist on "loginPage"
  And I should see "signInButton" exist on "loginPage"
  And I should see "forgotPasswordLink" exist on "loginPage"
  # And I should see "rememberMe" exist on "loginPage"
  And I should see "newDebenhamsText" as "New to Debenhams?" on "loginPage"
  And I should see "createAccountLink" exist on "loginPage"

@automated @DEBD-297
Scenario: Navigate to Debenhams login page and validate the error messages for empty email and password field on sign in
  And I click on "signInButton" on "loginPage"
  Then I should see "emailErrorMessage" as "The email address field cannot be empty" on "loginPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "loginPage"

@automated @DEBD-297
Scenario Outline: Navigate to Debenhams login page and validate the error messages for incorrect email on sign in
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  # And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "loginPage"

  Examples:
    | email |
    | user1 |

@automated @DEBD-297
Scenario Outline: Navigate to Debenhams login page and validate the error messages for empty password  on sign in
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "loginPage"

  Examples:
    | email           |
    | user1@gmail.com |

@automated @DEBD-297
Scenario Outline: Navigate to Debenhams login page and validate login with incorrect credentials
  Given I logout
  When I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "invalidLoginMessage" as "We can't find an account with this email address. Please check your email address and try again or register for a new account." on "loginPage"

  Examples:
    | email           | password |
    | user1@gmail.com | pass1    |


@automated @DEBD-297
Scenario: Navigate to Debenhams login page and validate error message in case of no email in create account
  When I click on "tab2" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  Then I should see "emailErrorMessageCreateAccount" as "The email address field cannot be empty" on "loginPage"

@automated @DEBD-297
Scenario Outline: Navigate to Debenhams login page and validate show hide functiality for password
  Given I logout
  When I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "text" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"



  Examples:
    | password  | email           |
    | password2 | hdjhd@gmail.com |

@automated @DEBD-297
Scenario Outline: Navigate to Debenhams login page and validate login with correct credentials
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I should see "signOutLink" exist on "commonPage"
  And I should not see "createAccountLink" on "commonPage"

  Examples:
    | email               | password   |
    | testukpp1@gmail.com | password2  |

@manual @DEBD-297
Scenario: Navigate to Debenhams login page and validate automatic sign in on fresh browser if user has closed the logged in browser
  Given I navigate to "loginUrl"
  And I provide valid credentials and login
  And I close browser
  When I navigate to "loginUrl" again
  Then I should be logged in
