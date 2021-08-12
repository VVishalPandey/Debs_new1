Feature: Test Debenhams Account details/login across stores


@automated @DEBD-1037 @DEBD-297 @DEBD-1037 @DEBD-1035 @Fixed
Scenario Outline: Validate that DOTINT user is able to login to DOTCOM
  Given I navigate to "homeURL"
  When I logout
  And I click on "signInOptionDesktop" on "commonPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordFieldType" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "3000" milliseconds
  And I should see "signOutLink" exist on "commonPage"
  Then I should not see "createAccountLink" on "commonPage"
  

  Examples:
    | email                        | password |
    | testautomationd111@gmail.com | password2 |


@automated @DEBD-1037 @DEBD-297 @DEBD-1037 @DEBD-1037 @DEBD-1035 @Fixed
Scenario Outline: Validate that DOTIE user is not able to login to DOTCOM
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
    | email           | password |
    | dotie@gmail.com | password2 |
