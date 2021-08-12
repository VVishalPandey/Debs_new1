Feature: Test Debenhams end to end journey number 3

@automatedSanity @preprodSanity @e2e
Scenario: Add quantity 2 and add to bag and store details from my bag
  Given I logout
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I navigate to "testDress2PdpURL"
  Then I add the product to bag and go to my bag page
  And I should see "testDress2ProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  And I should see "ProductPrice" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"
  And I should see "subtotalValue" exist on "myBagPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to delivery option as guest
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to international delivery options as guest user
  Then I should see "internationalDeliveryHeader" as "WHERE ARE WE DELIVERING TO?" on "deliveryOptionPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to delivery options by filling the international address manually and select International delivery
  When I provide Australia address details and navigate to delivery options under it
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payment page by selecting proceed payment button and validate the validate the page
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "2000" milliseconds
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  And I should see "deliveryType" exist on "paymentPage"
  And I should see "deliveryIcon" exist on "paymentPage"
  And I should see "changeDeliveryMethod" exist on "paymentPage"
  And I should see "deliveryAddress" exist on "paymentPage"
  And I should see "deliveryEstimationText" containing "Delivery within" on "paymentPage"
  And I should see "deliveryEstimationText" containing "working days" on "paymentPage"
  And I should see "orderSummaryProductList" exist on "paymentPage"
  And I should see "productNameElements" exist on "paymentPage"
  And I should see "productImageElements" exist on "paymentPage"
  And I should see "productSwatchElements" exist on "paymentPage"
  And I should see "productQuantityElements" exist on "paymentPage"
  And I should see "productPriceElements" exist on "paymentPage"
  And I should see "editShoppingBagLink" exist on "paymentPage"
  And I should see "dutyAndTaxNotification" exist on "paymentPage"
  And I should see "findOutMoreLink" exist on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should not see "beautyCardAccordion" on "paymentPage"
  And I should not see "giftCardAccordion" on "paymentPage"
  And I should see "payPalAccordion" exist on "paymentPage"

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
