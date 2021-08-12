Feature: Test Debenhams Chanel psp page validation

@automated @DEBD-926  @DEBD-834
Scenario Outline: Navigate to Debenhams chanel psp page and validate the page
  Given I logout
  When I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  When I navigate to "chanelpspPage"
  Then I should see "chanelPspBanner" exist on "pspPage"
  And I should see "headerText" containing "Beauty" on "pspPage"
  And I should see "pspHeader" as "CHANEL, LADIES' FRAGRANCES" on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  Then I should see "productViewPerPageLink" as "View all products" on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "filterSection" exist on "pspPage"
  And I should see "nextButton" exist on "pspPage"
  And I should see "pageNumberText" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see "normal" images
  Then I click on "chanelPspBanner" on "pspPage"
  And I should not see "chanelPspBanner" on "pspPage"
  And I go back to previous page
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pspPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pspPage"
  And I should not see "thirdBreadcrumb" on "pspPage"
  When I click on "firstBreadcrumb" on "pspPage"
  Then I should see "homeBanner" exist on "commonPage"
  Examples:
    | breadcrumb_1 | breadcrumb_2 |
    | Home         | Beauty       |


@automated @DEBD-926
Scenario: Navigate to Debenhams chanel psp page and validate sort by price (high-low)
  When I go back to previous page
  Then I should see "sortDropdown" exist on "pspPage"
  When I click on "sortOptionPriceHighLowIE" on "pspPage"
  Then I should see "url" contains "sid=-min_price"
  And I should see "filterSection" exist on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @DEBD-926
Scenario: Navigate to Debenhams Chanel psp page and validate sort by price (low-high)
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceLowHighIE" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*min_price"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @DEBD-926
Scenario: Navigate to Debenhams Chanel psp page and validate sort by best discount
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceDiscount" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-discounted_percentage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @DEBD-926
Scenario: Navigate to Debenhams Chanel psp page and validate sort by newest
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionNewest" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*newness%2C-product_views%2C-product_sales_value_10"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @DEBD-926
Scenario: Navigate to Debenhams Chanel psp page and validate sort by name (a-z) and then by best selling (default)
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionName" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*name"
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionBestSelling" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-product_availability%2C-units_sold%2C-total_review_count"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@manual @DEBD-926
Scenario: Navigate to Debenhams chanel psp page and validate the pagination at the top and at the bottom of the PSP with 60 or more products
  Given I navigate to "chanelpspPage"
  And The "pspPage" has 60 or more products
  Then I should see "topPaginationSection" exist on "pspPage"
  And I should see ""sortBy" below the slim banner on "pspPage"
  And I should see "SortBy" with a "downwards pointing arrow" within the box
  And it should be aligned with "view number of products"
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
  And I should see "Chanel" should be "Black and Bold" below each product tiles
  And I should see the name of range should be in "Black Capital letters" below "Chanel"
  And I should see product description font as Tablet
  And I validate SFL icon on product tiles
  And  I will see 'now', 'was' and 'then' prices in seprate line if available
  And the 'now' price will be in bold
  And the 'then' price will have a strike -through
  And I validate LHN of Chanel psp





