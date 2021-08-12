Feature: Test Debenhams SFL functionality on CCC

@automated @DEBD-1988
Scenario Outline: Validate the SFL button on the PSP/PDP page for a CCC user
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  When I navigate to "<url>"
  When I click on "saveForLaterButton" on "<page>"
  Then I should not see "saveItemSignInPageCloseIcon" on "pspPage"
  And I should not see "saveItemContinueShoppingButton" on "pspPage"
  And I should not see "saveItemSignInRegisterButton" on "pspPage"

Examples:
|url| page |
|testCoffeePdpURL| pdpPage |
|dressesPspUrl| pspPage |

@automated @DEBD-1988
Scenario: Validate the SFL page for user with Saved item in bag for a CCC user
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  When I "Remove" "all" products from "mySavedItems"
  When I click on "savedItemsButton" on "commonPage"
  Then I should not see "emailAddressFieldSignIn" on "mySavedItemPage"
  Then I should not see "passwordField" on "mySavedItemPage"
  Then I should not see "signInButton" on "mySavedItemPage"
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"

@automated @DEBD-1988
Scenario: Validate the SFL page for user with No Saved item in bag for a CCC user
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  When I "Remove" "all" products from "mySavedItems"
  When I navigate to "testCoffeePdpURL"
  When I click on "saveForLaterButton" on "pdpPage"
  When I click on "savedItemsButton" on "commonPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"

@notAutomated @DEBD-1988
Scenario: Validate the SFL button on the PSP page for a CCC user
  Given I logout
  When I enter "<email>" in "cccLoginField" on "cccLoginPage"
  And I enter "<password>" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should not see "cccSignInButton" on "cccLoginPage"
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  When I click on "saveForLaterButton" on "pspPage"
  Then I should not see "saveItemSignInPageCloseIcon" on "pspPage"
  And I should not see "saveItemContinueShoppingButton" on "pspPage"
  And I should not see "saveItemSignInRegisterButton" on "pspPage"

@notAutomated @DEBD-1988
Scenario: Validate the SFL button on the PDP page for a CCC user
  When I click on "firstProductImage" on "pspPage"   When I click on "saveForLaterButton" on "pdpPage"   Then I should not see "saveItemSignInPageCloseIcon" on "pdpPage"
  And I should not see "saveItemContinueShoppingButton" on "pdpPage"
  And I should not see "saveItemSignInRegisterButton" on "pdpPage"

@notAutomated @DEBD-1988
Scenario: Validate the SFL page for user with Saved item in bag for a CCC user
  When I click on "savedItemsButton" on "commonPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"

@notAutomated @DEBD-1988
Scenario: Validate the SFL page for user with Saved item in bag for a CCC user when we delete all the products from SFL
  When I click on "savedItemsButton" on "commonPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"
  When I click on "Remove all" on "mySavedItemPage"

@notAutomated @DEBD-1988
Scenario: Validate the SFL page for user with No Saved item in bag for a CCC user
  Given I logout
  When I enter "<email>" in "cccLoginField" on "cccLoginPage"
  And I enter "<password>" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should not see "cccSignInButton" on "cccLoginPage"
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  When I click on "savedItemsButton" on "commonPage"
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"
  And I should not see the login form on SFL page   Then I will see the no saved items page

@notAutomated @DEBD-1988
Scenario: Validate the SFL section on My bag page for a CCC user
  Given I am on the customer online ordering tool
  And I have saved items
  When I can see the saved items carousel on the my bag page
  Then I will not see the sign in to add items to your account yellow notification
