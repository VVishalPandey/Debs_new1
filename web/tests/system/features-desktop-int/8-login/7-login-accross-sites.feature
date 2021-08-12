Feature: Test Debenhams Account details/login across stores


@automated @DEBD-1037 @DEBD-297 @DEBD-1037 @DEBD-1037 @DEBD-1035
Scenario Outline: Validate that DOTIE user is not able to login to DOTCOM/DOTINT
  Given I logout
  When I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "signInOptionDesktop" on "commonPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordFieldType" on "loginPage"
  And I click on "signInButton" on "loginPage"
  # And I should see "errorMessage" exist on "loginPage"
  And I should see "invalidLoginMessage" as "We can't find an account with this email address. Please check your email address and try again or register for a new account." on "loginPage"

  Examples:
    | email           | password |
    | dotie@gmail.com | password2 |


@automated @DEBD-1037 @DEBD-297 @DEBD-1037 @DEBD-1035
Scenario Outline: Validate that DOTINT user is able to login to DOTCOM/DOTINT
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordFieldType" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "signOutLink" exist on "commonPage"
  Then I should not see "createAccountLink" on "commonPage"


  Examples:
    | email                       | password |
    | testautomationd11@gmail.com | password2 |

