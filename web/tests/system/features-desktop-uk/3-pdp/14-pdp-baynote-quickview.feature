Feature: Test Debenhams quick shop validation in pdp


# Below test cases has been documented based on the condition
# 1.Maximiser check to display Baynote upsell section in PDP for "You may also like" and "Customer Who May Also Bought" sections
# key =======> window.setMVT{desktop: {pdpBayNoteQuickView: 'variation1'}}
# 2.Baynote section will displayed based on the baynote feed for the corresponding product

@automated @PDP @Fixed @DEBD-2668
Scenario Outline: Navigate to pdp and validate quick shop overlay should be open upon clicking on quickView CTA button in Baynote(You may alos like) and not product image
  Given I navigate to "searchFoundationBeautyPspUrl"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I click on "firstProductImage" on "pspPage"
  When I am in view of "<section>" on "pdpPage"
  When I hover over product "1" on "pdpPage"
  Then I should see quickShop button "appear" on product "1" on "pdpPage"
  When I hover over product "2" on "pdpPage"
  Then I should see quickShop button "appear" on product "2" on "pdpPage"
  And I should see quickShop button "disappear" on product "1" on "pdpPage"
  When I click quickShop button on product "1" on "pdpPage"
  And I should see "quickShopOverlay" exist on "pdpPage"
  And I should see "quickShopCloseButton" exist on "pdpPage"
  And I should see "quickShopMainImage" exist on "pdpPage"
  And I should see "productName" exist on "pdpPage"
  And I should see "quickShopProductPrice" exist on "pdpPage"
  And I should see "quickShopRatingSummaryInHeader" exist on "pdpPage"
  And I should see "quickShopAddToBagButton" exist on "pdpPage"
  And I should see "quickShopViewProductPageLink" exist on "pdpPage"
  And I should see "quickShopColourDropDown" exist on "pdpPage"
  And I should see "quickShopQuantitySelector" exist on "pdpPage"
  And I should not see "quickShopSaveIcon" on "pdpPage"
  And I should not see "quickShopShopMoreText" on "pdpPage"
  And I should not see "quickShopRecentlyViewed" on "pdpPage"
  And I should not see "quickShopProdDescSection" on "pdpPage"
  And I should not see "quickShopDeliveryUrgencyDay" on "pdpPage"
  And I should not see "quickShopBeautyClubValuePoints" on "pdpPage"
  And I should see "quickShopViewProductPageLink" exist on "pdpPage"
  And I click on "quickShopViewProductPageLink" on "pdpPage"
  And I should not see "quickShopOverlay" on "pdpPage"

Examples:
|section     |
|baynoteCWMABSection|
|baynoteSection     |


@automated @PDP @Fixed @DEBD-2675 @DEBD-2668
Scenario Outline: Navigate to quick Shop of baynote section in pdp  and validate add to bag
  Given I navigate to "<pspUrl>"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I click on "firstProductImage" on "pspPage"
  When I am in view of "baynoteSection" on "pdpPage"
  And I select the product "1" in "pdpPage" and add to bag from quickView

Examples:
|pspUrl|
|beautyLipstickPspUrl|
|beautyMakeupPspURL|
|womenMaxiPSPURL  |
|searchFoundationBeautyPspUrl|
|womenCasualDressesPspUrl|
|coatsJacketsPspUrl|
|knitwearJumpersPspUrl|
|searchBlueDressesPspUrl|


@manual @DEBD-2675 @DEBD-2668
Scenario Outline: Navigate to quick Shop of baynote section in pdp with round robin and baynote(YMAL) carousals
  Given I navigate to "homeURL"
  #Then I "Remove" "all" products from "myBagPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "<searchText>" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  When I am in view of "roundRobinSection" on "pdpPage"
  When I mouse hover on "roundRobinSection"
  And I should not see "quickShopOverlay" on "pdpPage"
  When I am in view of "baynoteSection" on "pdpPage"
  When I mouse hover on "baynoteYMALFirstImage"
  When I click on "baynoteYMALFirstImage" on "pdpPage"
  And I should see "quickShopOverlay" exist on "pdpPage"
  When I click on "selectroundRobin1Carousal" on "pdpPage"
  And I should not see "quickShopOverlay" on "pdpPage"

