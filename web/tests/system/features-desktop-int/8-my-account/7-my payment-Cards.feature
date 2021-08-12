Feature: Test Debenhams My payment cards page under my account

@notAutomated @ECOMMUI-2 @DEBD-1199 @DEBD-195
Scenario Outline: My Account - validate user is able to not able to add any card for existing user with no saved cards
  Given I logout
  Then I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "pageTitle" as "My account" on "myDetailsPage"
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  And I click on "myPaymentCardsButton" on "myDetailsPage"
  Then I should see "titleOfPage" as "My payment cards" on "myDetailsPage"
  And I should see "backNavigationButton" exist on "myDetailsPage"
  And I should not see "addNewPaymentCardButton" on "myDetailsPage"

    Examples:
    | email              | password |
    | testvad1@gmail.com | test1234 |

@notAutomated @ECOMMUI-2
Scenario: My Account - validate user is not able to add any card for existing user having saved cards
  Given I logout
  And I am on my details page
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  When I click on "myPaymentCardsButton" on "myDetailsPage"
  Then I should see "titleOfPage" as "My payment cards" on "myDetailsPage"
  And I should not see "addNewPaymentCardButton" on "myDetailsPage"
  And I should see "existingPaymentCardDetails" exist on "myDetailsPage"
  And I should see "editPaymentCardLink" exist on "myDetailsPage"
  And I should see "removePaymentCardLink" exist on "myDetailsPage"
  When I click on "removePaymentCardLink" on "myDetailsPage"
  Then I should see "popup" exist on "myDetailsPage"
  And I click on "closeButton" on "myDetailsPage"
  And I should not see "cardsdropdown" on "myDetailsPage"
  And I should not see "credit/debitCardOption" on "myDetailsPage"
  And I should not see "storeCardOption" on "myDetailsPage"


@notAutomated @ECOMMUI-2 @DEBD-1199 @DEBD-195
Scenario: My Account - validate user is not able to edit card number and card type existing credit card number
 When I click on "EditPaymentCardCC" on "myDetailsPage"
 Then I should see "cardType" "readonly" on "pspPage"
 And I should see "cardInput" "readonly" on "pspPage"
 And I should see "startMonth" exist on "myDetailsPage"
 And I should see "startYear" exist on "myDetailsPage"
 And I should see "expireMonth" exist on "myDetailsPage"
 And I should see "expireYear" exist on "myDetailsPage"
 And I should see "issueNumber" exist on "myDetailsPage"
 And I should see "namefield" exist on "myDetailsPage"
 And I should see "billingAddressDropdown" exist on "myDetailsPage"

@notAutomated @ECOMMUI-2
Scenario: My Account -Validate  billing address on edit credit card page
  And I should see "title" exist on "myDetailsPage"
  And I should see "firstName" exist on "myDetailsPage"
  And I should see "lastName" exist on "myDetailsPage"
  And I should see "phoneNumber" exist on "myDetailsPage"
  And I should see "countryDropDown" exist on "myDetailsPage"
  And I should see "houseNumber" exist on "myDetailsPage"
  And I should see "addressLine1" exist on "myDetailsPage"
  And I should see "addressLine2" exist on "myDetailsPage"
  And I should see "city" exist on "myDetailsPage"
  And I should see "state" exist on "myDetailsPage"
  And I should see "postcode" exist on "myDetailsPage"
  And I should not see "findAddButton" on "myDetailsPage"
  And I should not see "cancelButton" on "myDetailsPage"
  And I should see "clearAddressLink" exist on "myDetailsPage"
  And I should see "savePaymentCardButton" exist on "myDetailsPage"

@manual @ECOMMUI-2
Scenario: My Account - validate user is  able to update existing credit Card
  When I enter updated card expireYear and expireYear
  And I enter updated billing address
  And I click on update payment details
  Then creditcards details should be updated
