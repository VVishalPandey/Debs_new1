Feature: Test Debenhams order E2E journeys

@automated  @DEBD-1978 @DEBD-1977
Scenario Outline: Navigate to Order confirmation page as a ccc user  with test data card
  Given I logout
  When I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  Then I should see "cccshopOnBehalfBanner" containing "You are shopping on behalf of a Guest Customer" on "cccLoginPage"
  When I "Remove" "all" products from "myBagPage"
  And I navigate to "testBeautyPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "5000" milliseconds
  When I click on "checkoutButton" on "myBagPage"
  And I wait for "5000" milliseconds
  When I select home delivery and provide IE address details and navigate to delivery options under it
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "5000" milliseconds
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  Then I click on "creditCardDateJanMonth" on "paymentPage"
  And I click on "creditCardDateNextYear" on "paymentPage"
  And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I wait for "5000" milliseconds
  Then I should see "cccshopOnBehalfBanner" containing "You are shopping on behalf of a Guest Customer" on "cccLoginPage"
  And I should see "webLoyaltyPopUp" exist on "orderConfirmationPage"
  And I should see "webLoyaltySection" exist on "orderConfirmationPage"


  Examples:
   | credit_card_number | icon_type | sec_num_digits_text  | cc_number           | security_num |
   | 4000000000001000   | visa      | 3 digits on the back | 4000 0000 0000 1000 | 123          |
   | 4000000000001117   | visa      | 3 digits on the back | 4000 0000 0000 1117 | 123          |
   | 5200000000001005   | master    | 3 digits on the back | 5200 0000 0000 1005 | 123          |
   | 5200000000001096   | master    | 3 digits on the back | 5200 0000 0000 1096 | 123          |
   | 4000000000000002   | visa      | 3 digits on the back | 4000 0000 0000 0002 | 123          |
   | 4000000000000119   | visa      | 3 digits on the back | 4000 0000 0000 0119 | 123          |
   | 5200000000000007   | master    | 3 digits on the back | 5200 0000 0000 0007 | 123          |
   | 5200000000000106   | master    | 3 digits on the back | 5200 0000 0000 0106 | 123          |
   | 6759410000006404   | maestro   | 3 digits on the back | 6759 4100 0000 6404 | 123          |
   | 6759411100000008   | maestro   | 3 digits on the back | 6759 4111 0000 0008 | 123          |