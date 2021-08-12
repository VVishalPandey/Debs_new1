Feature: Test Debenhams psp page validation

@automated @Fixed @DEBD-265 @DEBD-680
Scenario: Navigate to Debenhams women maxi dresses large image psp page and validate the page
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I should see "breadcrumbSection" exist on "pspPage"
  Then I should see "headerText" as "Maxi Dresses" on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  Then I should see "productViewPerPageLink" as "pspPageMoreItemPerPageTestText" on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "filterSection" exist on "pspPage"
  And I should see "nextButton" exist on "pspPage"
  And I should see "pageNumberText" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see "large" images
  #And I should see "prod uctTiles" with "3" products per row on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  And I should count and validate "totalBrandCount" on "pspPage"
  And I should count and validate "totalProductCount" on "pspPage"
  And I should count and validate "totalSaveIconCount" on "pspPage"

@automated @Fixed @DEBD-265 @DEBD-680
Scenario: Validate the pagination on first 2 page on women maxi dresses large image psp page
  Then I should scroll to "nextButton" on "pspPage"
  And I should see page number "1" of total on "pspPage"
  And I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"
  And I should see "headerText" as "Maxi Dresses" on "pspPage"

@automated @Fixed @DEBD-265 @DEBD-680
Scenario: Navigate to Debenhams normal size image with less than 30 products psp page and validate the page
  Given I navigate to "pspPageLessThan18Products"
  Then I should see "breadcrumbSection" exist on "pspPage"
  And I should not see "paginationSectionHeader" on "pspPage"
  And I should not see "paginationSectionFooter" on "pspPage"
  And I should not see "nextButton" on "pspPage"
  And I should not see "pageNumberText" on "pspPage"
  And I should not see "productViewPerPageLink" on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "filterSection" exist on "pspPage"
  And I should see "normal" images
  When I navigate to "multiwayCollectionPspUrl"
  Then I should not see "previousButtonState" on "loginPage"
  And I should not see "nextButtonState" on "loginPage"
  And I should not see "pageNumberText" on "loginPage"

@automated @Fixed @DEBD-265 @DEBD-680
Scenario: Navigate to Debenhams normal size image with less than 210 and more than 60 products psp page and validate the page
  When I "validate & click" subMenu option "School shoes" under "Kids" on commonPage bigscreen
  Then I should see "breadcrumbSection" exist on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  Then I should see "productViewPerPageLink" as "pspPageAllProductsTestText" on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "filterSection" exist on "pspPage"
  And I should see "nextButton" exist on "pspPage"
  And I should see "pageNumberText" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see "normal" images
  When I click on "productViewPerPageLink" on "pspPage"
  Then I should not see "paginationSectionHeader" on "pspPage"
  And I should not see "paginationSectionFooter" on "pspPage"
  And I should not see "nextButton" on "pspPage"
  And I should not see "pageNumberText" on "pspPage"
  And I should not see "productViewPerPageLink" on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "filterSection" exist on "pspPage"
  And I should see "normal" images

@automated @Fixed @DEBD-265
Scenario: Navigate to Debenhams women dresses psp page and validate product per page link
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  When I click on "productViewPerPageLink" on "pspPage"
  Then I should scroll to "subscribeButton" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  And I should count and validate "totalBrandCount" on "pspPage"
  And I should count and validate "totalProductCount" on "pspPage"
  And I should count and validate "totalSaveIconCount" on "pspPage"
  When I click on "productViewPerPageLink" on "pspPage"
  Then I should scroll to "subscribeButton" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  And I should count and validate "totalBrandCount" on "pspPage"
  And I should count and validate "totalProductCount" on "pspPage"
  And I should count and validate "totalSaveIconCount" on "pspPage"

@automated @Fixed @DEBD-265
Scenario Outline: Validate the breadcrumb section and validate navigation to TCAT and Homepage when breadcrumb selected
  Then I should see "breadcrumbSection" exist on "pspPage"
  And I should see "firstBreadcrumb" exist on "pspPage"
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pspPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pspPage"
  And I should see "thirdBreadcrumb" as "<breadcrumb_3>" on "pspPage"
  When I click on "thirdBreadcrumb" on "pspPage"
  Then I should see "headerText" as "Maxi Dresses" on "pspPage"
  And I should see "url" contains "/women/dresses/maxi-dresses"
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pspPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pspPage"
  And I should see "thirdBreadcrumb" as "<breadcrumb_3>" on "pspPage"
  When I click on "secondBreadcrumb" on "pspPage"
  Then I should see "tcatHeaderText" as "Women’s Clothing" on "pspPage"
  And I should see "url" contains "/women"
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pspPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pspPage"
  And I should not see "thirdBreadcrumb" on "pspPage"
  When I click on "firstBreadcrumb" on "pspPage"
  Then I should see "deliveryOptions" exist on "commonPage"
  Then I should not see "firstBreadcrumb" on "pspPage"
  And I should not see "secondBreadcrumb" on "pspPage"
  And I should not see "thirdBreadcrumb" on "pspPage"

  Examples:
    | breadcrumb_1 | breadcrumb_2 | breadcrumb_3 |
    | Home         | Women        | Dresses      |

