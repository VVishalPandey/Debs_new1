Feature: Test Debenhams psp filters

@automated @Fixed @DBNHST-53 @DBNHST-57
Scenario: Navigate to Debenhams women -> dresses psp page and validate the options within filters
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
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

@automated @Fixed @DBNHST-57
Scenario: Navigate to Debenhams women -> dresses psp page and validate result and filters for categories women -> dresses -> casual dresses
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
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

@automated @Fixed @DBNHST-75
Scenario: Navigate to Debenhams women -> dresses psp page and validate the image size should be large
  When I click on "closeIcon" on "pspPage"
  Then I should see "large" images

@automated @Fixed @DBNHST-57
Scenario: Navigate to Debenhams women -> dresses psp page and validate result and filters for categories designer -> women -> dresses -> casual dresses
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "dresses" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "Smart dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" containing "Smart dresses" on "pspPage"
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

@automated @Fixed @DBNHST-57
Scenario: Navigate to Debenhams designer -> women -> dresses -> casual dresses psp page from above scenario and validate filter result after removing remove casual dresses and then designers
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "Casual dresses" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
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


@automated @Fixed @DBNHST-57
Scenario: Navigate to Debenhams search -> blue dresses psp page and validate result and filters for categories women -> dresses -> casual dresses and validate result
  Given I navigate to "searchBlueDressesPspUrl"
  Then I should see "url" contains "search/blue+dresses"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "SEARCH RESULTS FOR "BLUE DRESSES"" on "pspPage"
  And I should not see "clearAllFilter" on "pspPage"
  And I should not see "filteredByText" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Categories" on "pspPage"
  And I wait for "(3000)" milliseconds
  And I "validate & click" option from "filterMenuList" of "Categories"  as "filterSubMenuLinkList" as "Women" on "pspPage"
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

@automated @Fixed @DBNHST-57
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

@automated @Fixed @DBNHST-197 @DBNHST-241
Scenario: Navigate to Debenhams women -> dresses -> casual dresses psp page and validate result and filters after applying filter for brand -> Phase Eight and then validate for search brand -> Dorothy Perkins
  Given I navigate to "womenCasualDressesPspUrl"
  Then I should see "headerText" as "WOMEN’S Casual Dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "WOMEN’S Casual Dresses" on "pspPage"
  # And I "should see" "Dresses" position "1" in filtered by
  # And I "should see" "Casual dresses" position "2" in filtered by
  When I click to "expand" filter "Brand" position "4"
  And I should see value of filter position "1" as "Dorothy Perkins" under parentfilter "4" "Brand"
  When I click on position "1" "Dorothy Perkins" under parentfilter "4" "Brand"
  Then I should see "url" contains "/women/dresses/dorothy-perkins/casual-dresses"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  # And I "should see" "Dresses" position "1" in filtered by
  # And I "should see" "Casual dresses" position "2" in filtered by
  # And I "should see" "Phase Eight" position "3" in filtered by
  #And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "View" on "pspPage"
  And I wait for "2000" milliseconds
  Then I should see "searchPanel" exist on "pspPage"
  When I enter "Mela London" in "searchPanel" on "pspPage"
  # Then I should see value as "Joe Browns" in position "1" in filter search result under parentfilter "3"
  # And I click on "Joe Browns" in position "1" in filter search result under parentfilter "3"
  And I wait for "3000" milliseconds
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "Mela London" on "pspPage"
  And I wait for "3000" milliseconds
  Then I should see "url" contains "women/dresses/dorothy-perkins:mela-london/casual-dresses"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  # And I "should see" "Dresses" position "1" in filtered by
  # And I "should see" "Casual dresses" position "2" in filtered by
  # And I "should see" "Dorothy Perkins" position "3" in filtered by
  # And I "should see" "Phase Eight" position "4" in filtered by
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"
# And I should see "headerFilterText" contains "Dorothy Perkins & Phase Eight"

@automated @Fixed @DBNHST-241
Scenario: Navigate to Debenhams women -> dresses -> casual dresses -> brand -> Dorothy Perkins & Phase Eight psp page then validate result and filters after applying filter for size
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
  # And I "should see" "Dresses" position "1" in filtered by
  # And I "should see" "Casual dresses" position "2" in filtered by
  # And I "should see" "Dorothy Perkins" position "3" in filtered by
  # And I "should see" "Phase Eight" position "4" in filtered by
  # And I "should see" "12" position "5" in filtered by
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"
# And I should see "headerFilterText" contains "Dorothy Perkins & Phase Eight, size 12"

