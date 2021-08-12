Feature: Test Debenhams my saved item page

@automated @DEBD-1071
Scenario Outline: Validate registered user is able to login sucessfully via save for later
  Given I navigate to "womenDressesPspUrl"
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
  And I should see "url" contains "/women/dresses"
  And I wait for "3000" milliseconds
  And I click on "savedItemsButton" on "commonPage"
  And I wait for "3000" milliseconds
  Then I validate products are saved on mySavedItemPage 
  And I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "mySavedItems"

  Examples:
    | email           | password |
    | user32@gmail.com| password2 |


@notAutomated @DEBD-1071 
Scenario Outline: Validate guest user is able to create an account via save for later
  Given I navigate to "womenDressesPspUrl"
  When I click on "saveForLaterButton" on "pspPage"
  And I wait for "3000" milliseconds
  And I should see "saveItemSignInPageCloseIcon" exist on "pspPage"
  And I should see "saveItemContinueShoppingButton" exist on "pspPage"
  And I should see "saveItemSignInRegisterButton" exist on "pspPage"
  When I click on "saveItemSignInRegisterButton" on "pspPage"
  When I create a new account
  # When I click on "tab2" on "loginPage"
  # And I enter "<email>" in "emailAddressField" on "registerPage"
  # And I click on "createAccountButton" on "loginPage"
  # And I wait for "5000" milliseconds
  # And I enter "<firstName>" in "firstNameField" on "registerPage"
  # And I enter "<lastName>" in "lastNamefield" on "registerPage"
  # And I enter "<password>" in "passwordField" on "loginPage"
  # And I click on "createAccountButton" on "registerPage"
  # And I wait for "10000" milliseconds
  And I should see "url" contains "/women/dresses"
  Then I validate products are saved on mySavedItemPage 
  
  Examples:
    | email                           | password  |
    | irelandnewaccount2222222@gmail.com| password2 |

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
