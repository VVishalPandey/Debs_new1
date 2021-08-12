Feature: Test Debenhams Regression scenarios 24 to 28

@automated @ops-TABLET @PDP @Sno.-24
Scenario: Search a Furniture(sofa) product and verify the correct products are displayed in the search result
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  And I empty mini bag
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsFurnitureMultiTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "OpsFurnitureMultiTestText"

@automated @ops-TABLET @PDP @Sno.-24
Scenario: Select a product and verify zoom functionality of image, Short description and price
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I click on "pdpImageToZoom" using jquery on "pdpPage"
  Then I should see "pdpCloseZoom" exist on "pdpPage"
  And I click on "zoomNextButton" on "pdpPage"
  #Then I should see "zoomImageTitle" as "Show slide 3 of 4" on "pdpPage"
  When I click on "pdpCloseZoom" on "pdpPage"
  Then I should not see "pdpCloseZoom" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-24
Scenario: Navigate to Sofa beds PDP and validate changing colour swatches for fabric and feet
    Then I should see "selectedFabricColor" exist on "pdpPage"
    And I should see "selectedFeetColor" exist on "pdpPage"
    And I should see "changeSelectedFabric" exist on "pdpPage"
    And I should see "changeSelectedFeet" exist on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-24
Scenario: Validate furnitre PDP navigation behavior on Fabric change
  Then I click on "changeSelectedFabric" on "pdpPage"
  And I change "SelectedFabric" the product changes on "pdpPage"
  #Then I should be taken to the main image of same PDP

@automated @ops-TABLET @PDP @Sno.-24
Scenario: Validate furnitre PDP navigation behavior on Feet change
  Then I click on "changeSelectedFeet" on "pdpPage"
  And I change "SelectedFeet" the product changes on "pdpPage"
  #Then I should be taken to the main image of same PDP

@automated @ops-TABLET @PDP @Sno.-25
Scenario: Navigate to Sofa beds PDP and validate order swatches form validation
  When I click on "orderSwatchesLink" on "pdpPage"
  Then I should see "colorListHeaderText" as "Order FREE Swatches" on "pdpPage"
  And I should see "orderSwatchFirstOption" exist on "pdpPage"
  And I should see "orderSwatchesButton" exist on "pdpPage"
  And I should not see "noSwatchSelectedError" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-25
Scenario: Validate error message when selected order swatch button without selecting swatch
  When I am in view of "orderSwatchesButton" on "pdpPage"
  And I click on "orderSwatchesButton" on "pdpPage"
  Then I should see "noSwatchSelectedError" containing "No swatches selected - Please select a swatch from the options below before continuing" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-25
Scenario Outline: Validate swatchis ordered when user enters address and selects a swatch
  Then I click on "orderSwatchFirstOption" on "pdpPage"
  And I click on "orderSwatchesButton" on "pdpPage"
  When I am in view of "orderSwatchFirstName" on "pdpPage"
  And I enter "<firstName>" in "orderSwatchFirstName" on "pdpPage"
  And I enter "<lastName>" in "orderSwatchLastName" on "pdpPage"
  And I enter "<email>" in "orderSwatchEmail" on "pdpPage"
  And I enter "<houseNumber>" in "orderSwatchHouseNo" on "pdpPage"
  And I enter "<addressLine1>" in "orderSwatchAddressLine1" on "pdpPage"
  And I enter "<addressLine2>" in "orderSwatchAddressLine2" on "pdpPage"
  And I enter "<city>" in "orderSwatchCity" on "pdpPage"
  And I enter "<postcode>" in "orderSwatchPostcode" on "pdpPage"
  When I am in view of "orderSwatchesButton" on "pdpPage"
  #And I click on "orderSwatchesButton" on "pdpPage"
  #Then I should see "orderSwatchConfirmSection" exist on "pdpPage"
  #And I should see "orderSwatchConfirmContinueButton" exist on "pdpPage"
  #And I should see "orderSwatchConfirmText" as "Your swatches have been ordered" on "pdpPage"
  #And I should see "orderSwatchConfirmDeliveryText" as "We will deliver them within 3-5 working days" on "pdpPage"
  #Then I click on "orderSwatchConfirmContinueButton" on "pdpPage"

  Examples:
    | firstName | lastName | email                     | houseNumber | addressLine1      | addressLine2           | city   | postcode |
    | Vishal    | Malhotra | vmalhotra9918@sapient.com | Flat 31     | The Lock Building | High Street, Stratford | London | E152QB   |

@automated @ops-TABLET @PDP @Sno.-24
Scenario: Validate the prodduct description, product dimensions delivery and return and review accordion
  And I am in view of "productDescriptionLink" on "pdpPage"
  And I should see "productDimensions" as "H72 x W175 x D94cm" on "pdpPage"
  Then I click on "productDescriptionLink" on "pdpPage"
  And I should see "furnitureDimenH" containing "72" on "pdpPage"
  And I should see "furnitureDimenW" containing "175" on "pdpPage"
  And I should see "furnitureDimenD" containing "94" on "pdpPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  And I should see "deliveryOptionMto" containing "Made to order" on "pdpPage"
  And I should see "nonReturnMsg" exist on "pdpPage"
  And I should see "financeBannerContainer" exist on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-24
Scenario Outline: Validate the Save for later, credit card points and Shop more tag on PDP page
  When I should see "addToBagButton" exist on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"
  Then I click on "saveForLaterButton" on "pdpPage"
  # And I click on "saveForLaterPopUpCloseButton" on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  #And I wait for "5000" milliseconds
  When I click on "shopMoreTag2Text" on "pdpPage"
  And I wait for "3000" milliseconds
  Then I should see "headerText" as "Sofas & chairs" on "pspPage"
  And I should see "url" contains "furniture/sofas-chairs"
  #Then I go back to previous page

  Examples:
    | tag_name_1  | tag_name_2      | tag_name_3 |
    | Furniture   | Sofas & chairs  | Debenhams  |


