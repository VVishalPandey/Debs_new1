Feature: Test Debenhams women dresses psp page

@automated @Fixed @DBNHST-52 @DBNHST-53 @DBNHST-55
Scenario: Navigate to Debenhams women dresses psp page and validate the page
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "filterButton" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "nextButton" exist on "pspPage"
  And I should see "pageNumberText" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"

@automated @Fixed @DBNHST-52 @DBNHST-57
Scenario: Navigate to Debenhams women dresses psp page and validate previous buton is disabled while next button is enabled
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"

@automated @Fixed @DBNHST-52 @DBNHST-56
Scenario: Navigate to Debenhams women dresses psp page and validate product images count on the page
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DBNHST-56
Scenario: Navigate to Debenhams women dresses psp page and validate products brand on the page
  Then I should count and validate "totalBrandCount" on "pspPage"

@automated @Fixed @DBNHST-56
Scenario: Navigate to Debenhams women dresses psp page and validate products on the page
  Then I should count and validate "totalProductCount" on "pspPage"

@automated @Fixed @DBNHST-56
Scenario: Navigate to Debenhams women dresses psp page and validate product save icon count on the page
  Then I should count and validate "totalSaveIconCount" on "pspPage"

@automated @Fixed @DBNHST-52 @DBNHST-57
Scenario: Navigate to Debenhams women dresses psp page and validate on page two that previous and next buton is enabled
  When I click on "nextButton" on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@deScoped @DBNHST-55
Scenario: Navigate to Debenhams women dresses psp page and validate product images count and images width on the page when in grid and column view
  When I am in view of "columnGridViewButton" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"
  When I am in view of "columnGridViewButton" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  And I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"

@deScoped  @DBNHST-55
Scenario: Navigate to Debenhams coats and jackets psp page from women dresses psp page in column view and validate width in both column and grid view
  When I am in view of "columnGridViewButton" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  And I navigate to "coatsJacketsPspUrl"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  When I am in view of "columnGridViewButton" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"

@automated @Fixed @DBNHST-56
Scenario: Navigate to Debenhams women dresses psp page and validate product save icon count on the page
  Given I navigate to "beautyLipstickPspUrl"
  Then I should count and validate "totalMoreColourOptionsCount" on "pspPage"

@automated @Fixed @DBNHST-52 @DBNHST-57
Scenario: Navigate to Debenhams multi collection psp page and validate previous, next and page number text does not exist
  Given I navigate to "multiwayCollectionPspUrl"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should not see "previousButtonState" on "pspPage"
  And I should not see "nextButtonState" on "pspPage"
  And I should not see "pageNumberText" on "pspPage"

@automated @Fixed @DBNHST-52 @DBNHST-57 @Issue207
Scenario: Navigate to Debenhams women suit & tailoring psp page and validate previous, next and page number text
  Given I navigate to "blusherMakeUpPspURL"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "disabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@automated @Fixed @DBNHST-52
Scenario: Navigate to Debenhams women dresses psp page and page number dislay
  Given I navigate to "womenDressesPspUrl"
  Then I should count and validate "pageNumberText" on "pspPage"

@automated @Fixed @DBNHST-52
Scenario: Navigate to Debenhams women dresses psp page and page number dislay
  Given I navigate to "womenDressesPspUrl"
  Then I should validate number of "pages" as per "totalCountOfProducts" on "pspPage"

@automated @Fixed @DBNHST-54
Scenario: Navigate to Debenhams women dresses psp page and validate sort by price (high-low)
  Given I navigate to "womenDressesPspUrl"
  When I click on "sortOptionPriceHighLow" on "pspPage"
  Then I should see "url" contains "sid=-price"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DBNHST-54
Scenario: Navigate to Debenhams women dresses psp page and validate sort by price (low-high)
  When I am in view of "sortDropdown" on "pspPage"
  And I click on "sortOptionPriceLowHigh" on "pspPage"
  Then I should see "url" contains "sid=*price"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DBNHST-54
Scenario: Navigate to Debenhams women dresses psp page and validate sort by best discount
  When I am in view of "sortDropdown" on "pspPage"
  And I click on "sortOptionPriceDiscount" on "pspPage"
  Then I should see "url" contains "sid=-discounted_percentage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DBNHST-54
Scenario: Navigate to Debenhams women dresses psp page and validate sort by newest
  When I am in view of "sortDropdown" on "pspPage"
  And I click on "sortOptionNewest" on "pspPage"
  Then I should see "url" contains "sid=*newness%2C-product_views%2C-product_sales_value_10"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DBNHST-54
Scenario: Navigate to Debenhams women dresses psp page and validate sort by name (a-z) and then by best selling (default)
  When I am in view of "sortDropdown" on "pspPage"
  And I click on "sortOptionName" on "pspPage"
  Then I should see "url" contains "sid=*name"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"
  When I click on "sortOptionBestSelling" on "pspPage"
  Then I should see "url" contains "sid=-product_availability%2C-units_sold%2C-total_review_count"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DBNHST-54
Scenario: Navigate to Debenhams search towel psp page and validate best selling and then by relevance (default)
  Given I navigate to "searchTowelPspUrl"
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceHighLow" on "pspPage"
  When I click on "sortOptionBestSelling" on "pspPage"
  Then I should see "url" contains "sid=*product_availability%2C-units_sold"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionRelevanceDefault" on "pspPage"
  Then I should see "url" contains "sid=*Newest"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"

@manual @DBNHST-73
Scenario: Navigate to Debenhams women dresses psp page and validate the prices with the prices available on the desktop site
  Given I navigate to "womenDressesPspUrl"
  Then I should validate price of prdouct as per desktop psp page

@manual @DBNHST-1235
Scenario:Navigate to Debenhams women dresses psp page, click next button and verify loader before the page re-loads and the skeleton is seen for the next page of the PSP


@automated @Fixed @DEBD-2584
Scenario Outline: Validate the Image src on psp as amplience
  Given I navigate to "<pspUrl>"
  Then I should see "firstProductImage" exist on "pspPage"
  And I verify "src" of "firstProductImage" containing "amplienceBaseUrl" on "pspPage"
  And I verify "srcset" of "firstProductImage" containing "pspImageParamsMob" on "pspPage"

Examples:
|pspUrl|
|plpPspPage|
|animalPrintPSP|
|testFurniturePSPURL|
|pspPageLessThan18Products|
|pspPageLessThan210Products|
# |pickListPage|
|chanelpspPage|
|searchDressesWomenPspUrl|
|searchFoundationBeautyPspUrl|
|searchTowelPspUrl|
|multiwayCollectionPspUrl|
|beautyLipstickPspUrl|
|searchBlueDressesPspUrl|
|beautyMakeupPspURL|
|brandFilterMakeupPspUrl|
|psp2PaginationPageUrl|

@automated @Fixed  @DEBD-2584
Scenario Outline: Validate the Image src on psp as amplience
  Given I navigate to "<pspUrl>"
  Then I should see "firstProductImage" exist on "pspPage"
  And I verify "src" of "firstProductImage" containing "amplienceBaseUrl" on "pspPage"
  And I verify "srcset" of "firstProductImage" containing "pspLongImageParamsMob" on "pspPage"
Examples:
|pspUrl|
|womenMaxiPSPURL|
|womenDressesPspUrl|
|womenCasualDressesPspUrl|
|womerSuitTailoringPspUrl|
|coatsJacketsPspUrl|
|brandFilterDressesPspUrl|
|coatsJacketsPspUrl|
