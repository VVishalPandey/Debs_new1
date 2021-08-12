Feature: Test Debenhams order placement with different cards (gift/beauty/mixed cards)

@automated @psd2
Scenario Outline: Validate order confirmation page with gift card payments
  Given I navigate to "lowPriceDressPDP"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as ghost user with UK address
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  When I click on "giftCardAccordion" on "paymentPage"
  Then I should see "giftCardHeaderText" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I should see "giftCardValue" exist on "paymentPage"
  When I click on "giftCardApplyButton" on "paymentPage"
  And I should see "giftCard1AppliedText" as "Gift card applied" on "paymentPage"
  And I should see "giftCard1AppliedValue" exist on "paymentPage"
  And I should see "giftCard1AppliedRemoveLink" exist on "paymentPage"
  And I should see "totalPayValue" as "£0.00" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"
  Examples:
  | gift_card_number   | gift_card_pin |
  | 6338309200522766   | 5662          |


@automated @psd2
Scenario Outline: Validate order confirmation page with beauty card payments
  Given I navigate to "lowestPriceBeautyPdp"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as ghost user with UK address
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  When I am in view of "beautyCardAccordion" on "paymentPage"
  And I should see "beautyCardAccordionTitle" as "Pay with a Beauty Club card" on "paymentPage"
  When I click on "beautyCardAccordion" on "paymentPage"
  Then I should see "beautyCardPreID" as "633586" on "paymentPage"
  And I enter "<beauty_card_number>" in "beautyCardIDField" on "paymentPage"
  And I enter "<beauty_card_pin>" in "beautyCardPinField" on "paymentPage"
  And I should see "beautyCardValue" exist on "paymentPage"
  When I click on "beautyCardApplyButton" on "paymentPage"
  And I should see "beautyCardAppliedText" as "Beauty Club Card applied" on "paymentPage"
  And I should see "beautyCardAppliedValue" exist on "paymentPage"
  And I should see "beautyCardAppliedRemoveLink" exist on "paymentPage"
  And I should see "totalPayValue" as "£0.00" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"
  Examples:
  | beauty_card_number  | beauty_card_pin |
  | 4934884018          | 0406          |

@manual @psd2
Scenario Outline: Validate order confirmation page with mixed card (Gift+Credit Card)payments
  Given I navigate to "lowPriceDressPDP"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as ghost user with UK address
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  When I click on "giftCardAccordion" on "paymentPage"
  Then I should see "giftCardHeaderText" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I should see "giftCardValue" exist on "paymentPage"
  When I click on "giftCardApplyButton" on "paymentPage"
  And I should see "giftCard1AppliedText" as "Gift card applied" on "paymentPage"
  And I should see "giftCard1AppliedValue" exist on "paymentPage"
  And I should see "giftCard1AppliedRemoveLink" exist on "paymentPage"
  And I should see "totalPayValue" is greater than "£0.00" on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  Then I click on "creditCardDateJanMonth" on "paymentPage"
  And I click on "creditCardDateNextYear" on "paymentPage"
  And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"
  Examples:
  | gift_card_number   | gift_card_pin | credit_card_number | sec_num_digits_text  | security_num | cc_number           | icon_type        |
  | 6335865107947557   | 9701          | 4111111111111111   | 3 digits on the back | 123          | 4111 1111 1111 1111 | VISA             |
