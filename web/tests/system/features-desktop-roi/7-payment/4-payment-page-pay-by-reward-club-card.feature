Feature: Test Debenhams Payment Page Pay By Reward Club Card

@automated @DEBD-1098 @DEBD-227
Scenario: Validate the Payment Page For Registered User And Reward Card has balance more than £0
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "testDressPdpURL"
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
  Then I should see "rewardCardAccordionTitle" as "Pay with a Reward Club card" on "paymentPage"
  When I click on "rewardCardAccordion" on "paymentPage"
  Then I should see "rewardCardImages" exist on "paymentPage"
  And I should see "rewardCardIDField" exist on "paymentPage"
  And I should see "rewardCardPreID" as "633586" on "paymentPage"
  And I should see "rewardCardPinField" exist on "paymentPage"
  And I should see "rewardCardSaveCheckbox" exist on "paymentPage"
  And I should see "rewardCardApplyButton" exist on "paymentPage"
  And I should see "rewardCardPreID" as "633586" on "paymentPage"

@automated @DEBD-227
Scenario Outline: Navigate to Debenhams payment page and validate the reward club card error message for empty fields
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<reward_card_number>" in "rewardCardIDField" on "paymentPage"
  And I enter "<reward_card_pin>" in "rewardCardPinField" on "paymentPage"
  And I click on "rewardCardApplyButton" on "paymentPage"
  Then I should see "rewardCardIDError" as "Please enter a valid card number." on "paymentPage"
  And I should see "rewardCardPinError" as "Please enter your PIN." on "paymentPage"

  Examples:
    | reward_card_number | reward_card_pin |
    |                    |                 |

@automated @DEBD-227
Scenario Outline: Navigate to Debenhams payment page and validate the reward club card error message for less than 16 digits
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<reward_card_number>" in "rewardCardIDField" on "paymentPage"
  And I click on "rewardCardApplyButton" on "paymentPage"
  Then I should see "rewardCardIDError" as "Your Reward ID must be 16 digits." on "paymentPage"

  Examples:
    | reward_card_number |
    | 0000               |

@automated @DEBD-227
Scenario Outline: Navigate to Debenhams payment page and validate the reward club card error message for incorrect card details
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<reward_card_number>" in "rewardCardIDField" on "paymentPage"
  And I enter "<reward_card_pin>" in "rewardCardPinField" on "paymentPage"
  And I click on "rewardCardApplyButton" on "paymentPage"
  Then I should see "genericErrorMessage" as "Invalid card number - please try again" on "paymentPage"

  Examples:
    | reward_card_number | reward_card_pin |
    | 0000111122         | 0000            |

@automated @DEBD-227
Scenario Outline: Navigate to Debenhams payment page and validate the reward club card for correct card details and then removing it
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<reward_card_number>" in "rewardCardIDField" on "paymentPage"
  And I enter "<reward_card_pin>" in "rewardCardPinField" on "paymentPage"
  Then I wait for "2000" milliseconds
  Then I should see "rewardCardAppliedValue" exist on "paymentPage"
  And I click on "rewardCardApplyButton" on "paymentPage"
  Then I wait for "2000" milliseconds
  Then I should see "rewardCardAppliedRemoveLink" exist on "paymentPage"
  When I click on "rewardCardAppliedRemoveLink" on "paymentPage"
  Then I should see "rewardCardIDField" exist on "paymentPage"
  And I should see "rewardCardPinField" exist on "paymentPage"
  And I should see "rewardCardApplyButton" exist on "paymentPage"

  Examples:
    | reward_card_number | reward_card_pin |
    | 5818497017         | 0852            |


@manual @DEBD-227
Scenario: Validate the Payment Page For reward Products For Guest User
Then I should see "rewardIDField" as field with 633586 pre-fix populated (can enter 10 characters max.)
Then I should see "availableBalanceMessage" as "You have £XXX on your card to spend" on "paymentPage"
When I click on "useThisCardCTA" on "paymentPage"
Then I should see "payWithrewardClubCardAccordion" goes teal
And I should see "totalToPay" as updated on "paymentPage" (balance covered by reward card & total remaining)

