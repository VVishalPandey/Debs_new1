Feature: Test Debenhams Promo Codes on Payment page

@automated @DEBD-1101
Scenario Outline: Validate the Promo Code Accordion on Payment Page
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "clickCollectPDP"
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
  Then I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  When I click on "promoCodeAccordion" on "paymentPage"
  And I should see "promoCodeInputField" exist on "paymentPage"
  And I should see "promoCodeApply" exist on "paymentPage"
  When I enter "<promoCode>" in "promoCodeInputField" on "paymentPage"
  When I click on "promoCodeApply" on "paymentPage"
  Then I should see "promoCodeAppliedNotification" exist on "paymentPage"
  And I should see "promoCodeAppliedNotificationMessage" as "<NotificationMessage>" on "paymentPage"
  And I should see "promoCodeRemoveLink" exist on "paymentPage"
  And I should see "promoDiscounts" exist on "paymentPage"
  Then I click on "promoCodeRemoveLink" on "paymentPage"

Examples:
    | promoCode |  NotificationMessage |email                          |password    |
    | PS01      |  PS01: Applied       |testpaymentautomation@test.com |Sapient123  |

@automated @DEBD-1101
Scenario Outline: Validate error message for blank promo code field
  When I enter "<promoCode>" in "promoCodeInputField" on "paymentPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeInlineErrorMessage" as "<promoErrorMessage>" on "paymentPage"

  Examples:
    | promoCode | promoErrorMessage                |
    |           | Please enter a promotional code. |

@automated @DEBD-1101
Scenario Outline: Validate error message for incorrect promo code field
  When I enter "<promoCode>" in "promoCodeInputField" on "paymentPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "invalidPromoCodeErrorMessage" as "<promoErrorMessage>" on "paymentPage"

  Examples:
    | promoCode | promoErrorMessage        |
    | aaaa      | Invalid Promotional Code |

@manual @DEBD-1101
Scenario: Validate that the promo code entered in lower case should be converted to uppercase
  Given I have at least one product applicable for promotion in My Bag
  When I enter valid promo code in lower case on payment page
  Then I should see "promotionAppliedNotification" exist on "paymentPage"
  Then I should see "promoCode" in Upper Case on "paymentPage"

@manual @DEBD-1101
Scenario: Validate that the user should be allowed to add another promo code when one is already applied on Payment Page
  Given I have at least one product applicable for promotion in My Bag
  When I enter valid promo code on payment page
  Then I should see "promotionAppliedNotification" exist on "paymentPage"
  When I enter another valid promo code
  Then I should see "promotionAppliedNotification" exist on "paymentPage"
  And I should see "promoCodeRemoveLink" exist on "paymentPage"
  And I should see "promoDiscounts" should be updated in "orderSummarySection" on "paymentPage"
  And I should see the "subTotalPrice" should be updated


@manual @DEBD-1101
Scenario: Validate that the promotion should be removed when user clicks on Remove Promotion Link on My Bag
  Given I have at least one product applicable for promotion in My Bag
  When I am on Payment Page
  And I enter valid promo code
  Then I should see "promotionAppliedNotification" exist on "paymentPage"
  And I should see "removePromotionLink" exist on "paymentPage"
  When I click on "removePromotionLink" on "paymentPage"
  Then I should see promo code removed on "paymentPage"
  And I should see "promoDiscount" should be updated in "orderSummarySection" on "paymentPage"
  And I should see the "subTotalPrice" should be updated

@manual @DEBD-1101
Scenario: Validate that the Duplicate Promo Code Error is displayed for already present promo code
 Given I have at least one product and an applied promo code in My Bag
 When I navigate to payment Page
 Then I enter the same promo code on Payment Page
 And I should see duplicatepromoCodeError on Payment Page
 And I enter another Promo Code on Payment Page
 And I click on "promoCodeApply" on "paymentPage"


