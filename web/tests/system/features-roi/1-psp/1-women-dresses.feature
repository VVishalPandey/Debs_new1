Feature: Test Debenhams women dresses psp page

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and validate the page
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  # And I should see "filterButton" exist on "pspPage"
  And I should see "columnGridViewButton" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "nextButton" exist on "pspPage"
  And I should see "pageNumberText" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and validate previous buton is disabled while next button is enabled
  Given I navigate to "womenDressesPspUrl"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and validate on page two that previous and next buton is enabled
  Given I navigate to "womenDressesPspUrl"
  When I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"

@manual  @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and validate product images count on the page
  Given I navigate to "womenDressesPspUrl"
  Then I should count and validate "imagesOnScreen" on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and validate products brand on the page
  Given I navigate to "womenDressesPspUrl"
  Then I should count and validate "totalBrandCount" on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and validate products on the page
  Given I navigate to "womenDressesPspUrl"
  Then I should count and validate "totalProductCount" on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and validate product save icon count on the page
  Given I navigate to "womenDressesPspUrl"
  Then I should count and validate "totalSaveIconCount" on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and validate product save icon count on the page
  Given I navigate to "beautyLipstickPspUrl"
  Then I should count and validate "totalMoreColourOptionsCount" on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and validate on page two that previous and next buton is enabled
  Given I navigate to "womenDressesPspUrl"
  When I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams multi collection psp page and validate previous, next and page number text does not exist
  Given I navigate to "multiwayCollectionPspUrl"
  Then I should not see "previousButtonState" on "loginPage"
  And I should not see "nextButtonState" on "loginPage"
  And I should not see "pageNumberText" on "loginPage"

@manual  @DDAI-297
Scenario: Navigate to Debenhams women suit & tailoring psp page and validate previous, next and page number text
  Given I navigate to "womerSuitTailoringPspUrl"
  When I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "disabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and validate product images count on the page when in grid and column view
  Given I navigate to "womenDressesPspUrl"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"

@manual  @DDAI-326
Scenario: Navigate to Debenhams women dresses psp page and validate product images width in both grid and column
  Given I navigate to "womenDressesPspUrl"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"

@manual  @DDAI-326
Scenario: Navigate to Debenhams coats and jackets psp page from women dresses psp page in column view and validate width in both column and grid view
  Given I navigate to "womenDressesPspUrl"
  When I click on "columnGridViewButton" on "pspPage"
  And I navigate to "coatsJacketsPspUrl"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and page number dislay
  Given I navigate to "womenDressesPspUrl"
  Then I should count and validate "pageNumberText" on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and page number dislay
  Given I navigate to "womenDressesPspUrl"
  Then I should validate number of "pages" as per "totalCountOfProducts" on "pspPage"

@manual @DDAI-160
Scenario: Navigate to Debenhams women dresses psp page and validate sort by price (high-low)
  Given I navigate to "womenDressesPspUrl"
  When I click on "sortOptionPriceHighLow" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-min_price"
  And I should count and validate "imagesOnScreen" on "pspPage"

@manual @DDAI-160
Scenario: Navigate to Debenhams women dresses psp page and validate sort by price (low-high)
  Given I navigate to "womenDressesPspUrl"
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*min_price"
  And I should count and validate "imagesOnScreen" on "pspPage"

@manual @DDAI-160
Scenario: Navigate to Debenhams women dresses psp page and validate sort by best discount
  Given I navigate to "womenDressesPspUrl"
  When I click on "sortOptionPriceDiscount" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-discounted_percentage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@manual  @DDAI-160
Scenario: Navigate to Debenhams women dresses psp page and validate sort by newest
  Given I navigate to "womenDressesPspUrl"
  When I click on "sortOptionNewest" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*sort_order,*product_availability,*newness,-units_sold"
  And I should count and validate "imagesOnScreen" on "pspPage"

@manual @DDAI-160
Scenario: Navigate to Debenhams women dresses psp page and validate sort by name (a-z) and then by best selling (default)
  Given I navigate to "womenDressesPspUrl"
  When I click on "sortOptionName" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*name"
  And I should count and validate "imagesOnScreen" on "pspPage"
  When I click on "sortOptionDefault" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*product_availability,-units_sold,-total_review_count"
  And I should count and validate "imagesOnScreen" on "pspPage"

@manual  @DDAI-160
Scenario: Navigate to Debenhams search towel psp page and validate best selling and then by relevance (default)
  Given I navigate to "searchTowelPspUrl"
  When I click on "sortOptionBestSelling" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*product_availability,-units_sold"
  And I should count and validate "imagesOnScreen" on "pspPage"
  When I click on "sortOptionRelevanceDefault" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*Newest"
  And I should count and validate "imagesOnScreen" on "pspPage"

@manual @DDAI-297
Scenario: Navigate to Debenhams women dresses psp page and validate the prices with the prices available on the desktop site
  Given I navigate to "womenDressesPspUrl"
  Then I should validate price of prdouct as per desktop psp page

@manual @DBNHST-1235
Scenario:Navigate to Debenhams women dresses psp page, click next button and verify loader before the page re-loads and the skeleton is seen for the next page of the PSP
