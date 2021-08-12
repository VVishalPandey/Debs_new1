Feature: Test Debenhams Chanel pdp page validation

@automated @DEBD-263
Scenario: Login to CCC site
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"

@automated @PDP @Fixed @DEBD-107
Scenario: Validate the Chanel more colour badge PDP page
  Given I navigate to "chanelLipstickPdp"
  Then I verify "href" of "chanelHeader" as "chanelHeaderLink" on "pdpPage"
  Then I should see "breadcrumbSection" exist on "pdpPage"
  And I should see "chanelBeautyBreadcrumb" as "Beauty" on "pdpPage"
  And I should see "chanelBrandName" exist on "pdpPage"
  Then I should verify "chanelBrandName" is "uppercase" on "pdpPage"
  And I should see "productName" exist on "pdpPage"
  #Then I should verify "productName" is "uppercase" on "pdpPage"
  And I should see "productPrice" exist on "pdpPage"
  And I should see "itemNo" exist on "pdpPage"
  Then I should see "pdpImageSection" exist on "pdpPage"
  When I should see "colourSwatches" exist on "pdpPage"
  Then I should see "colourDropDown" exist on "pdpPage"
  And I should see "saveForLaterButton" exist on "pdpPage"
  And I am in view of "prodDescSection" on "pdpPage"
  Then I should see "prodDescSection" containing "ROUGE COCO SHINE makes an" on "pdpPage"
  And I should see "deliveryAndReturnsOptions" exist on "pdpPage"
  And I should see "deliveryDetails" exist on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "clickAndCollectMoreInfoLink" exist on "pdpPage"
  And I should see "chanelReturnEspot" exist on "pdpPage"
  Then I should not see "recentlyViewed" on "pdpPage"
  Then I should scroll to "chanelHeader" on "pdpPage"
  And I click on "chanelHeader" on "pdpPage"
  Then I should see "url" contains "/chanel"
  Then I go back to previous page

@manual @DEBD-107 @awsManual
Scenario: Validate the OOS SKU for Chanel PDP
  Then I am in view of "colourSwatches" on "pdpPage"
  And I select Out of Stock colour from Colourswatches
  Then I should see "productSizeMessage" as "Sorry - this option is currently out of stock." on "pdpPage"
  And I validate low stock message on "pdpPage"

@automated @PDP @Fixed @DEBD-107
Scenario: Validate the quantity selector is disabled when quantity set to 3 (max quantity) multi-colour PDP
  And I enter "3" in "stepperCount" on "pdpPage"
  Then I should see "stepperIncrement" "disabled" on "pdpPage"
  Then I add to bag quantity "2" and go to my bag page

@automated @PDP @Fixed @DEBD-107
Scenario: Validate the Chanel single PDP page
  Given I navigate to "testChanelPerfPdpURL"
  Then I verify "href" of "chanelHeader" as "chanelHeaderLink" on "pdpPage"
  Then I should see "breadcrumbSection" exist on "pdpPage"
  And I should see "chanelBeautyBreadcrumb" as "Beauty" on "pdpPage"
  And I should see "chanelBrandName" exist on "pdpPage"
  Then I should verify "chanelBrandName" is "uppercase" on "pdpPage"
  And I should see "productName" exist on "pdpPage"
  #Then I should verify "productName" is "uppercase" on "pdpPage"
  And I should see "productPrice" exist on "pdpPage"
  And I should see "itemNo" exist on "pdpPage"
  Then I should see "pdpImageSection" exist on "pdpPage"
  And I should see "saveForLaterButton" exist on "pdpPage"
  And I am in view of "prodDescSection" on "pdpPage"
  Then I should see "prodDescSection" containing "Floral-aldehydic, a bouquet of abstract flowers with an indefinable" on "pdpPage"
  And I should see "deliveryAndReturnsOptions" exist on "pdpPage"
  And I should see "deliveryDetails" exist on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "clickAndCollectMoreInfoLink" exist on "pdpPage"
  And I should see "chanelReturnEspot" exist on "pdpPage"
  Then I should not see "recentlyViewed" on "pdpPage"
  Then I should scroll to "chanelHeader" on "pdpPage"
  And I click on "chanelHeader" on "pdpPage"
  Then I should see "url" contains "/chanel"
  Then I go back to previous page