@automated @Fixed @DEBD-265 @DEBD-654
Scenario: Navigate to Debenhams women maxi dresses psp page and validate sort by price (high-low)
  Given I navigate to "homeURL"
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "maxi dresses" under "Women" on commonPage bigscreen
  When I should see "sortDropdown" exist on "pspPage"
  #And I should see "sortDropdown" below "paginationSection" on "pspPage"
  #And I should see "sortDropdown" as "Sort by" on "pspPage"
  #And I should see "sortArrow" as teal and pointing down
  #When I click on "sortDropdown" on "pspPage"
  #Then I should see "sortDropdownMenu" exist on "pspPage"
  When I should scroll to "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceHighLow" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-price"
  And I should see "filterSection" exist on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DEBD-265 @DEBD-654
Scenario: Navigate to Debenhams women dresses psp page and validate sort by price (low-high)
  When I should scroll to "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*price"
  And I should see "filterSection" exist on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DEBD-265 @DEBD-654
Scenario: Navigate to Debenhams women dresses psp page and validate sort by best discount
  When I should scroll to "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceDiscount" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-discounted_percentage"
  And I should see "filterSection" exist on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DEBD-265 @DEBD-654
Scenario: Navigate to Debenhams women dresses psp page and validate sort by Newest
  When I should scroll to "sortDropdown" on "pspPage"
  When I click on "sortOptionNewest" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*newness"
  And I should see "filterSection" exist on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DEBD-265 @DEBD-654
Scenario: Navigate to Debenhams women dresses psp page and validate sort by name (a-z) and best selling
  Given I navigate to "searchTowelPspUrl"
  When I should scroll to "sortDropdown" on "pspPage"
  And I click on "sortOptionName" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*name"
  And I should see "filterSection" exist on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  When I should scroll to "sortDropdown" on "pspPage"
  When I click on "sortOptionBestSelling" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*product_availability%2C-units_sold"
  And I should see "filterSection" exist on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@manual @DEBD-265 @DEBD-653
Scenario: Navigate to Debenhams women dresses psp page and validate the pagination at the top and at the bottom of the PSP with 60 or more products
  Given I navigate to "womenDressesPspUrl"
  And The "pspPage" has 60 or more products
  Then I should see "topPaginationSection" exist on "pspPage"
  And I should see "topPaginationSection" below the "slimBanner" and above the "sortDropdown" on "pspPage"
  And I should see "NumberOfProductsLink" as "View No. products per page" in the same row as "topPaginationSection" on "pspPage"
  And I should see "pageNumbers" as per the design on "pspPage"
  And I should see "pageNumbers" as clickable on "pspPage" except the current page
  Then I should see the arrow pointing left should be colourless
  And I should see the circle border should be shaded
  And I should see the arrow pointing right should be in teal
  And I should see "currentPageNumber" with circle border in teal around and in bold and is not clickable
  When I should scroll to "bottom" on "commonPage"
  Then I should see "bottomPaginationSection" exist on "pspPage"
  And I should see "bottomPaginationSection" below the product tiles on the right on "pspPage"
  And I should see "NumberOfProductsLink" as "View No. products per page" in the same row as "bottomPaginationSection" on "pspPage"
  And I shhould see "arrows" pointing left and right on "pspPage"
  And I should see first three and last page numbers on "pspPage"
  And I am on last page of "pspPage"
  Then I should see the arrow pointing right should be colourless
  And I should see the circle border should be shaded
  And I should see the arrow pointing left should be in teal

