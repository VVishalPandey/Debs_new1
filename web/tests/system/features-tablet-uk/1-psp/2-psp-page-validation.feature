Feature: Test Debenhams psp page validation

@automated @Fixed @DBMTE-128
Scenario: Navigate to Debenhams women dresses psp page and validate the page
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "filterButton" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "nextButton" exist on "pspPage"
  And I should see "pageNumberText" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"

@automated @Fixed @DBMTE-128
Scenario Outline: Validate the breadcrumb section and validate navigation to TCAT and Homepage when breadcrumb selected
  Then I should see "breadcrumbSection" exist on "pspPage"
  And I should see "firstBreadcrumb" exist on "pspPage"
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
  Then I should not see "firstBreadcrumb" on "pspPage"
  And I should not see "secondBreadcrumb" on "pspPage"
  And I should not see "thirdBreadcrumb" on "pspPage"

  Examples:
    | breadcrumb_1 | breadcrumb_2 | breadcrumb_3 |
    | Home         | Women        | Dresses      |

@automated @Fixed @DBMTE-128
Scenario: Navigate to Debenhams women dresses psp page and validate product images count on the page
  Given I navigate to "womenDressesPspUrl"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"
  And I should count and validate "totalBrandCount" on "pspPage"
  And I should count and validate "totalProductCount" on "pspPage"
  And I should count and validate "totalSaveIconCount" on "pspPage"

@automated @Fixed @DBMTE-128
Scenario: Navigate to Debenhams women dresses psp page and validate on page two that previous and next buton is enabled
  When I am in view of "nextButton" on "pspPage"
  And I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@automated @Fixed @DBMTE-128
Scenario: Navigate to Debenhams women dresses psp page and validate product save icon count on the page
  Given I navigate to "beautyLipstickPspUrl"
  Then I should count and validate "totalMoreColourOptionsCount" on "pspPage"

@manual @DBMTE- @DBMTE-
Scenario: Navigate to Debenhams multi collection psp page and validate previous, next and page number text does not exist
  Given I navigate to "multiwayCollectionPspUrl"
  Then I should not see "previousButtonState" on "loginPage"
  And I should not see "nextButtonState" on "loginPage"
  And I should not see "pageNumberText" on "loginPage"

@manual @DBMTE- @DBMTE- @Issue207
Scenario: Navigate to Debenhams women suit & tailoring psp page and validate previous, next and page number text
  Given I navigate to "womerSuitTailoringPspUrl"
  When I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "disabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@manual  @DBMTE-
Scenario: Navigate to Debenhams women dresses psp page and validate product images width in both grid and column
  Given I navigate to "womenDressesPspUrl"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"

@manual  @DBMTE-
Scenario: Navigate to Debenhams coats and jackets psp page from women dresses psp page in column view and validate width in both column and grid view
  Given I navigate to "womenDressesPspUrl"
  When I click on "columnGridViewButton" on "pspPage"
  And I navigate to "coatsJacketsPspUrl"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"

@manual @DBMTE-
Scenario: Navigate to Debenhams women dresses psp page and page number dislay
  Given I navigate to "womenDressesPspUrl"
  Then I should count and validate "pageNumberText" on "pspPage"

@manual @DBMTE-
Scenario: Navigate to Debenhams women dresses psp page and page number dislay
  Given I navigate to "womenDressesPspUrl"
  Then I should validate number of "pages" as per "totalCountOfProducts" on "pspPage"

@automated @Fixed @DBMTE-128
Scenario: Navigate to Debenhams women dresses psp page and validate sort by price (high-low)
  Given I navigate to "womenDressesPspUrl"
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceHighLow" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "/dresses?sid=-price"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DBMTE-128
Scenario: Navigate to Debenhams women dresses psp page and validate sort by price (low-high)
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "/dresses?sid=*price"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DBMTE-128
Scenario: Navigate to Debenhams women dresses psp page and validate sort by best discount
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionPriceDiscount" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-discounted_percentage"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DBMTE-128
Scenario: Navigate to Debenhams women dresses psp page and validate sort by newest
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionNewest" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*newness%2C-product_views%2C-product_sales_value_10"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DBMTE-128
Scenario: Navigate to Debenhams women dresses psp page and validate sort by name (a-z) and then by best selling (default)
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionName" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*name"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionBestSelling" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-product_availability%2C-units_sold%2C-total_review_count"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automated @Fixed @DBMTE-128
Scenario: Navigate to Debenhams search towel psp page and validate best selling and then by relevance (default)
  Given I navigate to "searchTowelPspUrl"
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionBestSelling" on "pspPage"
  Then I should see "url" contains "sid=*product_availability%2C-units_sold"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  When I am in view of "sortDropdown" on "pspPage"
  When I click on "sortOptionRelevanceDefault" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*Newest"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@manual @DBMTE-128