@automated @DBNHST-241
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

@automated @Fixed @DBNHST-197 @DBNHST-241
Scenario: Navigate to Debenhams beauty -> makeup psp page and validate result and filters after applying filter for brand -> Benefit & ARMANI (using search)
  Given I navigate to "beautyMakeupPspURL"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Makeup" on "pspPage"
  # And I "should see" "Make up" position "1" in filtered by
  When I click to "expand" filter "Brand" position "3"
  Then I should see value of filter position "3" as "Benefit" under parentfilter "3" "Brand"
  And I click on position "3" "Benefit" under parentfilter "3" "Brand"
  And I click on "filterButton" on "pspPage"
  And I click to "expand" filter "Brand" position "4"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "View" on "pspPage"
  And I wait for "2000" milliseconds
  Then I should see "searchPanel" exist on "pspPage"
  And I enter "ARMANI" in "searchPanel" on "pspPage"
  Then I should see value of filter position "1" as "ARMANI" under parentfilter "4" "Brand"
  And I wait for "2000" milliseconds
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "ARMANI" on "pspPage"
  Then I should see "filterTitle" as "BENEFIT MAKEUP" on "pspPage"
  # And I "should see" "Make up" position "1" in filtered by
  # And I "should see" "ARMANI" position "2" in filtered by
  # And I "should see" "Benefit" position "3" in filtered by
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "BENEFIT MAKEUP" on "pspPage"
  And I should see "url" contains "beauty/make-up/armani:benefit"
  And I should validate "products" exist on "pspPage"
# And I should see "headerFilterText" as "ARMANI & Benefit" on "pspPage"

@automated @Fixed @DBNHST-241
Scenario: Navigate to Debenhams beauty -> makeup -> brand -> Benefit & ARMANI psp page then validate result and filters after applying filter for price
  Given I navigate to "brandFilterMakeupPspUrl"
  Then I should see "headerText" as "BENEFIT MAKEUP" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "BENEFIT MAKEUP" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Price"  as "filterSubMenuLinkList" as "£10 - £20" on "pspPage"
  Then I should see "filterTitle" as "MAKEUP" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" containing "Makeup" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @Fixed @DBNHST-197 @DBNHST-241
Scenario: Navigate to Debenhams beauty -> makeup -> brand -> Benefit & ARMANI psp page then validate result and filters after removing Benefit and adding Bobbi Brown brand in filter
  Given I navigate to "brandFilterMakeupPspUrl"
  Then I should see "headerText" as "BENEFIT MAKEUP" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "BENEFIT MAKEUP" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Benefit" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "View" on "pspPage"
  Then I should see "searchPanel" exist on "pspPage"
  And I enter "Bobbi Brown" in "searchPanel" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "Bobbi Brown" on "pspPage"
  Then I should see "filterTitle" as "BOBBI BROWN MAKEUP" on "pspPage"
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Bobbi Brown makeup" on "pspPage"
  And I should see "url" contains "beauty/make-up/armani:bobbi-brown"
  And I should validate "products" exist on "pspPage"

@manual @DBNHST-2017
Scenario: Navigate to Debenhams TCAT page and validate that the hero image & banner should be within the filter section
  Given I am on /women, /furniture and /sale TCAT pages
  Then I should see filter section on LHN
  And I should see the hero image should be within the filter section
  And global banner should be on top of header and outside the filter section
  And the filter bar would not be present

@manual @DBNHST-2017
Scenario: Navigate to Debenhams TCAT page and when user click on hero image then it should navigate to the appropriate url
  Given I am on /women, /furniture and /sale TCAT pages
  When I click on hero banner
  Then I should navigate to the appropriate url

@manual @DBNHST-2017
Scenario: Navigate to Debenhams SCAT page and validate that the hero image & banner should be within the filter section
  Given I am on furniture/living-room, /men/suits-tailoring SCAT page
  Then I should see filter section on LHN
  And I should see the hero image should be within the filter section
  And global banner should be on top of header and outside the filter section
  And the filter bar would not be present

@manual @DBNHST-2017
Scenario: Navigate to Debenhams SCAT page and when user click on hero image then it should navigate to the appropriate url
  Given I am on furniture/living-room, /men/suits-tailoring SCAT page
  When I click on hero banner
  Then I should navigate to the appropriate url