Examples:
|searchText|
|Silver Lace 7 Piece Set|
|Navy Textured Wool Blend 2 Button Regular Fit Travel Suit Jacket|


@manual @DEBD-2675 @DEBD-2668
Scenario Outline: Navigate to quick Shop of baynote section in pdp with round robin and cross sell carousals
  Given I navigate to "homeURL"
  #Then I "Remove" "all" products from "myBagPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "<searchText>" in "searchField" on "commonPage"
  When I am in view of "roundRobinSection" on "pdpPage"
  When I mouse hover on "roundRobinSection"
  And I should not see "quickShopOverlay" on "pdpPage"
  When I am in view of "roundRobinSection" on "pdpPage"
  When I mouse hover on "crossSellSection"
  And I should not see "quickShopOverlay" on "pdpPage"
  When I am in view of "baynoteSection" on "pdpPage"
  When I mouse hover on "baynoteCWMABFirstImage"
  And I should see "quickShopOverlay" exist on "pdpPage"

Examples:
|searchText|
|Artisan' Matte Grey mini stand mixer KSM3311XBFG   |
|Natural Underwired Padded 24 Hour Strapless Silicone Free Multi-Way Bra|

@manual @DEBD-2675 @DEBD-2668
Scenario Outline: Navigate to quick Shop of baynote section in pdp with cross sell and baynote(YMAL) carousals
  Given I navigate to "homeURL"
  #Then I "Remove" "all" products from "myBagPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "<searchText>" in "searchField" on "commonPage"
  When I am in view of "roundRobinSection" on "pdpPage"
  When I mouse hover on "roundRobinSection"
  And I should not see "quickShopOverlay" on "pdpPage"
  When I am in view of "baynoteSection" on "pdpPage"
  When I mouse hover on "baynoteYMALFirstImage"
  And I should see "quickShopOverlay" exist on "pdpPage"

Examples:
|searchText|
|Designer silver glass Swarovski crystal photo frame|
|Hannah Crystal Glass Wall Light|



@manual @DEBD-2668
Scenario: Navigate to pdp  and validate quick shop overlay should be open upon clicking on product image in Baynote (Customers who bought this item also bought )
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
  Then I should see "headerText" as "Lipstick" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  When I am in view of "baynoteYMAL" on "pdpPage"
  When I click on "baynoteYMALFirstImage" on "pdpPage"
  And I should see "quickShopOverlay" exist on "pdpPage"
  And I should see "quickShopCloseButton" exist on "pdpPage"
  And I should see "quickShopThumbnailImages" exist on "pdpPage"
  And I should see "quickShopMainImage" exist on "pdpPage"
  And I should see "productName" exist on "pdpPage"
  And I should see "quickShopProductPrice" exist on "pdpPage"
  And I should see "quickShopPricePerMlMg" exist on "pdpPage"
  And I should see "quickShopRatingSummaryInHeader" exist on "pdpPage"
  And I should see "quickShopAddToBagButton" exist on "pdpPage"
  And I should see "quickShopViewProductPageLink" exist on "pdpPage"
  And I should see "quickShopColourDropDown" exist on "pdpPage"
  And I should see "quickShopQuantitySelector" exist on "pdpPage"
  And I should not see "saveForLaterIcon" on "pdpPage"
  And I should not see "shopMoreText" on "pdpPage"
  And I should not see "recentlyViewed" on "pdpPage"
  And I should not see "prodDescSection" on "pdpPage"
  And I should not see "deliveryUrgencyDay" on "pdpPage"
  And I should not see "beautyClubValuePoints" on "pdpPage"

