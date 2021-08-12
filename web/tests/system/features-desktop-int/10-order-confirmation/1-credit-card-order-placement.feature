Feature: Test Debenhams order placement with different cards (non3ds/V1/V2 cards)

@automated @psd2
Scenario Outline: Validate order confirmation page with non 3DS cards payments
  Given I navigate to "lowPriceDressPDP"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to international delivery options as guest user
  Then I should see "internationalDeliveryHeader" as "WHERE ARE WE DELIVERING TO?" on "deliveryOptionPage"
  When I provide Australia address details and navigate to delivery options under it
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  Then I am in view of "newAddressText" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  Then I select new billing address and provide UK address details and use this address
  And I should see "editAddressLink" exist on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  Then I click on "creditCardDateJanMonth" on "paymentPage"
  And I click on "creditCardDateNextYear" on "paymentPage"
  And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"
  Examples:
    | credit_card_number | sec_num_digits_text  | security_num | cc_number           | icon_type        |
    | 4111111111111111   | 3 digits on the back | 123          | 4111 1111 1111 1111 | VISA             |
    | 340000000001130    | 3 digits on the back | 1234         | 340 0000000 01130   | american-express |
    | 340000000001114    | 3 digits on the back | 1234         | 340 0000000 01114   | american-express |
    | 340000000001106    | 3 digits on the back | 1234         | 340 0000000 01106   | american-express |
    | 340000000001098    | 3 digits on the back | 1234         | 340 0000000 01098   | american-express |
    | 340000000001064    | 3 digits on the back | 1234         | 340 0000000 01064   | american-express |
    | 340000000001023    | 3 digits on the back | 1234         | 340 0000000 01023   | american-express |
    | 5200000000001112   | 3 digits on the back | 1234         | 5200 0000 0000 1112 | Master Card      |
    | 5200000000001021   | 3 digits on the back | 1234         | 5200 0000 0000 1021 | Master Card      |


@automated @psd2
Scenario Outline: Validate order confirmation page with V1 3DS cards payments
  Given I navigate to "lowPriceDressPDP"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to international delivery options as guest user
  Then I should see "internationalDeliveryHeader" as "WHERE ARE WE DELIVERING TO?" on "deliveryOptionPage"
  When I provide Australia address details and navigate to delivery options under it
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  Then I am in view of "newAddressText" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  Then I select new billing address and provide UK address details and use this address
  And I should see "editAddressLink" exist on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  Then I click on "creditCardDateJanMonth" on "paymentPage"
  And I click on "creditCardDateNextYear" on "paymentPage"
  And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I should see "threeDSiFrame" exist on "paymentPage"
  And I should see "threeDSProgressNotification" as "Please don't close or refresh this window. Your order is being processed." on "paymentPage"
  # And I switch to iFrame and submit the password  (in POC)
  And I should see "orderNumber" exist on "orderConfirmationPage"
  Examples:
  | credit_card_number | sec_num_digits_text  | security_num |cc_number           | icon_type        |
  | 4000000000000002   | 3 digits on the back | 123          |4000 0000 0000 0002 |VISA              |


@automated @psd2
Scenario Outline: Validate order confirmation page with V2 3DS cards payments
  Given I navigate to "lowPriceDressPDP"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to international delivery options as guest user
  Then I should see "internationalDeliveryHeader" as "WHERE ARE WE DELIVERING TO?" on "deliveryOptionPage"
  When I provide Australia address details and navigate to delivery options under it
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  Then I am in view of "newAddressText" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  Then I select new billing address and provide UK address details and use this address
  And I should see "editAddressLink" exist on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  Then I click on "creditCardDateJanMonth" on "paymentPage"
  And I click on "creditCardDateNextYear" on "paymentPage"
  And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I should see "threeDSiFrame" exist on "paymentPage"
  And I should see "threeDSProgressNotification" as "Please don't close or refresh this window. Your order is being processed." on "paymentPage"
  # And I switch to iFrame and submit the password(in POC)
  And I should see "orderNumber" exist on "orderConfirmationPage"
  Examples:
  | credit_card_number | sec_num_digits_text  | security_num |cc_number           | icon_type        |
  | 4000000000001117   | 3 digits on the back | 123          |4000 0000 0000 1117 | VISA             |
