Feature: Test Debenhams psp filters

@manual @DBED-563 @DEBD-732
Scenario: Navigate to Debenhams PSP page and validate sticky bar should have filter applied
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  When I am in view of LHN
  Then I will see  sticky filter bar
  And I validate hotspot in LHN
  And I should see filter by area
  And I should see  filter your selection
  And I should see facets in LHN
  And I scroll down to filter section
  And I will see facets opened and closed as per desktop production
  When I am on a closed facet
  Then I will see the facet title in bold and black and a + on the right, both will be on the same row
  And I have opened a facet I will see the facet title in bold and black and a - on the right, both will be on the same row
  And I will see facet values with numbers in brackets next to them and they will be checkboxes
  When I scroll down to the bottom
  Then I will see LHN
  And I scroll inside LHN
  And I will see filter area is scrollable

@manual @DBED-738
Scenario Outline: Navigate to Debenhams TCAT page and validate  the LHN
  Given I navigate to "homeURL"
  When I "validate & click" menu option "<TopnavCat>" on commonPage bigscreen
  Then I should see "headerText" as "<headerText>" on "pspPage"
  And I should see "url" contains "<urlcontains>"
  Then I should see filter section on LHN on TCAT page
  And I should see "shop by.." on "TCATPage"
  And I will see facets opened and closed as per desktop production
  When I am on a closed facet
  Then I will see the facet title in bold and black and a + on the right, both will be on the same row
  And I have opened a facet I will see the facet title in bold and black and a - on the right, both will be on the same row
  And I will see facet values with numbers in brackets next to them and they will be clickable links
  Then I validate hotspot in LHN which should be black and bold with right arrow for Hotspots
  When I scroll down to the bottom
  Then I should not see LHN
  And I scroll inside the LHN
  Then I will see filter area is not scrollable
  When I open a facets in LHN
  Then I should not see  checkboxes

  Examples:
    | TopnavCat    | headerText                     | urlcontains |
    | Women        | Women's clothing & accessories | women       |
    | Furniture    | Furniture                      | furniture   |
    | Offers       | Sale                           | sale        |

@manual @DBED-738 @DEBD-750 @DEBD-927
Scenario Outline: Navigate to Debenhams SCAT page and validate  the LHN
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "<L2Category>" under "<L1Category>" on commonPage bigscreen
  Then I should see "headerText" as "<headerText>" on "pspPage"
  And I should see "url" contains "<urlcontains>"
  Then I should see filter section on LHN on TCAT page
  And I should see "shop by.." on "TCATPage"
  And I will see facets opened and closed as per desktop production
  When I am on a closed facet
  Then I will see the facet title in bold and black and a + on the right, both will be on the same row
  And I have opened a facet I will see the facet title in bold and black and a - on the right, both will be on the same row
  And I will see facet values with numbers in brackets next to them and they will be clickable links
  Then I validate hotspot in LHN which should be black and bold with right arrow for Hotspots
  When I scroll down to the bottom
  Then I should not see LHN
  And I scroll inside the LHN
  Then I will see filter area is not scrollable
  When I open a facets in LHN
  Then I should not see  checkboxes
  When I select any facet /click on the next pagination/select sorting
  Then I "validate" the animated loader should appear

  Examples:
      | L2Category                | L1Category   | headerText             | urlcontains             |
      | All living room furniture | Furniture    | Living room furniture  | furniture/living-room   |
      | All bedroom furniture     | Furniture    | Bedroom furniture      | furniture/bedroom       |

@automated @DBED-663
Scenario: Navigate to the Debenhams PSP page and validate brand facet
  Given I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I should see "headerText" contains "Dresses"
  Then I should see "pspHeader" as "Maxi Dresses" on "pspPage"
  When I "validate & click" subFilter option "View all Brands" under "Brand" on commonPage bigscreen
  Then I should see "searchPanel" exist on "pspPage"
  When I "validate & click" subFilter option "View less Brands" under "Brand" on commonPage bigscreen
  Then I should not see "searchPanel" on "pspPage"
  And I "validate" subFilter option "View all Brands" under "Brand" on commonPage bigscreen

@automated @DEBD-732
Scenario: Validate remove all applied filter on PSP page so that user is navigated to TCAT page
  When I "validate & remove" the applied filter "Dresses" on commonPage bigscreen
  Then I should see "url" contains "/women/maxi-dresses"
  And I should see "headerText" contains "Women's clothing & accessories"
  And I should see "pspHeader" as "Maxi dresses" on "pspPage"
  When I "validate & remove" the applied filter "Maxi dresses" on commonPage bigscreen
  Then I should see "url" contains "/women"
  And I should see "pspHeaderText" as "Women's clothing & accessories" on "pspPage"
  And I should not see "filteredByOptions" on "pspPage"
  And I should not see "clearAllFiltersLink" on "pspPage"