@manual @DBNHST-2017 @DBNHST-2041
Scenario: Navigate to Debenhams Beauty brand Room page and validate that the hero image & banner should not be within the filter section
  Given I am on Kat-Von-D beauty brand room
  Then I should see filter section on LHN next to products
  And i should see all the section with images content above products list to remain untouched by filters LHN
  And global banner should be on top of header and outside the filter section
  And the filter bar would be present with the brand name as selected within it and clear all as enabled

@manual @DBNHST-2017
Scenario: Navigate to Debenhams Chanel content page and validate that the filter LHN not be visible as per desktop and Chanel banner should be on top of page
  Given I am on Chanel content page like content/chanel, content/chanel/chanel-ladies-fragrances
  Then I should not see filter LHN as per desktop
  And I should see the Chanel banner should not be within the filter section

@manual @DBNHST-2017
Scenario: Navigate to Debenhams Chanel psp page and validate that the filter LHN should be visible and the Chanel banner should not be within filter section
  Given I am on Chanel -> Ladies fragrances -> Coco mademoiselle pages
  Then I should see filter section on LHN
  And I should see the Chanel banner should not be within the filter section

@manual @DBNHST-2028 @outOfScopeForPortrait
Scenario: Navigate to Debenhams PSP large image page and validate images count on portrait and landscape mode
  Given I am on women dresses page
  When I am on portrait mode
  Then I should see 2 images per row
  When I am on landscape mode
  Then I should see 3 images per row

@manual @DBNHST-2028 @outOfScopeForPortrait
Scenario: Navigate to Debenhams PSP normal size image page and validate images count on portrait and landscape mode
  Given I am on mac cosmetics page
  When I am on portrait mode
  Then I should see 2 images per row
  When I am on landscape mode
  Then I should see 3 images per row

@manual @DBNHST-2028 @outOfScopeForPortrait
Scenario: Navigate to Debenhams search PSP page and validate images count on portrait and landscape mode
  Given I am on search psp page
  When I am on portrait mode
  Then I should see 2 images per row
  When I am on landscape mode
  Then I should see 3 images per row

@manual @DBNHST-2062 @outOfScopeForPortrait
Scenario: Navigate to Debenhams psp page with Merch set and validate merch set products on portrait and landscape mode
  Given I am on psp page with merch set products
  When I am on portrait mode
  Then I should see 2 merch set products in a row, 3rd product to be hidden
  When I am on landscape mode
  Then I should see all 3 merch set products in a row

@manual @DBNHST-2034
Scenario: Navigate to Debenhams TCAT page and validate the bottom open filters and filter button is removed on the page
  Given I am on /women, /furniture and /sale TCAT pages
  Then the bottom open filters and filter button is not seen on the page

@manual @DBNHST-2034
Scenario: Navigate to Debenhams SCAT page and validate the bottom open filters and filter button is removed on the page
  Given I am on furniture/living-room, /men/suits-tailoring SCAT page
  Then the bottom open filters and filter button is not seen on the page

@manual @DBNHST-2053 @DBNHST-2042 @DBNHST-2053
Scenario: Navigate to Debenhams SCAT page and validate sticky bar should have filter applied and no number of products with clear all as enabled
  Given I am on furniture/living-room, /men/suits-tailoring SCAT page
  When I scroll down to the filter section
  Then no applied filters label would be displayed on the applied filters section
  #Then I should see filter applied as Living room and clear all link as enabled
  And I should see no number of products returned in search results section

@manual @DBNHST-2053 @DBNHST-2042
Scenario: Navigate to Debenhams SCAT page and validate that user is navigated to TCAT when default applied filter is removed
  Given I am on furniture/living-room, /men/suits-tailoring SCAT page
  When I scroll down to the filter section
  Then I should see filter applied as Living room and clear all link as enabled
  When I click clear all link
  Then I should navigate to TCAT page of furniture

@manual @DBNHST-2040 @DBNHST-2024 @DBNHST-2126
Scenario: Navigate to Debenhams TCAT page and validate sticky bar should have filter applied and no number of products with clear all as enabled
  Given I am on /women, /furniture and /sale TCAT pages
  When I scroll down to the filter section
  Then I will see no sticky filter bar
  #Then I should see no filter applied and clear all link as disabled
  #And the filtered by section will have text as "No filters applied..."
  #And I should see no number of products returned in search results section
  #And the sticky bar will be active when I pass the filter bar on page

