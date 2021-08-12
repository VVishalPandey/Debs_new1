Feature: Test Debenhams quick shop validation

  @automated @PDP @Fixed @DEBD-2240 @DEBD-2239 @DEBD-2269 @DEBD-2539
  Scenario: Navigate to Debenhams Beauty  psp page and validate the quick Shop button
    Given I navigate to "homeUKURL"
    Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
    When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
    Then I should see "headerText" as "Lipstick" on "pspPage"
    Then I should validate product name on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    When I hover over product "2" on "pspPage"
    Then I should see quickShop button "appear" on product "2" on "pspPage"
    And I should see quickShop button "disappear" on product "1" on "pspPage"


  @automated @PDP @Fixed @DEBD-2240 @DEBD-2239 @DEBD-2269 @DEBD-2539
  Scenario: Navigate to Debenhams Beauty  psp page and validate the quick Shop click functionality
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    Then I should validate product name on "quickShop"

  @automated @PDP @Fixed @DEBD-2240 @DEBD-2539
  Scenario: Navigate to quick shop and validate the components
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I should see "quickShopThumbnailImages" exist on "pspPage"
    And I should see "quickShopMainImage" exist on "pspPage"
    And I should see "productName" exist on "pspPage"
    And I should see "quickShopProductPrice" exist on "pspPage"
    # And I should see "quickShopPricePerMlMg" exist on "pspPage"
    And I should see "quickShopRatingSummaryInHeader" exist on "pspPage"
    And I should see "quickShopAddToBagButton" exist on "pspPage"
    And I should see "quickShopViewProductPageLink" exist on "pspPage"
    And I should see "quickShopColourDropDown" exist on "pspPage"
    And I should see "quickShopQuantitySelector" exist on "pspPage"
    And I should not see "swatchColorSelectorOptions" on "pspPage"
    And I should not see "saveForLaterIcon" on "pspPage"
    And I should not see "shopMoreText" on "pspPage"
    And I should not see "recentlyViewed" on "pspPage"
    And I should not see "prodDescSection" on "pspPage"
    And I should not see "deliveryUrgencyDay" on "pspPage"
    And I should not see "beautyClubValuePoints" on "pspPage"


  @automated @PDP @Fixed @DEBD-2240 @DEBD-2247 @DEBD-2244
  Scenario: Navigate to Debenhams Beauty Perfume perfume quick Shop overlay and validate add to bag for size dropdown
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Dior" under "Beauty" on commonPage bigscreen
    And I select the product "1" in "pspPage" and add to bag from quickView
    When I "validate & click" subMenu option "Dior" under "Beauty" on commonPage bigscreen
    And I click on "firstProductImage" on "pspPage"
    And I validate current pdp product "exist" on "myBagPage"

  @automated @PDP @Fixed @DEBD-2245
  Scenario: Navigate to debenhams quick shop and validation of the quantity selector when it is available less than 90
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "All makeup" under "Beauty" on commonPage bigscreen
    When I click quickShop button on product "1" on "pspPage"
    And I should validate minibag count "before"
    And I change the stepper count to "2"
    When I click on "quickShopAddToBagButton" on "pspPage"
    And I validate current pdp product "exist" on "myBagPage"
    Then I should validate minibag count "after"


  @automated @PDP @Fixed @DEBD-2245
  Scenario: Navigate to debenhams quick shop overlay and validation of the quantity selector when it is available less than 90 and quanity exceeded message
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "bareMinerals" under "Beauty" on commonPage bigscreen
    When I click quickShop button on product "2" on "pspPage"
    And I should validate minibag count "before"
    And I select available size on "pdpPage"
    And I change the stepper count to "10"
    When I click on "quickShopAddToBagButton" on "pspPage"
    And I should see "quantityExceededMessage" exist on "pspPage"
    And I change the stepper count to "2"
    When I click on "quickShopAddToBagButton" on "pspPage"
    And I validate current pdp product "exist" on "myBagPage"
    Then I should validate minibag count "after"



  @automated @PDP @Fixed @DEBD-2245
  Scenario: Navigate to debenhams quick shop overlay and validation of the quantity selector increment disable
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "bareMinerals" under "Beauty" on commonPage bigscreen
    When I click quickShop button on product "1" on "pspPage"
    And I change the stepper count to "14"
    And I should see value of "stepperCount" as "14" on "pspPage"
    Then I should see "stepperIncrement" "disabled" on "pspPage"
    And I should validate minibag count "before"
    And I change the stepper count to "1"
    When I click on "quickShopAddToBagButton" on "pspPage"
    And I validate current pdp product "exist" on "myBagPage"
    Then I should validate minibag count "after"

  @automated @PDP @Fixed @DEBD-2248
  Scenario: Validate view product description page link in quick shop overlay
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
    And I should validate product name on "pspPage"
    And I click quickShop button on product "1" on "pspPage"
    And I should validate product name on "quickShop"
    And I should see "quickShopViewProductPageLink" exist on "pspPage"
    And I click on "quickShopViewProductPageLink" on "pspPage"
    And I should validate product name on "pdpPage"
    And I go back to previous page
    And I should not see "quickShopOverlay" on "pspPage"

  @automated @PDP @Fixed @DEBD-2249 @DEBD-2250
  Scenario: Validate quick shop low and out of stock behavior for color dropdown
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
    And I click quickShop button on product "6" on "pspPage"
    # Then I select "Out of Stock" size from "quickShopDropdown"
    # And I validate "Out of Stock" message from  "dropdown" on  "pdpPage"
    Then I select "low stock" size from "quickShopDropdown"
    And I validate "low stock" message from  "dropdown" on  "pdpPage"

  @automated @PDP @Fixed @DEBD-2240
  Scenario: Navigate to Debenhams Chanel  psp page and validate  quick Shop button should not be displayed
    Given I navigate to "chanelpspPage"
    When I hover over product "1" on "pspPage"
    Then I should not see "quickShopButton" on "pspPage"

  @automated @PDP @Fixed @DEBD-2241
  Scenario: Navigate to Debenhams quick Shop overlay and validate close icon behavior
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Perfume" under "Beauty" on commonPage bigscreen
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I click on "quickShopCloseButton" on "pspPage"
    And I should not see "quickShopOverlay" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I click using JQuery on "quickShopOverlayOutsideClick" on "pspPage"
    And I should not see "quickShopOverlay" on "pspPage"




  @automated @PDP @Fixed @DEBD-2269
  Scenario: Navigate to quick shop and verify the colour accordion for beauty product in Quick Shop with 13 or more colours in dropdown
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
    And I click quickShop button on product "1" on "pspPage"
    Then I should not see "pspColourSwatches" on "pspPage"
    And I should see "quickShopColourDropDown" exist on "pspPage"
    And I should not see "showmoreColorsButton" containing "Show more colours" on "pspPage"


  @automated @PDP @Fixed   @DEBD-2242
  Scenario: Validate in debenhams quick shop that the user should see the thumbnails without carousal arrows  with 4 or less product images
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Fragrance gift sets" under "Beauty" on commonPage bigscreen
    When I click quickShop button on product "1" on "pspPage"
    Then I should see "quickShopThumbnailImages" exist on "pspPage"
    And I should not see "quickShopThumbnailDownCarousalArrow" on "pspPage"
    And I should not see "quickShopThumbnailUpCarousalArrow" on "pspPage"

  @automated @PDP @Fixed @DEBD-2242
  Scenario: Validate in debenhams quoick shop that the user should see the thumbnails with carousal arrows with 5 or more product images
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "All makeup" under "Beauty" on commonPage bigscreen
    When I click quickShop button on product "2" on "pspPage"
    Then I should see "quickShopThumbnailImages" exist on "pspPage"
    And I should see "quickShopThumbnailDownCarousalArrow" exist on "pspPage"
    And I should see "quickShopThumbnailUpCarousalArrow" exist on "pspPage"



  @automated @PDP @Fixed   @DEBD-2242
  Scenario: Validate that the zoomed image should be displayed on clicking on the main Image Container on quick shop
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
    And I click quickShop button on product "1" on "pspPage"
    When I hover and click on "quickShopMainImageContainer" on "pspPage"
    Then I should not see "quickShopZoomedImagePopUp" on "pspPage"



  @automated @PDP @Fixed @DEBD-2539
  Scenario Outline: Navigate to quick Shop overlay and validate add to bag
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation1"
    When I "validate & click" subMenu option "<subcategory>" under "<category>" on commonPage bigscreen
    Then I should validate product name on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    And I select the product "1" in "pspPage" and add to bag from quickView
    When I "validate & click" subMenu option "<subcategory>" under "<category>" on commonPage bigscreen
    And I click on "firstProductImage" on "pspPage"
    And I validate current pdp product "exist" on "myBagPage"

    Examples:
      | category | subcategory |
      | Beauty   | Lipstick    |



  @automated @PDP @Fixed @DEBD-2539
  Scenario: Navigate to Debenhams Bauty  psp page and validate  quick Shop button should be displayed
    Given I navigate to "psp2PaginationPageUrl"
    #When I click on "sortOptionPriceHighLow" on "pspPage"
    And I set mvt test for "quickViewPSP" as "variation1"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    When I hover over product "2" on "pspPage"
    Then I should see quickShop button "appear" on product "2" on "pspPage"
    And I should see quickShop button "disappear" on product "1" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"


  @automated @PDP @Fixed @DEBD-2229
  Scenario: Navigate to DOTIE and verify quick shop should not be displayed in beauty psp's
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation1"
    And I "validate & click" country as "IE" from "countryOptions" on "commonPage"
    When I "validate & click" subMenu option "Perfume" under "Beauty" on commonPage bigscreen
    And I hover over product "1" on "pspPage"
    Then I should not see "quickShopButton" on "pspPage"