Scenario: Navigate to Debenhams women dresses psp page and validate the prices with the prices available on the desktop site
  Given I navigate to "womenDressesPspUrl"
  Then I should validate price of prdouct as per desktop psp page

@manual @DBMTE-128
Scenario: Navigate to Debenhams search psp page and validate the header text comes in one line and products in next line

@manual @DBMTE-128
Scenario: Navigate to Debenhams psp page and validate the new filter icon

@manual @DBMTE-128
Scenario: Navigate to Debenhams psp page and validate that the column non column view

@manual @DBMTE-128
Scenario: Navigate to Debenhams psp page and validate that the column non column view

@manual @DBMTE-128
Scenario: Navigate to Debenhams psp beauty page and validate the badges

@manual @DBMTE-128
Scenario: Validate psp sorting result with desktop results

@manual @DBMTE-128
Scenario: Navigate to Debenhams psp page and Sign in pop once user selects save for later icon

@manual @DBMTE-128
Scenario: Validate sign in pop up on psp page (when selected save for later) closes on selecting cancel button

@manual @DBMTE-128
Scenario: Validate sign in pop up on psp page (when selected save for later) redirect to sign in page on selecting sign in option

@manual @DBMTE-128
Scenario: Validate sign in pop up on psp page (when selected save for later) closes on selecting close icon

@manual @DBMTE-196
Scenario: Validate the merch set on the women dress page - shoudl be in different container
  Given I have set up some merch sets on desktop e.g. dresses our favourites
  When I go to the relevant PSP
  Then I should see the merch set at the top of the PSP with a container that separates it from the rest of the PSP

@manual @DBMTE-196
Scenario: Validate the merch set is hidden when navigated to second page
  Given I moved to the second page of the PSP
  Then the merch set will be hidden

@manual @DBMTE-196
Scenario: Validate the merch set is hidden when applied filter and comes back when removed filter
  Given I have applied a filter
  Then the merch set will be hidden
  When I removed filter
  Then the merch re-appears

@manual @DBMTE-206
Scenario: Validate the slim banners of women dresses and women tops ps page
  Given I navigate to women dresses psp page
  Then I validate the slim banner appears on page
  When I navigate to women tops psp page
  Then I validate the slim banner appears on page

@manaul @DDAI-1073
Scenario Outline: Validate that we are able to see the header for different categories of PSP pages
	Given I navigate to "<PSP>" pages
	Then I validate that we are able to see the header

	Examples:
    | PSP       |
		| Women     |
		| Lingerie  |
		| Beauty    |
		| Home      |
		| Furniture |
		| Men       |
		| PLP       |
		| Chanel    |
		|Search PSP |

@manual @DDAI-1073
Scenario: Validate that we are not able to see the header for the brand room PSP pages i.e : Kat von d,Benefit etc.

@automated @Fixed  @DEBD-2584
Scenario Outline: Validate the Image src on psp as amplience
  Given I navigate to "<pspUrl>"
  Then I should see "firstProductImage" exist on "pspPage"
  And I verify "src" of "firstProductImage" containing "amplienceBaseUrl" on "pspPage"
  And I verify "srcset" of "firstProductImage" containing "pspImageParams" on "pspPage"

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
  And I verify "srcset" of "firstProductImage" containing "pspLongImageParams" on "pspPage"
Examples:
|pspUrl|
|womenMaxiPSPURL|
|womenDressesPspUrl|
|womenCasualDressesPspUrl|
|womerSuitTailoringPspUrl|
|coatsJacketsPspUrl|
|brandFilterDressesPspUrl|
