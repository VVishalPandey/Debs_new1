Feature: Test Debenhams place order on alpha using registered journey



  @manual @DEBD-1114 @DEBD-320 @DEBD-1113 @DEBD-327 @DEDB-213 @awsManual
Scenario: Validate  Order confirmation Page for Dress Product with nextday delivery and registered user
    Given I navigate to "DressPdp"
    And I add the product to bag and go to my bag page
    Then I navigate to delivery options as registered user with UK address
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    When I enter "Debenhams Card details" in "Cardrequiredfields" on "paymentPage"
    And I click "placeOrderButton" on "paymentPage"
    Then I should see "webloyaltyPop-up" exist on "orderconfirmationPage"
    And I should see "webloyaltyPop-up" contain "Claim your cashback on your next Debenhams purchase!"
    And I should see "ContinueButtonLoyaltyPop-up" on "orderconfirmationPage"
    And I scroll on "orderconfirmationPage"
    Then I should see "webloyaltyPop" remain on the page until I click "closeButton"
    And I click on "ContinueButtonLoyaltyPop" on "OrderConfirmationPage"
    Then I get redirected to  "https://one-time-offer.com/" n new browser
    When  I click on "closeButtonCTA"
    Then  I should not see "webloyaltyPop-up" on "orderconfirmationPage"
    And I should not see "CreateAccountContainer" on "orderconfirmationPage"
    And I should see "productImage" on "orderconfirmationPage"
    And I should see "productTitle" on "orderconfirmationPage"
    And I should see "productSize" on "orderconfirmationPage"
    And I should see "productColour" on "orderconfirmationPage"
    And I should see "productQuantity" on "orderconfirmationPage"
    Then I should see "payment information separated by a line" in "order summary" on "OrderconfirmationPage"
    And I am in view of "footerMenuSection" on "commonPage"
    And I should see  "CreditCard Details" under "Order summary" on "OrderconfirmationPage"
    And I should see  "Billing Address details" under "Order summary" on "OrderconfirmationPage"
    And I should see "Last4digit" of the used Card on "OrderConfirmation Page"
    And I will see "Card Expiry Date" on "OrderConfirmation Page"
    And I will see "Paid Amount" on  "OrderConfirmation Page"
    And I will see "name" on  "OrderConfirmation Page"
    And I will see "email" on  "OrderConfirmation Page"
    And I will see "phoneNumber" on  "OrderConfirmation Page"
    Then I should see "CreditcardpointText" containing " x no debenhams credit card rewards points have been earned with your order" on "paymentPage"
    When I navigate to "Orderdetails" in "myaccount"
    Then I should see my placed order details


@manual @DEBD-1114 @awsManual
Scenario: Validate  Order confirmation Page for Dress Product with international delivery and registered user
  Given I navigate to "DressPdp"
  And I add the product to bag and go to my bag page
  Then I navigate to delivery options as registered user with Austrlian address
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  When I enter "Debenhams Card details" in "Cardrequiredfields" on "paymentPage"
  And I click "placeOrderButton" on "paymentPage"
  And I validate "Order summary" on "Order Confirmation Page"


