Feature: Test Debenhams minibag section

@automated @DEBD-215
Scenario: Validate that the mini bag should be displayed when user hovers over empty mini bag icon in header
  Given I navigate to "homeURL"
  And I "Remove" "all" products from "myBagPage"
  And I should not see "numberCountInMiniBag" on "commonPage"
  When I mouse hover on "miniBagIcon" on "commonPage"
  Then I should see "miniBag" exist on "commonPage"
  And I should see "minibagProductCountOnHover" as "0 items" on "minibagPage"
  And I should see "minibagHeader" as "My Bag" on "minibagPage"
  And I should see "miniBagClose" exist on "minibagPage"
  And I should not see "productMiniBag" on "minibagPage"
  And I should not see "productImg" on "minibagPage"
  And I should not see "productRemove" on "minibagPage"
  And I should see "emptyCartMiniBagMessage" as "Your bag is currently empty" on "minibagPage"
  When I click on "miniBagIcon" on "commonPage"
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"

@automated @DEBD-215
Scenario: Validate that the mini bag should be displayed when user hovers over mini bag icon in header
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I mouse hover on "miniBagIcon" on "commonPage"
  Then I should see "miniBag" exist on "commonPage"
  And I should see "minibagProductCountOnHover" as "1 item" on "minibagPage"
  And I should see "minibagHeader" as "My Bag" on "minibagPage"
  And I should see "miniBagClose" exist on "minibagPage"
  And I should see "productMiniBag" exist on "minibagPage"
  And I should see "productImg" exist on "minibagPage"
  And I should see "productTitle" exist on "minibagPage"
  And I should see "productRemove" exist on "minibagPage"
  And I should see "productPrice" exist on "minibagPage"
  And I should see "miniCartBagButton" as "View all items in My Bag" on "minibagPage"
  And I should see "miniCartCheckoutButton" as "Secure Checkout" on "minibagPage"
  And I click on "miniBagIcon" on "commonPage"
  And I validate current pdp product "exist" on "myBagPage"
  When I mouse hover on "miniBagIcon" on "commonPage"
  And I click on "productImg" on "minibagPage"
  And I wait for "2000" milliseconds
  And I should see "url" contains "urlPartOfTestDress"
  When I navigate to "homeURL"
  When I mouse hover on "miniBagIcon" on "commonPage"
  And I click on "productTitle" on "minibagPage"
  And I should see "url" contains "urlPartOfTestDress"
  When I mouse hover on "miniBagIcon" on "commonPage"
  And I click on "miniCartCheckoutButton" on "minibagPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"

@automated @DEBD-215
Scenario: Validate closing of Mini Bag
  When I mouse hover on "miniBagIcon" on "commonPage"
  Then I should see "miniBag" exist on "commonPage"
  And I should see "miniBagClose" exist on "minibagPage"
  When I click on "miniBagClose" on "minibagPage"
  Then I should not see "miniBag" on "commonPage"
  When I mouse hover on "miniBagIcon" on "commonPage"
  Then I should see "miniBag" exist on "commonPage"
  When I mouse hover on "headerText" on "myBagPage"
  And I click on "headerText" on "myBagPage"
  Then I should not see "miniBag" on "commonPage"
  When I mouse hover on "miniBagIcon" on "commonPage"
  Then I should see "miniBag" exist on "commonPage"
  When I mouse hover on "createAccountLink" on "commonPage"
  Then I should not see "miniBag" on "commonPage"

@automated @DEBD-215
Scenario: Validate removing product from mini bag
  When I mouse hover on "miniBagIcon" on "commonPage"
  And I click on "productRemove" on "minibagPage"
  And I should not see "productMiniBag" on "minibagPage"
  And I should not see "productImg" on "minibagPage"
  And I should not see "productRemove" on "minibagPage"
  And I should see "emptyCartMiniBagMessage" as "Your bag is currently empty" on "minibagPage"

@manual @DEBD-215 @awsManual
Scenario: Validate view more link on mini bag incase more than 5 products are added in bag

