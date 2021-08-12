Feature: Test Debenhams Regression scenarios 21 to 24

@automated @ops-TABLET @PDP @Sno.-21
Scenario: Verify that the Beauty PDP (multisku) page
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  And I wait for "3000" milliseconds
  Then I empty mini bag
  Then I should see "searchIcon" exist on "commonPage"
  And I click on "searchIcon" on "commonPage"
  And I enter "OpsBeautyMultiTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I should see "colourSwatches" exist on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-21
Scenario: Verify that the Beauty PDP (multisku) page colour swatches and dropdown
  Then I should see selected colour as "A-Go-Go"
  And I select available colour "2" as "Ayesha" from "colourSwatch"
  And I should see selected colour as "Ayesha"
  Then I should see "colourDropDown" exist on "pdpPage"
  And I should see selected colour as "Ayesha"
  # Then I select available colour "3" as "Bachelorette" from "colourDropDown"
  # And I should see selected colour as "Bachelorette"

@automated @ops-TABLET @PDP @Sno.-21
Scenario: Verify that the Beauty PDP (multisku) page max qunatity for add to bag and price per ml, beauty point msg
  When I am in view of "stepperCount" on "pdpPage"
  Then I should see "pricePerml" exist on "pdpPage"
  And I enter "3" in "stepperCount" on "pdpPage"
  Then I should see "stepperIncrement" "enabled" on "pdpPage"
  # And I should see "beautyClubMessage" containing "with the Beauty Club Card" on "pdpPage"
  And I enter "1" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  # Then I should see "viewBasketCloseButton" exist on "pdpPage"
  # And I click on "viewBasketCloseButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "1" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-21
Scenario: Validate the prodduct description, delivery and return and review accordion
  And I am in view of "productDescriptionLink" on "pdpPage"
  And I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescSection" exist on "pdpPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  And I should see "nonReturnMsg" containing "Non returnable item - Beauty" on "pdpPage"
  Then I click on "miniBagButton" on "pdpPage"
  And I should see "colourName" containing "Ayesha" on "minibagPage"
  And I click on "closeButton" on "minibagPage"

@automated @ops-TABLET @PDP @Sno.-22
Scenario: Verify that the Beauty PDP (dropdown selector) page
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  And I empty mini bag
  Then I should see "searchIcon" exist on "commonPage"
  And I click on "searchIcon" on "commonPage"
  And I enter "OpsBeautyDropTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I should see "sizeDropDown" exist on "pdpPage"
  When I should see "stepperIncrement" exist on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-22
Scenario: Verify that the Beauty PDP (dropdown) page max qunatity for add to bag and price per ml, beauty point msg
  When I am in view of "stepperCount" on "pdpPage"
  Then I should see "pricePerml" exist on "pdpPage"
  And I click on "stepperIncrement" on "pdpPage"
  Then I should see value of "stepperCount" as "2" on "pdpPage"
  # And I should see "beautyClubMessage" containing "with the Beauty Club Card" on "pdpPage"
  And I store name of product and select save item on pdpPage
  Then I select available size and add to bag on pdpPage
  Then I should see "addToCartButtonDisplayFinal" as "1" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-22
Scenario: Validate the prodduct description, delivery and return and review accordion
  And I am in view of "productDescriptionLink" on "pdpPage"
  And I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescSection" exist on "pdpPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  And I should see "nonReturnMsg" containing "Non returnable item - Beauty" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-23
Scenario: Verify that the Beauty PDP (single SKU) page zoom functionality
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  And I wait for "3000" milliseconds
  And I empty mini bag
  Then I should see "searchIcon" exist on "commonPage"
  And I click on "searchIcon" on "commonPage"
  And I enter "OpsBeautySingleTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I should see "stepperIncrement" exist on "pdpPage"
  When I click on "pdpImageToZoom" using jquery on "pdpPage"
  Then I should see "pdpCloseZoom" exist on "pdpPage"
  # And I click on "zoomNextButton" on "pdpPage"
  #Then I should see "zoomImageTitle" as "Show slide 3 of 4" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-23
Scenario: Verify that the Beauty PDP (single sku) page max qunatity for add to bag and price per ml, beauty point msg
  When I click on "pdpCloseZoom" on "pdpPage"
  Then I should not see "pdpCloseZoom" on "pdpPage"
  When I am in view of "stepperCount" on "pdpPage"
  Then I should see "pricePerml" exist on "pdpPage"
  And I click on "stepperIncrement" on "pdpPage"
  Then I should see value of "stepperCount" as "2" on "pdpPage"
  # And I should see "beautyClubMessage" containing "with the Beauty Club Card" on "pdpPage"
  And I store name of product and select save item on pdpPage
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "maxQuantityError" containing "You have exceeded the maximum quantity allowed for this item" on "pdpPage"
  When I enter "4" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  # Then I should see "viewBasketCloseButton" exist on "pdpPage"
  # And I click on "viewBasketCloseButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "4" on "pdpPage"
  And I should not see "maxQuantityError" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-23
Scenario: Validate the prodduct description, delivery and return and review accordion
  And I am in view of "productDescriptionLink" on "pdpPage"
  And I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescSection" exist on "pdpPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  And I should see "nonReturnMsg" containing "Non returnable item - Beauty" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-23
Scenario: Verify the GLP Furniture content page  for Furniture > Sofas & Chairs > All sofas & chairs
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Furniture" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Sofas & chairs" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "All sofas & chairs" on "commonPage"
  And I wait for "2000" milliseconds
  Then I should see "url" contains "furniture/sofas-chairs"
  # Then I should see "furnitureContentPageHeading" containing "Sofas and Armchairs" on "pspPage"
  # And I am in view of "furnitureStoreLocator" on "pspPage"
  # And I should see "furnitureStoreLocator" exist on "pspPage"

@automated @ops-TABLET @PDP @Sno.-24
Scenario: Navigate the furniture PSP page from the furniture content
  # Then I click on "furnitureAdspotLink" on "pspPage"
  And I should see "headerText" containing "Sofas & chairs" on "pspPage"
  When I am in view of "moreColourOptionBadging" on "pspPage"
  And I should see "moreColourOptionBadging" exist on "pspPage"
