Feature: Test Debenhams Beauty Brandroom psp page validation

@automated @Fixed @DEBD-974
Scenario Outline: Navigate to Debenhams Beauty Brandroom psp page and validate the page
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Guerlain" under "Beauty" on commonPage bigscreen
  Then I should see "headerText" as "GUERLAIN" on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  And I should see "productViewPerPageLink" exist on "pspPage"
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


@automated @Fixed @DEBD-974
Scenario: Navigate to Debenhams Beauty Brandroom psp page and validate sort by price (high-low)
  When I "validate & click" subMenu option "Guerlain" under "Beauty" on commonPage bigscreen
  Then I should see "sortDropdown" exist on "pspPage"
  When I click on "sortOptionPriceHighLow" on "pspPage"
  Then I should see "url" contains "sid=-price"
  And I should see "filterSection" exist on "pspPage"
  And I should see "paginationSectionHeader" exist on "pspPage"
  And I should see "paginationSectionFooter" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @Fixed @DEBD-974
Scenario: Navigate to Debenhams Beauty Brandroom psp page and validate sort by price (low-high)
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*price"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @Fixed @DEBD-974
Scenario: Navigate to Debenhams Beauty Brandroom psp page and validate sort by best discount
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceDiscount" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-discounted_percentage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @Fixed @DEBD-974
Scenario: Navigate to Debenhams Beauty Brandroom psp page and validate sort by newest
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionNewest" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*newness%2C-product_views%2C-product_sales_value_10"
  When I should scroll to "subscribeToNewsletter" on "commonPage"

@automated @Fixed @DEBD-974
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

@automated @Fixed @DEBD-974
Scenario: Navigate to Debenhams Beauty Brandroom psp page and validate filters
  When I "validate & click" subFilter option "£60 and over" under "Price" on commonPage bigscreen
  Then I should see "url" contains "price%3E60.0"
  And I should see "headerText" as "Beauty" on "pspPage"
  And I should see "pspHeader" as "GUERLAIN, £60 and over" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I "validate & remove" the applied filter "£60 and over" on commonPage bigscreen
  When I "validate & click" subFilter option "Mon Guerlain" under "Collections" on commonPage bigscreen
  Then I should see "url" contains "mon-guerlain"
  And I should see "headerText" as "Beauty" on "pspPage"
  And I should see "pspHeader" as "GUERLAIN, Mon Guerlain" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I "validate & remove" the applied filter "Mon Guerlain" on commonPage bigscreen

@automated @Fixed @DEBD-974
Scenario: Navigate to the next page of brandroom psp page and validate the pagination
  And I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  #And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"
  And I should see "headerText" as "GUERLAIN" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should validate "products" exist on "pspPage"

@manual @DEBD-974  @awsManual
Scenario: Validate Beauty Brandroom UI and products with respect to Desktop
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Kat Von D" under "Beauty" on commonPage bigscreen
  And I validate the UI of the beauty Brandroom Page


@manual @awsManual
Scenario: Validate the user is able to navigate to content page successfully.

@manual @awsManual
Scenario: Validate the content pages are displaying properly
