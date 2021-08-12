Feature:  Test Edit payment card page

@notautomated @DBED-195 @awsManual
Scenario Outline: Validate My account - Edit Payment page setup
  Given I logout
  When I wait for "4000" milliseconds
  Then I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "3000" milliseconds
  And I click on "myPaymentCardsButton" on "myDetailsPage"
  And I wait for "18000" milliseconds
  And I should see "header" as "My payment cards" on "paymentPage"
  And I should see "backButton" exist on "paymentPage"
  And I should see "addNewPaymentCardLink" exist on "paymentPage"
  And I should see "existingCardDetails" exist on "paymentPage"
  And I should see "editPaymentCardDetailsLink" exist on "paymentPage"
  Then I click on "editPaymentCardDetailsLink" on "paymentPage"
  And I should see "subHeading" as "Edit payment card" on "paymentPage"
  And I should see "cardTypeSection" as "Card details" on "paymentPage"
  And I should see "selectCardTypeDropDown" exist on "paymentPage"
  #And I should see "existingCardType" containing "CreditCard" on "paymentPage"
  Then I should see value of "cardNumberInputBox" as "************1111" on "paymentPage"
  And I should see "creditCardStartMonth" exist on "paymentPage"
  And I should see "creditCardStartYear" exist on "paymentPage"
  And I should see "cCardExpiryMonth" exist on "paymentPage"
  And I should see "cCardExpiryYear" exist on "paymentPage"
  And I should see "issueNumber" exist on "paymentPage"
  And I should see "nameOnCard" exist on "paymentPage"
  And I should see "billingAddressDetailSection" as "Billing address" on "paymentPage"
  And I should see "selectSavedAddressDropDown" exist on "paymentPage"
  And I should see "title" exist on "paymentPage"
  And I should see "firstName" exist on "paymentPage"
  And I should see "lastName" exist on "paymentPage"
  And I should see "phoneNumber" exist on "paymentPage"
  And I should see "countryDropDown" exist on "paymentPage"
  And I should see "houseNumber" exist on "paymentPage"
  And I should see "zipCode" exist on "paymentPage"
  And I should see "clearAddressLink" exist on "paymentPage"
  And I should see "findAddButton" exist on "paymentPage"
  And I should see "cancelButton" exist on "paymentPage"
  And I should see "savePaymentCardButton" exist on "paymentPage"

  Examples:
    | email              | password |
    | testvad1@gmail.com | test1234 |

@manual @DBED-195 @awsManual
Scenario: My Account - Page Setup :Senario-My payment cards displayed  :Existing User having on Edit Card details page , clicks on Cancel Button
  When I click on "cancelButton" on "myDetailsPage"
  Then I should see "cancelPopUp" on "myDetailsPage"
  And I should see "canceltext" as "Are you sure you would like to cancel? Any changes will not be saved." on "myDetailsPage"
  And I should see "yesButton" on "myDetailsPage"
  And I shouls see "noButton" on "myDetailsPage"

@manual @DBED-195 @awsManual
Scenario: Navigate to Debenhams edit payment card page under my payment cards and validate that user is able to update the card details

@manual @DBED-195 @awsManual
Scenario: Navigate to Debenhams edit payment card page under my payment cards and validate that user is able to update the billing address details
