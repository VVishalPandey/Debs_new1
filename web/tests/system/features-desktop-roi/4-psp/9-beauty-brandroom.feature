Feature: Test Debenhams Beauty Brandroom psp page validation

@automated @DEBD-1021
Scenario Outline: Navigate to Debenhams Beauty Brandroom psp page and validate the page
  Given I logout
  When I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  When I "validate & click" subMenu option "GUERLAIN" under "Beauty" on commonPage bigscreen
  And I wait for "2000" milliseconds
  And I should see "headerText" containing "Beauty" on "pspPage"
  And I should see "pspHeader" as "GUERLAIN" on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  Then I should see "productViewPerPageLink" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "filterSection" exist on "pspPage"
  And I should see "nextButton" exist on "pspPage"
  And I should see "pageNumberText" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see "normal" images
  And I should validate "products" exist on "pspPage"
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pspPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pspPage"
  And I should not see "thirdBreadcrumb" on "pspPage"
  When I click on "firstBreadcrumb" on "pspPage"
  Then I should see "homeBanner" exist on "commonPage"
  Examples:
    | breadcrumb_1 | breadcrumb_2 |
    | Home         | Beauty       |


@automated @DEBD-1021
Scenario: Navigate to Debenhams Beauty Brandroom psp page and validate sort by price (high-low)
  When I go back to previous page
  Then I should see "sortDropdown" exist on "pspPage"
  When I click on "sortOptionPriceHighLowIE" on "pspPage"
  Then I should see "url" contains "sid=-min_price"
  And I should see "filterSection" exist on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @DEBD-1021
Scenario: Navigate to Debenhams Beauty Brandroom psp page and validate sort by price (low-high)
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceLowHighIE" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*min_price"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @DEBD-1021
Scenario: Navigate to Debenhams Beauty Brandroom psp page and validate sort by best discount
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceDiscount" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-discounted_percentage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @DEBD-1021
Scenario: Navigate to Debenhams Beauty Brandroom psp page and validate sort by newest
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionNewest" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*newness%2C-product_views%2C-product_sales_value_10"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @DEBD-1021
Scenario: Navigate to Debenhams Beauty Brandroom psp page and validate sort by name (a-z) and then by best selling (default)
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionName" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*name"
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionBestSelling" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-product_availability%2C-units_sold%2C-total_review_count"
  When I should scroll to "subscribeToNewsletter" on "commonPage"


@automated @DEBD-1021
Scenario: Navigate to Debenhams Beauty Brandroom psp page and validate filters
  When I "validate & click" subFilter option "€25 - 35" under "Price" on commonPage bigscreen
  Then I should see "url" contains "25.0%3Cprice%3C35.0"
  And I should see "headerText" containing "Beauty" on "pspPage"
  And I should see "pspHeader" as "GUERLAIN, €25 - 35" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I "validate & remove" the applied filter "€25 - 35" on commonPage bigscreen
  When I "validate & click" subFilter option "Abeille Royale" under "Collections" on commonPage bigscreen
  Then I should see "url" contains "abeille-royale"
  And I should see "headerText" containing "Beauty" on "pspPage"
  And I should see "pspHeader" as "GUERLAIN, Abeille Royale" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I "validate & remove" the applied filter "Abeille Royale" on commonPage bigscreen

@automated @DEBD-1021
Scenario: Navigate to the next page of brandroom psp page and validate the pagination
  And I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"
  And I should see "headerText" containing "Beauty" on "pspPage"
  And I should validate "products" exist on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"

@manual @DEBD-1021
Scenario: Validate Beauty Brandroom UI and products with respect to Desktop
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Kat Von D" under "Beauty" on commonPage bigscreen
  And I validate the UI of the beauty Brandroom Page