@manual @DEBD-2240
Scenario: Navigate to quick shop and validate that it should not be scrollable
 When I am in a view of "quickShopOverlay"
 And the overlay should not be scrollable
 And all the components above the fold


@manual @DEBD-2269
Scenario: Validate UI of dropdown in quick shop
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Chanel" under "Beauty" on commonPage bigscreen
  And I click quickShop button on product "1" on "pspPage"
  When I on dropdown
  Then I should see colour swatch border is highlighted in orange
  And I should see the chosen colour fills the colour drop down

@manual @DEBD-2244
Scenario: Validate size order for the quick shop in size dropdowns
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Perfume" under "Beauty" on commonPage bigscreen
  When I click quickShop button on product "1" on "pspPage"
  Then I should see the order of sizes as  XS, S, M, L, XL sizes

@manual  @DEBD-2242
Scenario: Validate in debenhams quick shop that the carousel of smaller thumbnail images to the left of the large container should be displayed  with multiple images
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
  When I click quickShop button on product "1" on "pspPage"
  Then I should see the first product image in a large container
  And I should see a carousel of smaller thumbnail images to the left of the large container
  And I should see the first image in the thumbnails will have a green border

@manual  @DEBD-2242
Scenario: Validate in debenhams quick shop that the user should see thumbnail carousel arrow to be grey when a thumbnail carousel arrow is inactive and thumbnail carousel arrow to be teal when active
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "All makeup" under "Beauty" on commonPage bigscreen
  When I click quickShop button on product "1" on "pspPage"
  Then I should see "quickShopThumbnailImages" exist on "pspPage"
  And I should see "quickShopThumbnailcarousalArrows" exist on "pspPage"
  When I navigate to top of the "quickShopThumbnailImages" on "pspPage"
  Then I should see "quickShopThumbnailcarousaltopArrow" as grey
  And I should see "quickShopThumbnailcarousalbottomArrow" as teal

