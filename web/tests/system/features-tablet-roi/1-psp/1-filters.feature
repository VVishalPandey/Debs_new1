Feature: Test Debenhams Dotie psp filters

@manual @DBMTE-669
Scenario: Navigate to Debenhams women -> dresses psp page and validate the options within filters
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I should see "clearAllFilter" exist on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Fit" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Size" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Sleeve length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Colour" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Discount" on "pspPage"

@manual @DBMTE-669
Scenario: Navigate to Debenhams women -> dresses psp page and validate result and filters for categories women -> dresses -> maxi dresses
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  #And I "should see" "Dresses" position "1" in filtered by
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "Maxi dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Maxi dresses" on "pspPage"
  And I should see "url" contains "women/dresses/maxi-dresses"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  # And I "should see" "Dresses" position "1" in filtered by
  # And I "should see" "Maxi dresses" position "2" in filtered by
  And I "validate" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Fit" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Size" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Sleeve length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Colour" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Discount" on "pspPage"

@manual @DBMTE-669
Scenario: Navigate to Debenhams women -> dresses psp page and validate the image size should be large
  When I click on "closeIcon" on "pspPage"
  Then I should see "large" images

@manual @DBMTE-669
Scenario: Navigate to Debenhams women -> dresses psp page and validate result and filters for categories designer -> women -> dresses -> all smart dresses & all casual dresses
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  #And I "should see" "Dresses" position "1" in filtered by
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "All smart dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "All smart dresses" on "pspPage"
  And I should see "url" contains "women/dresses/all-smart-dresses"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "All casual dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "All casual dresses & All smart dresses" on "pspPage"
  And I should see "url" contains "all-casual-dresses:all-smart-dresses"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"

@manual @DBMTE-669
Scenario: Navigate to Debenhams designer -> women -> dresses -> casual dresses psp page from above scenario and validate filter result after removing remove casual dresses and then designers
  #When I "remove" "All casual dresses" position "4" in filtered by
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "All smart dresses" on "pspPage"
  And I should see "url" contains "women/dresses/all-smart-dresses"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  #When I "remove" "All smart dresses" position "4" in filtered by
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "url" contains "dresses"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"

@manual @DBMTE-669
Scenario: Navigate to Debenhams search -> blue dresses psp page and validate result and filters for categories women -> dresses -> casual dresses and validate result
  Given I navigate to "searchBlueDressesPspUrl"
  Then I should see "url" contains "search/blue+dresses"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "SEARCH RESULTS FOR "BLUE DRESSES"" on "pspPage"
  And I should not see "clearAllFilter" on "pspPage"
  And I should not see "filteredByText" on "pspPage"
  And I should see value of parentfilter position "1" as "Categories"
  When I click to "expand" filter "Categories" position "1"
  Then I should see value of filter position "1" as "Women" under parentfilter "1" "Categories"
  When I click on position "1" "Women" under parentfilter "1" "Categories"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as ""blue dresses"" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  #And I should see "filterTitle" as "WOMEN'S CLOTHING & ACCESSORIES" on "pspPage"
  And I should not see "clearAllFilter" on "pspPage"
  And I should not see "filteredByText" on "pspPage"
  When I click to "expand" filter "Categories" position "1"
  Then I should see value of filter position "1" as "Dresses" under parentfilter "1" "Categories"
  When I click on position "1" "Dresses" under parentfilter "1" "Categories"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as ""blue dresses"" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women/dresses"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  Then I should see "clearAllFilter" exist on "pspPage"  
  And I should see "filteredByText" exist on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "All casual dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as ""blue dresses"" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women/dresses/all-casual-dresses#filter"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
# And I "should see" "Dresses" position "1" in filtered by
# And I "should see" "Casual dresses" position "2" in filtered by

@manual @DBMTE-669
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> casual dresses psp page from above scenario and validate filter result after removing dresses from filtered by
  #When I "remove" "Dresses" position "1" in filtered by
  When I click on "removeCasualfilterBy" on "pspPage"
  When I click on "removeDressfilterBy" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "searchText" as "Women's clothing & accessories..." on "pspPage"
  Then I should see "headerText" as ""blue dresses"" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Women's clothing & accessories" on "pspPage"
  And I should not see "clearAllFilter" on "pspPage"
  And I should not see "filteredByText" on "pspPage"
  When I click to "expand" filter "Categories" position "1"
  Then I should see value of filter position "1" as "Dresses" under parentfilter "1" "Categories"

@manual @DBMTE-669
Scenario: Navigate to Debenhams women -> dresses -> all casual dresses psp page and validate result and filters after applying filter for brand -> Phase Eight and then validate for search brand -> Dorothy Perkins
  Given I navigate to "womenCasualDressesPspUrl"
  Then I should see "headerText" as "All casual dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  When I click to "expand" filter "Brand" position "3"
  And I should see value of filter position "1" as "Phase Eight" under parentfilter "3" "Brand"
  When I click on position "1" "Phase Eight" under parentfilter "3" "Brand"
  Then I should see "url" contains "/women/dresses/phase-eight/all-casual-dresses"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  #And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewList" as "View" on "pspPage"
  And I wait for "2000" milliseconds
  Then I should see "searchPanel" exist on "pspPage"
  When I enter "Debut" in "searchPanel" on "pspPage"
  Then I should see value as "Debut" in position "1" in filter search result under parentfilter "3"
  And I click on "Debut" in position "1" in filter search result under parentfilter "3"
  Then I should see "url" contains "women/dresses/debut:phase-eight/all-casual-dresses"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"
  
