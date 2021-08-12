Feature: Test CCC account locked page


@manual @DEBD-1986
Scenario Outline: Navigate to Debenhams login page and validate login with incorrect password with account locked
  Given I logout
  And I click on "signInOptionDesktop" on "cccLoginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "cccLoginPage"
  And I enter "<password>" in "passwordField" on "cccLoginPage"
  And I click on "signInButton"  3 time on "cccLoginPage"
  Then I should see "invalidLoginMessage" as "Due to several unsuccessful password attempts in a row, your account has been restricted. Please contact your support team." on "loginPage"
  And I enter "correctemail" in "emailAddressFieldSignIn" on "cccLoginPage"
  And I enter "correctpassword" in "emailAddressFieldSignIn" on "cccLoginPage"
  And I click on "signInButton" on "cccLoginPage"
  And I should not be able to login
  Examples:
    | email   | password |
    | a@a.com | pass     |

@automated @DEBD-1986 
Scenario Outline: Validate the error message for locked account
  Given I logout
  When I enter "<email>" in "cccLoginField" on "cccLoginPage"
  And I enter "<password>" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should see "errorNotification" as "Due to several unsuccessful password attempts in a row, your account has been restricted. Please contact your support team." on "cccLoginPage"

Examples:
    | email                    | password   | 
    | ramjha0@publicisgroupe.net | P@&&w0rd |