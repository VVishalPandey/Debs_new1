Feature: Test Debenhams Pay By Card on Payment page

@automated @DEBD-164 @DEBD-148
Scenario: Validate the Pay By Card Accordion on Payment Page For Registered User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  Then I am on my details page
  Then I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "internationalDeliveryHeader" as "Where are we delivering to?" on "deliveryOptionPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I should see "creditCardAccordion" as "Pay with a Credit or Debit card" on "paymentPage"
  And I should see "securePayment" as "SECURE PAYMENT" on "paymentPage"
  And I should see "padLockIcon" exist on "paymentPage"
  And I should see "creditCardIcons" exist on "paymentPage"
  And I verify "xlink:href" of "masterCardIconINT" as "masterCardIconImage" on "paymentPage"
  And I verify "xlink:href" of "visaCardIconINT" as "visaCardIconImage" on "paymentPage"
  And I verify "xlink:href" of "maestroCardIconINT" as "maestroCardIconImage" on "paymentPage"
  And I should see "creditCardIDField" exist on "paymentPage"
  And I should see "expirtyDate" as "Expiry date" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumberLabel" as "Security number" on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardSecurityNumberIcon" exist on "paymentPage"
  And I should see "creditCardSecurityNumberHint" exist on "paymentPage"
  And I should see "saveThisCardCheckbox" exist on "paymentPage"



@automated @DEBD-164
Scenario: Navigate to Debenhams payment page and validate the credit card error message for empty fields
  When I enter " " in "creditCardIDField" on "paymentPage"
  And I enter " " in "creditCardSecurityNumber" on "paymentPage"
  And I click on "creditCardExpiryMonth" on "paymentPage"
  And I click on "creditCardExpiryYear" on "paymentPage"
  Then I should see "creditCardIDError" as "Card Number is required" on "paymentPage"
  And I should see "creditCardExpiryDateError" as "Please enter the expiry date of your payment card." on "paymentPage"
  And I should see "creditCardSecurityNumError" as "Please enter a valid security number" on "paymentPage"


@automated @DEBD-164
Scenario Outline: Navigate to Debenhams payment page and validate the credit card error message for less than 16 digits
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_sec_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I should see "creditCardIDError" as "Card number must be more than 15 digits" on "paymentPage"

  Examples:
    | credit_card_number | credit_card_sec_num |
    | 41111              |                     |

@automated @DEBD-164
Scenario Outline: Navigate to Debenhams payment page and validate the credit card icon
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I verify "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type         | sec_num_digits_text  | cc_number           |
    | 4111111111111111   | visaIconType      | 3 digits on the back | 4111 1111 1111 1111 |
    | 6759270000000000   | meastroIconType   | 3 digits on the back | 6759 2700 0000 0000 |
    | 5555555555554444   | masterIconType    | 3 digits on the back | 5555 5555 5555 4444 |


@manual @DEBD-164
Scenario: Validate the card number spacing after entry
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  When I enter "cardNumber" in "cardNumberField" on "paymentPage"
  Then I should see card number as separated into groups of 4, as it's written on my credit card e.g. 4012 0010 1100 0771

@manual @DEBD-164
Scenario: Validate the highlighting of relevant card icon
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
  When I click on "loggedInuserUKOption" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  When I type the first 4 digits
  Then the BIN range is recognised e.g. 4102
  And  the appropriate card icon e.g. visa next to the card number input field will highlight in the list of icons
  And the non-relevant icons will go a darker shade
  And I won't see the card icon within the card number input field
  When I delete more than the first four digits of the payment card
  Then all the card icons will come back into focus

@manual @DEBD-148
Scenario: Validate the user should be allowed with only mastercard, visa, or maestro for making payments
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  Then I should be allowed with only mastercard, visa, or maestro for making payments

@manual @DEBD-148
Scenario: Validate the invalid card Error
  Given I am on the Pay with a Credit, Debit section
  When I enter an incorrect/invalid card number
  Then I should see an inline validation error messaging
  And the 'Place Order and Pay' button should be greyed out
