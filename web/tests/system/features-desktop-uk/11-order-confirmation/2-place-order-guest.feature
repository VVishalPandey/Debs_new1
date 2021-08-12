Feature: Test Debenhams place order on alpha using guest journey

@automatedPayment
Scenario: Validate the product gets added in my when user select add to bag
  Given I navigate to "testBeautyLipGlowfPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testBeautyLipGlowfProductName" product name exist on myBagPage
  And I store details from myBag to validate later

@automatedPayment
Scenario: Navigate to payments page with new delivery address and delivery option selected as standard
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  When I select home delivery and provide UK address details and navigate to delivery options under it
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

@automatedPayment
Scenario: On Payment page add a new delivery address which handle PCA address also
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  Then I am in view of "newAddressText" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  Then I select new billing address and provide UK address details and use this address
  And I should see "editAddressLink" exist on "paymentPage"
  And I should not see "findAddressButton" on "paymentPage"
  And I should not see "useAddressButton" on "paymentPage"
  And I should not see "bfpoLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"
  And I should not see "enterAddressManuallyLink" on "paymentPage"

@automatedPayment
Scenario Outline: Add a beauty card and make the payment
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I click on "beautyCardAccordion" on "paymentPage"
  And I enter "<beauty_card_number>" in "beautyCardIDField" on "paymentPage"
  And I enter "<beauty_card_pin>" in "beautyCardPinField" on "paymentPage"
  Then I should see "beautyCardAppliedValue" exist on "paymentPage"
  And I click on "beautyCardApplyButton" on "paymentPage"
  Then I should see "beautyCardAppliedRemoveLink" exist on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"

  Examples:
    | beauty_card_number | beauty_card_pin |
    | 4934884018         | 0406            |
  
@automatedPayment
Scenario: Validate the web loyalty pop up on order confirmation page and print the order number
  Then I should see "webLoyaltyPopUp" exist on "orderConfirmationPage"
  And I should see "webLoyaltySection" exist on "orderConfirmationPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"