@manual @DEBD-508 @DEBD-215 @DEBD-872 @awsManual
Scenario: Validate that colourless My Bag CTA should be displayed when the user doesn't have added any products in My Bag
  Given I have not added any products in My Bag
  When I navigate to "homeURL"
  Then I should see "miniBagIcon" as "colourless" on "commonPage"
  Then I should not see "numberCountInMiniBag" on "commonPage"
  When I mouse hover on "minibagicon" on "commonPage"
  Then I should see "miniBag" exist on "commonPage"
  And should see "miniBag" as per the design on "commonPage"
  And I should see "closeCTA" exist on "minibagPage"
  And I should see "myBagTitle" exist on "minibagPage"
  And I should see "zeroItems" exist on "minibagPage"
  And I should see "emptyMiniBagText" as "Your bag is currently empty"
  And I select available size and add to bag on pdpPage
  Then I should see "miniBagIcon" as "orangeColor" on "commonPage"
  And I should see "miniBagIconText" as "whiteColor" on "commonPage"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "8" and add to bag on pdpPage
  When I mouse hover on "minibagicon" on "commonPage"
  And I should see "bottomArrow" below "viewAllItemsInMyBagText" on "minibagPage"
  And I should see "bottomArrow" as inactive on "minibagPage"
  Then I should see arrows pointing upwards/downwards as per design
  When I click on the arrows on "minibagPage"
  Then I should preview the products in the mini bag
  And I should see 2.5 products displayed on "minibagPage"
  When I am on the last product on "minibagPage"
  Then I should see "topArrow" as active and clickable
  And I should see "bottomArrow" as inactive
  And I should see 2.5 products displayed on "minibagPage"


@notAutomated @DEBD-508 @DEBD-215 @awsManual
Scenario: Validate that orange colour My Bag CTA should be displayed when the user have added any products in My Bag
  Given I have not added any products in My Bag
  When I navigate to "pdpURL"
  And I select available size and add to bag on pdpPage
  When I mouse hover on "minibagicon" on "minibagPage"
  Then I should see "numberOfItemsInMyBag" exist on "minibagPage"
  And I should see "numberOfItemsInMyBag" exist on "minibagPage"
  And I should see "productImageLink" exist on "minibagPage"
  And I should see "productTitleLink" exist on "minibagPage"
  And I should see "selectedSwatch" exist on "minibagPage"
  And I should see "selectedQuantity" exist on "minibagPage"
  And I should see "productPrice" exist on "minibagPage"
  And I should see "productPrice" as bold on "minibagPage"
  And I should see "removeTrashIcon" exist on "minibagPage"
  And I should see "subTotal" exist on "minibagPage"
  And I should see "secureCheckoutButton" exist on "minibagPage"
  And I should see "padLockIcon" exist on "minibagPage"
  When I click on "productImageLink" on "miniBagPage"
  Then I should be navigated to corresponding pdpPage
  When I navigate to "homeURL"
  And I mouse hover on "minibagicon" on "minibagPage"
  And I click on "productTitleLink" on "miniBagPage"
  Then I should be navigated to corresponding pdpPage
  And I mouse hover on "minibagicon" on "minibagPage"
  When I click on "secureCheckoutButton" on "miniBagPage"
  Then I should see "myBagPageHeader" on "myBagPage"


@notAutomated @DEBD-215 @awsManual
Scenario: Validate removing product from mini bag
  Given I have added products to My Bag
  When I mouse hover on "minibagicon" on "minibagPage"
  And I click on "removeTrashIcon" on "minibagPage"
  Then I should not see "numberCountInMiniBag" on "commonPage"

@manual @DEBD-215 @awsManual
Scenario: Validate the Out Of Stock Notification should not be present in Mini Bag
  Given I have added products to My Bag
  And The product becomes Out Of Stock
  When I mouse hover on "minibagicon" on "minibagPage"
  Then I should see "miniBag" exist on "commonPage"
  And I should not see "outOfStockNotification" on "minibagPage"
  When I click on "minibagicon" on "minibagPage"
  Then I should see "myBagPageHeader" on "myBagPage"
  And I should see "outOfStockNotification" exist on "myBagPage"

@notAutomated @DEBD-873
Scenario: Validate that the Free-Gift product should be displayed in the mini-bag when I open the mini bag container having a product with free gift
  When I navigate to "freeGiftPdpURL"
  And I select available size and add to bag on pdpPage
  And I should validate minibag count  as "2"
  When I mouse hover on "minibagicon" on "minibagPage"
  Then I should see "originalProduct" on "minibagPage"
  And I should see "freGiftProduct" on "minibagPage"
  And I should see "freeGiftProductPrice" containing "$" on "minibagPage"
  And I should see "freeGiftProductPrice" as "$0.00" on "minibagPage"

@manual @DEBD-873 @awsManual
Scenario: Validate that the Free-Gift product should be displayed in the mini-bag when I have added a product that is subject to a 3 for 2 offer
  When I navigate to "3For2OfferPdpURL"
  And And I select available size enter quantity as "3" and add to bag on pdpPage
  When I mouse hover on "minibagicon" on "minibagPage"
  And I should see "subtotal" containing "regularPrice" on "minibagPage"
  And I should not see discount applied on "minibagPage"
  When I click on on "minibagicon" on "minibagPage"
  Then I should see discount applied
