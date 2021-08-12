Feature: Test Debenhams Chanel pdp page validation

@automated @PDP @Fixed @DEBD-107
Scenario: Validate the Chanel more colour badge PDP page
  Given I navigate to "chanelMakeUpUrl"
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

@manual @DEBD-107 @awsManual
Scenario: Validate that error is displayed when user try to add quantity more than 3 to bag
  Then I empty the minibag
  Then I add to bag quantity "3" and go to my bag page
  And I should see the mini bag count as 3
  Then I add to bag quantity "1" and go to my bag page
  And I should see the error "You have exceeded the maximum quantity allowed for this item"

@manual @DEBD-107 @awsManual
Scenario: Validate the UI for the Chanel page
  Given I navigate to "ChanelPDP"
  Then I should see productName and information in arial font
  And I should see Brand, Product name and Product description always start on a new line
  And I should see reduced product detail info
  And I should see Price per ml/g
  And I should not see "promotionalEspot" on "pdpPage"
  Then I navigate to women dress PDP page
  And I should not see Chanel in recently viewed section
  And I should see Add to bag button in black colour when clicked
  And I should see a tick mark over the add to bag button
  And I should see the save for later as black when clicked

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
  Then I should see "prodDescSection" containing "CHANEL introduces three essential N°5 'purse jewels" on "pdpPage"
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

@manual  @awsManual @DEBD-107
Scenario: Validate the quantity selector is disabled when quantity set to 3 (max quantity) single SKU
  And I enter "3" in "stepperCount" on "pdpPage"
  Then I should see "stepperIncrement" "disabled" on "pdpPage"
  Then I enter "2" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  #And I should verify "addToBagButton" "rgba(0, 0, 0, 1)" to be highlighted "background-color" on "pdpPage"

@manual @DEBD-604
Scenario: validate UI of chanel pdp dropdown
  Given I'm on Chanel PDP with multi color
  When I on dropdown
  Then I should see the border of the dropdown in black colour
  And I should see black drop down arrow