@manual @DBNHST-2043
Scenario: Navigate to Debenhams PSP page and validate sticky bar should have filter applied and number of products with clear all as enabled
  Given I am on PSP page like women dresses
  When I scroll down to the filter section
  Then I should see filter applied as Dresses and clear all link as enabled
  And I should see number of products returned in search results section
  When I remove the default applied filter Dresses
  Then I should navigate to TCAT page of women

@manual @DBNHST-2043
Scenario: Navigate to Debenhams beauty brand room page and validate sticky bar should have filter applied and number of products with clear all as enabled
  Given I am on Kat-Von-D beauty brand room
  When I scroll down to the filter section
  Then I should see filter applied as Kat Von D and clear all link as enabled
  And I should see number of products returned in search results section
  When I remove the default applied filter Kat Von D
  Then I should navigate to TCAT page of beauty

@manual @DBNHST-2043 @DBNHST-2024
Scenario: Navigate to Debenhams search PSP page and validate sticky bar should not have filter applied but have number of products with clear all as disabled
  Given I am on a search PSP page
  When I scroll down to the filter section
  Then I should see no filter applied and clear all link as disabled
  And the filtered by section will have text as "No filters applied..."
  And I should see no number of products returned in search results section

@manual @DBNHST-2043
Scenario: Navigate to Debenhams Chanel PSP page and validate sticky bar should have filters applied with number of products displayed with clear all as enabled
  Given I am on Chanel -> Ladies fragrances -> Coco mademoiselle page
  When I scroll down to the filter section
  Then I should see filter applied as Chanel, ladies fragnances and Coco mademoiselle and clear all link as enabled
  And I should see number of products returned in search results section
  When I remove one of the default applied filter ladies fragnances
  Then I navigate to Chanel -> Coco mademoiselle PSP page
  And I should see filter applied as Chanel and Coco mademoiselle and clear all link as enabled
  When I click clear all link
  Then I should navigate to TCAT page of beauty

@manual @DBNHST-2041
Scenario: Navigate to Debenhams women -> dresses psp page and validate the options within filters
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "clearAllFilter" exist on "pspPage"
  And I should see "Dresses" in filtered by
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

@manual @DBNHST-2041
Scenario: Navigate to Debenhams women -> dresses psp page and validate result and filters for categories women -> dresses -> casual dresses
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  And I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "All casual dresses" on "pspPage"
  Then I should see "headerText" as "Casual dresses" on "pspPage"
  And I should see "url" contains "women/dresses/all-casual-dresses"
  And I should validate "products" exist on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  And I "should see" "All casual dresses" position "2" in filtered by

@manual @DBNHST-2041
Scenario: Navigate to Debenhams designer -> women -> dresses -> casual dresses psp page from above scenario and validate filter result after adding filters
  When I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Phase Eight" on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  And I "should see" "Phase Eight" position "2" in filtered by
  And I "should see" "All casual dresses" position "3" in filtered by

@manual @DBNHST-2041
Scenario: Navigate to Debenhams designer -> women -> dresses -> casual dresses -> Phase Eight and validate the filters menu changes after removing the filters
  When I "remove" "Dresses" in filtered by
  And I "should see" "Phase Eight" position "1" in filtered by
  And I "should see" "All casual dresses" position "2" in filtered by
  Then I should see "headerText" as "Women's clothing & accessories" on "pspPage"
  And I should see "url" contains "women/all-casual-dresses"
  And I should validate "products" exist on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Go to" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Size" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Colour" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Discount" on "pspPage"

@manual @DBNHST-2041
Scenario: Navigate to Debenhams designer -> women -> dresses -> casual dresses psp page from above scenario and validate filter result after selecting category as dresses
  When I "validate & click" option from "filterMenuList" of "Go to"  as "filterSubMenuInputList" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  And I "should see" "Phase Eight" position "2" in filtered by
  And I "should see" "All casual dresses" position "3" in filtered by
  Then I should see "headerText" as "Dresses" on "pspPage"
  Then I should see "searchText" as "Phase Eight, All casual dresses" on "pspPage"
  And I should see "url" contains "women/dresses/phase-eight/all-casual-dresses"

@manual @DBNHST-2041
Scenario: Navigate to Debenhams Beauty brand rooms page Kat Von D and validate filter options

