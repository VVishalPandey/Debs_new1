Feature: Test Add a new Payment card scenarios

@notnotAutomated @DEBD-195
Scenario Outline: Validate My account - Payment page setup
  Given I logout
  When I wait for "4000" milliseconds
  Then I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "3000" milliseconds
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  Then I click on "myPaymentCardsButton" on "myDetailsPage"
  And I should see "header" as "My payment cards" on "paymentPage"
  And I should see "backButton" exist on "paymentPage"
  And I should see "addNewPaymentCardLink" exist on "paymentPage"
  And I should see "existingCardDetails" exist on "paymentPage"

  Examples:
    | email              | password |
    | debsops3@gmail.com | debs1234 |

@notnotAutomated  @DEBD-195
Scenario: Validate My account - Add new Payment card page setup
  Then I click on "addNewPaymentCardLink" on "paymentPage"
  And I should see "subHeading" as "Add a new payment card" on "paymentPage"
  And I should see "cardTypeSection" as "Card details" on "paymentPage"
  And I should see "selectCardTypeDropDown" exist on "paymentPage"
  And I should see "billingAddressDetailSection" as "Billing address" on "paymentPage"
  And I should see "selectSavedAddressDropDown" exist on "paymentPage"
  And I should see "title" exist on "paymentPage"
  And I should see "firstName" exist on "paymentPage"
  And I should see "lastName" exist on "paymentPage"
  And I should see "phoneNumber" exist on "paymentPage"
  And I should see "countryDropDown" exist on "paymentPage"
  And I should see "houseNumber" exist on "paymentPage"
  And I should see "postCode" exist on "paymentPage"
  And I should see "enterAddManuallyLink" exist on "paymentPage"
  And I should see "findAddButton" exist on "paymentPage"
  And I should see "cancelButton" exist on "paymentPage"
  And I should see "savePaymentCardButton" exist on "paymentPage"

