Feature: Test Debenhams Payment Page Pay By Beauty Club Card

@automated @DEBD-846 @DEBD-222
Scenario: Validate the Payment Page For Beauty Products For Registered User And Reward Card has balance more than £0
  Given I logout
  Then I am on my details page
  And I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "pdpBeautyColorProduct"
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
  Then I should see "beautyCardAccordionTitle" as "Pay with a Beauty Club card" on "paymentPage"
  When I click on "beautyCardAccordion" on "paymentPage"
  Then I should see "beautyCardImages" exist on "paymentPage"
  And I should see "beautyCardIDField" exist on "paymentPage"
  And I should see "beautyCardPreID" as "633586" on "paymentPage"
  And I should see "beautyCardPinField" exist on "paymentPage"
  And I should see "beautyCardSaveCheckbox" exist on "paymentPage"
  And I should see "beautyCardApplyButton" exist on "paymentPage"
  And I should see "beautyCardPreID" as "633586" on "paymentPage"
  And I should see "beautyClubCardPointPreID" as "63383" on "paymentPage"

@automated @DEBD-222
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card error message for empty fields
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<beauty_card_number>" in "beautyCardIDField" on "paymentPage"
  And I enter "<beauty_card_pin>" in "beautyCardPinField" on "paymentPage"
  And I click on "beautyCardApplyButton" on "paymentPage"
  Then I should see "beautyCardIDError" as "Please enter a valid card number." on "paymentPage"
  And I should see "beautyCardPinError" as "Please enter your PIN." on "paymentPage"

  Examples:
    | beauty_card_number | beauty_card_pin |
    |                    |                 |

@automated @DEBD-222
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card error message for less than 16 digits
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<beauty_card_number>" in "beautyCardIDField" on "paymentPage"
  And I click on "beautyCardApplyButton" on "paymentPage"
  Then I should see "beautyCardIDError" as "Your Reward ID must be 16 digits." on "paymentPage"

  Examples:
    | beauty_card_number |
    | 0000               |

@automated @DEBD-222
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card error message for incorrect card details
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<beauty_card_number>" in "beautyCardIDField" on "paymentPage"
  And I enter "<beauty_card_pin>" in "beautyCardPinField" on "paymentPage"
  And I click on "beautyCardApplyButton" on "paymentPage"
  Then I should see "errorMessage" as "Invalid card number - please try again" on "paymentPage"

  Examples:
    | beauty_card_number | beauty_card_pin |
    | 0000111122         | 0000            |

@automated @DEBD-222
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card for correct card details and then removing it
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<beauty_card_number>" in "beautyCardIDField" on "paymentPage"
  And I enter "<beauty_card_pin>" in "beautyCardPinField" on "paymentPage"
  Then I wait for "2000" milliseconds
  Then I should see "beautyCardAppliedValue" exist on "paymentPage"
  And I click on "beautyCardApplyButton" on "paymentPage"
  Then I wait for "2000" milliseconds
  Then I should see "beautyCardAppliedRemoveLink" exist on "paymentPage"
  When I click on "beautyCardAppliedRemoveLink" on "paymentPage"
  Then I should see "beautyCardIDField" exist on "paymentPage"
  And I should see "beautyCardPinField" exist on "paymentPage"
  And I should see "beautyCardApplyButton" exist on "paymentPage"

  Examples:
    | beauty_card_number | beauty_card_pin |
    | 4917026678         | 4825            |


@manual @DEBD-222 @awsManual
Scenario: Validate the Payment Page For Beauty Products For Guest User
Then I should see "rewardIDField" as field with 633586 pre-fix populated (can enter 10 characters max.)
Then I should see "availableBalanceMessage" as "You have £XXX on your card to spend" on "paymentPage"
When I click on "useThisCardCTA" on "paymentPage"
Then I should see "payWithBeautyClubCardAccordion" goes teal
And I should see "totalToPay" as updated on "paymentPage" (balance covered by beauty card & total remaining)

