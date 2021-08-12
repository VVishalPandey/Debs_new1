Feature: Test Debenhams Bundle pdp page validation

@manual @DEBD-108 @awsManual
Scenario: Validate the Mens's suite bundle product list view
  Given I navigate to "menSuiteBundleProduct"
  Then I should see product image on "pdpPage"
  And I should see the "now" and "was" price
  And I should see the "productDetails" on "pdpPage"
  And I should see the "sizeSelector" on "pdpPage"
  And I should see the "addToBagButton" on "pdpPage"
  And I should not see "baynote" on "pdpPage"
  And I should not see "recentlyViewed" on "pdpPage"
  And I should not see "roundRobins" on "pdpPage"

@manual @DEBD-562 @awsManual
Scenario: Validate the Add to bag for OOS product in Mens's suite bundle product list view
  Then I select "Out of Stock" size
  And I validate "Out of Stock" message  on  "pdpPage"
  Then I should see "addToBagButton" "disabled" on "pdpPage"
  And I should see quantity selector should be greayed out
  Then I select "low stock" size
  And I validate "low stock" message on  "pdpPage"

@manual @DEBD-108 @awsManual
Scenario: Validate the Dinnerware bundle product grid view
  Given I navigate to "dinnerWareBundleProduct"
  Then I should see product just main image on "pdpPage"
  And I should see the "now" and "was" price
  And I should see the "total price" for "product1" on "pdpPage"
  And I should see the "total price" for "product2" on "pdpPage"
  And I should see the "total price" for "product3" on "pdpPage"
  And I should see the "productDetails" on "pdpPage"
  And I should see the "sizeSelectorP1" on "pdpPage"
  And I should see the "addToBagButtonP1" on "pdpPage"
  And I should see the "sizeSelectorP2" on "pdpPage"
  And I should see the "addToBagButtonP2" on "pdpPage"
  And I should see the "sizeSelectorP3" on "pdpPage"
  And I should see the "addToBagButtonP3" on "pdpPage"
  And I should not see "baynote" on "pdpPage"
  And I should not see "recentlyViewed" on "pdpPage"
  And I should not see "roundRobins" on "pdpPage"

@notautomated @DEBD-562 @awsManual
Scenario: Navigate toBundle  PDP page and validate  out of stock and low stock behavior
  Given I navigate to "BundlePDPatyPDPurl"
  Then I select "Out of Stock" size
  And I validate "Out of Stock" message  on  "pdpPage"
  Then I should see "addToBagButton" "disabled" on "pdpPage"
  And I should see quantity selector should be greayed out
  Then I select "low stock" size
  And I validate "low stock" message on  "pdpPage"

@automated @PDP @Fixed @DEBD-108
Scenario: Validate customer photo container on PDP page
  Given I navigate to "bundlepdpPage"
  Then I should see "noCustomerPhotosContainer" exist on "pdpPage"
