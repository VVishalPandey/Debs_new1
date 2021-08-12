Feature: Test Debenhams Payment Page Pay By Multiple Payment Methods

@automated @DEBD-1098
Scenario Outline: Validate the Payment Page For Using Two Gift Cards
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "pdpLessThan25Euro"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I go back to previous page
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "giftCardAccordion" exist on "paymentPage"
  And I should see "giftCardAccordionLabel" as "Pay with a Gift card" on "paymentPage"
  When I click on "giftCardAccordion" on "paymentPage"
  And I should see "giftCardHeaderText" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"
  And I enter "<gift_card_number1>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin1>" in "giftCardPinField" on "paymentPage"
  And I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "giftCard1AppliedRemoveLink" exist on "paymentPage"
  And I should see "giftCard1AppliedText" as "Gift card applied" on "paymentPage"
  And I should see "giftCard1AppliedCard" containing "<gift_card_number1endingdigit>" on "paymentPage"
  And I should see "giftCardAddAnotherCardLink" exist on "paymentPage"
  And I click on "giftCardAddAnotherCardLink" on "paymentPage"
  And I should see "giftCardHeaderText" as "Use your Gift card to pay the remaining balance of your order." on "paymentPage"
  And I enter "<gift_card_number2>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin2>" in "giftCardPinField" on "paymentPage"
  And I click on "giftCardApplyButton" on "paymentPage"
  And I should see "giftCard2AppliedText" as "Gift card applied" on "paymentPage"
  And I should see "giftCard2AppliedCard" containing "<gift_card_number2endingdigit>" on "paymentPage"
  Then I should see "giftCard2AppliedRemoveLink" exist on "paymentPage"
  And I count number of "giftCard1AppliedCardRow" to be "2" on "paymentPage"


Examples:
  |email                               |password         |gift_card_number1        |gift_card_pin1       |gift_card_number1endingdigit       |gift_card_number2       |gift_card_pin2    |gift_card_number2endingdigit    |
  |testtwogiftcards@test.com           |Sapient123       |6335865046648696         |0534                 |8696                               |6335865045855268        |6936              |5268                            |