@manual @DEBD-846 @DEBD-222 @awsManual
Scenario: Validate the Payment Page For Beauty Products For Guest User And Reward Card covers the full balance
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  Then I should see "beautyPointsContainer" exist on "paymentPage"
  When I click on "payWithBeautyClubCardAccordion" on "paymentPage"
  Then I should see "payWithBeautyClubCardAccordion" as "open" on "paymentPage"
  When I enter "validRewardId" in "rewardIDField" on "paymentPage"
  And I enter "validPin" in "PinField" on "paymentPage"
  Then I should see "checkingSpinner" exist on "paymentPage"
  And I wait for "2000" milliseconds
  When I click on "useThisCardCTA" on "paymentPage"
  Then I should see "applyingBeautyCardSpinner" exist on "paymentPage"
  And I wait for "2000" milliseconds
  And I should see "payWithCardAccordion" as "closed" on "paymentPage"
  And I should see "payWithCardAccordion" as "grey" on "paymentPage"
  And I should see "payWithGiftCardAccordion" as "closed" on "paymentPage"
  And I should see "payWithGiftCardAccordion" as "grey" on "paymentPage"


@manual @DEBD-222 @awsManual
Scenario: Validate the Payment Page For Beauty Products For Guest User And Reward Card covers the full balance
  And I should see "payWithCardAccordion" as moved underneath the billing address
  And I should see "payWithGiftCardAccordion" as moved underneath the billing address

@automated @DEBD-222
Scenario Outline: Validate the Payment Page For Beauty Products For Registered User And have saved Reward Card with rewards to spend on card
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<emailSavedRewardCard>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<passwordSavedRewardCard>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
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
  Then I should see "beautyCardAccordionTitle" as "Pay with a Beauty Club card" on "paymentPage"
  And I should see "beautyClubCardPointContainer" exist on "paymentPage"
  And I should see "beautyCardAccordionInfo" exist on "paymentPage"
  When I click on "beautyCardAccordion" on "paymentPage"
  Then I should see "beautyCardAppliedValue" exist on "paymentPage"
  And I should see "beautyCardPinField" as "" on "paymentPage"
  And I should not see "beautyCardSaveCheckbox" on "paymentPage"
  And I enter "<validPin>" in "beautyCardPinField" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "beautyCardAppliedValue" exist on "paymentPage"
  When I click on "beautyCardApplyButton" on "paymentPage"
  And I wait for "2000" milliseconds
  And I should see "beautyCardAppliedText" as "Beauty Club card applied" on "paymentPage"

Examples:
 |emailSavedRewardCard           |passwordSavedRewardCard |validPin   |
 |testsavedrewardcard@test.com   |Sapient123              |6919       |

  @manual @DEBD-222 @awsManual
Scenario: Validate the Payment Page For Beauty Products For Registered User And have saved Reward Card with rewards to spend on card
  Then I should see "availableBalanceMessage" as "You have £XXX on your card to spend" on "paymentPage"
  Then I should see "rewardIDField" populated with saved beauty card

@automated @DEBD-222
Scenario Outline: Validate the Payment Page For Beauty Products For Registered User And have saved Reward Card and press use this this card without entering Pin
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<emailSavedRewardCard>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<passwordSavedRewardCard>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
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
  And I should see "beautyClubCardPointContainer" exist on "paymentPage"
  When I click on "beautyCardAccordion" on "paymentPage"
  Then I should see "beautyCardAppliedValue" exist on "paymentPage"
  And I should see "beautyCardPinField" as "" on "paymentPage"
  When I click on "beautyCardApplyButton" on "paymentPage"
  And I wait for "2000" milliseconds
  And I should see "beautyCardPinError" as "Please enter your PIN." on "paymentPage"

Examples:
 |emailSavedRewardCard           |passwordSavedRewardCard |
 |testsavedrewardcard@test.com   |Sapient123              |

@manual @DEBD-222
Scenario: Validate saving beauty clup card
  Given I logout
  Then I am on my details page and do not have saved beauty card
  When I leave the save card checkbox ticked
  And I place an order
  Then the beauty card will saved to my account

@manual @DEBD-222 @awsManual
Scenario: Validate not saving beauty clup card
  Given I logout
  Then I am on my details page and do not have saved beauty card
  When I untick the save card checkbox
  And I place an order
  Then the beauty card will not be saved to my account

