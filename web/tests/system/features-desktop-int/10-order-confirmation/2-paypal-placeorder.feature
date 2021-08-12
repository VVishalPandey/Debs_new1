Feature: Test Debenhams order placement with paypal

@automated @psd2
Scenario Outline: Test Debenhams Pay By Paypal on Payment page
  Given I navigate to "lowPriceDressPDP"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to international delivery options as guest user
  Then I should see "internationalDeliveryHeader" as "WHERE ARE WE DELIVERING TO?" on "deliveryOptionPage"
  When I provide Australia address details and navigate to delivery options under it
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I should see "creditCardIDField" exist on "paymentPage"
  And I should see "payPalAccordion" exist on "paymentPage"
  And I should see "payPalAccordionTitle" as "Pay with PayPal" on "paymentPage"
  And I should not see "payPalAccordionText" on "paymentPage"
  When I click on "payPalAccordion" on "paymentPage"
  And I should see "payPalAccordionText" exist on "paymentPage"
  And I should not see "creditCardIDField" on "paymentPage"
  And I should see "payPalAccordionText" as "<payPalText>" on "paymentPage"
  And I should see "placeOrderPayPalButton" exist on "paymentPage"
  When I click on "placeOrderPayPalButton" on "paymentPage"
  And I should see "url" contains "paypal.com"
  And I should see "payPalSection" exist on "paymentPage"
  And I should see "payPalLogo" exist on "paymentPage"
  Then I should see "payPalTagLine" as "Enter your email or mobile number to get started." on "paymentPage"
  When I enter "<email>" in "payPalEmailField" on "paymentPage"
  And I click on "payPalNextBtn" on "paymentPage"
  When I enter "<password>" in "payPalPasswordField" on "paymentPage"
  And I click on "paypalLoginBtn" on "paymentPage"
  Then I should see "payPalShippingName" as "TestFirstName UserLastName" on "paymentPage"
  Then I should see "payPalShippingAddress" as "11, Melbourne 1111" on "paymentPage"
  And I click on "payPalPayNowBtn" on "paymentPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"


Examples:
    | email                             | password | payPalText                                                                                                                                                              |
    | Del_CAD_paypal_test@debenhams.com | pass@101 | You will be directed to PayPal to complete payment and then returned to Debenhams for your order confirmation. Please click on 'Checkout with PayPal' button to proceed |
