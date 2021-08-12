Feature: Test Debenhams Payment Page Earn Reward Club Points

@automated @DEBD-170
Scenario Outline: Validate the Payment Page For reward Products For Registered User And Reward Card has balance more than £0
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
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
  Then I should see "rewardClubCardPointContainer" exist on "paymentPage"
  And I should see "rewardClubCardPointContainerText" containing "Earn" on "paymentPage"
  And I should see "rewardClubCardPointContainerText" containing "Earn 51 points on your Reward Club Card" on "paymentPage"
  And I should see "rewardClubCardPointContainerSpan" as "Your Points ID:" on "paymentPage"
  And I should see "rewardClubCardPointIDApplied" exist on "paymentPage"
  And I should see "rewardClubCardPointApply" exist on "paymentPage"

Examples:
 |email                               |password        |
 |testearnrewardclubpoints@test.com   |Sapient123      |

@automated @DEBD-170
Scenario Outline: Navigate to Debenhams payment page and validate the reward club card point error with incomplete digits
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I enter "<reward_card_point_number>" in "rewardClubCardPointIDField" on "paymentPage"
  And I click on "paymentMethodHeaderText" on "paymentPage"
  Then I should see "rewardClubCardPointIDError" as "PLEASE ENTER A VALID POINTS ID - THIS IS THE 14 DIGITS FOLLOWING 63383" on "paymentPage"

  Examples:
    | reward_card_point_number |
    |                          |

@automated @DEBD-170
Scenario Outline: Navigate to Debenhams payment page and validate the reward club card point error with incomplete digits
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I enter "<reward_card_point_number>" in "rewardClubCardPointIDField" on "paymentPage"
  And I click on "paymentMethodHeaderText" on "paymentPage"
  Then I should see "rewardClubCardPointIDError" as "PLEASE ENTER A VALID POINTS ID - THIS IS THE 14 DIGITS FOLLOWING 63383." on "paymentPage"

  Examples:
    | reward_card_point_number |
    | 0000                     |

@automated @DEBD-170
Scenario Outline: Navigate to Debenhams payment page and validate the reward club card point header error with incomplete digits
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I enter "<reward_card_point_number>" in "rewardClubCardPointIDField" on "paymentPage"
  And I click on "rewardClubCardPointApply" on "paymentPage"
  Then I should see "rewardClubCardPointIDError" as "PLEAE ENTER A VALID REWARD POINTS ID NUMBER, IT LOOKS LIKE THE CURRENT NUMBER IS INVALID" on "paymentPage"

  Examples:
    | reward_card_point_number |
    | 00001111222233           |

@automated @DEBD-170
Scenario Outline: Navigate to Debenhams payment page and validate the reward club card point applied with valid entry and then removing it
  When I am in view of "rewardClubCardPointApply" on "paymentPage"
  And I enter "<reward_card_point_number>" in "rewardClubCardPointIDField" on "paymentPage"
  And I click on "rewardClubCardPointApply" on "paymentPage"
  Then I should see "rewardClubCardPointIDApplied" containing "<reward_card_point_ending_digit>" on "paymentPage"
  And I should see "rewardClubCardPointRemoveLink" exist on "paymentPage"
  When I click on "rewardClubCardPointRemoveLink" on "paymentPage"
  Then I wait for "2000" milliseconds
  And I should see "rewardClubCardPointIDField" exist on "paymentPage"
  And I should see "rewardClubCardPointApply" exist on "paymentPage"

  Examples:
    | reward_card_point_number | reward_card_point_ending_digit |
    | 00200018497017           | 7017                           |

@manual @DEBD-170
Scenario: Validate the Payment Page For reward Products For Registered User And have saved Reward Card
  Given I logout
  Then I am on my details page and have saved reward card
  And I should see "myAccountLink" exist on "commonPage"
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdprewardColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  Then I should see my saved reward card number pre-populated in the earn reward club points container
  And I should see "rewardPointsRemoveLink" exist on "paymentPage"
  And I will earn the rewards on my card when I place my order