@manual @DBNHST-2041
Scenario: Navigate to Debenhams Beauty brand rooms page Kat Von D and validate that the label for category filter is displayed as "Go to"

@manual @DBNHST-2041
Scenario: Navigate to Debenhams Beauty brand rooms page Kat Von D and validate that the "Go to" filter is expanded by default and does not have a collapse Feature

@manual @DBNHST-2041
Scenario: Navigate to Debenhams Beauty brand rooms page Kat Von D and validate that "Refined by:" coloumn is displayed below the "Go to" filter

@manual @DBNHST-2041
Scenario: Navigate to Debenhams Beauty brand rooms page Kat Von D and validate that user is able to add a "Go to" filter succesfully and the page is redirected to the PSP page

@manual @DBNHST-2041
Scenario: Validate that when the user removes the "Go to" filter from the above PSP page , it gets redirected to the Debenhams Kat Von D Brand room page with no filters selected

@manual @DBNHST-2041
Scenario: Navigate to Debenhams Beauty brand rooms page Kat Von D and validate that after selecting manual price range the filter is displayed in filter bar and the product count is correct

@manual @DBNHST-2041
Scenario: Navigate to Debenhams Beauty brand rooms page Kat Von D and select a discount range filter successfully then validate filter displayed in filter bar and the product count

@manual @DBNHST-2041
Scenario: Navigate to Debenhams Beauty brand rooms page Kat Von D and validate that on navigating back the browser the Beauty brand rooms page Kat Von D is displayed with empty applied filter bar and correct product count

@manual @DBNHST-2041
Scenario: Navigate to Debenhams Beauty brand rooms page Kat Von D and validate that we are able to see the price filter in the menu list after successfully removing the price filter

@manual @DBNHST-2054
Scenario: Navigate to Debenhams Beauty brand room and apply more than 4 filters then validate that user can see half of the last visible filter and is able to scroll the filter bar from left to right for the multi-filter aplied on the Beauty brand room

@manual @DBNHST-2054
Scenario: Navigate to Debenhams SCAT page and apply more than 4 filters then validate that user can see half of the last visible filter and is able to scroll the filter bar from left to right for the multi-filter aplied on the SCAT page

@manual @DBNHST-2054
Scenario: Navigate to Debenhams TCAT page and apply more than 4 filters then validate that user can see half of the last visible filter

@manual @DBNHST-2054
Scenario: Validate that is user is able to scroll the filter bar from left to right for the multi-filter aplied on the TCAT page

@manual @DBNHST-2054
Scenario: Navigate to Debenhams PSP page and apply more than 4 filters then validate that user can see half of the last visible filter and is able to scroll the filter bar from left to right for the multi-filter aplied on the PSP page

@manual @DBNHST-2054
Scenario: Navigate to Debenhams search PSP page and apply more than 4 filters then validate that user can see half of the last visible filter and is able to scroll the filter bar from left to right for the multi-filter aplied on the PSP page

@manual @DBNHST-2054
Scenario: Navigate to Debenhams Women > Dresses > All dresses PSP page and click on the any of the linkd present in the SEO content then verify that filter by bar is updated with the new filtered and it is navigated to the corect PSP page as per destop

@manual @DBNHST-2054
Scenario: Navigate to Debenhams Beauty -> makeup and apply the category filter lip balms and treatment PSP page then verify that applied filter is updated from "makeup" to "skincare" and "lipbalm & treatment" displaying the corect PSP page as per destop

@manual @DBNHST-2054
Scenario: Validate that on moving to the next page we are still able to see the applied filter bar on the top

@manual @DBNHST-2054
Scenario: Navigate to Debenhams Women > New Arrival page and validate that there are no default applied filters

@manual @DBNHST-2023
Scenario: Navigate to Debenhams Mens shirt PSP page and validate that user is able to see the sticky filter bar on the top and fiilter menu on the LHS with close facets other than Go to

@manual @DBNHST-2026
Scenario: Navigate to Debenhams Mens shirt PSP page and validate that the spiner is displayed on the center of the page when the user selects a filter

@manual @DBNHST-2026
Scenario: Navigate to Debenhams Womens PSP page and expanded a non-multi select facet accordion e.g. designer validate that no checkboxes by the facet value should be displayed

@manual @DBNHST-2026
Scenario: Navigate to Debenhams Womens PSP page and select an option(e.g:jasper conran) from designer filter validate that the user is able to see whole page overlay with a central spinner and he PSP product results will update