@manual @DEBD-2668
Scenario Outline: Validate Quick Shop should not be displayed for Cross-sell,Round Robin and Recently Viewed carousals
  Given I navigate to "homeURL"
  #Then I "Remove" "all" products from "myBagPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "<searchText>" in "searchField" on "commonPage"
  When I am in view of "roundRobinSection" on "pdpPage"
  When I mouse hover on "roundRobinSection"
  And I should not see "quickShopOverlay" on "pdpPage"
  When I mouse hover on "crossSellSection"
  And I should not see "quickShopOverlay" on "pdpPage"
  When I mouse hover on "recentlyViewed"
  And I should not see "quickShopOverlay" on "pdpPage"

Examples:
|searchText|
|Natural 'Silicone Free' Underwired Padded Multi-Way Bra|
|Set Of 2 Amalfi Velvet 'Kempton' Armchairs|
|Navy Textured Wool Blend 2 Button Regular Fit Travel Suit Jacket|


@automated @PDP @Fixed   @DEBD-2668
Scenario Outline: Navigate to pdp page and validate the quick Shop button for the categories (excluding furniture , electrical’s, suits , gifts/toys and search results PSP)
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "<subcategory>" under "<category>" on commonPage bigscreen
  Then I should see "headerText" containing "<header text>" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  When I hover over product "1" on "pdpPage"
  Then I should see quickShop button "appear" on product "1" on "pdpPage"
  When I hover over product "2" on "pdpPage"
  Then I should see quickShop button "appear" on product "2" on "pdpPage"
  And I should see quickShop button "disappear" on product "1" on "pdpPage"
  When I click quickShop button on product "2" on "pdpPage"
  And I should see "quickShopOverlay" exist on "pdpPage"
  And I should see "quickShopCloseButton" exist on "pdpPage"
  And I should see "quickShopMainImage" exist on "pdpPage"
  And I should see "productName" exist on "pdpPage"
  And I should see "quickShopProductPrice" exist on "pdpPage"
  And I should see "quickShopRatingSummaryInHeader" exist on "pdpPage"
  And I should see "quickShopAddToBagButton" exist on "pdpPage"
  And I should see "quickShopViewProductPageLink" exist on "pdpPage"
  And I should see "<dropdown>" exist on "pdpPage"
  And I should see "quickShopQuantitySelector" exist on "pdpPage"
  And I should not see "quickShopSaveForLaterIcon" on "pdpPage"
  And I should not see "quickShopShopMoreText" on "pdpPage"
  And I should not see "quickShopRecentlyViewed" on "pdpPage"
  And I should not see "quickShopProdDescSection" on "pdpPage"
  And I should not see "quickShopDeliveryUrgencyDay" on "pdpPage"
  And I should not see "quickShopBeautyClubValuePoints" on "pdpPage"
  And I click on "quickShopViewProductPageLink" on "pdpPage"

   Examples:
    | category          | subcategory        | dropdown                | header text         |
    | Women             | Dresses            | quickShopSizeDropDown   | Dresses             |
    | Lingerie          | Pyjamas            | quickShopSizeDropDown   | Women's Pyjamas     |
    | Home & Furniture  | Duvets             | quickShopSizeDropDown   | Duvets              |
    | Men               | Formal shirts      | quickShopSizeDropDown   | Men's shirts        |
    | Kids              | All school uniform | quickShopSizeDropDown   | School uniform      |
    | Offers            | All beauty sale    | quickShopSizeDropDown   | Beauty sale         |
    | Women             | Knitwear           | quickShopSizeDropDown   | Women's knitwear    |
    | Gifts & Toys      | Wedding gifts      | quickShopSizeDropDown   | Wedding gifts       |

