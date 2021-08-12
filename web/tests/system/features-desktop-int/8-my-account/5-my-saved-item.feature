Feature: Test Debenhams my saved item page

@automated @DEBD-1071
Scenario Outline: Validate registered user is able to login sucessfully via save for later
  Given I logout
  When I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I wait for "5000" milliseconds
  When I navigate to "pspPageLessThan18Products"
  And I wait for "5000" milliseconds
  And I store name of product and select save item on pspPage
  And I wait for "3000" milliseconds
  And I should see "saveItemSignInPageCloseIcon" exist on "pspPage"
  And I should see "saveItemContinueShoppingButton" exist on "pspPage"
  And I should see "saveItemSignInRegisterButton" exist on "pspPage"
  When I click on "saveItemSignInRegisterButton" on "pspPage"
  And I wait for "3000" milliseconds
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "3000" milliseconds
  And I should see "url" contains "men/big-tall/suits-tailoring"
  And I wait for "3000" milliseconds
  And I click on "savedItemsButton" on "commonPage"
  And I wait for "3000" milliseconds
  Then I validate products are saved on mySavedItemPage
  And I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "mySavedItems"

  Examples:
    | email                   | password |
    | paras.pandiyar@gmail.com| Test1234 |

@notAutomated @DEBD-1071
Scenario Outline: Validate guest user is able to create an account via save for later
  Given I navigate to "homeURL"
  When I am on my details page
  And I logout
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I store value of first "1" products and select save item on pspPage
  And I should see "saveItemSignInPageCloseIcon" exist on "pspPage"
  And I should see "saveItemContinueShoppingButton" exist on "pspPage"
  And I should see "saveItemSignInRegisterButton" exist on "pspPage"
  When I click on "saveItemSignInRegisterButton" on "pspPage"
  And I click on "saveForLater" on "pspPage"
  And I should see "headerText" as "My Account" on "pspPage"
  And I click on "createAnAccountTab" on "loginPage"
  And I create a new account
  And I should see "url" contains "/women/dresses"
  Then I validate products are saved on mySavedItemPage

@manual @DEBD-1071
Scenario: Validate user is able to scroll to the same item  in the page from where he has done SFL
  Given I navigate to "homeURL"
  When I am on my details page
  And I logout
  And I navigate to "pspPage"
  And I scroll to the last product of pspPage
  And I click on "saveForLaterButton" on "pspPage"
  And I am on my details page
  And I should see "url" contains "/women/dresses"
  And I should scroll down to the same item for which saveForLater has been done
  And I should see SFL icon will be filled in with red color
  And I should see saved item is added in My Saved items page
