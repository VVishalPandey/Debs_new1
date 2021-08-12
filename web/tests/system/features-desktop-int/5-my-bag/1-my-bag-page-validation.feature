Feature: Test Debenhams my bag page validation

@automated @DEBD-200
Scenario: Validate that My Bag Page Content
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "headerItemsCount" exist on "myBagPage"
  And I should see "banner1Content" exist on "myBagPage"
  And I validate the "total items"

@automated @DEBD-200 @DEBD-141
Scenario: Validate that My Bag Page Left Pane  Content
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  Then I should see "productList" exist on "myBagPage"
  And I should see "productImage" exist on "myBagPage"
  And I should see "allProductNameElements" exist on "myBagPage"
  And I should see "swatchOption" exist on "myBagPage"
  And I should see "ProductPrice" exist on "myBagPage"
  And I should see "increaseQuantity" exist on "myBagPage"
  And I should see "decreaseQuantity" exist on "myBagPage"
  And I should see "saveForLaterCTA" exist on "myBagPage"
  And I should see "removeTrashIcon" exist on "myBagPage"
  And I should see "deliveryOptionSection" exist on "myBagPage"


@automated @DEBD-200 @DEBD-141
Scenario: Validate that My Bag Page Right Pane  Content
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagSummarySection" exist on "myBagPage"
  And I should not see "creditCardInfo" on "myBagPage"
  And I should not see "beautyCardInfo" on "myBagPage"
  And I should see "promoCodeField" exist on "myBagPage"
  And I should see "promoCodeApply" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"
  And I should see "discountRows" exist on "myBagPage"
  And I should see "productDiscountText" exist on "myBagPage"
  And I should see "productDiscountText" as "Discounts" on "myBagPage"
  And I should see "productDiscountValue" exist on "myBagPage"
  And I should see "subtotalRow" exist on "myBagPage"
  And I should see "excludingDeliveryMessage" exist on "myBagPage"
  And I should see "excludingDeliveryMessage" as "Excluding delivery" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should see "creditCardAcceptCopy" exist on "myBagPage"
  And I should see "creditCardAcceptCopy" as "We accept:" on "myBagPage"
  And I should see "creditCardIcons" exist on "myBagPage"
  And I should see "visaCreditCardIcon" exist on "myBagPage"
  And I should see "masterCreditCardIcon" exist on "myBagPage"
  And I should see "maestroCreditCardIcon" exist on "myBagPage"
  And I should see "payPalIcon" exist on "myBagPage"
  When I go back to previous page
  Then I validate current pdp product "exist" on "myBagPage"
  And I validate the "banner price"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

@notAutomated @DEBD-636
Scenario: Valaidate the product quantity and subtotal price gets updated in mini bag when user updates the quantity
  When I navigate to "pdpURL"
  And I select available size and add to bag on pdpPage
  When I click on on "minibagicon" on "minibagPage"
  Then I should see "myBagPageHeader" on "myBagPage"
  When I update the quantity of the product on "myBagPage"
  Then I should validate minibag count "after"
  And I should see the "subTotalPrice" updated on "myBagPage"

@manual @DEBD-636
Scenario: Valaidate that the + quantity button should be disabled when user tries to exceed the quantity restrictions against the product in the bag
  When I navigate to "pdpURLWithQuantityRestriction"
  And I select available size and add to bag on pdpPage
  When I click on on "minibagicon" on "minibagPage"
  Then I should see "myBagPageHeader" on "myBagPage"
  When I update the quantity of the product to "maximmumAllowedQuantity" on "myBagPage"
  Then I should see "plusQuantityButton" disabled on "myBagPage"

@manual @DEBD-636
Scenario: Valaidate that the error message should be displayed when user tries to exceed the quantity avaialable in stock against the product in the bag
  When I navigate to "pdpURLWithQuantityRestriction"
  And I select available size and add to bag on pdpPage
  When I click on on "minibagicon" on "minibagPage"
  Then I should see "myBagPageHeader" on "myBagPage"
  When I update the quantity of the product to "maximmumAvailableQuantity" on "myBagPage"
  Then I should see "insufficientStockAvailableMsg" as "There is insufficient inventory to purchase <quantity> units of <prdductName>" on "myBagPage"
  And I should be able to continue to checkout

@notAutomated @DEBD-636
Scenario: Valaidate that the Debenhams credit card loyalty points should be updated when the user updates the quantity of the product on my bag page
  When I navigate to "pdpURL"
  And I select available size and add to bag on pdpPage
  When I click on on "minibagicon" on "minibagPage"
  Then I should see "myBagPageHeader" on "myBagPage"
  When I update the quantity of the product on "myBagPage"
  Then I should see "debenhamsCreditCardLoyaltyPoints" as updated

@notAutomated @DEBD-636
Scenario: Valaidate that the Beauty Club Card loyalty points should be updated when the user updates the quantity of the product on my bag page
  When I navigate to "pdpURL"
  And I select available size and add to bag on pdpPage
  When I click on on "minibagicon" on "minibagPage"
  Then I should see "myBagPageHeader" on "myBagPage"
  When I update the quantity of the product on "myBagPage"
  Then I should see "beautyClubCardLoyaltyPoints" as updated

@notAutomated @DEBD-627
Scenario: Validate that the no bag page
 Given I have no products in my bag
 When I navigate to "myBagPage"
 Then I should see "emptyBagMessage" as "Your bag is currently empty" on "myBagPage"
 And I should see "emptyBagLogo" exist on "myBagPage"
 And I should see "continueShoppingCTA" exist on "myBagPage"

@notAutomated @DEBD-235
Scenario: Validate that the empty Bag should be displayed when the user removes all the products from My Bag
  Given I have multiple products in My Bag
  When I remove all the products from My Bag
  Then I should see "emptyBagPage"
  And I should see "emptyBagMessage" as "Your bag is currently empty" on "myBagPage"
  And I should see "emptyBagLogo" exist on "myBagPage"
  And I should see "continueShoppingCTA" exist on "myBagPage"
  And I should see "miniBagNumbver" as "0" on "myBagPage"


@manual @DEBD-296
Scenario: Validate that the out of stock notification at the top of My Bag should be displayed when a product in My Bag becomes Out Of Stock
  Given I have a product in My Bag
  When the product in the bag becomes Out Of Stock
  Then I should see "outOfStockNotification" at the top of "myBagPage"
  And I should be taken to the top of the "myBagPage"
  And I should see "outOfStockMessage" under the "productPrice" on "myBagPage"
  And I should not see "quantitySelector" on "myBagPage"
  And I should see "secureCheckoutButton" as grey on "myBagPage"
  And I should see "secureCheckoutButton" as unclickable on "myBagPage"

@manual @DEBD-296
Scenario: Validate that the normal My Bag Page should be displayed when user removes Out Of Stock Item from My Bag
  Given I have more than one products in My Bag and one of them is Out Of Stock
  When I remove the Out Of Stock Product on "myBagPage"
  Then I should see normal "myBagPage"
  And I should see "secureCheckoutButton" as clickable on "myBagPage"

@automated @DEBD-247
Scenario: Validate that the notification stating the amount to reach for free delivery should be shown in local currency
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  Then I should see "deliveryThresholdAmountNotification" exist on "myBagPage"
  And I validate the "banner price"
  And I validate the "banner message"

@automated @DEBD-247
Scenario: Validate that the Free Delivery should be displayed when user met the threshold
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithPriceMoreThan100"
  And I click on "addToBagButton" on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  Then I should see "deliveryThresholdAmountNotification" exist on "myBagPage"
  And I validate the "banner price"
  And I validate the "banner message"