@automated @PDP @Fixed   @DEBD-2668
Scenario Outline: Navigate to pdp page and validate the quick Shop functioanlity for no size/color dropdown products belonging to the categories (excluding furniture , electrical’s, suits , gifts/toys and search results PSP)
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "<subcategory>" under "<category>" on commonPage bigscreen
  Then I should see "headerText" as "<header text>" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  When I hover over product "1" on "pdpPage"
  Then I should see quickShop button "appear" on product "1" on "pdpPage"
  When I hover over product "2" on "pdpPage"
  Then I should see quickShop button "appear" on product "2" on "pdpPage"
  And I should see quickShop button "disappear" on product "1" on "pdpPage"
  When I click quickShop button on product "1" on "pdpPage"
  And I should see "quickShopOverlay" exist on "pdpPage"
  And I should see "quickShopCloseButton" exist on "pdpPage"
  And I should see "quickShopMainImage" exist on "pdpPage"
  And I should see "productName" exist on "pdpPage"
  And I should see "quickShopProductPrice" exist on "pdpPage"
  And I should see "quickShopRatingSummaryInHeader" exist on "pdpPage"
  And I should see "quickShopAddToBagButton" exist on "pdpPage"
  And I should see "quickShopViewProductPageLink" exist on "pdpPage"
  And I should see "quickShopQuantitySelector" exist on "pdpPage"
  And I should not see "quickShopSaveForLaterIcon" on "pdpPage"
  And I should not see "quickShopShopMoreText" on "pdpPage"
  And I should not see "quickShopRecentlyViewed" on "pdpPage"
  And I should not see "quickShopProdDescSection" on "pdpPage"
  And I should not see "quickShopDeliveryUrgencyDay" on "pdpPage"
  And I should not see "quickShopBeautyClubValuePoints" on "pdpPage"
  And I click on "quickShopViewProductPageLink" on "pdpPage"

   Examples:
    | category         | subcategory | header text |
    | Women            | Watches     | Watches     |
    | Beauty           | Perfume     | Perfume     |
    | Home & Furniture | Clocks      | Clocks      |
    | Men              | Bags        | Men's bags  |
    | Gifts & Toys     | LEGO        | LEGO        |


@automated @PDP @Fixed   @DEBD-2668
Scenario Outline: Navigate to pdp page and validate the quick Shop button for the categories (furniture , electrical’s, suits and gifts/toys)
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "<subcategory>" under "<category>" on commonPage bigscreen
  Then I should see "headerText" as "<header text>" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  When I hover over product "1" on "pdpPage"
  Then I should see quickShop button "appear" on product "1" on "pdpPage"
  When I hover over product "2" on "pdpPage"
  Then I should see quickShop button "appear" on product "2" on "pdpPage"
  And I should see quickShop button "disappear" on product "1" on "pdpPage"
  When I click quickShop button on product "1" on "pdpPage"
  And I should see "quickShopOverlay" exist on "pdpPage"
  And I should see "quickShopCloseButton" exist on "pdpPage"
  And I should see "quickShopMainImage" exist on "pdpPage"
  And I should see "productName" exist on "pdpPage"
  And I should see "quickShopProductPrice" exist on "pdpPage"
  And I should see "quickShopRatingSummaryInHeader" exist on "pdpPage"
  And I should see "quickShopViewProductPageLink" exist on "pdpPage"
  And I should not see "quickShopSaveForLaterIcon" on "pdpPage"
  And I should not see "quickShopAddToBagButton" on "pdpPage"
  And I should not see "quickShopShopMoreText" on "pdpPage"
  And I should not see "quickShopRecentlyViewed" on "pdpPage"
  And I should not see "quickShopProdDescSection" on "pdpPage"
  And I should not see "quickShopDeliveryUrgencyDay" on "pdpPage"
  And I should not see "quickShopBeautyClubValuePoints" on "pdpPage"
  And I click on "quickShopViewProductPageLink" on "pdpPage"

   Examples:
  | category     | subcategory         | header text   |
  | Gifts & Toys |  Food & drinks gifts | Food & drink gifts|
  | Gifts & Toys |  Alcohol gifts      | Alcoholic gifts |
  | Home & Furniture  | Sofas & chairs | Sofas & chairs |
  | Electricals  |  Fryers         | Fryers   |
  | Electricals  |  Hair styling       | Hair styling |
  | Electricals  |  Kettles             | Kettles|
  | Electricals  |  Kitchen electricals | Food & drink preparation|

