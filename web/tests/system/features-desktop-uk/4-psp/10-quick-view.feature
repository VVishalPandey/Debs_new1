Feature: Test Debenhams quick shop validation

  @automated @Fixed @DEBD-2240 @DEBD-2239 @DEBD-2269 @DEBD-2539
  Scenario: Navigate to Debenhams Beauty  psp page and validate the quick Shop button
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
    Then I should see "headerText" as "Lipstick" on "pspPage"
    When I click on "sortOptionBestSelling" on "pspPage"
    Then I should validate product name on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    When I hover over product "2" on "pspPage"
    Then I should see quickShop button "appear" on product "2" on "pspPage"
    And I should see quickShop button "disappear" on product "1" on "pspPage"


  @automated @Fixed @DEBD-2240 @DEBD-2239 @DEBD-2269 @DEBD-2539
  Scenario: Navigate to Debenhams Beauty  psp page and validate the quick Shop click functionality
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    Then I should validate product name on "quickShop"

  @automated @Fixed @DEBD-2240 @DEBD-2539
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


  @automated @Fixed @DEBD-2240 @DEBD-2247 @DEBD-2244
  Scenario: Navigate to Debenhams Beauty Perfume perfume quick Shop overlay and validate add to bag for size dropdown
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Elemis" under "Beauty" on commonPage bigscreen
    And I select the product "1" in "pspPage" and add to bag from quickView
    And I validate current pdp product "exist" on "myBagPage"

  @automated @Fixed @DEBD-2245
  Scenario: Navigate to debenhams quick shop and validation of the quantity selector when it is available less than 90
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "All makeup" under "Beauty" on commonPage bigscreen
    When I click quickShop button on product "1" on "pspPage"
    And I should validate minibag count "before"
    And I change the stepper count to "2"
    When I click on "quickShopAddToBagButton" on "pspPage"
    And I validate current pdp product "exist" on "myBagPage"
    Then I should validate minibag count "after"


  @automated @Fixed @DEBD-2245
  Scenario: Navigate to debenhams quick shop overlay and validation of the quantity selector when it is available less than 90 and quanity exceeded message
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "bareMinerals" under "Beauty" on commonPage bigscreen
    When I click quickShop button on product "1" on "pspPage"
    And I should validate minibag count "before"
    And I select available size on "pdpPage"
    And I change the stepper count to "10"
    When I click on "quickShopAddToBagButton" on "pspPage"
    And I should see "quantityExceededMessage" exist on "pspPage"
    And I change the stepper count to "2"
    When I click on "quickShopAddToBagButton" on "pspPage"
    And I validate current pdp product "exist" on "myBagPage"
    Then I should validate minibag count "after"



  @automated @Fixed @DEBD-2245
  Scenario: Navigate to debenhams quick shop overlay and validation of the quantity selector increment disable
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Benefit" under "Beauty" on commonPage bigscreen
    When I click quickShop button on product "1" on "pspPage"
    And I change the stepper count to "99"
    And I should see value of "stepperCount" as "99" on "pspPage"
    Then I should see "stepperIncrement" "disabled" on "pspPage"
    And I should validate minibag count "before"
    And I change the stepper count to "1"
    When I click on "quickShopAddToBagButton" on "pspPage"
    And I validate current pdp product "exist" on "myBagPage"
    Then I should validate minibag count "after"

  @automated @Fixed @DEBD-2248
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

  @automated @Fixed @DEBD-2249 @DEBD-2250
  Scenario: Validate quick shop low and out of stock behavior for color dropdown
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Foundation" under "Beauty" on commonPage bigscreen
    And I click quickShop button on product "6" on "pspPage"
    # Then I select "Out of Stock" size from "quickShopDropdown"
    # And I validate "Out of Stock" message from  "dropdown" on  "pdpPage"
    Then I select "low stock" size from "quickShopDropdown"
    And I validate "low stock" message from  "dropdown" on  "pdpPage"

  @automated @Fixed @DEBD-2240
  Scenario: Navigate to Debenhams Chanel  psp page and validate  quick Shop button should not be displayed
    Given I navigate to "chanelpspPage"
    When I click on "sortOptionPriceHighLow" on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should not see "quickShopButton" on "pspPage"

  @automated @Fixed @DEBD-2241
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


  @automated @Fixed @DEBD-2269
  Scenario: Navigate to quick shop and verify the colour accordion for beauty product in Quick Shop with 13 or more colours in dropdown
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
    When I click on "sortOptionPriceLowHigh" on "pspPage"
    And I click quickShop button on product "1" on "pspPage"
    Then I should not see "pspColourSwatches" on "pspPage"
    And I should see "quickShopColourDropDown" exist on "pspPage"
    And I should not see "showmoreColorsButton" containing "Show more colours" on "pspPage"


  @automated @Fixed   @DEBD-2242
  Scenario: Validate in debenhams quick shop that the user should see the thumbnails without carousal arrows  with 4 or less product images
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Moisturisers" under "Beauty" on commonPage bigscreen
    When I click on "sortOptionName" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    Then I should see "quickShopThumbnailImages" exist on "pspPage"
    And I should not see "quickShopThumbnailDownCarousalArrow" on "pspPage"
    And I should not see "quickShopThumbnailUpCarousalArrow" on "pspPage"

  @automated @Fixed @DEBD-2242
  Scenario: Validate in debenhams quoick shop that the user should see the thumbnails with carousal arrows with 5 or more product images
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Moisturisers" under "Beauty" on commonPage bigscreen
    When I click on "sortOptionPriceHighLow" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    Then I should see "quickShopThumbnailImages" exist on "pspPage"
    And I should see "quickShopThumbnailDownCarousalArrow" exist on "pspPage"
    And I should see "quickShopThumbnailUpCarousalArrow" exist on "pspPage"


  @automated @Fixed   @DEBD-2242
  Scenario: Validate that the zoomed image should be displayed on clicking on the main Image Container on quick shop
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
    And I click quickShop button on product "1" on "pspPage"
    When I hover and click on "quickShopMainImageContainer" on "pspPage"
    Then I should not see "quickShopZoomedImagePopUp" on "pspPage"


  @automated @Fixed @DEBD-2229   ROI Need to move
  Scenario: Navigate to DOTIE and verify quick shop should not be displayed in beauty psp's
    Given I navigate to "homeURL"
    And I "validate & click" country as "IE" from "countryOptions" on "commonPage"
    When I "validate & click" subMenu option "Perfume" under "Beauty" on commonPage bigscreen
    And I hover over product "1" on "pspPage"
    Then I should not see "quickShopButton" on "pspPage"




  @automated @Fixed @DEBD-2539
  Scenario Outline: Navigate to quick Shop overlay and validate add to bag
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "<subcategory>" under "<category>" on commonPage bigscreen
    And I click on "sortOptionNewest" on "pspPage"
    Then I should validate product name on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    And I select the product "1" in "pspPage" and add to bag from quickView
    # And I validate current pdp product "exist" on "myBagPage"

    Examples:
      | category | subcategory |
      | Beauty   | Lipstick    |



  @automated @Fixed @DEBD-2539
  Scenario: Navigate to Debenhams Chanel  psp page and validate  quick Shop button should be displayed
    Given I navigate to "chanelpspPage"
    When I click on "sortOptionPriceHighLow" on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    When I hover over product "2" on "pspPage"
    Then I should see quickShop button "appear" on product "2" on "pspPage"
    And I should see quickShop button "disappear" on product "1" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"


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




  # ==========================================================================================================
  # # key =======>      window.setMVT{desktop: {quickViewPSP: 'variation1'}}


  @automated @Fixed @DEBD-2539
  Scenario Outline: Navigate to psp page and validate the quick Shop button for the categories (excluding furniture , electrical’s, suits , gifts/toys and search results PSP)
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation1"
    When I "validate & click" subMenu option "<subcategory>" under "<category>" on commonPage bigscreen
    Then I should see "headerText" as "<header text>" on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    And I wait for "2000" milliseconds
    When I hover over product "2" on "pspPage"
    Then I should see quickShop button "appear" on product "2" on "pspPage"
    And I should see quickShop button "disappear" on product "1" on "pspPage"
    When I click quickShop button on product "2" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I should see "quickShopMainImage" exist on "pspPage"
    And I should see "productName" exist on "pspPage"
    And I should see "quickShopProductPrice" exist on "pspPage"
    And I should see "quickShopRatingSummaryInHeader" exist on "pspPage"
    And I should see "quickShopAddToBagButton" exist on "pspPage"
    And I should see "quickShopViewProductPageLink" exist on "pspPage"
    And I should see "<dropdown>" exist on "pspPage"
    And I should see "quickShopQuantitySelector" exist on "pspPage"
    And I should not see "swatchColorSelectorOptions" on "pspPage"
    And I should not see "saveForLaterIcon" on "pspPage"
    And I should not see "shopMoreText" on "pspPage"
    And I should not see "recentlyViewed" on "pspPage"
    And I should not see "prodDescSection" on "pspPage"
    And I should not see "deliveryUrgencyDay" on "pspPage"
    And I should not see "beautyClubValuePoints" on "pspPage"
    And I click on "quickShopViewProductPageLink" on "pspPage"

    Examples:
      | category         | subcategory           | dropdown              | header text         |
      | Women            | Dresses               | quickShopSizeDropDown | Dresses             |
      | Lingerie         | All bras             | quickShopSizeDropDown   | Bras              |
      | Home & Furniture | Sheets                | quickShopSizeDropDown | Bed sheets          |
      | Men              | Formal shirts         | quickShopSizeDropDown | MEN'S SHIRTS        |
      | Kids             | All school uniform    | quickShopSizeDropDown | School uniform      |
      | Women            | Swimwear              | quickShopSizeDropDown | Swimwear            |
      | Women            | Wedding guest dresses | quickShopSizeDropDown | Wedding Guest Dresses             |
      | Women            | Knitwear              | quickShopSizeDropDown | Women's knitwear    |
      | Home & Furniture | Duvets                | quickShopSizeDropDown | Duvets              |
      | Gifts & Toys     | Gift boxes & bags      | quickShopSizeDropDown | Gift boxes & bags   |
      | Men              | Suits                 | quickShopSizeDropDown | Suits               |


  @automated @Fixed @DEBD-2539
  Scenario Outline: Navigate to psp page and validate the quick Shop functioanlity for no size/color dropdown products belonging to the categories (excluding furniture , electrical’s, suits , gifts/toys and search results PSP)
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation1"
    When I "validate & click" subMenu option "<subcategory>" under "<category>" on commonPage bigscreen
    Then I should see "headerText" as "<header text>" on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    And I wait for "2000" milliseconds
    When I hover over product "2" on "pspPage"
    Then I should see quickShop button "appear" on product "2" on "pspPage"
    And I should see quickShop button "disappear" on product "1" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I should see "quickShopMainImage" exist on "pspPage"
    And I should see "productName" exist on "pspPage"
    And I should see "quickShopProductPrice" exist on "pspPage"
    And I should see "quickShopRatingSummaryInHeader" exist on "pspPage"
    And I should see "quickShopAddToBagButton" exist on "pspPage"
    And I should see "quickShopViewProductPageLink" exist on "pspPage"
    And I should see "quickShopQuantitySelector" exist on "pspPage"
    And I should not see "swatchColorSelectorOptions" on "pspPage"
    And I should not see "saveForLaterIcon" on "pspPage"
    And I should not see "shopMoreText" on "pspPage"
    And I should not see "recentlyViewed" on "pspPage"
    And I should not see "prodDescSection" on "pspPage"
    And I should not see "deliveryUrgencyDay" on "pspPage"
    And I should not see "beautyClubValuePoints" on "pspPage"
    And I click on "quickShopViewProductPageLink" on "pspPage"

    Examples:
      | category         | subcategory           | header text                  |
      | Women            | Watches               | Watches                      |
      | Beauty           | Perfume               | Perfume                      |
      | Home & Furniture | Clocks                | Clocks                       |
      | Men              | Hats                  | Men's hats                   |
      | Gifts & Toys     | LEGO                  | LEGO                         |


  @automated @Fixed @DEBD-2558
  Scenario Outline: Navigate to psp page and validate the quick Shop button for the categories (furniture , electrical’s, suits and gifts/toys)
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation1"
    When I "validate & click" subMenu option "<subcategory>" under "<category>" on commonPage bigscreen
    Then I should see "headerText" as "<header text>" on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    And I wait for "2000" milliseconds
    When I hover over product "2" on "pspPage"
    Then I should see quickShop button "appear" on product "2" on "pspPage"
    And I should see quickShop button "disappear" on product "1" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I should see "quickShopMainImage" exist on "pspPage"
    And I should see "productName" exist on "pspPage"
    And I should see "quickShopProductPrice" exist on "pspPage"
    And I should see "quickShopRatingSummaryInHeader" exist on "pspPage"
    And I should see "quickShopViewProductPageLink" exist on "pspPage"
    And I should not see "saveForLaterIcon" on "pspPage"
    And I should not see "quickShopAddToBagButton" on "pspPage"
    And I should not see "quickShopQuantitySelector" on "pspPage"
    And I should not see "quickShopSizeDropDown" on "pspPage"
    And I click on "quickShopViewProductPageLink" on "pspPage"

    Examples:
      | category         | subcategory         | header text              |
      | Gifts & Toys     | Food & drinks gifts | Food & drink gifts       |
      | Gifts & Toys     | Alcohol gifts       | Alcoholic gifts          |
      | Home & Furniture | Sofas & chairs      | Sofas & chairs           |
      | Electricals      | Heating             | Heating                  |
      | Electricals      | Hair styling        | Hair styling             |
      | Electricals      | Kettles             | Kettles                  |
      | Electricals      | Kitchen electricals | Food & drink preparation |


  @automated @Fixed @DEBD-2558
  Scenario Outline: Navigate to search results page and verify the Quick View functionality
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation1"
    And I enter "<searchTerm>" in "searchField" on "commonPage"
    And I click on "searchApply" on "commonPage"
    And I should see "searchResultHeader" containing "Search results for" on "commonPage"
    And I should see "searchResultHeaderSearchTerm" containing "<searchTerm>" on "commonPage"
    Then I should validate product name on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    Then I should validate product name on "quickShop"
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I should see "quickShopThumbnailImages" exist on "pspPage"
    And I should see "quickShopMainImage" exist on "pspPage"
    And I should see "productName" exist on "pspPage"
    And I should see "quickShopProductPrice" exist on "pspPage"
    And I should see "quickShopRatingSummaryInHeader" exist on "pspPage"
    And I should see "quickShopAddToBagButton" exist on "pspPage"
    And I should see "quickShopQuantitySelector" exist on "pspPage"
    And I should see "<dropdown>" exist on "pspPage"
    And I should see "quickShopViewProductPageLink" exist on "pspPage"
    And I should not see "saveForLaterIcon" on "pspPage"
    And I click on "quickShopViewProductPageLink" on "pspPage"
    And I should validate product name on "pdpPage"

    Examples:
      | searchTerm | dropdown              |
      | dress      | quickShopSizeDropDown |
      | Shirts     | quickShopSizeDropDown |
      | Skirts     | quickShopSizeDropDown |


  @automated @Fixed @DEBD-2558
  Scenario Outline: Navigate to Did you mean search results page and verify the Quick View functionality
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation1"
    And I enter "<searchTerm>" in "searchField" on "commonPage"
    And I click on "searchApply" on "commonPage"
    And I should see "url" contains "search/dressesss"
    And I should see "searchSuggestText" contains "Did you mean:"
    And I should see "searchSuggestText" contains "? See our selection below for"
    And I should see "searchSuggestText" contains "or try searching again."
    And I should see "searchSuggestText" contains "<searchedResultTerm>"
    And I should see "searchResultHeader" containing "Search results for" on "commonPage"
    And I should see "searchResultHeaderSearchTerm" containing "<searchTerm>" on "commonPage"
    Then I should validate product name on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    Then I should validate product name on "quickShop"
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I should see "quickShopThumbnailImages" exist on "pspPage"
    And I should see "quickShopMainImage" exist on "pspPage"
    And I should see "productName" exist on "pspPage"
    And I should see "quickShopProductPrice" exist on "pspPage"
    And I should see "quickShopRatingSummaryInHeader" exist on "pspPage"
    And I should see "quickShopViewProductPageLink" exist on "pspPage"
    And I should see "quickShopAddToBagButton" exist on "pspPage"
    And I should see "<dropdown>" exist on "pspPage"
    And I should not see "saveForLaterIcon" on "pspPage"
    And I should see "quickShopQuantitySelector" exist on "pspPage"
    And I click on "quickShopViewProductPageLink" on "pspPage"
    And I should validate product name on "pdpPage"

    Examples:
      | searchTerm | dropdown              | searchedResultTerm |
      | dressesss  | quickShopSizeDropDown | dresses            |



  @automated @Fixed @DEBD-2558
  Scenario: Navigate to Quick View of Men Suits bundle product and verify the functionality
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation1"
    When I "validate & click" subMenu option "Suits" under "Men" on commonPage bigscreen
    And I wait for "4000" milliseconds
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I should see "quickShopThumbnailImages" exist on "pspPage"
    And I should see "quickShopMainImage" exist on "pspPage"
    And I should see "productName" exist on "pspPage"
    And I should see "quickShopProductPrice" exist on "pspPage"
    And I should see "quickShopRatingSummaryInHeader" exist on "pspPage"
    And I should see "quickShopViewProductPageLink" exist on "pspPage"
    And I should see "quickShopAddToBagButton" exist on "pspPage"
    And I should not see "saveForLaterIcon" on "pspPage"
    And I should see "quickShopQuantitySelector" exist on "pspPage"
    And I should see "quickShopSizeDropDown" exist on "pspPage"
    And I click on "quickShopViewProductPageLink" on "pspPage"



  @manual @DEBD-2558
  Scenario Outline: Navigate to search results page for mixed bag items where few items should not have add to bag
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation1"
    And I enter "<searchTerm>" in "searchField" on "commonPage"
    And I click on "searchApply" on "commonPage"
    And I should see "searchResultHeader" containing "Search results for" on "commonPage"
    And I should see "searchResultHeaderSearchTerm" containing "<searchTerm>" on "commonPage"
    Then I should validate product name on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    And I should see Add to Bag, dropdown and quanitity for the products excluing catgories mentioned in the examples
    And I should not see Add to Bag, dropdown and quanitity for the products including catgories mentioned in the examples

    Examples:
      | category     |
      | Gifts & Toys |
      | Gifts & Toys |
      | Furniture    |
      | Furniture    |
      | Furniture    |
      | Furniture    |
      | Furniture    |
      | Furniture    |
      | Furniture    |
      | Furniture    |
      | Furniture    |
      | Electricals  |
      | Electricals  |
      | Electricals  |
      | Electricals  |

      | searchTerm  |
      | blue fabric |
      | velvet      |


  # # ==================================================================================================================================================================================
  # # Below test cases has been documented based on the condition
  # # 1.Maximiser check to display countdown delivery urgency timer in quick view of psp
  # # key =======>      window.setMVT{desktop: {quickViewPSP: 'variation2'}}



  @automated @Fixed @DEBD-2863
  Scenario Outline:  Navigate to psp page and validate the urgency delivery timer should be displayed in quick Shop button for the non exclusion (no Add To Bag)categories
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation2"
    When I "validate & click" subMenu option "<subcategory>" under "<category>" on commonPage bigscreen
    Then I should see "headerText" as "<header text>" on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    When I hover over product "2" on "pspPage"
    Then I should see quickShop button "appear" on product "2" on "pspPage"
    And I should see quickShop button "disappear" on product "1" on "pspPage"
    When I click quickShop button on product "2" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    And I should see "quickShopDeliveryCountdownTimer" exist on "pspPage"
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I should see "quickShopMainImage" exist on "pspPage"
    And I should see "productName" exist on "pspPage"
    And I should see "quickShopProductPrice" exist on "pspPage"
    And I should see "quickShopRatingSummaryInHeader" exist on "pspPage"
    And I should see "quickShopAddToBagButton" exist on "pspPage"
    And I should see "<dropdown>" exist on "pspPage"
    And I should see "quickShopQuantitySelector" exist on "pspPage"
    And I should see "quickShopAddToBagButton" exist on "pspPage"
    And I should not see "swatchColorSelectorOptions" on "pspPage"
    And I should not see "saveForLaterIcon" on "pspPage"
    And I should not see "shopMoreText" on "pspPage"
    And I should not see "recentlyViewed" on "pspPage"
    And I should not see "prodDescSection" on "pspPage"
    And I should not see "deliveryUrgencyDay" on "pspPage"
    And I should not see "beautyClubValuePoints" on "pspPage"
    And I click on "quickShopCloseButton" on "pspPage"
    And I select the product "1" in "pspPage" and add to bag from quickView
    Examples:
      | category         | subcategory          | dropdown                | header text       |
      | Women            | Dresses              | quickShopSizeDropDown   | Dresses           |
      | Lingerie         | Full cup bras           | quickShopSizeDropDown |Full cup bras|
      | Home & Furniture | Sheets               | quickShopSizeDropDown   | Bed sheets        |
      | Men              | Shorts               | quickShopSizeDropDown   | Men's shorts      |
      | Kids             | All School uniform   | quickShopSizeDropDown   | School uniform    |
      | Offers             | Makeup sale          | quickShopColourDropDown | Makeup            |
      | Women            | Knitwear             | quickShopSizeDropDown   | Women's knitwear  |
      | Gifts & Toys     | For babies           | quickShopSizeDropDown   | Baby gifts        |
      | Men              | Suits                | quickShopSizeDropDown   | Suits             |

  @automated @Fixed @DEBD-2863
  Scenario Outline: Navigate to psp page and validate the urgency delivery timer should be displayed in quick Shop button for the exclusion (no Add To Bag)categories
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation2"
    When I "validate & click" subMenu option "<subcategory>" under "<category>" on commonPage bigscreen
    Then I should see "headerText" as "<header text>" on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    When I hover over product "2" on "pspPage"
    Then I should see quickShop button "appear" on product "2" on "pspPage"
    And I should see quickShop button "disappear" on product "1" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    And I should see "quickShopDeliveryCountdownTimer" exist on "pspPage"
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I should see "quickShopMainImage" exist on "pspPage"
    And I should see "productName" exist on "pspPage"
    And I should see "quickShopProductPrice" exist on "pspPage"
    And I should see "quickShopRatingSummaryInHeader" exist on "pspPage"
    And I should see "quickShopViewProductPageLink" exist on "pspPage"
    And I should not see "saveForLaterIcon" on "pspPage"
    And I should not see "quickShopAddToBagButton" on "pspPage"
    And I should not see "quickShopQuantitySelector" on "pspPage"
    And I should not see "quickShopSizeDropDown" on "pspPage"
    And I click on "quickShopViewProductPageLink" on "pspPage"

    Examples:
      | category     | subcategory         | header text              |
      | Gifts & Toys | Food & drinks gifts | Food & drink gifts       |
      | Gifts & Toys | Alcohol gifts       | Alcoholic gifts          |
      | Electricals  | Kettles              | Kettles               |
      | Electricals  | Hair styling        | Hair styling             |
      | Electricals  | Fryers             | Fryers                  |
      | Electricals  | Kitchen electricals | Food & drink preparation |

  @automated @Fixed @DEBD-2863
  Scenario: Navigate to psp page and validate the urgency delivery timer should not be displayed in quick Shop button for the exclusion (no Add To Bag)categories
    Given I navigate to "homeURL"
    And I set mvt test for "quickViewPSP" as "variation2"
    When I "validate & click" subMenu option "Sofas & chairs" under "Home & Furniture" on commonPage bigscreen
    Then I should see "headerText" as "Sofas & chairs" on "pspPage"
    When I hover over product "1" on "pspPage"
    Then I should see quickShop button "appear" on product "1" on "pspPage"
    When I hover over product "2" on "pspPage"
    Then I should see quickShop button "appear" on product "2" on "pspPage"
    And I should see quickShop button "disappear" on product "1" on "pspPage"
    When I click quickShop button on product "1" on "pspPage"
    And I should see "quickShopOverlay" exist on "pspPage"
    And I should see "quickShopCloseButton" exist on "pspPage"
    And I should see "quickShopMainImage" exist on "pspPage"
    And I should see "productName" exist on "pspPage"
    And I should see "quickShopProductPrice" exist on "pspPage"
    And I should see "quickShopRatingSummaryInHeader" exist on "pspPage"
    And I should see "quickShopViewProductPageLink" exist on "pspPage"
    And I should not see "quickShopDeliveryCountdownTimer" on "pspPage"
    And I should not see "saveForLaterIcon" on "pspPage"
    And I should not see "quickShopAddToBagButton" on "pspPage"
    And I should not see "quickShopQuantitySelector" on "pspPage"
    And I should not see "quickShopSizeDropDown" on "pspPage"
    And I click on "quickShopViewProductPageLink" on "pspPage"