@automated @DBED-732 @DBED-750
Scenario: validate clear all filters link should navigate user to TCAt page from PSP page
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I should see "headerText" contains "Dresses"
  Then I should see "pspHeader" as "Maxi Dresses" on "pspPage"
  When I click on "clearAllFiltersLink" on "pspPage"
  Then I should see "url" contains "/women"
  And I should see "pspHeaderText" as "Women's clothing & accessories" on "pspPage"
  And I should not see "filteredByOptions" on "pspPage"
  And I should not see "clearAllFiltersLink" on "pspPage"

@automated @DBED-663
Scenario: Navigate to the Debenhams TCAT page and validate brand facet
  Given I navigate to "homeURL"
  When I "validate & click" menu option "Women" on commonPage bigscreen
  Then I should see "pspHeaderText" contains "Women's clothing & accessories"
  And I should see "url" contains "/women"
  When I "validate & click" subFilter option "View all Brands" under "Brand" on commonPage bigscreen
  Then I should see "searchPanel" exist on "pspPage"
  When I "validate & click" subFilter option "View less Brands" under "Brand" on commonPage bigscreen
  Then I should not see "searchPanel" on "pspPage"
  And I "validate" subFilter option "View all Brands" under "Brand" on commonPage bigscreen

@automated @DBED-663 @DBED-657
Scenario:validate searchbox under Brand facet
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I should see "headerText" contains "Dresses"
  Then I should see "pspHeader" as "Maxi Dresses" on "pspPage"
  When I "validate & click" subFilter option "View all Brands" under "Brand" on commonPage bigscreen
  Then I should see "searchPanel" exist on "pspPage"
  When I enter "Mela London" in "searchPanel" on "pspPage"
  And I "validate & click" subFilter option "Mela London" under "Brand" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/mela-london/maxi-dresses"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Mela London, Maxi dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-657 @DEBD-656 @DEBD-663
Scenario: Validate multi filter on PSP page when applied on brand and colour and length
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  And I "validate & click" subFilter option "Long" under "Length" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/maxi-dresses/long"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Maxi dresses, Long" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "Black" under "Colour" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/maxi-dresses/black/long"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Maxi dresses, black, Long" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "Yumi" under "Brand" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/yumi/maxi-dresses/black/long"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Yumi, Maxi dresses, black, Long" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-732
Scenario: Validate remove applied filter on PSP page from above scenario
  When I "validate & remove" the applied filter "Long" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/yumi/maxi-dresses/black"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Yumi, Maxi dresses, Black" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I "validate & remove" the applied filter "Yumi" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/maxi-dresses/black"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Maxi Dresses, black" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-657 @DEBD-656
Scenario: Validate price filter on psp page
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  And I should see "headerText" contains "Dresses"
  And I "validate & click" subFilter option "€55 and over" under "Price" on commonPage bigscreen
  Then I should see "url" contains "price%3E55.0"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Maxi dresses, €55 and over" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I click on "priceFilter" on "pspPage"
  When I scroll to "filterFromPrice" within filters
  And I enter "10" in "filterFromPrice" on "pspPage"
  And I enter "40" in "filterToPrice" on "pspPage"
  And I click on "filterPriceGo" on "pspPage"
  Then I should see "url" contains "price&rlo=10&rhi=40"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Maxi dresses, €10 - 40" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-657 @DEBD-656
Scenario: Validate price filter error cases on psp page
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  And I should see "headerText" contains "Dresses"
  And I "validate & click" subFilter option "€55 and over" under "Price" on commonPage bigscreen
  Then I should see "url" contains "price%3E55.0"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Maxi dresses, €55 and over" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I click on "priceFilter" on "pspPage"
  And I scroll to "filterFromPrice" within filters
  And I enter "" in "filterFromPrice" on "pspPage"
  And I enter "" in "filterToPrice" on "pspPage"
  And I click on "filterPriceGo" on "pspPage"
  And I should see "filterPriceError" as "Please enter a price range to use this feature." on "pspPage"
  When I enter "100" in "filterFromPrice" on "pspPage"
  And I enter "40" in "filterToPrice" on "pspPage"
  And I click on "filterPriceGo" on "pspPage"
  And I should see "filterPriceError" as "The 'From' price must be lower than the 'To' price." on "pspPage"

