Feature: Test Debenhams Regression scenarios 24 to 26 covering Furniture PDP, swatch order, single sku and Checkout Journey Furniture Product Guest User

@automated @ops-INT @Sno.-39
Scenario: Checkout Journey OB product Registerd User -Add product to Bag
  Given I logout
  Then I am on my details page
  Then I empty mini bag
  Then I navigate to "mantarayProduct"
  Then I select available size from "dropdown"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds

@automated @ops-INT @Sno.-41
Scenario: Navigate to delivery page with delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I select home delivery and provide new address details when already logged In and navigate to delivery options under it
  Then I should see "internationalOption" exist on "deliveryOptionPage"
  When I click on "internationalOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"

@automated @ops-INT @Sno.-41
Scenario: Navigate to payments page with delivery option as next/nominated day 
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  Then I click on "promoCodeAccordion" on "paymentPage"
  And I enter "PS01" in "promoCodeInputField" on "paymentPage"
  Then I click on "promoCodeApply" on "paymentPage"
  And I should see "promoCodeSuccessMsg" containing "PS01: Applied" on "paymentPage"
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  When I am in view of "editShoppingBagLink" on "paymentPage"
  Then I click on "editShoppingBagLink" on "paymentPage"
  And I should see "headerText" as "My Bag" on "myBagPage"
  Then I click on "incrementStepper" on "myBagPage"
  Then I should see value of "countInputField" as "2" on "myBagPage"
