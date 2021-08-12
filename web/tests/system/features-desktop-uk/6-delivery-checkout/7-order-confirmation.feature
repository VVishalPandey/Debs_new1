Feature: Validate order confirmation page

@manual @DEBD-1114 @DEBD-320 @DEBD-1113 @DEBD-327 @DEDB-213 @awsManual
Scenario Outline: Validate  Order confirmation Page for Dress Product with Standard home delivery and ghostuser
    Given I navigate to "DressPdp"
    And I add the product to bag and go to my bag page
    Then I navigate to delivery options as ghost user with UK address
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    When I enter "<card_details>" in "Cardrequiredfields" on "paymentPage"
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
    Then I should see "CreditcardpointText" containing " x no debenhams credit card rewards points could have been earned with your order" on "paymentPage"
      Examples:
            | credit_card_details_Type  |
            | Master Card               |
            | Maestro Card              |
            | VISA                      |
            | JCB                       |
            | american-express          |
            | Gift Card                 |
            | Beauty Card               |
            | Credit Card + Gift Card   |
            | Credit Card + Beauty Card |
            | Git Card + Beauty Card    |
            | Git Card+ Gift Card       |




@manual @DEBD-1114 @awsManual
Scenario: Validate  Order confirmation Page for Beauty product with click and collect delivery and debenhams credit card as a guest user
    Given I navigate to "BeautyPdp"
    And I add the product to bag and go to my bag page
    Then I navigate to delivery options as guest user with UK address
    And I select "clickandcollect" for "deliveryoption"
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    And I enter and apply "RewardspointId" on "paymentPage"
    When I enter "BeautyCardDteails" in "BeautyCardPaymentField" on "paymentPage"
    And I click "placeOrderButton" on "paymentPage"
    Then I should see "productImage" on "orderconfirmationPage"
    And I should see "productTitle" on "orderconfirmationPage"
    And I should see "productSize" on "orderconfirmationPage"
    And I should see "productColour" on "orderconfirmationPage"
    And I should see "productQuantity" on "orderconfirmationPage"
    Then I should see "payment information separated by a line" in "order summary" on "OrderconfirmationPage"
    And I am in view of "footerMenuSection" on "commonPage"
    And I should see  "Debenhams CreditCard Details" under "Order summary" on "OrderconfirmationPage"
    And I should see  "Billing Address details" under "Order summary" on "OrderconfirmationPage"
    And I should see "Last4digit" of the used Card on "OrderConfirmation Page"
    And I will see "Card Expiry Date" on "OrderConfirmation Page"
    And I will see "Paid Amount" on  "OrderConfirmation Page"
    And I will see "name" on  "OrderConfirmation Page"
    And I will see "email" on  "OrderConfirmation Page"
    And I will see "phoneNumber" on  "OrderConfirmation Page"
    Then I should see "CreditcardpointText" containing " x no debenhams credit card rewards points have been earned with your order" on "OrderconfirmationPage"
    And I should see "rewardspointText" contains " x no beauty rewards points have been earned with your order" on "OrderconfirmationPage"


@manual @DEDB-320 @awsManual
Scenario: Validated create account from order confimation page
    When I should see "create account container" on "orderconfirmationPage"
    And I should see "TealbordershoppingbagText" as "Make shopping faster and easier next time" on "orderconfirmationPage"
    And I should see "CreatePasswordTextField" on "orderconfirmationPage"
    And I should see "PasswordValidateContainer" on "orderconfirmationPage"
    And I should see "savemypaymentdetailscheckbox" on "orderconfirmationPage"
    And I should see "savePasswordCTA" on "orderconfirmationPage"
    When I enter "Password" in "CreatePasswordTextField" on "OrderConfirmationPage"
    And I click "savePasswordCTA" on "orderConfirmationPage"
    And I click "savemypaymentdetailscheckbox" on "orderConfirmationPage"
    And my Paymentdetails should be saved and it should be visible when I go to the payment page
    Then my password should be saved
    And I should see "Hi! name" on "commonPage"
    When  I place the order again
    And I should not see "CreateAccountContainer" on "orderconfirmationPage"
    And I'm able to remove my saved payment details form My account
    And I should see my "Recently Placed Order details" in my account