@manual @DBNHST-2026
Scenario: Navigate to Debenhams Womens search PSP page and select an option(e.g:jasper conran) from designer filter validate that the user is taken taken to the filter bar (top of page above the fold) and clear all CTA will become activated with jasper conran is updated in the applied filter bar and designer facet should stay open

@manual @DBNHST-2027
Scenario: Navigate to any TCAT/SCAT/PSP page and expanded a multi select facet accordion e.g. colour and validate that the user is able to see the checkboxes for the facet options

@manual @DBNHST-2027
Scenario: Navigate to any TCAT/SCAT/PSP page and select blue colour options from the colour facet, validate that a whole page overlay with a central spinner and the PSP page is updated as per the applied filter

@manual @DBNHST-2027
Scenario: Select red colour options from the colour facet and validate that a whole page overlay with a central spinner and the PSP page is updated as per the applied filter with filter bar updated with red filter applied and validate that colour facet should stay open

@manual @DBNHST-2027
Scenario: Expand another facet e.g size and validate that colour facet should stay open

@manual @DBNHST-2031 @DBNHST-2078
Scenario: Validate the search result psp page when user apply filter Brand - Phase Eight
  When I click on "searchIcon" on "commonPage"
  And I enter "Women sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as "Women's sale" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewList" as "View" on "pspPage"
  And I "validate" option from "filterMenuList" of "Brand"  as "filterSubMenuViewList" as "View" on "pspPage"
  Then I should see "searchPanel" exist on "pspPage"
  When I am in view of "searchPanel" on "pspPage"
  And I enter "Phase Eight" in "searchPanel" on "pspPage"
  Then I should see value as "Phase Eight" in position "1" in filter search result under parentfilter "3"
  And I wait for "3000" milliseconds
  When I click on "Phase Eight" in position "1" in filter search result under parentfilter "3"
  And I click on "closeButton" on "pspPage"
  Then I should see "headerText" as "Women's occasion & evening wear" on "pspPage"
  And I should see "searchText" as "Phase Eight" on "pspPage"
  And I should see "url" contains "sale/women/occasion-evening-wear/phase-eight"

@manual @DBNHST-2029
Scenario: Navigate to Debenhams SCAT page and apply a category filter then validate the user is taken to the relevent PSP page and validate filter displayed in filter bar and the product count

@manual @DBNHST-2029
Scenario: Remove the applied filter from the filter bar then validate the user is taken to the relevent SCAT page and validate filter displayed in filter bar and the product count

@manual @DBNHST-2029
Scenario: Navigate to Debenhams SCAT page and apply a price filter then validate the user is remains on the same SCAT page with applied filter displayed in filter bar and the product count

@manual @DBNHST-2029
Scenario: Remove the applied filter from the filter bar then validate the user is remains on the SCAT page and validate filter displayed in filter bar and the product count

@manual @DBNHST-2029
Scenario: Navigate to Debenhams TCAT page and apply a category filter then validate the user is taken to the relevent PSP page and validate filter displayed in filter bar and the product count

@manual @DBNHST-2029
Scenario: Navigate to Debenhams TCAT page and apply a price filter then validate the user is taken to the relevent PSP page and validate filter displayed in filter bar and the product count

@manual @DBNHST-2029
Scenario: Remove the applied filter from the filter bar then validate the user is returns on the TCAT page and validate filter displayed in filter bar and the product count

@manual @DBNHST-2029
Scenario: Navigate to Debenhams Brand room page and apply a category filter then validate the user is taken to the relevent PSP page and validate filter displayed in filter bar and the product count

@manual @DBNHST-2029
Scenario: Remove the applied filter from the filter bar then validate the user is taken to the relevent Brand room page and validate filter displayed in filter bar and the product count

@manual @DBNHST-2029
Scenario: Navigate to Debenhams Brand room page and apply a price filter then validate the user is remains on the same Brand room page with applied filter displayed in filter bar and the product count

@manual @DBNHST-2029
Scenario: Remove the applied filter from the filter bar then validate the user is taken to the relevent PSP page and validate filter displayed in filter bar and the product count

@manual @DBNHST-2019
Scenario: Navigate to a PSP page and click on clear all CTA then validate that user is redirected to the TCAT page and the applied filter bar does not displayed any filters

