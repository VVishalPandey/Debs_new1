Feature: Test Debenhams order placement with different cards (non3ds/V1/V2 cards) for ROI

@automatedPaymentTest @psd2
Scenario Outline: Validate order confirmation page with non 3DS cards payments
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  When I navigate to "<pdp_url>"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "5000" milliseconds
  When I should scroll to "checkoutButton" on "myBagPage"
  When I navigate from basket page to delivery page as a "guest" user
  When I navigate to payment page of ROI with the delivery options as "<delivery_type>"
  When I procced the "<card_type>" card payment with "<credit_card_number>" using card pin as "<security_num>"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I wait for "7000" milliseconds
  And I should see "orderNumber" exist on "orderConfirmationPage"
  And I should see "deliveryTypeText" containing "<delivery_type>" on "orderConfirmationPage"
  When I am in view of "cardTypeHeaderText" on "orderConfirmationPage"
  And I should see "cardTypeHeaderText" containing "<card_type>" on "orderConfirmationPage"
  And I should see "cardNumberMasked" containing "<credit_card_number>" on "orderConfirmationPage"
  And I click on "logoDebenhams" on "commonPage"

  Examples:
    |pdp_url          |delivery_type |card_type| credit_card_number | security_num | icon_type        |
    |testDress2PdpURL  |Standard      |Credit   |4111111111111111| 123          | visa     |
    |testDressPdpURL  |Standard      |Credit   |6759270000000000| 1234          | maestro    |
    |nextDayDeliveryPdpURL  |Next      |Credit   |6759270000000000| 1234          | maestro     |
    |testDress2PdpURL  |Standard      |Credit   |5200000000001021| 123          | mastercard     |

@automatedPaymentTest @psd2
Scenario Outline: Validate order confirmation page with V1 & V2 3DS cards payments
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  When I navigate to "<pdp_url>"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "5000" milliseconds
  When I should scroll to "checkoutButton" on "myBagPage"
  When I navigate from basket page to delivery page as a "guest" user
  When I navigate to payment page of ROI with the delivery options as "<delivery_type>"
  When I procced the "<card_type>" card payment with "<credit_card_number>" using card pin as "<security_num>"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I wait for "7000" milliseconds
  And I should see "threeDSiFrame" exist on "paymentPage"
  And I should see "threeDSProgressNotification" as "Please don't close or refresh this window. Your order is being processed." on "paymentPage"
  And I switch to iFrame for 3ds and submit the password
  And I wait for "8000" milliseconds
  And I should see "orderNumber" exist on "orderConfirmationPage"
  And I should see "deliveryTypeText" containing "<delivery_type>" on "orderConfirmationPage"
  When I am in view of "cardTypeHeaderText" on "orderConfirmationPage"
  And I should see "cardTypeHeaderText" containing "<card_type>" on "orderConfirmationPage"
  And I should see "cardNumberMasked" containing "<credit_card_number>" on "orderConfirmationPage"
  And I click on "logoDebenhams" on "commonPage"

  Examples:
    |pdp_url              |delivery_type |card_type| credit_card_number | security_num | icon_type        |
    |testDress2PdpURL      |Standard      |Credit   |4000000000000002| 123     | visa             |
    |nextDayDeliveryPdpURL  |Next          |Credit   |340000000001130| 1234    | american-express     |
    |testDress2PdpURL      |Standard      |Credit   |5200000000001112| 123      | mastercard      |
    |testDress2PdpURL      |Standard      |Credit   |4000000000001117| 123        | visa             |


@automatedPaymentTest @psd2
Scenario Outline: Validate order confirmation page with gift and beauty card payments
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  When I navigate to "<pdp_url>"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "5000" milliseconds
  When I should scroll to "checkoutButton" on "myBagPage"
  When I navigate from basket page to delivery page as a "guest" user
  When I navigate to payment page of ROI with the delivery options as "<delivery_type>"
  When I procced the "<card_type>" card payment with "<card_number>" using card pin as "<security_num>"
  Then I click on "placeOrderButton" on "paymentPage"
  And I wait for "7000" milliseconds
  And I should see "orderNumber" exist on "orderConfirmationPage"
  And I should see "deliveryTypeText" containing "<delivery_type>" on "orderConfirmationPage"
  When I am in view of "cardTypeHeaderText" on "orderConfirmationPage"
  And I should see "cardTypeHeaderText" containing "<card_type>" on "orderConfirmationPage"
  And I should see "cardNumberMasked" containing "<card_number>" on "orderConfirmationPage"
  And I click on "logoDebenhams" on "commonPage"

  Examples:
    |pdp_url          |delivery_type |card_type| card_number | security_num |
    |lowPricePdpUrl     |Standard   |Gift     | 6338309307378047   |5981|