@automated @ops-TABLET @PDP @Sno.-26
Scenario: Search a Furniture(single SKU) product and verify the correct products are displayed in the search result
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  And I empty mini bag
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsFurnitureSingleTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "OpsFurnitureSingleTestText"

@automated @ops-TABLET @PDP @Sno.-26
Scenario: Select a product and verify zoom functionality of image, Short description and price
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I click on "pdpImageToZoom" using jquery on "pdpPage"
  Then I should see "pdpCloseZoom" exist on "pdpPage"
  And I click on "zoomNextButton" on "pdpPage"
  #Then I should see "zoomImageTitle" as "Show slide 3 of 4" on "pdpPage"
  When I click on "pdpCloseZoom" on "pdpPage"
  Then I should not see "pdpCloseZoom" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-26
Scenario: Validate the prodduct description, product dimensions delivery and return and review accordion
  And I am in view of "productDescriptionLink" on "pdpPage"
  And I should see "productDimensions" as "H75 x W165 x D90cm" on "pdpPage"
  Then I click on "productDescriptionLink" on "pdpPage"
  And I should see "furnitureDimenH" containing "75" on "pdpPage"
  And I should see "furnitureDimenW" containing "165" on "pdpPage"
  And I should see "furnitureDimenD" containing "90" on "pdpPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  And I should see "deliveryOptionMto" containing "Made to order" on "pdpPage"
  And I should see "nonReturnMsg" exist on "pdpPage"
  And I should see "financeBannerContainer" exist on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-26
Scenario Outline: Validate the Save for later, credit card points and Shop more tag on PDP page
  When I should see "addToBagButton" exist on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"
  Then I click on "saveForLaterButton" on "pdpPage"
  # And I click on "saveForLaterPopUpCloseButton" on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  #And I wait for "5000" milliseconds
  When I click on "shopMoreTag2Text" on "pdpPage"
  Then I should see "headerText" as "Dining tables & chairs" on "pspPage"
  And I should see "url" contains "furniture/dining-tables-chairs"
  #Then I go back to previous page

  Examples:
    | tag_name_1  | tag_name_2               | tag_name_3 |
    | Furniture   | Dining tables & chairs  | Debenhams  |


@automated @ops-TABLET @PDP @Sno.-26
Scenario: Search a Furniture-Mattress(size dropdown) product and verify the correct products are displayed in the search result
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  And I empty mini bag
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsFurnitureMattressTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "OpsFurnitureMattressTestText"

@automated @ops-TABLET @PDP @Sno.-26
Scenario: Select a product and verify zoom functionality of image, Short description and price
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I click on "pdpImageToZoom" using jquery on "pdpPage"
  Then I should see "pdpCloseZoom" exist on "pdpPage"
  And I click on "zoomNextButton" on "pdpPage"
  #Then I should see "zoomImageTitle" as "Show slide 3 of 4" on "pdpPage"
  When I click on "pdpCloseZoom" on "pdpPage"
  Then I should not see "pdpCloseZoom" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-26
Scenario: Validate the prodduct description, product dimensions delivery and return and review accordion
  And I am in view of "productDescriptionLink" on "pdpPage"
  Then I click on "productDescriptionLink" on "pdpPage"
  And I should see "prodDescItemNumber" containing "3210033530" on "pdpPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  # And I should see "deliveryOptionMto" containing "Made to order" on "pdpPage"
  And I should see "nonReturnMsg" exist on "pdpPage"
  And I should see "financeBannerContainer" exist on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-26
Scenario Outline: Validate the Save for later, credit card points and Shop more tag on PDP page
  When I should see "addToBagButton" exist on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"
  Then I select available size and add to bag on pdpPage
  Then I click on "saveForLaterButton" on "pdpPage"
  # And I click on "saveForLaterPopUpCloseButton" on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "1" on "pdpPage"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  #And I wait for "5000" milliseconds
  When I click on "shopMoreTag2Text" on "pdpPage"
  Then I should see "headerText" as "Mattresses" on "pspPage"
  And I should see "url" contains "furniture/mattresses"
  #Then I go back to previous page

  Examples:
    | tag_name_1  | tag_name_2  | tag_name_3 |
    | Furniture   | Mattresses  | Sleepeezee  |

@automated @ops-TABLET @PDP @Sno.-27
Scenario: Search a Chanel perfume product and verify the correct products are displayed in the search result
  Given I logout
  Given I navigate to "chanelPerfumePdp"
  Then I should see "chanelSlimBanner" exist on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"
  Then I add to bag quantity "2" and go to my bag page
  And I store details from myBag to validate later

@automated @ops-TABLET @PDP @Sno.-28
Scenario: Search a Chanel lipstick product and verify the correct products are displayed in the search result
  Given I navigate to "chanelLipstickPdp"
  Then I should see "chanelSlimBanner" exist on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"
  Then I click on "saveForLaterButton" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-28
Scenario: Validate the prodduct description, delivery and return and no review accordion
  And I am in view of "prodDescSection" on "pdpPage"
  And I click on "prodDescSection" on "pdpPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  And I should not see "reviewsAccordion" on "pdpPage"
  # Then I am in view of "financeBanner" on "pdpPage"
  #And I verify "href" of "applyNowButton" as "applyNowLink" on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"
  Then I add to bag quantity "2" and go to my bag page
  And I store details from myBag to validate later