@automated @PDP @Fixed   @DEBD-2668
Scenario Outline: Navigate to pdp page via search results page and verify the Quick View functionality
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  And I enter "<searchTerm>" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "<searchTerm>" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  When I hover over product "1" on "pdpPage"
  Then I should see quickShop button "appear" on product "1" on "pdpPage"
  When I click quickShop button on product "1" on "pdpPage"
  And I should see "quickShopOverlay" exist on "pdpPage"
  And I should see "quickShopCloseButton" exist on "pdpPage"
  And I should see "quickShopMainImage" exist on "pdpPage"
  And I should see "productName" exist on "pdpPage"
  And I should see "quickShopProductPrice" exist on "pdpPage"
  And I should see "quickShopRatingSummaryInHeader" exist on "pdpPage"
  And I should see "quickShopAddToBagButton" exist on "pdpPage"
  And I should see "quickShopQuantitySelector" exist on "pdpPage"
  And I should see "<dropdown>" exist on "pdpPage"
  And I should see "quickShopViewProductPageLink" exist on "pdpPage"
  And I should not see "quickShopSaveForLaterIcon" on "pdpPage"
  And I click on "quickShopViewProductPageLink" on "pdpPage"

   Examples:
  | searchTerm   | dropdown |
  | Navy Textured Wool Blend 2 Button Regular Fit Travel Suit Jacket |quickShopSizeDropDown|
  | dress      | quickShopSizeDropDown |
  | Shirts     | quickShopSizeDropDown |
  | Skirts     | quickShopSizeDropDown |

@automated @PDP @Fixed   @DEBD-2668
Scenario: Navigate to Quick View of Men Suits bundle product and verify the functionality
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Suits" under "Men" on commonPage bigscreen
  And I wait for "4000" milliseconds
  When I click on "firstProductImage" on "pspPage"
  When I hover over product "1" on "pdpPage"
  Then I should see quickShop button "appear" on product "1" on "pdpPage"
  When I click quickShop button on product "1" on "pdpPage"
  And I should see "quickShopOverlay" exist on "pdpPage"
  And I should see "quickShopCloseButton" exist on "pdpPage"
  And I should see "quickShopMainImage" exist on "pdpPage"
  And I should see "productName" exist on "pdpPage"
  And I should see "quickShopProductPrice" exist on "pdpPage"
  And I should see "quickShopRatingSummaryInHeader" exist on "pdpPage"
  And I should see "quickShopViewProductPageLink" exist on "pdpPage"
  And I should not see "quickShopSaveForLaterIcon" on "pdpPage"
  And I should see "quickShopAddToBagButton" exist on "pdpPage"
  And I should not see "quickShopShopMoreText" on "pdpPage"
  And I should not see "quickShopRecentlyViewed" on "pdpPage"
  And I should not see "quickShopProdDescSection" on "pdpPage"
  And I should not see "quickShopDeliveryUrgencyDay" on "pdpPage"
  And I should not see "quickShopBeautyClubValuePoints" on "pdpPage"
  And I click on "quickShopViewProductPageLink" on "pdpPage"

@manual @DEBD-2668
Scenario: Navigate to Debenhams Chanel  pdp page and validate  quick Shop button should not be displayed
  Given I navigate to "chanelpdpPage"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I click on "firstProductImage" on "pspPage"
  And I should not see baynote,crosssell,round robin carousals
  And I should not see "quickShopOverlay" on "pdpPage"


@automated @PDP @Fixed   @DEBD-2672
Scenario: Navigate to Debenhams Beauty Perfume perfume quick Shop overlay and validate add to bag for size dropdown
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Dior" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  And I select the product "1" in "pdpPage" and add to bag from quickView