@automated @Fixed @DBMTE-265 @dataNA
Scenario Outline: Validate the merch set on the women dress page - shoudl be in different container
  When I "validate & click" subMenu option "Boots" under "Men" on commonPage bigscreen
  Then I should see "seoContent" exist on "pspPage"
  And I should see "merchSetSection" exist on "pspPage"
  #And I should not see "merchSetSection" on "pspPage"
  And I count number of "merchSetProducts" to be "<merchSetProductCount>" on "pspPage"

  Examples:
    | merchSetProductCount |
    |                    3 |

@automated @Fixed @DBMTE-265
Scenario: Validate the merch set is hidden when navigated to second page
  When I should see page number "1" of total on "pspPage"
  And I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"
  And I should not see "seoContent" on "pspPage"
  And I should not see "merchSetSection" on "pspPage"
  And I should not see "merchSetProducts" on "pspPage"

@notAutomated @DBMTE-265
Scenario: Validate the merch set is hidden when applied filter and comes back when removed filter
  Given I have applied a filter
  Then the merch set will be hidden
  When I removed filter
  Then the merch re-appears

@manual @DEBD-265
Scenario:Validate that the Signin Pop up should appear on click of SFL on pdpPage for guest user for first time and not on second psp page
  Given I am on my details page
  Then I logout
  When I navigate to "productTile" on "pspPage"
  Then I should see "SFL icon" exist on "pspPage"
  When I click on "saveForLaterButton" on "pspPage"
  Then I should see a dark overlay and a pop up window
  And  I should be asked whether I want to sign in or register or continue shopping for first time
  And I press sign in
  Then I should be navigated to the sign in page
  And I sign in successfully
  Then I should be navigated back to PSP
  And I should see the item saved in "Saved for later"
  And the saved items count in the header icon should be updated
  And I navigate to "productTile" on "pspPage"
  When I should see "SFL icon" exist on "pspPage"
  When I click on "saveForLaterButton" on "pspPage"
  Then I should not see the Signin popup

@automated @Fixed @DEBD-265
Scenario: Validate that the Signin Pop up should not appear on click of SFL on pdpPage if user is already Signin
  Given I logout
  Then I am on my details page
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  When I click on "saveForLaterButton" on "pspPage"
  Then I should not see "saveItemSignInPageCloseIcon" on "pspPage"
  And I should not see "saveItemContinueShoppingButton" on "pspPage"
  And I should not see "saveItemSignInRegisterButton" on "pspPage"

@automated @Fixed @DEBD-265
Scenario: Validate that the Signin Pop up should appear on click of SFL on pdpPage if user is signed out
  Given I logout
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  When I click on "saveForLaterButton" on "pspPage"
  Then I should see "saveItemSignInPageCloseIcon" exist on "pspPage"
  Then I should see "saveItemContinueShoppingButton" exist on "pspPage"
  Then I should see "saveItemSignInRegisterButton" exist on "pspPage"
  When I click on "saveItemContinueShoppingButton" on "pspPage"
  Then I should see "headerText" as "MAXI DRESSES" on "pspPage"
  And I should see "url" contains "/women/dresses/maxi-dresses"
  And I should not see "saveItemSignInPageCloseIcon" on "pspPage"
  And I should not see "saveItemContinueShoppingButton" on "pspPage"
  And I should not see "saveItemSignInRegisterButton" on "pspPage"

@automated @Fixed @DEBD-265
Scenario:Validate that the product should be saved and Pop Up should be closed on click Continue Shopping OR Close the dark overlay
  Given I am on my details page
  Then I logout
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  When I click on "saveForLaterButton" on "pspPage"
  Then I should see "saveItemSignInPageCloseIcon" exist on "pspPage"
  Then I should see "saveItemContinueShoppingButton" exist on "pspPage"
  Then I should see "saveItemSignInRegisterButton" exist on "pspPage"
  When I click on "saveItemSignInRegisterButton" on "pspPage"
  Then I should not see "saveItemSignInPageCloseIcon" on "pspPage"
  And I should not see "saveItemContinueShoppingButton" on "pspPage"
  And I should not see "saveItemSignInRegisterButton" on "pspPage"
  And I should see "headerText" as "My Account" on "loginPage"

@manual @DEBD-265
Scenario: Navigate to Debenhams women dresses psp page and validate out of stock product should not be displayed on the page
  Given I navigate to "womenDressesPspUrl"
  Then I should not see out of stock product on "pspPage"

@manual @DEBD-265 @awsManual
Scenario: Validate that an out of stock message, product price should not be displayed for no longer available products on PSP
  Given I navigate to "womenDressesPspUrl"
  When the stock check has run
  And the stock is no longer available for the product
  Then I should see an out of stock message
  And I should not see the product price anymore

