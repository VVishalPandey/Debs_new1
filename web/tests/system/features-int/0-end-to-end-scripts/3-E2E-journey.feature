Feature: Test Debenhams end to end journey number 3

@automatedSanity @preprodSanity @e2e
Scenario: Add quantity 2 and add to bag and store details from my bag
  Given I logout
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I wait for "2000" milliseconds
  When I navigate to "testDress2PdpURL"
  Then I add to bag quantity "1" and go to my bag page
  And I should see "testDress2ProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  And I should see "ProductPrice" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"
  And I should see "subtotalValue" exist on "myBagPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to delivery option as guest
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to international delivery options as guest user
  And I should see "headerText" as "WHERE ARE WE DELIVERING TO?" on "deliveryOptionPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to delivery options by filling the international address manually and select International delivery
  When I provide Australia address details and navigate to delivery options under it
  Then I should see "internationalOption" exist on "deliveryOptionPage"
  When I click on "internationalOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payment page by selecting proceed payment button and validate the validate the page
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "2000" milliseconds
  Then I should see "headerText" as "Payment" on "paymentPage"
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I am in view of "creditCardAccordion" on "paymentPage"
  And I should see "creditCardAccordion" exist on "paymentPage"
  And I should see "payPalAccordion" exist on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"
  And I am in view of "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "international Delivery" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Navigate to Debenhams payment page and validate the visa credit card icon
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  | cc_number           |
    | 4111111111111111   | visa      | 3 digits on the back | 4111 1111 1111 1111 |

@automatedSanity @preprodSanity  @e2e
Scenario Outline: Navigate to Debenhams payment page and validate the master credit card icon
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type  | sec_num_digits_text  | cc_number           |
    | 5555555555554444   | mastercard | 3 digits on the back | 5555 5555 5555 4444 |

@automatedSanity @preprodSanity @e2e
Scenario Outline: Navigate to Debenhams payment page and validate the maestro credit card icon
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  | cc_number           |
    | 6759270000000000   | maestro   | 3 digits on the back | 6759 2700 0000 0000 |