@automated @DBMTE-669
Scenario: Navigate to Debenhams women -> dresses -> all casual dresses -> brand -> Debut & Phase Eight psp page then validate result and filters after applying filter for size
  Given I navigate to "brandFilterDressesPspUrl"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  When I click to "expand" filter "Size" position "3"
  And I should see value of filter position "5" as "12" under parentfilter "3" "Size"
  When I click on position "5" "12" under parentfilter "3" "Size"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DBMTE-669
Scenario: Navigate to Debenhams women -> dresses -> all casual dresses -> brand -> Debut & Phase Eight psp page then validate result and filters after removing Phase Eight and then validate after clear all
  Given I navigate to "brandFilterDressesPspUrl"
  Then I should see "headerText" containing "Dorothy Perkins & Wallis, Casual dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  When I "remove" "Wallis" position "2" in filtered by
  Then I should see "headerText" containing "Dorothy Perkins, Casual dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "2" in filtered by
  And I "should see" "Casual dresses" position "4" in filtered by
  And I "should see" "Dorothy Perkins" position "3" in filtered by
  When I click on "clearAllFilter" on "pspPage"
  Then I should see "url" contains "debenhams.com/women"

@manual @DBMTE-669
Scenario: Navigate to Debenhams beauty -> makeup psp page and validate result and filters after applying filter for brand -> Benefit & Dior (using search)
  Given I navigate to "beautyMakeupPspURL"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Makeup" on "pspPage"
  When I click to "expand" filter "Brand" position "2"
  Then I should see value of filter position "2" as "Benefit" under parentfilter "2" "Brand"
  When I click on position "2" "Benefit" under parentfilter "2" "Brand"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewList" as "View" on "pspPage"
  And I wait for "2000" milliseconds
  Then I should see "searchPanel" exist on "pspPage"
  And I enter "Dior" in "searchPanel" on "pspPage"
  Then I should see value as "Dior" in position "1" in filter search result under parentfilter "2"
  And I click on "Dior" in position "1" in filter search result under parentfilter "2"
  Then I should see "filterTitle" as "Makeup" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should see "url" contains "beauty/make-up/benefit:dior"
  And I should validate "products" exist on "pspPage"

@manual @DBMTE-669
Scenario: Navigate to Debenhams beauty -> makeup -> brand -> Benefit & Dior psp page then validate result and filters after applying filter for price
  Given I navigate to "brandFilterMakeupPspUrl"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Makeup" on "pspPage"
  When I click to "expand" filter "Price" position "5"
  And I should see value of filter position "2" as "£15 - £25" under parentfilter "5" "Price"
  When I click on position "2" "£15 - £25" under parentfilter "5" "Price"
  Then I should see "filterTitle" as "Makeup" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should validate "products" exist on "pspPage"

@manual @DBMTE-669
Scenario: Navigate to Debenhams beauty -> makeup -> brand -> Benefit & Dior psp page then validate result and filters after removing Benefit and adding Kat Von D brand in filter
  Given I navigate to "brandFilterMakeupPspUrl"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Makeup" on "pspPage"
  When I click to "expand" filter "Brand" position "2"
  Then I should see value of filter position "2" as "Benefit" under parentfilter "2" "Brand"
  When I click on position "2" "Benefit" under parentfilter "2" "Brand"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewList" as "View" on "pspPage"
  And I wait for "2000" milliseconds
  Then I should see "searchPanel" exist on "pspPage"
  And I enter "Kat Von D" in "searchPanel" on "pspPage"
  Then I should see value as "Kat Von D" in position "1" in filter search result under parentfilter "2"
  And I click on "Kat Von D" in position "1" in filter search result under parentfilter "2"
  Then I should see "filterTitle" as "Makeup" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should see "url" contains "beauty/make-up/benefit:kat-von-d"
  And I should validate "products" exist on "pspPage"

@manual @DBMTE-669
Scenario: Navigate to Debenhams women -> dresses psp page and validate that loader is displayed when we click on non-multi select facet on filter page

@manual @DBMTE-669
Scenario: Navigate to Debenhams women -> dresses psp page and validate manually entering the price range on filter page for price

@manual @DBMTE-669
Scenario: Navigate to Debenhams women -> dresses psp page and validate selecting discount range on filter page for discount

@manual @DBMTE-669
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> all casual dresses psp page from above scenario and validate loader is displayed on removing dresses from filtered by

@manual @DBMTE-669
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> all casual dresses psp page from above scenario and validate on clicking clear all on filter page all the filters are removed and Home page is loaded

@manual @DBMTE-669
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> all casual dresses psp page from above scenario and validate on clicking X on filter page the filter section should be closed

@manual @DBMTE-669
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> all casual dresses psp page from above scenario and validate on clicking Done button on filter page the filter section should be closed

@manual @DBMTE-669
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> all casual dresses psp page from above scenario and validate on clicking background psp on filter page the filter section should be closed

@manual @DBMTE-669
Scenario: Validate that a PSP which already has an filter automatically applied should show the filter CTA with a count in green colour

@manual @DBMTE-669
Scenario: Validate that when we apply filters on the PSP page the number of filter increases into CTA with green styling

@manual @DBMTE-669
Scenario: Validate that when we remove filters on the PSP page the number of filter decrease into CTA with green styling

@manual @DBMTE-669
Scenario: Validate that when we remove all filters on the PSP page the filter CTA should change to colourless