@automated @DEBD-737
Scenario: Navigate to the Debenhams TCAT page and validate brand facet
  Given I navigate to "homeURL"
  When I "validate & click" menu option "Women" on commonPage bigscreen
  Then I should see "pspHeaderText" as "Women's clothing & accessories" on "pspPage"
  And I should see "url" contains "/women"
  When I "validate & click" subFilter option "View all Brands" under "Brand" on commonPage bigscreen
  Then I should see "searchPanel" exist on "pspPage"
  When I "validate & click" subFilter option "View less Brands" under "Brand" on commonPage bigscreen
  Then I should not see "searchPanel" on "pspPage"
  And I "validate" subFilter option "View all Brands" under "Brand" on commonPage bigscreen

@manual @DEBD-737
Scenario: Navigate to the Debenhams PSP page/TCAT Page and validate brand facet
  Given I am on women>dresses psp
  When I click on Brand facet
  Then I should see facet  opened
  And I should see the view All brand link
  And I click on view all brand link
  Then I should see search box in under brand facet
  And I should see full list of  brand names along with checkboxes in brand facet
  And I should see View less Brand link
  And I click on view less Brand link
  Then I should see view all brand link
  And I should not see search box

@manual @DEBD-737
Scenario:validate searchbox under Brand facet
  When I click on Brand facet
  And I click on view all brand link
  Then I should see search box in under brand facet
  And I should see "Search Brands" inside the search box
  And I click inside the search box
  And I should not see "Search Brands" inside the search box
  And I type "Mango" in the search box
  Then I should see only brand name as "Mango" with checkbox in Brand facet
  And I click and enter "man"  in search box
  Then I should all brands name containing "man"

@notAutomated @DEBD-655
Scenario: Validate the filter applied for price 10 to 20
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Price"  as "filterSubMenuLinkList" as "€55 - €100" on "pspPage"
  And I click on "closeButton" on "pspPage"
  Then I should see "headerText" as "Women's clothing & accessories" on "pspPage"
  And I should see "searchText" as "€10 - €20" on "pspPage"

@manual @DEBD-655
Scenario: Validate UI of price filter
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I "validate & click" option is available in "filterMenuList" as "Price" on "pspPage"
  And I should see Clickable links to pre-selected price ranges
  And I should see 2 Price range input boxes having hint text as with "From" and "To"
  And I should see Go Button in define range
  And when I click in the input fields and click out without entering any numbers
  Then I should still see the hint texts inside the input boxes
  And I click on Go Button
  Then I should see a error message as "Please enter a price range to use this feature."
  And I should see the border of the input boxes changes to "Red"
  And when I click and enter "50" in "From"  input box
  Then "From" hint text should disappear
  And when I click and enter "60" in "To"  input box
  Then "To" hint text should disappear
  And I "Validate and click " "Go" Button
  Then I relevent psp should reloads
  When I enter "€100" in "From" input box and "€55" in "to" Input boxes
  Then I should see a error message as "The ‘From’ price must be lower than the ‘To’ price"

@automated @DBED-663 @DEBD-739
Scenario:validate searchbox under Brand facet
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I should see "headerText" contains "Dresses"
  And I "validate & click" subFilter option "Mela London" under "Brand" on commonPage bigscreen
  Then I should see "url" contains "women/dresses/mela-london/maxi-dresses"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Mela London, Maxi dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-739 @DEBD-656 @DEBD-663
Scenario: Validate multi filter on PSP page when applied on brand and colour and length
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  And I "validate & click" subFilter option "Long" under "Length" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/maxi-dresses/long"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Maxi dresses, Long" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "Black" under "Colour" on commonPage bigscreen
  Then I should see "url" contains "women/dresses/maxi-dresses/black/long"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Maxi dresses, black, Long" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "Mela London" under "Brand" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/mela-london/maxi-dresses/black/long"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Mela London, Maxi dresses, black, Long" on "pspPage"
  And I should validate "products" exist on "pspPage"


@automated @DEBD-739 @DEBD-656
Scenario: Validate price filter on psp page
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  And I "validate & click" subFilter option "€55 and over" under "Price" on commonPage bigscreen
  Then I should see "url" contains "price%3E55.0"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Maxi dresses, €55 and over" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I click on "priceFilter" on "pspPage"
  And I scroll to "filterFromPrice" within filters
  And I enter "10" in "filterFromPrice" on "pspPage"
  And I enter "40" in "filterToPrice" on "pspPage"
  And I click on "filterPriceGo" on "pspPage"
  Then I should see "url" contains "price&rlo=10&rhi=40"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "MAXI DRESSES, €10 - 40" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-739 @DEBD-656