@manual  @DEBD-2242
Scenario: Validate that user should see a grey border when he hovers or focuses on a thumbnail that is not showing in the main image on quick shop
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "All make up" under "Beauty" on commonPage bigscreen
  And I click quickShop button on product "1" on "pspPage"
  And I hover or focus on a thumbnail that is not showing in the main image
  Then I should see a grey border around the "thumbnailImage"

@manual  @DEBD-2242
Scenario: Validate that main image should be updated with the relevant thumbnail when user clicks on each thumbnail on quick shop with multiple images
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "All make up" under "Beauty" on commonPage bigscreen
  And I click quickShop button on product "1" on "pspPage"
  When I click on "thumbnailImage" on "pspPage"
  Then I should see the "mainImage" should be updated with relevant image
  And I should see a teal border around selected "thumbnailImage"


@manual  @DEBD-2242
Scenario: Validate that the user should be able to see next set of product image thumbnails when user clicks up or down arrow on quick shop with 5 or more product images
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "All make up" under "Beauty" on commonPage bigscreen
  And I click quickShop button on product "1" on "pspPage"
  When I click "thumbnailcarousaltopArrow" on "pspPage"
  Then I should see next set of product image thumbnails
  When I click "thumbnailcarousalbottomArrow" on "pspPage"
  Then I should see next set of product image thumbnails

@manual  @DEBD-2242
Scenario: Validate that the image should be zoomed in to the focused area of the main image on quick shop
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
  And I click quickShop button on product "1" on "pspPage"
  When I hover over the "mainImage" on "pspPage"
  Then I should see the image will zoom in to the area I'm focusing on
  And I should not see "thumbnailcarousalArrows" on "pspPage"
  When I move my cursor around
  Then I should see the image will remain zoomed in
  And I should see focus on the new location of my cursor


@manual @DEBD-2229
Scenario: Navigate to Tablet and mobile site and verify quick shop should not be displayed in beauty psp's
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
  And I validate quick shop button should not be displayed.



