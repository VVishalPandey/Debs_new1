Feature: Test Debenhams psp filters

@automated @Fixed @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams women -> dresses psp page and validate the options within filters
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I should see "clearAllFilter" exist on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Fit" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Size" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Colour" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Sleeve length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Discount" on "pspPage"

@automated @Fixed @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams women -> dresses psp page and validate result and filters for categories women -> dresses -> casual dresses
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  #And I "should see" "Dresses" position "1" in filtered by
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "Casual dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Women’s Casual Dresses" on "pspPage"
  And I should see "url" contains "women/dresses/casual-dresses#filter"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "WOMEN’S CASUAL DRESSES" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Fit" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Size" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Colour" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Sleeve length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Discount" on "pspPage"

@automated @Fixed @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams women -> dresses psp page and validate the image size should be large
  When I click on "closeIcon" on "pspPage"
  Then I should see "large" images

@automated @Fixed @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams women -> dresses psp page and validate result and filters for categories designer -> women -> dresses -> casual dresses
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "Smart dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" contains "Dresses"
  And I should see "url" contains "women/dresses/smart-dresses#filter"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "DRESSES" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "Casual dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "WOMEN’S CASUAL DRESSES" on "pspPage"
  And I should see "url" contains "casual-dresses:smart-dresses#filter"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "WOMEN’S CASUAL DRESSES" on "pspPage"

@automated @Fixed @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams designer -> women -> dresses -> casual dresses psp page from above scenario and validate filter result after removing remove casual dresses and then designers
  #When I "remove" "Casual dresses" position "4" in filtered by
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "Casual dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" contains "Dresses"
  And I should see "url" contains "/smart-dresses#filter"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "DRESSES" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "Smart dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "url" contains "dresses"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
# And I "should see" "Designers" position "1" in filtered by


@automated @Fixed @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams search -> blue dresses psp page and validate result and filters for categories women -> dresses -> casual dresses and validate result
  Given I navigate to "searchBlueDressesPspUrl"
  Then I should see "url" contains "search/blue+dresses"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "SEARCH RESULTS FOR "BLUE DRESSES"" on "pspPage"
  And I should not see "clearAllFilter" on "pspPage"
  And I should not see "filteredByText" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Categories" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Categories"  as "filterSubMenuViewList" as "Women" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as ""blue dresses"" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should not see "clearAllFilter" on "pspPage"
  And I should not see "filteredByText" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Occasion"  as "filterSubMenuInputList" as "Evening" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as ""blue dresses"" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women/evening#filter"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "WOMEN'S CLOTHING & ACCESSORIES" on "pspPage"
  Then I should see "clearAllFilter" exist on "pspPage"
  And I should see "filteredByText" exist on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "Smart dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as ""blue dresses"" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women/smart-dresses/evening#filter"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "WOMEN'S CLOTHING & ACCESSORIES" on "pspPage"
# And I "should see" "Dresses" position "1" in filtered by
# And I "should see" "Casual dresses" position "2" in filtered by

@automated @Fixed @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> casual dresses psp page from above scenario and validate filter result after removing dresses from filtered by
  When I click on "removeCasualfilterBy" on "pspPage"
  When I click on "removeDressfilterBy" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "searchText" as "Women's clothing & accessories..." on "pspPage"
  Then I should see "headerText" as ""BLUE DRESSES"" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Women's clothing & accessories" on "pspPage"
  And I should not see "clearAllFilter" on "pspPage"
  And I should not see "filteredByText" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Occasion"  as "filterSubMenuInputList" as "Evening" on "pspPage"

@automated3 @Fixed @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams women -> dresses -> casual dresses psp page and validate result and filters after applying filter for brand -> Phase Eight and then validate for search brand -> Dorothy Perkins
  Given I navigate to "womenCasualDressesPspUrl"
  Then I should see "headerText" as "WOMEN’S CASUAL DRESSES" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "WOMEN’S CASUAL DRESSES" on "pspPage"
  When I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Wallis" on "pspPage"
  Then I should see "url" contains "/women/dresses/wallis/casual-dresses#filter"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewListBrand" as "View" on "pspPage"
  Then I should see "searchPanel" exist on "pspPage"
  When I enter "Dorothy Perkins" in "searchPanel" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "Dorothy Perkins" on "pspPage"
  Then I should see "url" contains "women/dresses/dorothy-perkins:wallis/casual-dresses"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @Fixed @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams women -> dresses -> casual dresses -> brand -> Dorothy Perkins & Phase Eight psp page then validate result and filters after applying filter for size
  Given I navigate to "brandFilterDressesPspUrl"
  Then I should see "headerText" contains "Dresses"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Size" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Size"  as "filterSubMenuInputList" as "12" on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" contains "Dresses"
  And I should validate "products" exist on "pspPage"

