Feature: Test Debenhams Payment Page Earn Beauty Club Points

@automated @DEBD-152
Scenario Outline: Validate the Payment Page For Beauty Products For Registered User And Reward Card has balance more than £0
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
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
  Then I should see "beautyClubCardPointContainer" exist on "paymentPage"
  And I should see "beautyClubCardPointContainerText" containing "Earn" on "paymentPage"
  And I should see "beautyClubCardPointContainerText" containing "points on your Beauty Club Card" on "paymentPage"
  And I should see "beautyClubCardPointContainerSpan" as "Your Points ID:" on "paymentPage"
  And I should see "beautyClubCardPointIDApplied" exist on "paymentPage"
  And I should see "beautyClubCardPointApply" exist on "paymentPage"

Examples:
 |email                               |password        |
 |testearnbeautyclubpoints@test.com   |Sapient123      |

@automated @DEBD-222
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card point error with incomplete digits
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I enter "<beauty_card_point_number>" in "beautyClubCardPointIDField" on "paymentPage"
  And I click on "paymentMethodHeaderText" on "paymentPage"
  Then I should see "beautyClubCardPointIDError" as "Please enter a valid Points ID - this is the 14 digits following 63383." on "paymentPage"

  Examples:
    | beauty_card_point_number |
    |                          |
    | 0000                     |

@automated @DEBD-222
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card point header error with incomplete digits
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I enter "<beauty_card_point_number>" in "beautyClubCardPointIDField" on "paymentPage"
  And I click on "beautyClubCardPointApply" on "paymentPage"
  Then I should see "beautyClubCardPointError" as "Please enter a valid Beauty Card Points ID number, it looks like the current number is invalid" on "paymentPage"

  Examples:
    | beauty_card_point_number |
    | 00001111222233           |

@automated @DEBD-222
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card point applied with valid entry and then removing it
  When I am in view of "beautyClubCardPointApply" on "paymentPage"
  And I enter "<beauty_card_point_number>" in "beautyClubCardPointIDField" on "paymentPage"
  And I click on "beautyClubCardPointApply" on "paymentPage"
  Then I should see "beautyClubCardPointIDApplied" containing "<beauty_card_point_ending_digit>" on "paymentPage"
  And I should see "beautyClubCardPointRemoveLink" exist on "paymentPage"
  When I click on "beautyClubCardPointRemoveLink" on "paymentPage"
  Then I wait for "2000" milliseconds
  And I should see "beautyClubCardPointIDField" exist on "paymentPage"
  And I should see "beautyClubCardPointApply" exist on "paymentPage"

  Examples:
    | beauty_card_point_number | beauty_card_point_ending_digit |
    | 00500017026679           | 6679                           |

@manual @DEBD-152
Scenario: Validate the Payment Page For Beauty Products For Registered User And have saved Reward Card
  Given I logout
  Then I am on my details page and have saved beauty card
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  Then I should see my saved beauty card number pre-populated in the earn beauty club points container
  And I should see "beautyPointsRemoveLink" exist on "paymentPage"
  And I will earn the rewards on my card when I place my order

