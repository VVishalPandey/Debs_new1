Feature: Test Debenhams Delivery Options on My Bag page validation

@automated @DEBD-930
Scenario: Validate that the tooltip should open when user hovers on available delivery option
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "productWithAlphabetSizeSwatchName" product name exist on myBagPage
  And I should see "deliveryOptionSection" exist on "myBagPage"
  And I should see "availableDeliveryOption" exist on "myBagPage"

@automated @DEBD-930
Scenario: Validate that the tooltip should close when user mouse offs the icon or focuses on another element
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "productWithAlphabetSizeSwatchName" product name exist on myBagPage
  And I should see "deliveryOptionSection" exist on "myBagPage"
  And I should see "availableDeliveryOption" exist on "myBagPage"
  When I mouse hover on "availableDeliveryOption" on "myBagPage"
  Then I should see "deliveryOptionTooltip" exist on "myBagPage"
  When I mouse hover on "checkoutButton" on "myBagPage"
  Then I should not see "deliveryOptionTooltip" on "myBagPage"