@automated @Fixed @DEBD-265
Scenario: Navigate to Debenhams women suit & tailoring psp page and validate previous, next and page number text
  Given I navigate to "psp2PaginationPageUrl"
  And I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "disabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@manual @DEBD-265
Scenario: Navigate to Debenhams women dresses psp page and page number dislay
  Given I navigate to "womenDressesPspUrl"
  Then I should validate number of "pages" as per "totalCountOfProducts" on "pspPage"

@manual @DEBD-265
Scenario: Navigate to Debenhams women dresses psp page and validate the prices with the prices available on the desktop site
  Given I navigate to "womenDressesPspUrl"
  Then I should validate price of prdouct as per desktop psp page

@manual @DEBD-265
Scenario: Navigate to Debenhams psp page and validate the new filter icon

@manual @DEBD-265
Scenario: Navigate to Debenhams psp page and validate that the column non column view

@manual @DEBD-265
Scenario: Navigate to Debenhams psp page and validate that the column non column view

@manual @DEBD-265
Scenario: Navigate to Debenhams psp beauty page and validate the badges

@manual @DEBD-265
Scenario: Validate psp sorting result with desktop results

@manual @DEBD-265
Scenario: Navigate to Debenhams psp page and Sign in pop once user selects save for later icon

@manual @DEBD-265
Scenario: Validate sign in pop up on psp page (when selected save for later) closes on selecting cancel button

@manual @DEBD-265
Scenario: Validate sign in pop up on psp page (when selected save for later) redirect to sign in page on selecting sign in option

@manual @DEBD-265
Scenario: Validate sign in pop up on psp page (when selected save for later) closes on selecting close icon

@manual @DEBD-265
Scenario: Validate the slim banners of women dresses and women tops ps page
  Given I navigate to women dresses psp page
  Then I validate the slim banner appears on page
  When I navigate to women tops psp page
  Then I validate the slim banner appears on page

@manual @DEBD-265
Scenario: Validate that we are not able to see the header for the brand room PSP pages i.e : Kat von d,Benefit etc.

@notAutomated @DEBD-293
Scenario Outline:Validate that product tile on psp page
  Given I navigate to "womenDressesPspUrl"
  And I'm in view of "producttiles" on "pspPage"
  Then I count number of "producttilePerRow" to be "<producttilePerRowCount>" on "pspPage"
  Then I should see "merchset" on "pspPage"
  And I count number of "merchSetProducts" to be "<merchSetProductCount>" on "pspPage"
  And I should see "Productimage" on "pspPage"
  And I should see "productname" on "pspPage"
  And I should see "NowPrice" on "pspPage"
  And I should see "SaveforLatericon" on "pspPage"
  When I click "fisrtproductImage" on "pspPage"
  Then I should see "firstProductname" on "pdpPage"
   Examples:
    | producttilePerRowCount | merchSetProductCount |
    |                      3 |                    3 |



@manual @DEBD-293
Scenario: Navigate to Debenhams psp page and validate discounted products
  Given I am on a PSP where products are discounted
  Then I should see save % off in red, was, now in bold, Then with strikethrough price

@manual @DEBD-293 @awsManual
Scenario Outline: Navigate to Debenhams psp page and validate badges if applicable
  Given I am on a PSP where badges are enabled
  Then I should see "<badges>" on "pspPage"
  And the badges should not be clickable
  Examples:
    |       Free gift        |
    | Editors pick           |
    | Exclusive to Debenhams |
    | New designer           |
    | Online exclusive       |
    | Pre-Chirstmas Delivery |

@manual @DEBD-293 @awsManual
Scenario: Navigate to Debenhams psp page and validate SFL hovering behavior
  Given I navigate to "womenDressesPspUrl"
  Then I will see larger product images than other PSPs like tops
  Then I should see "SFLicon" on "pspPage"
  When I hover/focus over/on the SFL CTA
  Then I will see a Save tool tip as per the current desktop experience
  And the badges should not be clickable
  When I save an item
  Then the item will be saved
  And the heart in the SFL CTA will be pink
  And the border of the icon will turn pink

@notAutomated @DEBD-293
Scenario:Validate that product tile for furniture psp page
  Given I navigate to "furniturePspUrl"
  Then I should see "multiplecolourOption" on "pspPage"
  And I should not see "colourSwathes" on "pspPage"
  And I click on "multiplecolourOption" on "pspPage"
  Then I'll be taken to relevent pdpPage