@automated @PDP @Fixed  @DEBD-2672
Scenario: Navigate to debenhams quick shop and validation of the quantity selector when it is available less than 90
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "All makeup" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  When I click quickShop button on product "1" on "pdpPage"
  And I should validate minibag count "before"
  And I change the stepper count to "2"
  When I click on "quickShopAddToBagButton" on "pdpPage"
  Then I should validate minibag count "after"


@automated @PDP @Fixed  @DEBD-2672
Scenario: Navigate to debenhams quick shop overlay and validation of the quantity selector when it is available less than 90 and quanity exceeded message
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Armani" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  When I click quickShop button on product "2" on "pdpPage"
  And I should validate minibag count "before"
  And I select available size on "pdpPage"
  And I change the stepper count to "10"
  When I click on "quickShopAddToBagButton" on "pdpPage"
  And I should see "quickShopOverlayTopNotification" exist on "pdpPage"
  And I change the stepper count to "2"
  When I click on "quickShopAddToBagButton" on "pdpPage"
  Then I should validate minibag count "after"

@automated @PDP @Fixed   @DEBD-2672
Scenario: Navigate to debenhams quick shop overlay and validation of the quantity selector increment disable
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Benefit" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  When I click quickShop button on product "1" on "pdpPage"
  And I change the stepper count to "99"
  And I should see value of "stepperCount" as "99" on "pdpPage"
  Then I should see "stepperIncrement" "disabled" on "pdpPage"
  And I should validate minibag count "before"
  And I change the stepper count to "1"
  When I click on "quickShopAddToBagButton" on "pdpPage"
  Then I should validate minibag count "after"

@automated @PDP @Fixed   @DEBD-2678
Scenario: Validate view product description page link in quick shop overlay
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  And I click quickShop button on product "1" on "pdpPage"
  And I should see "quickShopViewProductPageLink" exist on "pdpPage"
  And I click on "quickShopViewProductPageLink" on "pdpPage"
  And I go back to previous page
  And I should not see "quickShopOverlay" on "pdpPage"

@manual   @DEBD-2676
Scenario: Validate quick shop low and out of stock behavior for color dropdown
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Foundation" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  And I click quickShop button on product "1" on "pdpPage"
  Then I select "Out of Stock" size from "quickShopDropdown"
  And I validate "Out of Stock" message from  "dropdown" on  "pdpPage"
  Then I select "low stock" size from "quickShopDropdown"
  And I validate "low stock" message from  "dropdown" on  "pdpPage"

@automated @PDP @Fixed   @DEBD-2670
Scenario: Navigate to Debenhams quick Shop overlay and validate close icon behavior
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Perfume" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  When I click quickShop button on product "1" on "pdpPage"
  And I should see "quickShopCloseButton" exist on "pdpPage"
  And I click on "quickShopCloseButton" on "pdpPage"
  And I should not see "quickShopOverlay" on "pdpPage"
  When I click quickShop button on product "1" on "pdpPage"
  And I should see "quickShopCloseButton" exist on "pdpPage"
  And I click using JQuery on "quickShopOverlayOutsideClick" on "pdpPage"
  And I should not see "quickShopOverlay" on "pdpPage"

@manual @DEBD-2670
Scenario: Navigate to quick shop and validate that it should not be scrollable
 When I am in a view of "quickShopOverlay"
 And the overlay should not be scrollable
 And all the components above the fold

@automated @PDP @Fixed @DEBD-2678
Scenario: Navigate to quick shop and verify the colour accordion for beauty product in Quick Shop with 13 or more colours in dropdown
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  And I click quickShop button on product "1" on "pdpPage"
  Then I should not see "pspColourSwatches" on "pdpPage"
  And I should see "quickShopColourDropDown" exist on "pdpPage"
  And I should not see "quickShopShowMoreColorsButton" containing "Show more colours" on "pdpPage"

