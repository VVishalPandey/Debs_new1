Feature: Validate order confirmation page

@manual @DEBD-290 @DEBD-327
Scenario Outline: Validate  Order confirmation Page for Dress Product with International delivery and ghostuser
    Given I navigate to "DressPdp"
    And I add the product to bag and go to my bag page
    Then I navigate to delivery options as ghost user with International Address
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    When I enter "<credit_card_details_Type>" in "creditCardrequiredfields" on "paymentPage"
    And I click "placeOrderButton" on "paymentPage"
    And I scroll on "orderconfirmationPage"
    When  I click on "closeButtonCTA"
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
    Then I should not see "CreditcardpointText" containing " x no debenhams credit card rewards points could have been earned with your order" on "paymentPage"
    And I should not see "BeautypointText" contains " x no beauty rewards points have been earned with your order" on "OrderconfirmationPage"\
       Examples:
        | credit_card_details_Type |
        | Master Card              |
        | VISA                     |
        | Gift Card                |
        |CreditCard+ GiftCard      |


@manual @DEDB-320
Scenario: Validated create account from order confimation page as a guest user
    Given I navigate to "DressPdp"
    And I add the product to bag and go to my bag page
    Then I navigate to delivery options as Guest user with International Address
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    When I enter "<credit_card_details>" in "creditCardrequiredfields" on "paymentPage"
    And I click "placeOrderButton" on "paymentPage"
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

@manual @DEDB-1113
Scenario: Validated order confirmation Page for registered user with Paypal Payment method
    Given I navigate to "DressPdp"
    And I add the product to bag and go to my bag page
    Then I navigate to delivery options as registered user with International Address
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    And I click "Pay with Paypal" on "paymentPage"
    Then I should be redirected to "PayPal SandBox"
    And I click "Login" on "PayPal Sandbox"
    And I enter "PayPal Credentials" on "PayPal window"
    And I select "Card" from "Paypal window"
    And I click on "Pay with Paypal" from "Paypal window"
    And I should be redirected to "Order confirmation Page"
    And I should see "productImage" on "orderconfirmationPage"
    And I should see "productTitle" on "orderconfirmationPage"
    And I should see "productSize" on "orderconfirmationPage"
    And I should see "productColour" on "orderconfirmationPage"
    And I should see "productQuantity" on "orderconfirmationPage"
    Then I should see "payment information separated by a line" in "order summary" on "OrderconfirmationPage"
    And I am in view of "footerMenuSection" on "commonPage"
    And I should see  "Paidwith Paypal" under "Order summary" on "OrderconfirmationPage"
    And  And I should see my "Order details" in my accountI should see  "Billing Address details" under "Order summary" on "OrderconfirmationPage"
    And the billing address will be as per the address in my PayPal account







