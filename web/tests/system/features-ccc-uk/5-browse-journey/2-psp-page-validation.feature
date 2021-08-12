Feature: Test Debenhams psp page validation

@automated @DEBD-263
Scenario: Login to CCC site
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"

@automated @Fixed @DEBD-265 @DEBD-680
Scenario: Navigate to Debenhams women maxi dresses large image psp page and validate the page
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

@automated @Fixed @DEBD-265 @DEBD-654
Scenario: Navigate to Debenhams women maxi dresses psp page and validate sort by price (high-low)
  When I should see "sortDropdown" exist on "pspPage"
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

@automated @Fixed @DEBD-265
Scenario: Navigate to Debenhams women dresses psp page and validate product per page link
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
  Then I should see "tcatHeaderText" as "WOMEN'S CLOTHING & ACCESSORIES" on "pspPage"
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

@automated @Fixed @DEBD-265 @DEBD-680
Scenario: Navigate to Debenhams normal size image with less than 210 and more than 60 products psp page and validate the page
  When I "validate & click" subMenu option "School shoes" under "Kids" on commonPage bigscreen
  Then I should see "breadcrumbSection" exist on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  Then I should see "productViewPerPageLink" as "pspPageAllProductsTestText" on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "filterSection" exist on "pspPage"
  And I should see "normal" images

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

@automated @Fixed @DEBD-265
Scenario: Navigate to Debenhams women suit & tailoring psp page and validate previous, next and page number text
  Given I navigate to "psp2PaginationPageUrl"
  And I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "disabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@manual @DEBD-265
Scenario: Validate that we are not able to see the header for the brand room PSP pages i.e : Kat von d,Benefit etc.

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

@notAutomated @DEBD-293
Scenario:Validate that product tile for furniture psp page
  Given I navigate to "furniturePspUrl"
  Then I should see "multiplecolourOption" on "pspPage"
  And I should not see "colourSwathes" on "pspPage"
  And I click on "multiplecolourOption" on "pspPage"
  Then I'll be taken to relevent pdpPage
