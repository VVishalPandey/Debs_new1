Feature: Test Debenhams Payment page Pay By Gift Card

@automated @DEBD-279
Scenario: Validate the Gift Card Container on the Payment Page For Registered User
  Given I logout
  Then I am on my details page
  And I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
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
  And I should see "giftCardIDField" exist on "paymentPage"
  And I should see "giftCardPinField" exist on "paymentPage"
  And I should see "giftCardApplyButton" exist on "paymentPage"

@automated @DEBD-279
Scenario Outline: Navigate to Debenhams payment page and validate the gift card error message for empty fields
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "giftCardIDError" as "Please enter your Gift card number." on "paymentPage"
  And I should see "giftCardPinError" as "Please enter a valid 4 digit PIN." on "paymentPage"

  Examples:
    | gift_card_number | gift_card_pin |
    |                  |               |

@automated @DEBD-279
Scenario Outline: Navigate to Debenhams payment page and validate the gift card error message for less than 16 digits
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "giftCardIDError" as "Your Gift card number must be at least 16 digits." on "paymentPage"

  Examples:
    | gift_card_number |
    | 0000             |

@automated @DEBD-279
Scenario Outline: Navigate to Debenhams payment page and validate the gift card error message for incorrect card details
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "errorMessage" as "Invalid card number - please try again" on "paymentPage"

  Examples:
    | gift_card_number | gift_card_pin |
    | 0000111122223333 | 0000          |

@automated @DEBD-279
Scenario Outline: Navigate to Debenhams payment page and validate the gift card applied
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "giftCardValue" as "<gift_card_value>" on "paymentPage"
  When I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "errorMessage" as "SORRY, THERE ARE INSUFFICIENT FUNDS AVAILABLE ON YOUR GIFT CARD." on "paymentPage"

  Examples:
    | gift_card_number | gift_card_pin | gift_card_value |
    | 6338309524892655 | 2243          | £0.00         |


@manual @DEBD-279
Scenario: Validate the applying/removing Gift Cards on the Payment Page For Guest User
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  When I click on "payWithGiftCardAccordion" on "paymentPage"
  Then I should see "payWithGiftCardAccordion" as "open" on "paymentPage"
  When I enter "validGiftCardNumber" in "giftCardNumberField" on "paymentPage"
  And I enter "validGiftCardPin" in "giftCardPinField" on "paymentPage"
  Then I should see "checkingBalanceSpinner" exist on "paymentPage"
  And I wait for "2000" milliseconds
  And I should see "balanceOfGiftCard" exist on "paymentPage"
  When I click on "applyGiftCardCTA" on "paymentPage"
  Then I should see "transititionStateLoader" exist on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "payWithGiftCardAccordion" as "green" on "paymentPage"
  And I should see "giftCardAppliedMessage" exist on "paymentPage"
  And I should see "giftCardAppliedMessage" as "Gift card applied" on "paymentPage"
  And I should see "giftCardNumber" exist on "paymentPage"
  And I should see "giftCardBalance" exist on "paymentPage"
  And I should see "giftCardRemainingBalance" exist on "paymentPage"
  And I should see "giftCardRemoveLink" exist on "paymentPage"
  When I click on "giftCardRemoveLink" on "paymentPage"
  Then I should see "removeTransitionLoader" exist on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "totalToPay" as updated on "paymentPage"
  And I should not see "giftCardAppliedMessage" on "paymentPage"

@manual @DEBD-279
Scenario: Validate the applying two Gift Cards on the Payment Page
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  When I click on "payWithGiftCardAccordion" on "paymentPage"
  When I enter "validGiftCardNumber" in "giftCardNumberField" on "paymentPage"
  And I enter "validGiftCardPin" in "giftCardPinField" on "paymentPage"
  When I click on "applyGiftCardCTA" on "paymentPage"
  And I should see "giftCardAppliedMessage" exist on "paymentPage"
  And I should see "giftCardAppliedMessage" as "Gift card applied" on "paymentPage"
  And I should see "totalToPay" as updated on "paymentPage"
  And I should see "addAnotherGiftCardLink" exist on "paymentPage"
  When I click on "addAnotherGiftCardLink" on "paymentPage"
  Then I should see "payWithGiftCardAccordion" as "open" on "paymentPage"
  And I should see "payWithGiftCardMessage" exist on "paymentPage"
  And I should see "payWithGiftCardMessage" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"
  And I should see "giftCardNumberField" exist on "paymentPage"
  And I should see "giftCardPinField" exist on "paymentPage"
  And I should see "applyGiftCardCTA" exist on "paymentPage"
  And I should see "applyGiftCardCTA" as enabled on "paymentPage"
  When I click on "applyGiftCardCTA" on "paymentPage"
  Then I should see "payWithGiftCardAccordion" as "green" on "paymentPage"
  And I should see "giftCardAppliedMessage" exist on "paymentPage"
  And I should see "giftCardAppliedMessage" as "Gift card applied" on "paymentPage"
  And I should see "giftCardNumber" exist on "paymentPage"
  And I should see "giftCardBalance" exist on "paymentPage"
  And I should see "giftCardRemainingBalance" exist on "paymentPage"
  And I should see "giftCardRemoveLink" exist on "paymentPage"
  And I should see "giftCardAppliedMessageForSecondGiftCard" exist on "paymentPage"
  And I should see "removeLinkForSecondGiftCard" exist on "paymentPage"

@manual @DEBD-279
Scenario: Validate the applying two Gift Cards on the Payment Page  and the two gift cards also do not cover the whole payment For Guest User
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  When I click on "payWithGiftCardAccordion" on "paymentPage"
  When I enter "validGiftCardNumber" in "giftCardNumberField" on "paymentPage"
  And I enter "validGiftCardPin" in "giftCardPinField" on "paymentPage"
  When I click on "applyGiftCardCTA" on "paymentPage"
   And I should see "totalToPay" as updated on "paymentPage"
  And I should see "addAnotherGiftCardLink" exist on "paymentPage"
  When I click on "addAnotherGiftCardLink" on "paymentPage"
  Then I should see "payWithGiftCardAccordion" as "open" on "paymentPage"
  And I should see "payWithGiftCardMessage" exist on "paymentPage"
  And I should see "payWithGiftCardMessage" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"
  And I should see "giftCardNumberField" exist on "paymentPage"
  And I should see "giftCardPinField" exist on "paymentPage"
  And I should see "applyGiftCardCTA" exist on "paymentPage"
  And I should see "applyGiftCardCTA" as enabled on "paymentPage"
  When I click on "applyGiftCardCTA" on "paymentPage"
  Then I should see "errorMessage" exist on "paymentPage"
  And I should not see "giftCardAppliedMessageForSecondGiftCard" on "paymentPage"