Scenario: Validate price filter error cases on psp page
#  Given I navigate to "homeURL"
  Given I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  And I "validate & click" subFilter option "€55 and over" under "Price" on commonPage bigscreen
  Then I should see "url" contains "price%3E55.0"
  And I should see "headerText" contains "Dresses"
  And I should see "pspHeader" as "Maxi dresses, €55 and over" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I click on "priceFilter" on "pspPage"
  And I scroll to "filterFromPrice" within filters
  And I enter "" in "filterFromPrice" on "pspPage"
  And I enter "" in "filterToPrice" on "pspPage"
  And I click on "filterPriceGo" on "pspPage"
  And I should see "filterPriceError" as "Please enter a price range to use this feature." on "pspPage"
  When I enter "100" in "filterFromPrice" on "pspPage"
  And I enter "40" in "filterToPrice" on "pspPage"
  And I click on "filterPriceGo" on "pspPage"
  And I should see "filterPriceError" as "The 'From' price must be lower than the 'To' price." on "pspPage"

@automated @DEBD-739 @DEBD-656
Scenario: Validate multi filter on valid search psp page when applied on Style and categories and length
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  Then I enter "jeans" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "jeans" on "commonPage"
  When I "validate & click" subFilter option "Jeggings" under "Style" on commonPage bigscreen
  Then I should see "url" contains "/search/jeans/jeggings"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "jeans" on "commonPage"
  And I should see "searchTextOnSearchPSP" containing "jeans" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "Women" under "Categories" on commonPage bigscreen
  Then I should see "url" contains "/search/jeans/women/jeggings"
  And I should see "searchResultHeader" containing "Women's clothing & accessories..." on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "jeans" on "commonPage"
  And I should see "searchTextOnSearchPSP" containing "jeans" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-739 @DEBD-656
Scenario: Validate multi filter on incorrect search psp page when applied on brand and style and length
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  Then I enter "dresas" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "dresas" on "commonPage"
  And I should see "searchSuggestText" containing "Did you mean:" on "pspPage"
  When I "validate & click" subFilter option "Maxi dresses" under "Style" on commonPage bigscreen
  Then I should see "url" contains "/search/dresas/maxi-dresses"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "dresas" on "commonPage"
  And I should see "searchSuggestText" containing "Did you mean:" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "18" under "Size" on commonPage bigscreen
  Then I should see "url" contains "%7B18%7D"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "dresas" on "commonPage"
  And I should see "searchSuggestText" containing "Did you mean:" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-739 @DEBD-656
Scenario: Validate multi filter on 0 result psp page when applied on categories and then on beauty TCAT
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  Then I enter "asd" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "asd" on "commonPage"
  When I "validate & click" subFilter option "Beauty" under "Categories" on commonPage bigscreen
  Then I should see "url" contains "/search/asd/beauty"
  When I "validate & click" subFilter option "Skin care" under "Categories" on commonPage bigscreen
  Then I should see "url" contains "/search/asd/beauty/skin-care"
  And I should validate "products" exist on "pspPage"

@notAutomated @DEBD-739
Scenario: Validate the search result when user choose Choose 'J by Jasper Conran' under Brand
  When I wait for "4000" milliseconds
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "J by Jasper Conran" on "pspPage"
  Then I should see Page reloads with relevent count of the product
  And I should see "J by Jasper Conran" selected in "filtered Area" on "psp Page"
  And I should see "searchText" as "J by Jasper Conran" on "pspPage"
  And I should see "url" contains "search/Home+sale/j-by-jasper-conran"
  And I "validate & click" option from "filterMenuList" of "categories"  as "filterSubMenuInputList" as "women" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Size"  as "filterSubMenuInputList" as "14" on "pspPage"
  Then I should see Page reloads with relevent count of the product
  And I should see "size-14" is selected in "filtered Area" on "pspPage"
  And I should see  "Size-14" checkbox in "facet" is selected on "pspPage"
  And I click on "closeButton" on "size" in "filtered area" on "pspPage"
  Then I should see Page reloads with relevent count of the product
  And I should not see  "Size-14" checkbox in "facet" is selected on "pspPage"
  Then I should see "headerText" as "Women's clothing & accessories" on "pspPage"
  When I click on "clearAllFilter" on "pspPage"
  Then I should see "url" contains "debenhams.com/women"


