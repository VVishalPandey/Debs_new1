Feature: Test Debenhams Pay By Paypal on Payment page

@automated @DEBD-190
Scenario Outline: Validate the Pay By PayPal Accordion on Payment Page For Registered User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
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
  Then I wait for "5000" milliseconds
  And I should see "url" contains "paypal.com"

Examples:
 |email                 |password                |payPalText                                                                                                                                                               |
 |testpaypal@test.com   |Sapient123              |You will be directed to PayPal to complete payment and then returned to Debenhams for your order confirmation. Please click on 'Checkout with PayPal' button to proceed  |

@manual @DEBD-190
Scenario: Validate the Pay By PayPal Accordion on Payment Page For Registered User
  Then the place order & pay CTA will change to a yellow pay with paypal CTA (branded paypal logo)
  When I click on "payWithPayPalCTA" on "paymentPage"
  Then I am taken to paypal (re-directs on same page) where I am prompted to log in to my paypal account

