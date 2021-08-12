Feature: Test Debenhams Promo Codes on My Bag Page validation

@notAutomated @DEBD-937 @DEBD-941
Scenario: Validate that the free Gift product should be displayed in the Minibag when user adds the product with free gift
  Given I have added product having freeGiftProduct 
  When I hover the minibag container
  Then I should see "freeGiftProduct" added in the Minibag
  And I should see the number of the "freeGiftProduct" added in the "miniBagNumber" count


@notAutomated @DEBD-937 @DEBD-941
Scenario: Validate that the product with 3 for 2 offer should be displayed in the Minibag when user adds
  Given I have added product with 3 for 2 offer 
  When I hover the minibag container
  Then I should see products added in the Minibag
  And I should see the "subTotalPrice" as regular price
  And I should not see the discount applied until navigates to the "myBagPage"

@notAutomated @DEBD-937 @DEBD-941
Scenario: Validate that the free Gift product should be removed from My Bag when user removes the original Product from My Bag
  Given I have freeGiftProduct in My Bag
  When I remove the "originalProduct" from "myBagPage"
  Then I should see "freeGiftProduct" removed from "myBagPage"
  And I should see the "miniBagNumber" should be decreased
  And I should see the "subTotalPrice" should be updated

@manual @DEBD-937
Scenario: Validate that the promotion should be removed from My Bag when user removes the original Product linked to promotion from My Bag
  Given I have promotionLinkedProduct in My Bag
  When I remove the "originalProduct" from "myBagPage"
  Then I should see "promotion" removed from "myBagPage"
  And I should see the "miniBagNumber" should be decreased
  And I should see the "subTotalPrice" should be updated

@notAutomated @DEBD-159
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

@notAutomated @DEBD-159
Scenario: Validate that the user should be allowed to add another promo code when one is already applied on My Bag
  Given I have at least one product applicable for promotion in My Bag
  When I enter valid promo code
  Then I should see "promotionAppliedNotification" exist on "myBagPage"
  When I enter another valid promo code
  Then I should see "promotionAppliedNotification" exist on "myBagPage"
  And I should see "removePromotionLink" exist on "myBagPage"
  And I should see "promoDiscount" should be updated in "orderSummarySection" on "myBagPage"
  And I should see the "subTotalPrice" should be updated


@notAutomated @DEBD-159
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

@notAutomated @DEBD-159
Scenario: Validate that the invalid promo code error should be displayed whe user enters invalid promo code
  Given I have at least one product applicable for promotion in My Bag
  When I enter invalid promo code
  Then I should see "invalidPromoCodeErrorMessage" exist on "myBagPage"

@notAutomated @DEBD-159
Scenario: Validate that the promo code should be displayed on Payment Page when applied on My Bag
  Given I have at least one product applicable for promotion in My Bag
  When I enter valid promo code
  Then I should see "promotionAppliedNotification" exist on "myBagPage"
  When I navigate to "paymentPage"
  Then I should see "promoCode" exist on "paymentPage"
