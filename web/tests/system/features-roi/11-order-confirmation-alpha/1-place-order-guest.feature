Feature: Test Debenhams Order Confirmation Guest Flow

@automatedPayment
Scenario: Navigate to Debenhams PDP page and add product to bag
  Given I logout
  Then I navigate to "testDressPdpURL"
  And I select available size from "swatch"
  Then I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later

@automatedPayment
Scenario: Navigate to Debenhams delivery option as guest user
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  And I should see "deliveryTypeheaderTextInt" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I select home delivery and provide IE address details and navigate to delivery options under it
# Then I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"

@automatedPayment
Scenario: Navigate to Debenhams payment page and validate as a guest user
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  And I should see "beautyCardAccordion" as "Pay with a Reward Club card" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordionUk" as "Pay with a Credit or Debit card" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"

@automatedPayment
Scenario Outline: Navigate to Debenhams payment page and provide visa credit card icon
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


@automatedPayment
Scenario Outline: Navigate to Debenhams payment page and provide Expiry and CVV number
 When I am in view of "creditCardIDField" on "paymentPage"
 Then I click on "creditCardDateJanMonth" on "paymentPage"
 And I click on "creditCardDateNextYear" on "paymentPage"
 And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
 Then I click on "placeOrderButton" on "paymentPage"

Examples:
  | security_num |
  | 123          |


@automatedPayment
Scenario: Validate the web loyalty pop up on order confirmation page and print the order number
  Then I should see "webLoyaltyPopUp" exist on "orderConfirmationPage"
  And I should see "webLoyaltySection" exist on "orderConfirmationPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"
