Feature: Test Debenhams my bag page validation

@automated @DEBD-263
Scenario: Login to CCC site
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"

@automated @DEBD-200
Scenario: Validate that My Bag Page Content
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "headerItemsCount" exist on "myBagPage"
  And I should see "banner1Content" exist on "myBagPage"
  And I validate the "total items"

@automated @DEBD-200
Scenario: Validate that My Bag Page Left Pane  Content
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
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


@automated @DEBD-200
Scenario: Validate that My Bag Page Right Pane  Content
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  Then I should see "myBagSummarySection" exist on "myBagPage"
  And I should see "creditCardInfo" exist on "myBagPage"
  And I should see "beautyCardInfo" exist on "myBagPage"
  And I should see "promoCodeField" exist on "myBagPage"
  And I should see "promoCodeApply" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"
  And I should see "discountRows" exist on "myBagPage"
  And I should see "productDiscountText" exist on "myBagPage"
  And I should see "productDiscountText" as "Discounts" on "myBagPage"
  And I should see "productDiscountValue" exist on "myBagPage"
  And I should see "subtotalRow" exist on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should see "creditCardAcceptCopy" exist on "myBagPage"
  And I should see "creditCardAcceptCopy" as "We accept:" on "myBagPage"
  And I should see "creditCardIcons" exist on "myBagPage"
  And I should see "debsCreditCardIcon" exist on "myBagPage"
  And I should see "visaCreditCardIcon" exist on "myBagPage"
  And I should see "masterCreditCardIcon" exist on "myBagPage"
  And I should see "amexCreditCardIcon" exist on "myBagPage"
  And I should see "maestroCreditCardIcon" exist on "myBagPage"
  When I go back to previous page
  Then I validate current pdp product "exist" on "myBagPage"
  And I validate the "banner price"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

@notAutomated @DEBD-636
Scenario: Valaidate the product quantity and subtotal price gets updated in mini bag when user updates the quantity
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on on "minibagicon" on "minibagPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I "increase" quantity of the product on "myBagPage"
  Then I should validate minibag count "after"
  And I should see the "subTotalPrice" updated on "minibagPage"

@manual @DEBD-636 @awsManual
Scenario: Valaidate that the error message should be displayed when user tries to exceed the quantity avaialable in stock against the product in the bag
  When I navigate to "pdpURLWithLowStock"
  And I select available size and add to bag on pdpPage
  When I click on on "minibagicon" on "minibagPage"
  Then I should see "myBagPageHeader" on "myBagPage"
  When I update the quantity of the product to "maximmumAvailableQuantity" on "myBagPage"
  Then I should see "insufficientStockAvailableMsg" as "There is insufficient inventory to purchase <quantity> units of <prdductName>" on "myBagPage"
  And I should be able to continue to checkout

@notAutomated @DEBD-235 @awsManual
Scenario: Validate that the empty Bag should be displayed when the user removes all the products from My Bag
  Given I have multiple products in My Bag
  When I remove all the products from My Bag
  Then I should see "emptyBagPage"
  And I should see "emptyBagMessage" as "Your bag is currently empty" on "myBagPage"
  And I should see "emptyBagLogo" exist on "myBagPage"
  And I should see "continueShoppingCTA" exist on "myBagPage"
  And I should see "miniBagNumbver" as "0" on "myBagPage"

@manual @DEBD-2133
Scenario Outline: Validate that 20% discount is displayed in fianance banner on My bag pages for Womenwear
  Given I logout
  Then I navigate to "<PDPurl>"
  Then I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  Then I should see 20% discount on the fianance banner in the 34th week of the year

  Examples:
  | PDPurl    |
  |Phase Eight |
  |Jeans |
  | kidsWear |
  | Home |

@manual @DEBD-2133
Scenario Outline: Validate that 10% discount is displayed in fianance banner on My bag pages for Beauty
  Given I logout
  Then I navigate to "<PDPurl>"
  Then I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  Then I should see 10% discount on the fianance banner in the 34th week of the year

  Examples:
  | PDPurl    |
  | Mac |
  | Chanel |
  | Luggage |
  | Electrical |


@manual @DEBD-2133
Scenario Outline: Validate that 10% discount is displayed in fianance banner on My bag pages for mixed bag(Womenwear and beauty)
  Given I logout
  Then I navigate to "<PDPurl1>"
  Then I select available size and add to bag on pdpPage
  Then I navigate to "<PDPurl2>"
  Then I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  Then I should see 10% discount on the fianance banner in the 34th week of the year

  Examples:
  | PDPurl1  | PDPurl2 |
  | Mac | Jeans  |
  |Electrical | Womenswear |
