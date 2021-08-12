Feature: Test Debenhams Promo Codes on My Bag Page validation

@automated @DEBD-159
Scenario: Validate error message for empty promo code field
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeErrorMessage" as "Please enter a promotional code." on "myBagPage"

@automated @DEBD-159
Scenario Outline: Validate error message for incorrect promo code field
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  When I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeHeaderErrorMessage" as "<promoErrorMessage>" on "myBagPage"

  Examples:
    | promoCode | promoErrorMessage                                                           |
    | aaaa      | Sorry that promotional code was not recognised, please check and try again. |

@automated @DEBD-159
Scenario Outline: Validate that promo code and discont is applied successfully
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  When I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "myBagPage"
  And I should validate "promoCodeRemove" exist on "myBagPage"
  Then I should see "productDiscountValue" exist on "myBagPage"
  Then I validate "discountValue" as "<discount>" on mybagPage
  And I validate the "banner price"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

  Examples:
    | promoCode | promoMessage  | discount |
    | PS01      | PS01: Applied | -£0.01   |

@automated @DEBD-159
Scenario Outline: Validate that message for duplicate promo code
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  When I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "myBagPage"
  When I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeErrorMessage" as "<promoErrorMessage>" on "myBagPage"

Examples:
    | promoCode | promoMessage  | promoErrorMessage |
    | PS01      | PS01: Applied | The promotional code you have entered cannot be applied as it has already been used |

@automated @DEBD-159
Scenario Outline: Validate the discounts after removing the promo code
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  When I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "myBagPage"
  And I should validate "promoCodeRemove" exist on "myBagPage"
  When I click on "promoCodeRemove" on "myBagPage"
  Then I validate "discountValue" as "<discount>" on mybagPage
  And I should not see "promoCodeAppliedText" on "myBagPage"
  And I should not see "promoCodeRemove" on "myBagPage"
  And I validate the "banner price"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

  Examples:
    | promoCode | promoMessage  | discount |
    | PS01      | PS01: Applied | £0.00    |

@notautomated @DEBD-159
Scenario Outline: Validate that the promo code should be displayed on Payment Page when applied on My Bag
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  When I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  When I select home delivery and provide UK address details and navigate to delivery options under it
  When I click on "nextNominatedOption" on "deliveryOptionPage"
  Then I should see "nextNominatedSectionHeaderText" as "When would you like to receive your delivery?" on "deliveryOptionPage"
  When I am in view of "nextNominatedSectionHeaderText" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "paymentPage"

Examples:
    | promoCode | promoMessage  |
    | PS01      | PS01: Applied |

@manual @DEBD-235
Scenario: Validate that the free Gift product should be removed from My Bag when user removes the original Product from My Bag
  Given I have freeGiftProduct in My Bag
  When I remove the "originalProduct" from "myBagPage"
  Then I should see "freeGiftProduct" removed from "myBagPage"
  And I should see the "miniBagNumber" should be decreased
  And I should see the "subTotalPrice" should be updated

@manual @DEBD-235
Scenario: Validate that the promotion should be removed from My Bag when user removes the original Product linked to promotion from My Bag
  Given I have promotionLinkedProduct in My Bag
  When I remove the "originalProduct" from "myBagPage"
  Then I should see "promotion" removed from "myBagPage"
  And I should see the "miniBagNumber" should be decreased
  And I should see the "subTotalPrice" should be updated

@manual @DEBD-159
Scenario: Validate that the promotion should be applied when user enters a valid promo code on My Bag
  Given I have at least one product applicable for promotion in My Bag
  When I enter valid promo code
  Then I should see "promotionAppliedNotification" exist on "myBagPage"
  And I should see "removePromotionLink" exist on "myBagPage"
  And I should see "promoDiscount" should be updated in "orderSummarySection" on "myBagPage"
  And I should see the "subTotalPrice" should be updated

@manual @DEBD-159
Scenario: Validate that the promotion should be applied individually on product when user enters a valid promo code on My Bag
  And I should see promotion should be applied individually on all applicable products on "myBagPage"
  And I should see "promotionDescription" besides all applicable products on "myBagPage"
  And I should see "valueDiscounted" besides all applicable products on "myBagPage"

@manual @DEBD-159
Scenario: Validate that the user should be allowed to add another promo code when one is already applied on My Bag
  Given I have at least one product applicable for promotion in My Bag
  When I enter valid promo code
  Then I should see "promotionAppliedNotification" exist on "myBagPage"
  When I enter another valid promo code
  Then I should see "promotionAppliedNotification" exist on "myBagPage"
  And I should see "removePromotionLink" exist on "myBagPage"
  And I should see "promoDiscount" should be updated in "orderSummarySection" on "myBagPage"
  And I should see the "subTotalPrice" should be updated


@manual @DEBD-159
Scenario: Validate that the promotion should be removed when user clicks on Remove Promotion Link on My Bag
  Given I have at least one product applicable for promotion in My Bag
  When I enter valid promo code
  Then I should see "promotionAppliedNotification" exist on "myBagPage"
  And I should see "removePromotionLink" exist on "myBagPage"
  When I click on "removePromotionLink" on "myBagPage"
  Then I should see promo code removed on "myBagPage"
  And I should see "promoDiscount" should be updated in "orderSummarySection" on "myBagPage"
  And I should see the "subTotalPrice" should be updated

@manual @DEBD-159
Scenario: Validate that the promotion should be removed individually from products when user clicks on Remove Promotion Link on My Bag
  And I should see promotion should be removed from all applicable products on "myBagPage"
  And I should not see "promotionDescription" besides all applicable products on "myBagPage"
  And I should not see "valueDiscounted" besides all applicable products on "myBagPage"

@manual @DEBD-159
Scenario: Validate that the promotion not applicable message should be displayed when user removes all the applicable products from My Bag
  Given I have at least one product applicable for promotion in My Bag
  When I enter valid promo code
  Then I should see "promotionAppliedNotification" exist on "myBagPage"
  When I remove all the applicable products on "myBagPage"
  Then I should see "promoNotEligibleMessage" as "sorry your basket is not eligible for this promotion" on "myBagPage"
  And I should see "promoDiscount" should be updated in "orderSummarySection" on "myBagPage"
  And I should see the "subTotalPrice" should be updated

@manual @DEBD-159
Scenario: Validate that the promo code entered in lower case should be converted to uppercase
  Given I have at least one product applicable for promotion in My Bag
  When I enter valid promo code in lower case
  Then I should see "promotionAppliedNotification" exist on "myBagPage"
  Then I should see "promoCode" in Upper Case on "myBagPage"

@manual @DEBD-159
Scenario: Validate that the promo code should be displayed on Payment Page when applied on My Bag
  Given I have at least one product applicable for promotion in My Bag
  When I enter valid promo code
  Then I should see "promotionAppliedNotification" exist on "myBagPage"
  When I navigate to "paymentPage"
  Then I should see "promoCode" exist on "paymentPage"