@notAutomated @DEBD-739 @DEBD-656
Scenario: Validate multi filter on Beauty brand room page when applied on brand and colour and length
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "10% off Kat Von D" under "Beauty" on commonPage bigscreen
  And I "validate & click" subFilter option "Make up" under "Categories" on commonPage bigscreen
  Then I should see "url" contains "/beauty/make-up/kat-von-d"
  And I should see "headerText" as "Makeup" on "pspPage"
  And I should see "searchText" as "Kat Von D" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I "validate & click" subFilter option "Everlasting" under "Collection" on commonPage bigscreen
  Then I should see "url" contains "/beauty/make-up/kat-von-d/everlasting"
  And I should see "headerText" as "Makeup" on "pspPage"
  And I should see "searchText" as "Kat Von D, Everlasting" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I "validate & click" subFilter option "10th Anniversary" under "Collection" on commonPage bigscreen
  Then I should see "url" contains "/beauty/make-up/kat-von-d/10th-anniversary:everlasting"
  And I should see "headerText" as "Makeup" on "pspPage"
  And I should see "searchText" as "Kat Von D, 10th Anniversary & Everlasting" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-657 @DEBD-656
Scenario: Validate multi filter on valid search psp page when applied on style and categories and length
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  Then I enter "jeans" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "jeans" on "commonPage"
  When I "validate & click" subFilter option "Skinny jeans" under "Style" on commonPage bigscreen
  Then I should see "url" contains "/search/jeans/skinny-jeans"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "jeans" on "commonPage"
  And I should see "searchTextOnSearchPSP" containing "jeans" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "Women" under "Categories" on commonPage bigscreen
  Then I should see "url" contains "/search/jeans/women/skinny-jeans"
  And I should see "searchResultHeader" containing "Women's clothing & accessories..." on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "jeans" on "commonPage"
  And I should see "searchTextOnSearchPSP" containing "jeans" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-657 @DEBD-656
Scenario: Validate multi filter on incorrect search psp page when applied on brand and style and length
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  Then I enter "dresas" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "dresas" on "commonPage"
  And I should see "searchSuggestText" containing "Did you mean:" on "pspPage"
  When I "validate & click" subFilter option "Evening" under "Occasion" on commonPage bigscreen
  Then I should see "url" contains "/search/dresas/evening"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "dresas" on "commonPage"
  And I should see "searchSuggestText" containing "Did you mean:" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "Lace dresses" under "Style" on commonPage bigscreen
  Then I should see "url" contains "/search/dresas/lace-dresses/evening"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "dresas" on "commonPage"
  And I should see "searchSuggestText" containing "Did you mean:" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-657 @DEBD-656
Scenario: Validate multi filter on 0 result psp page when applied on categories and then on beauty TCAT
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  Then I enter "asd" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "asd" on "commonPage"
  When I "validate & click" subFilter option "Beauty" under "Categories" on commonPage bigscreen
  Then I should see "url" contains "/beauty"
  And I wait for "7000" milliseconds
  When I "validate & click" subFilter option "Make up" under "Categories" on commonPage bigscreen
  Then I should see "url" contains "/beauty/make-up"
  And I should validate "products" exist on "pspPage"

@automated @DBED-738
Scenario: Validate searchbox under Brand facet on TCAT page and navigation to the selected brand filter
  Given I navigate to "homeURL"
  When I "validate & click" menu option "Women" on commonPage bigscreen
  Then I should see "pspHeaderText" as "Women's clothing & accessories" on "pspPage"
  And I should see "url" contains "/women"
  When I "validate & click" subFilter option "View all Brands" under "Brand" on commonPage bigscreen
  Then I should see "searchPanel" exist on "pspPage"
  When I enter "Mela London" in "searchPanel" on "pspPage"
  And I "validate & click" subFilter option "Mela London" under "Brand" on commonPage bigscreen
  Then I should see "url" contains "/women/mela-london"
  And I should see "headerText" containing "Women's clothing & accessories" on "pspPage"
  And I should see "pspHeader" as "Mela London" on "pspPage"
  And I should validate "products" exist on "pspPage"

@notAutomated @DBED-738 @DBED-732
Scenario: Validate searchbox under Brand facet on SCAT page and navigation to the selected brand filter
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "All living room furniture" under "Furniture" on commonPage bigscreen
  Then I should see "headerText" as "Living room furniture" on "pspPage"
  And I should see "url" contains "/furniture/living-room"
  And I should not see "filteredByOptions" on "pspPage"
  And I should not see "clearAllFiltersLink" on "pspPage"
  When I "validate & click" subFilter option "Sofas & chairs" under "Categories" on commonPage bigscreen
  Then I should see "url" contains "/content/sofas"
  And I should see "headerText" as "Sofas and Armchairs" on "pspPage"
