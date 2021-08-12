Feature: Test Debenhams pdp page validation for beauty pages

@automated @PDP @Fixed @DEBD-114 @DEBD-556 @DEBD-114 @DEBD-215
Scenario: Navigate to dress and validate circular size swatch
  When I navigate to "testDressPdpURL"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "nothingSelectedErrorMessage" as "Please select an option" on "pdpPage"
  And I select available size enter quantity as "2" and add to bag on pdpPage
  And I validate add to bag message as per quantity "2" selector on "pdpPage"
  And I should not see "addedToBagNotification" on "minibagPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I go back to previous page
  And I validate current pdp product "exist" on "myBagPage"

@automated @PDP @Fixed @DEBD-114 @DEBD-113 @DEBD-556 @DEBD-215
Scenario: Navigate to dress and validate circular size swatch
  When I navigate to "pdpKidRangeProduct"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "nothingSelectedErrorMessage" as "Please select an option" on "pdpPage"
  And I select available size and add to bag on pdpPage
  And I validate add to bag message as per quantity "1" selector on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I go back to previous page
  And I validate current pdp product "exist" on "myBagPage"

@manual @DEBD-872 @awsManual
Scenario: Validate that the 2.5 products should be displayed, top arrow should be active and clickable and bottom arrow should be inactive when we have more than two products in the mini bag and they are different SKUs
  When I mouse hover on "minibagicon" on "minibagPage"
  Then I should see "topArrow" on "minibagPage"
  Then I should see "bottomArrow" on "minibagPage"
  When I am on the last product on "minibagPage"
  Then I should see "topArrow" as active and clickable
  And I should see "bottomArrow" as inactive
  And I should see 2.5 products displayed on "minibagPage"

@automated @PDP @Fixed @DEBD-114 @DEBD-113 @DEBD-556 @DEBD-215
Scenario: Navigate to dress and validate circular size swatch
  When I navigate to "pdpKnitWearProduct"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "nothingSelectedErrorMessage" as "Please select an option" on "pdpPage"
  And I select available size and add to bag on pdpPage
  And I validate add to bag message as per quantity "1" selector on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I go back to previous page
  And I validate current pdp product "exist" on "myBagPage"

@automated @PDP @Fixed @DEBD-114 @DEBD-113 @DEBD-556 @DEBD-215
Scenario: Navigate to dress and validate circular size swatch
  When I navigate to "pdpBeautyColorProduct"
  And I select available size and add to bag on pdpPage
  And I validate add to bag message as per quantity "1" selector on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I go back to previous page
  And I validate current pdp product "exist" on "myBagPage"

@notautomated @DEBD-114 @DEBD-113 @DEBD-556 @DEBD-215 @DEBD-508
Scenario: Navigate to dress and validate circular size swatch
  When I navigate to "pdpChanelProduct"
  And I select available size and add to bag on pdpPage
  And I validate add to bag message as per quantity "1" selector on "pdpPage"
  When I mouse hover on "minibagicon" on "minibagPage"
  When I scroll to the bottom of "miniBagPage"
  Then I should see "viewAllItemsInMyBagText" exist on "minibagPage"
  And I should see "viewAllItemsInMyBagText" as "<text>" on "minibagPage"
  And I should see "bottomArrow" exist on "minibagPage"
  When I click on "viewAllItemsInMyBagText" on "minibagPage"
  Then I should see "myBagPageHeader" as "My Bag" on "myBagPage"
  Then I go back to previous page
  And I validate current pdp product added to minibag and mybag

@manual @DEBD-215 @DEBD-872
Scenario: Validate that the arrows pointing upwards/downwards should be displayed in minibag when user has more than two products in the mini bag and they are different SKUs
  Given I have more than products in My Bag and they are different SKUs
  When I mouse hover on "minibagicon" on "minibagPage"
  Then I should see arrows pointing upwards/downwards as per design
  When I click on the arrows on "minibagPage"
  Then I should preview the products in the mini bag
  And I should see 2.5 products displayed on "minibagPage"
  Then I should see "topArrow" on "minibagPage"
  Then I should see "bottomArrow" on "minibagPage"
  When I am on the top product on "minibagPage"
  Then I should see "topArrow" as inactive
  And I should see "bottomArrow" as active and clickable

@notautomated @DEBD-114 @DEBD-215 @awsManual
Scenario: Validation of add to bag of the recently viewed item
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Shoes" under "Women" on commonPage bigscreen
  And I click on first product
  When I "validate & click" subMenu option "Shorts" under "Lingerie" on commonPage bigscreen
  And I click on first product
  When I am in view of "recentlyViewed" on "pdpPage"
  Then I should match product name of first product "recentlyViewedProduct1" in carousel on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "nothingSelectedErrorMessage" as "Please select an option" on "pdpPage"
  When I select available size on "pdpPage"
  And I addtobag the product and validate minibag count
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "has been added to your bag." on "pdpPage"
  Then I go back to previous page
  And I validate current pdp product added to minibag and mybag

@notAutomated @DEBD-215
Scenario: Validate removing product with same SKU from mini bag
  Given I have added products with the same SKU to My Bag
  When I mouse hover on "minibagicon" on "minibagPage"
  And I click on "removeTrashIcon" on "minibagPage"
  Then I should see the product with same sku removed from "miniBagPage"
  And I should see "miniBagNumber" updated on "minibagPage"
  And I should see "subTotal" updated on "minibagPage"
  Then I go back to previous page
  And I validate current pdp product added to minibag and mybag

@notAutomated @DEBD-215 @awsManual
Scenario: Validate that the number of items and subtotal should update when the user adds/removes products from Bag
  Given I have added products to My Bag
  When I add product to My Bag
  And I should see "miniBagNumber" updated on "minibagPage"
  And I should see "subTotal" updated on "minibagPage"
  When I remove product from My Bag
  And I should see "miniBagNumber" updated on "minibagPage"
  And I should see "subTotal" updated on "minibagPage"
  Then I go back to previous page
  And I validate current pdp product added to minibag and mybag

@manual  @awsManual
Scenario: Validation of the MiniBag notification on PDP
  When I navigate to "pdpBeautyColorProduct"
  And I select available size
  And I click on "addToBagButton" on "pdpPage"
  And I should see "miniBagNumber" updated on "minibagPage"
  And I should see the added to bag notification component as per below under the mini bag header icon
  #"Item added successfully" blue notification
  #product image (links to PDP on the same tab)
  #product title (links to PDP on the same tab)
  #chosen size & colour on the same line
  #chosen quantity & price each on a new line
  #"View all items in my bag" CTA (links to My Bag)
  #"Secure checkout CTA" (links to My Bag)

@automated @PDP @Fixed @DEBD-2267
Scenario Outline: Validate that size dropdown is displayed on all PDP pages which have size selector
  Given I logout
  # Then I navigate to "<PDPurl>"
  Then I should see "searchIcon" exist on "commonPage"
  When I click on "searchIcon" on "commonPage"
  And I enter "<Products>" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I should not see "sizeSwatches" on "pdpPage"
  And I should see "sizeAsDropdown" exist on "pdpPage"
  Then I select available size and add to bag on pdpPage


  Examples:
  | Products    |
  |Dorothy Perkins |
  |Quiz |
  |Wallis |
  |Debut |
  |Jenny Packham |
  |Mantaray |
  |RedHerring |
  |The Collection |
  |Dress Studio by Preen |
  |Nine by Savannah Miller |
  |Knickers |
  |Nightwear |
  |Jeans |
  |Shoes |