@manual @DEBD-2670
Scenario: Validate UI of dropdown in quick shop
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Chanel" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  And I click quickShop button on product "1" on "pdpPage"
  When I on dropdown
  Then I should see colour swatch border is highlighted in orange
  And I should see the chosen colour fills the colour drop down

@manual  @DEBD-2242
Scenario: Validate in debenhams quick shop that the carousel of smaller thumbnail images to the left of the large container should be displayed  with multiple images
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  When I click quickShop button on product "1" on "pdpPage"
  Then I should see the first product image in a large container
  And I should see a carousel of smaller thumbnail images to the left of the large container
  And I should see the first image in the thumbnails will have a green border

@automated @PDP @Fixed  @DEBD-2242
Scenario: Validate in debenhams quick shop that the user should see the thumbnails without carousal arrows  with 4 or less product images
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Mascara" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  When I click quickShop button on product "1" on "pdpPage"
  And I should not see "quickShopThumbnailDownCarousalArrow" on "pdpPage"
  And I should not see "quickShopThumbnailUpCarousalArrow" on "pdpPage"

@automated @PDP @Fixed   @DEBD-2242
Scenario: Validate in debenhams quoick shop that the user should see the thumbnails with carousal arrows with 5 or more product images
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "All makeup" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  When I click quickShop button on product "1" on "pdpPage"
  And I should see "quickShopThumbnailDownCarousalArrow" exist on "pdpPage"
  And I should see "quickShopThumbnailUpCarousalArrow" exist on "pdpPage"

@manual  @DEBD-2242
Scenario: Validate that user should see a grey border when he hovers or focuses on a thumbnail that is not showing in the main image on quick shop
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "All make up" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  And I click quickShop button on product "1" on "pdpPage"
  And I hover or focus on a thumbnail that is not showing in the main image
  Then I should see a grey border around the "thumbnailImage"

@manual  @DEBD-2242
Scenario: Validate that main image should be updated with the relevant thumbnail when user clicks on each thumbnail on quick shop with multiple images
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "All make up" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  And I click quickShop button on product "1" on "pdpPage"
  When I click on "thumbnailImage" on "pdpPage"
  Then I should see the "mainImage" should be updated with relevant image
  And I should see a teal border around selected "thumbnailImage"


@manual  @DEBD-2242
Scenario: Validate that the image should be zoomed in to the focused area of the main image on quick shop
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  And I click quickShop button on product "1" on "pdpPage"
  When I hover over the "mainImage" on "pdpPage"
  Then I should see the image will zoom in to the area I'm focusing on
  And I should not see "thumbnailcarousalArrows" on "pdpPage"
  When I move my cursor around
  Then I should see the image will remain zoomed in
  And I should see focus on the new location of my cursor

@automated @PDP @Fixed    @DEBD-2242
Scenario: Validate that the zoomed image pop up should be displayed on clicking on the main Image Container on quick shop
  Given I navigate to "homeURL"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  And I click quickShop button on product "1" on "pdpPage"
  When I hover and click on "quickShopMainImageContainer" on "pdpPage"
  Then I should not see "quickShopZoomedImagePopUp" on "pdpPage"

@manual @DEBD-2229
Scenario: Navigate to Tablet and mobile site and verify quick shop should not be displayed in beauty psp's
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  And I validate quick shop button should not be displayed.

@manual @DEBD-2229
Scenario: Navigate to DOTIE and verify quick shop should not be displayed in beauty psp's
  Given I navigate to "homeURL"
  And I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  And I set mvt test for "pdpBayNoteQuickView" as "variation1"
  When I "validate & click" subMenu option "Perfume" under "Beauty" on commonPage bigscreen
  When I click on "firstProductImage" on "pspPage"
  And I hover over product "1" on "pdpPage"
  When I click quickShop button on product "1" on "pdpPage"
  Then I should not see "quickShopOverlay" on "pdpPage"