@automated @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams women -> dresses -> casual dresses -> brand -> Dorothy Perkins & Phase Eight psp page then validate result and filters after removing Phase Eight and then validate after clear all
  Given I navigate to "brandFilterDressesPspUrl"
  Then I should see "headerText" containing "Dorothy Perkins & Wallis, Casual dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  When I "remove" "Wallis" position "2" in filtered by
  Then I should see "headerText" containing "Dorothy Perkins, Casual dresses" on "pspPage"
  # And I should see "headerFilterText" as "Dorothy Perkins" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "2" in filtered by
  And I "should see" "Casual dresses" position "4" in filtered by
  And I "should see" "Dorothy Perkins" position "3" in filtered by
  When I click on "clearAllFilter" on "pspPage"
  Then I should see "url" contains "debenhams.com/women"

@automated @DBMTE-130 @DBMTE-150 @Issue
Scenario: Navigate to Debenhams beauty -> makeup psp page and validate result and filters after applying filter for brand -> Benefit & ARMANI (using search)
  Given I navigate to "beautyMakeupPspURL"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Makeup" on "pspPage"
  When I click to "expand" filter "Brand" position "3"
  Then I should see value of filter position "3" as "Benefit" under parentfilter "3" "Brand"
  When I click on position "3" "Benefit" under parentfilter "3" "Brand"
  And I click on "filterButton" on "pspPage"
  And I click to "expand" filter "Brand" position "4"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewListBrand" as "View" on "pspPage"
  And I wait for "2000" milliseconds
  Then I should see "searchPanel" exist on "pspPage"
  And I enter "ARMANI" in "searchPanel" on "pspPage"
  Then I should see value as "ARMANI" in position "1" in filter search result under parentfilter "4"
  And I click on "ARMANI" in position "1" in filter search result under parentfilter "4"
  Then I should see "filterTitle" as "Benefit Makeup" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" containing "Makeup" on "pspPage"
  And I should see "url" contains "beauty/make-up/armani:benefit"
  And I should validate "products" exist on "pspPage"

@automated2 @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams beauty -> makeup -> brand -> Benefit & ARMANI psp page then validate result and filters after applying filter for price
  Given I navigate to "brandFilterMakeupPspUrl"
  Then I should see "headerText" as "BENEFIT MAKEUP" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "BENEFIT MAKEUP" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Price"  as "filterSubMenuViewList" as "£10 - £20" on "pspPage"
  Then I should see "filterTitle" as "BENEFIT MAKEUP" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "BENEFIT MAKEUP" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @Fixed @DBMTE-130 @DBMTE-150
Scenario: Navigate to Debenhams beauty -> makeup -> brand -> Benefit & ARMANI psp page then validate result and filters after removing Benefit and adding Kat Von D brand in filter
  Given I navigate to "brandFilterMakeupPspUrl"
  Then I should see "headerText" as "BENEFIT MAKEUP" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "BENEFIT MAKEUP" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewListBrand" as "View all brands" on "pspPage"
  Then I should see "searchPanel" exist on "pspPage"
  And I enter "bareMinerals" in "searchPanel" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "bareMinerals" on "pspPage"
  Then I should see "filterTitle" as "BENEFIT MAKEUP" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "BENEFIT MAKEUP" on "pspPage"
  And I should see "url" contains "beauty/make-up/armani:bareminerals"
  And I should validate "products" exist on "pspPage"

@manual @DBMTE-150
Scenario: Navigate to Debenhams women -> dresses psp page and validate that loader is displayed when we click on non-multi select facet on filter page

@manual @DBMTE-150
Scenario: Navigate to Debenhams women -> dresses psp page and validate manually entering the price range on filter page for price

@manual @DBMTE-150
Scenario: Navigate to Debenhams women -> dresses psp page and validate manually entering the discount range on filter page for discount

@manual @DBMTE-151
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> casual dresses psp page from above scenario and validate loader is displayed on removing dresses from filtered by

@manual @DBMTE-151
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> casual dresses psp page from above scenario and validate on clicking clear all on filter page all the filters are removed and Home page is loaded

@manual @DBMTE-151
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> casual dresses psp page from above scenario and validate on clicking X on filter page the filter section should be closed

@manual @DBMTE-151
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> casual dresses psp page from above scenario and validate on clicking Done button on filter page the filter section should be closed

@manual @DBMTE-151
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> casual dresses psp page from above scenario and validate on clicking background psp on filter page the filter section should be closed

@manual @DBMTE-234
Scenario: Validate that a PSP which already has an filter automatically applied should show the filter CTA with a count in green colour

@manual @DBMTE-234
Scenario: Validate that when we apply filters on the PSP page the number of filter increases into CTA with green styling

@manual @DBMTE-234
Scenario: Validate that when we remove filters on the PSP page the number of filter decrease into CTA with green styling

@manual @DBMTE-234
Scenario: Validate that when we remove all filters on the PSP page the filter CTA should change to colourless
