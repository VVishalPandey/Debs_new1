Feature: Test Debenhams Account details/login across stores

@automated @DEBD-1037 @DEBD-297 @DEBD-1037 @DEBD-1035
Scenario Outline: Validate that DOTINT user is not able to login to DOTIE
  Given I navigate to "homeURL"
  When I logout
  And I click on "signInOptionDesktop" on "commonPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordFieldType" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "3000" milliseconds
  # And I should see "errorMessage" exist on "loginPage"
  And I should see "createAccountLink" exist on "commonPage"
  And I should not see "signOutLink" on "commonPage"
  

  Examples:
    | email                 | password |
    | parasint1@gmail.com   | password2|