@manual @DEBD-1098 @DEBD-227
Scenario: Validate the Payment Page For reward Products For Guest User And Reward Card covers the full balance
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdprewardColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  Then I should see "rewardPointsContainer" exist on "paymentPage"
  When I click on "payWithrewardClubCardAccordion" on "paymentPage"
  Then I should see "payWithrewardClubCardAccordion" as "open" on "paymentPage"
  When I enter "validRewardId" in "rewardIDField" on "paymentPage"
  And I enter "validPin" in "PinField" on "paymentPage"
  Then I should see "checkingSpinner" exist on "paymentPage"
  And I wait for "2000" milliseconds
  When I click on "useThisCardCTA" on "paymentPage"
  Then I should see "applyingrewardCardSpinner" exist on "paymentPage"
  And I wait for "2000" milliseconds
  And I should see "payWithCardAccordion" as "closed" on "paymentPage"
  And I should see "payWithCardAccordion" as "grey" on "paymentPage"
  And I should see "payWithGiftCardAccordion" as "closed" on "paymentPage"
  And I should see "payWithGiftCardAccordion" as "grey" on "paymentPage"


@manual @DEBD-227
Scenario: Validate the Payment Page For reward Products For Guest User And Reward Card covers the full balance
  And I should see "payWithCardAccordion" as moved underneath the billing address
  And I should see "payWithGiftCardAccordion" as moved underneath the billing address

@automated @DEBD-227
Scenario Outline: Validate the Payment Page For reward Products For Registered User And have saved Reward Card with rewards to spend on card
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<emailSavedRewardCard>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<passwordSavedRewardCard>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "pdpKidRangeProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  Then I wait for "3000" milliseconds
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "rewardCardAccordionTitle" as "Pay with a reward Club card" on "paymentPage"
  And I should see "rewardClubCardPointContainer" exist on "paymentPage"
  And I should see "rewardCardAccordionInfo" exist on "paymentPage"
  When I click on "rewardCardAccordion" on "paymentPage"
  Then I should see "rewardCardAppliedValue" exist on "paymentPage"
  And I should see "rewardCardPinField" as "" on "paymentPage"
  And I should not see "rewardCardSaveCheckbox" on "paymentPage"
  And I enter "<validPin>" in "rewardCardPinField" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "rewardCardAppliedValue" exist on "paymentPage"
  When I click on "rewardCardApplyButton" on "paymentPage"
  And I wait for "2000" milliseconds
  And I should see "rewardCardAppliedText" as "reward Club card applied" on "paymentPage"

Examples:
 |emailSavedRewardCard           |passwordSavedRewardCard |validPin   |
 |testsavedrewardcard@test.com   |Sapient123              |0852       |

  @manual @DEBD-227
Scenario: Validate the Payment Page For reward Products For Registered User And have saved Reward Card with rewards to spend on card
  Then I should see "availableBalanceMessage" as "You have £XXX on your card to spend" on "paymentPage"
  Then I should see "rewardIDField" populated with saved reward card

@automated @DEBD-227
Scenario Outline: Validate the Payment Page For reward Products For Registered User And have saved Reward Card and press use this this card without entering Pin
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<emailSavedRewardCard>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<passwordSavedRewardCard>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "pdpKidRangeProduct"
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
  And I should see "rewardClubCardPointContainer" exist on "paymentPage"
  When I click on "rewardCardAccordion" on "paymentPage"
  Then I should see "rewardCardAppliedValue" exist on "paymentPage"
  And I should see "rewardCardPinField" as "" on "paymentPage"
  When I click on "rewardCardApplyButton" on "paymentPage"
  And I wait for "2000" milliseconds
  And I should see "rewardCardPinError" as "Please enter your PIN." on "paymentPage"

Examples:
 |emailSavedRewardCard           |passwordSavedRewardCard |
 |testsavedrewardcard@test.com   |Sapient123              |

@manual @DEBD-227
Scenario: Validate saving reward clup card
  Given I logout
  Then I am on my details page and do not have saved reward card
  When I leave the save card checkbox ticked
  And I place an order
  Then the reward card will saved to my account

@manual @DEBD-227
Scenario: Validate not saving reward clup card
  Given I logout
  Then I am on my details page and do not have saved reward card
  When I untick the save card checkbox
  And I place an order
  Then the reward card will not be saved to my account