@manual @DBNHST-2030
Scenario: Navigate to Debenhams Women --> All dresses page and validate that the sort by drop down displayed on the left

@manual @DBNHST-2030
Scenario: Navigate to Debenhams Women --> All dresses page and click on sort by after applying multi-filter and validate that the sort by drop down opens

@manual @DBNHST-2030
Scenario: Select sort by as High to low and validate that the sort by drop down closes and product order should be update as per desktop

@manual @DBNHST-2030
Scenario: Navigate to Debenhams Women --> All dresses page and click on sort by after removing the applied multi-filter and validate that the sort by drop down opens

@manual @DBNHST-2030
Scenario: Select sort by as High to low and validate that the sort by drop down closes and product order should be update as per desktop

@manual @DBNHST-2030
Scenario: Validate the when we scroll down the sticky filter bar the sort by is not included in the sticky filter bar and stay at the top of the search results

@manual @DBNHST-2062
Scenario: Navigate to the Debenhams PSP page with merch set and validate the merch set is displayed on the top in portrait mode

@manual @DBNHST-2085
Scenario: Navigate to the Debenhams PSP pageg and validate "Go to" is on top of the filters and rest all filters should be under refine section
  Given I navigate to PSP pages
  When I scroll down to the filter section issue
  Then "Go to" is on top of the filters in LHN and rest all filters should be under refine section

@manual @DBNHST-2085
Scenario: Navigate to the Debenhams TCAT/SCAT/Brand room page and validate "Go to" is on top of the filters and rest all filters should be under refine section
  Given I navigate to TCAT/SCAT/Brand room page
  When I scroll down to the filter section issue
  Then "Go to" is on top of the filters in LHN and rest all filters should be under refine section

@manual @
Scenario: Navigate to plp page and validate the filter bar and filter options shoudl be as per desktop

@manual @
Scenario: Navigate to plp page and validate that no default filters are applied on the page and text "No filters applied..." in filtered by section

@manual @
Scenario: Navigate to plp page and validate that when price filter is applied then it remains on the same page and applied filtered is displayed under filter bar with updated result count

@manual @
Scenario: Navigate to plp page and validate multi filter is working on the page, the applied filter will be displayed on filtered by and updated result count is updated

@manual @
Scenario: Navigate to plp page and validate that the sticky filter will get activated once user will pass the filter bar on the page

@manual @
Scenario: Navigate to plp page and validate sorting should work (low-high) and the results gets updated accordingly

@manual @
Scenario: Navigate to plp page and validate categories should be renamed as "Go To" and should be at the top on LHN with other filters under "Refine by"

@manual @
Scenario: Navigate to plp page and vaidate if products less that 60 then no pagination should be on the page

@manual @
Scenario: Navigate to plp page and validate psp hero banner should be on out of the filtercomponent

# Below may not be part of release 4.4.0

@manual @DBNHST-2088
Scenario: Navigate to the Debenhams 0 product page and validate filter LHN and filter bar applied filter
  Given I am on PSP page
  When I apply on search which returns 0 products
  Then I see the PSP 0 product page with filter on LHN
  And the filters to be same as on desktop
  And the filtered by sections should have the user applied filters

@manual @DBNHST-2088
Scenario: Navigate to the Debenhams 0 product page and validate sort option should not appear
  Given I am on PSP page
  When I apply on search which returns 0 products
  Then I see the PSP 0 product page with filter on LHN
  And I sort dropdown should not appear

@manual @DBNHST-2088
Scenario: Navigate to the Debenhams 0 product page and validate remove filter and navigating to PSP page
  Given I am on PSP page
  When I apply on search which returns 0 products
  Then I see the PSP 0 product page with filter on LHN
  When I remove the applied filter
  Then I should navigate to PSP page with products on page
  And I should see sort option re-appear on the page

@manual @DBNHST-2226 @DBNHST-2228
Scenario: Validate the pae setup for Variant D/variant BCD
  Given I am on PSP/PLP/TCAT/SCAT/Search page
  Then I should see the orange Filter button in portrait mode
  When I am on landscape mode
  Then I should see sort option on the RHS in filter bar section
  And sorting should work when applied on PSP/PLP/TCAT/SCAT/Search page
  And I should see the LHN filters with no 'Go to' and 'Refine by' section
  And 'Go to' filter option to renamed to categories
  And all the filters should be in same order as the filter options under orange button/desktop filter
  And it should have performance fix from sprint 27
