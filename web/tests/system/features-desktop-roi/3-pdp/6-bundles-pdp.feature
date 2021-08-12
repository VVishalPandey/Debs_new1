Feature: Test Debenhams bundle pdp validation

@automated @DEBD-577 @DEBD-579
Scenario: Validate the Mens's suite bundle product list view
  Given I navigate to "menSuiteBundleProduct"
  And I should see "pdpMainImage" exist on "pdpPage"
  And I should see "pdpthumbnailVerticalImages" exist on "pdpPage"
  When I am in view of "bundleVerticalProductSection" on "pdpPage"
  And I should see "bundleVerticalProductSection" exist on "pdpPage"
  And I should see "sizeSelectorForBundle" exist on "pdpPage"
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagListFirstProd" on "pdpPage"
  And I wait for "2000" milliseconds
  And I click on "addToBagListSecondProd" on "pdpPage"
  And I wait for "2000" milliseconds
  And I should not see "baynoteSection" on "pdpPage"
  And I should not see "recentlyViewed" on "pdpPage"
  And I should not see "roundRobinSection" on "pdpPage"

@notAutomated @DEBD-577 @DEBD-579 @deprecated
Scenario: Validate the Dinnerware/Luggage bundle product grid view
  Given I navigate to "luggageBundleProduct"
  And I should see "pdpMainImage" exist on "pdpPage"
  And I should not see "pdpthumbnailVerticalImages" on "pdpPage"
  When I am in view of "bundleHorizontalProductSection" on "pdpPage"
  And I should see "bundleHorizontalProductSection" exist on "pdpPage"
  And I click on "addToBagGridFirstProd" on "pdpPage"
  And I wait for "2000" milliseconds
  And I click on "addToBagGridSecondProd" on "pdpPage"
  And I wait for "2000" milliseconds
  And I click on "addToBagGridThirdProd" on "pdpPage"
  And I wait for "2000" milliseconds
  And I should not see "sizeSelectorForBundle" on "pdpPage"
  And I should not see "baynoteSection" on "pdpPage"
  And I should not see "recentlyViewed" on "pdpPage"
  And I should not see "roundRobinSection" on "pdpPage"

@notautomated @DEBD-577 @DEBD-579 @depricated
Scenario: Navigate to bundle pdp page and validate that countdown timer should not be displayed
Given I navigate to "luggageBundleProduct"
And I should not see "urgentDeliveryMessage" on "pdpPage"

@notAutomated @DEBD-577 @DEBD-579
Scenario: Validate the Total price in  Mens's suite bundle pdp
Given I navigate to "menSuiteBundleProduct"
When I am in view of "bundleVerticalProductSection" on "pdpPage"
And I should see the "now" and "was" price
And I should see the "total price" for "product1&product2" on "pdpPage"

@notAutomated @DEBD-577 @DEBD-579
Scenario: Validate the Prices in  Dinnerware/Luggae bundle pdp
Given I navigate to "luggageBundleProduct"
And I should see "PriceRange" exist on "pdpPage"
And I should see the "now" and "was" price
When I am in view of "bundleHorizontalProductSection" on "pdpPage"
And I should see "PriceRangeProd1" exist on "pdpPage"
And I should see "PriceRangeProd2" exist on "pdpPage"
And I should see "PriceRangeProd3" exist on "pdpPage"

@manual @DEBD-577 @DEBD-579
Scenario: Navigate to Bundle  PDP page and validate  out of stock and low stock behavior
Given I navigate to "luggageBundleProduct"
And I validate "Out of Stock" message from  "bundleHorizontalProductSection" on  "pdpPage"
And I should not see "addToBagButton" on "pdpPage"
And I should not see "quanitySelector" on "pdpPage"
And I should not see "Price" for Out of stock product on "pdpPage"
When I navigate to "menSuiteBundleProduct"
Then I select "low stock" size from "dropdown"
And I validate "low stock" message from  "dropdown" on  "pdpPage"

