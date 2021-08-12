Feature: Test Debenhams Chanel psp page validation

@automated @DEBD-263
Scenario: Login to CCC site
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"

@automated @DEBD-767 @Issue3465
Scenario Outline: Navigate to Debenhams chanel psp page and validate the page
  Given I navigate to "chanelpspPage"
  Then I should see "chanelPspBanner" exist on "pspPage"
  And I should see "headerText" as "Beauty" on "pspPage"
  And I should see "searchText" as "CHANEL, MAKEUP, LIPS" on "pspPage"
  And I should not see "paginationSectionHeader" on "pspPage"
  And I should not see "paginationSectionFooter" on "pspPage"
  #And I should see "paginationSectionHeader" exist on "pspPage"
  #And I should see "paginationSectionFooter" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "filterSection" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"
  And I should see "normal" images
  Then I click on "chanelPspBanner" on "pspPage"
  And I should see "chanelContent" exist on "pspPage"
  And I go back to previous page
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pspPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pspPage"
  And I should not see "thirdBreadcrumb" on "pspPage"
  When I click on "firstBreadcrumb" on "pspPage"
  Then I should see "homeBanner" exist on "commonPage"
  Examples:
    | breadcrumb_1 | breadcrumb_2 |
    | Home         | Beauty       |

@automated @Fixed @DEBD-767
Scenario: Navigate to Debenhams chanel psp page and validate sort by price (high-low)
  Given I navigate to "chanelpspPage"
  Then I should see "sortDropdown" exist on "pspPage"
  When I click on "sortOptionPriceHighLow" on "pspPage"
  Then I should see "url" contains "sid=-price"
  And I should see "filterSection" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @Fixed @DEBD-767
Scenario: Navigate to Debenhams Chanel psp page and validate sort by price (low-high)
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*price"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @Fixed @DEBD-767
Scenario: Navigate to Debenhams Chanel psp page and validate sort by best discount
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceDiscount" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-discounted_percentage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @Fixed @DEBD-767
Scenario: Navigate to Debenhams Chanel psp page and validate sort by newest
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionNewest" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*newness%2C-product_views%2C-product_sales_value_10"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @Fixed @DEBD-767
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

@automated @Fixed @DEBD-767
Scenario: Navigate to Debenhams Chanel psp page and validate filters
  Given I navigate to "chanelpspPage"
  When I "validate & click" subFilter option "LIPSTICKS" under "Product type" on commonPage bigscreen
  Then I should see "chanelPspBanner" exist on "pspPage"
  And I should see "headerText" as "Beauty" on "pspPage"
  And I should see "searchText" as "CHANEL, MAKEUP, LIPSTICKS, LIPS" on "pspPage"
