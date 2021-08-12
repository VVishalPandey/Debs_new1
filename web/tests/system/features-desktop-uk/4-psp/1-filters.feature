Feature: Test Debenhams psp filters

@manual @DBED-563 @DEBD-661 @awsManual
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

@manual @DBED-660 @awsManual
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

@manual @DBED-660 @DEBD-672 @awsManual
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
  Then I "validate" the loader should appear

  Examples:
      | L2Category                | L1Category   | headerText             | urlcontains             |
      | All living room furniture | Furniture    | Living room furniture  | furniture/living-room   |
      | All bedroom furniture     | Furniture    | Bedroom furniture      | furniture/bedroom       |

@automated @Fixed @DBED-663
Scenario: Navigate to the Debenhams PSP page and validate brand facet
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Maxi dresses" on "pspPage"
  When I "validate & click" subFilter option "View all Brands" under "Brand" on commonPage bigscreen
  Then I should see "searchPanel" exist on "pspPage"
  When I "validate & click" subFilter option "View less Brands" under "Brand" on commonPage bigscreen
  Then I should not see "searchPanel" on "pspPage"
  And I "validate" subFilter option "View all Brands" under "Brand" on commonPage bigscreen

@automated @Fixed @DEBD-661
Scenario: Validate remove all applied filter on PSP page so that user is navigated to TCAT page
  When I "validate & remove" the applied filter "Dresses" on commonPage bigscreen
  Then I should see "url" contains "/women/maxi-dresses"
  And I should see "headerText" containing "Women's clothing & accessories" on "pspPage"
  And I should see "pspHeader" as "Maxi dresses" on "pspPage"
  When I "validate & remove" the applied filter "Maxi dresses" on commonPage bigscreen
  Then I should see "url" contains "/women"
  And I should see "tcatHeaderText" as "WOMEN’S CLOTHING" on "pspPage"
  And I should not see "filteredByOptions" on "pspPage"
  And I should not see "clearAllFiltersLink" on "pspPage"

@automated @Fixed @DBED-661
Scenario: validate clear all filters link should navigate user to TCAt page from PSP page
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Maxi dresses" on "pspPage"
  When I click on "clearAllFiltersLink" on "pspPage"
  Then I should see "url" contains "/women"
  And I should see "tcatHeaderText" as "Women’s Clothing" on "pspPage"
  And I should not see "filteredByOptions" on "pspPage"
  And I should not see "clearAllFiltersLink" on "pspPage"

@automated @Fixed @DBED-663
Scenario: Navigate to the Debenhams TCAT page and validate brand facet
  Given I navigate to "homeURL"
  When I "validate & click" menu option "Women" on commonPage bigscreen
  Then I should see "tcatHeaderText" as "WOMEN’S CLOTHING" on "pspPage"
  And I should see "url" contains "/women"
  When I "validate & click" subFilter option "View all Brands" under "Brand" on commonPage bigscreen
  Then I should see "searchPanel" exist on "pspPage"
  When I "validate & click" subFilter option "View less Brands" under "Brand" on commonPage bigscreen
  Then I should not see "searchPanel" on "pspPage"
  And I "validate" subFilter option "View all Brands" under "Brand" on commonPage bigscreen

@automated @Fixed @DBED-663 @DEBD-657
Scenario:validate searchbox under Brand facet
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Maxi dresses" on "pspPage"
  When I "validate & click" subFilter option "View all Brands" under "Brand" on commonPage bigscreen
  Then I should see "searchPanel" exist on "pspPage"
  When I enter "Dorothy Perkins" in "searchPanel" on "pspPage"
  And I "validate & click" subFilter option "Dorothy Perkins" under "Brand" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/dorothy-perkins/maxi-dresses"
  And I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "pspHeader" as "Dorothy Perkins, Maxi dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @Fixed @DEBD-657 @DEBD-656 @DEBD-663
Scenario: Validate multi filter on PSP page when applied on brand and colour and length
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  And I "validate & click" subFilter option "Long" under "Length" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/maxi-dresses/long"
  And I should see "headerText" as "Dresses" on "pspPage"
  And I should see "pspHeader" as "Maxi dresses, Long" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "Black" under "Colour" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/maxi-dresses/black/long"
  And I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "pspHeader" as "Maxi dresses, black, Long" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "Dorothy Perkins" under "Brand" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/dorothy-perkins/maxi-dresses/black/long"
  And I should see "headerText" as "Dresses" on "pspPage"
  And I should see "pspHeader" as "Dorothy Perkins, Maxi dresses, black, Long" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @Fixed @DEBD-661
Scenario: Validate remove applied filter on PSP page from above scenario
  When I "validate & remove" the applied filter "Long" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/dorothy-perkins/maxi-dresses/black"
  And I should see "headerText" as "Dresses" on "pspPage"
  And I should see "pspHeader" as "Dorothy Perkins, Maxi dresses, black" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I "validate & remove" the applied filter "Maxi dresses" on commonPage bigscreen
  Then I should see "url" contains "/women/dresses/dorothy-perkins/black"
  And I should see "headerText" as "Dresses" on "pspPage"
  And I should see "pspHeader" as "Dorothy Perkins, black" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DEBD-657 @DEBD-656
Scenario: Validate price filter on psp page
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  And I "validate & click" subFilter option "£50 and over" under "Price" on commonPage bigscreen
  Then I should see "url" contains "price%3E50.0"
  And I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "pspHeader" as "Maxi dresses, £50 and over" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I click on "priceFilter" on "pspPage"
  When I scroll to "filterFromPrice" within filters
  And I enter "10" in "filterFromPrice" on "pspPage"
  And I enter "40" in "filterToPrice" on "pspPage"
  And I click on "filterPriceGo" on "pspPage"
  And I wait for "2000" milliseconds
  Then I should see "url" contains "price&rlo=10&rhi=40"
  And I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "pspHeader" as "Maxi dresses, £10 - £40" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @Fixed @DEBD-657 @DEBD-656
Scenario: Validate price filter error cases on psp page
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  And I "validate & click" subFilter option "£50 and over" under "Price" on commonPage bigscreen
  Then I should see "url" contains "price%3E50.0"
  And I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "pspHeader" as "Maxi dresses, £50 and over" on "pspPage"
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
  When I enter "£100" in "From" input box and "£50" in "to" Input boxes
  Then I should see a error message as "The ‘From’ price must be lower than the ‘To’ price"

@notAutomated @DEBD-657 @DEBD-656
Scenario: Validate multi filter on Beauty brand room page when applied on brand and colour and length
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "10% off Kat Von D" under "Beauty" on commonPage bigscreen
  And I "validate & click" subFilter option "Make up" under "Categories" on commonPage bigscreen
  Then I should see "url" contains "/beauty/make-up/kat-von-d"
  And I should see "headerText" as "Makeup" on "pspPage"
  And I should see "pspHeader" as "Kat Von D" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I "validate & click" subFilter option "Everlasting" under "Collection" on commonPage bigscreen
  Then I should see "url" contains "/beauty/make-up/kat-von-d/everlasting"
  And I should see "headerText" as "Makeup" on "pspPage"
  And I should see "pspHeader" as "Kat Von D, Everlasting" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I "validate & click" subFilter option "10th Anniversary" under "Collection" on commonPage bigscreen
  Then I should see "url" contains "/beauty/make-up/kat-von-d/10th-anniversary:everlasting"
  And I should see "headerText" as "Makeup" on "pspPage"
  And I should see "pspHeader" as "Kat Von D, 10th Anniversary & Everlasting" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @Fixed @DEBD-657 @DEBD-656
Scenario: Validate multi filter on valid search psp page when applied on brand and categories and length
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  Then I enter "jeans" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "jeans" on "commonPage"
  When I "validate & click" subFilter option "Dorothy Perkins" under "Brand" on commonPage bigscreen
  Then I should see "url" contains "/search/jeans/dorothy-perkins"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "jeans" on "commonPage"
  And I should see "filterText" as "Dorothy Perkins" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "Women" under "Categories" on commonPage bigscreen
  Then I should see "url" contains "/search/jeans/women/dorothy-perkins"
  And I should see "searchResultHeader" containing "Women's clothing & accessories..." on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "jeans" on "commonPage"
  And I should see "filterText" as "Dorothy Perkins" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @Fixed @DEBD-657 @DEBD-656
Scenario: Validate multi filter on incorrect search psp page when applied on brand and style and length
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  Then I enter "dresas" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "dresas" on "commonPage"
  And I should see "searchSuggestText" containing "Did you mean:" on "pspPage"
  When I "validate & click" subFilter option "Dorothy Perkins" under "Brand" on commonPage bigscreen
  Then I should see "url" contains "/search/dresas/dorothy-perkins"
  And I should see "searchResultHeader" containing "Search results for" on "commonPage"
  And I should see "searchResultHeaderSearchTerm" containing "dresas" on "commonPage"
  And I should see "searchSuggestText" containing "Did you mean:" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I "validate & click" subFilter option "Casual dresses" under "Style" on commonPage bigscreen
  Then I should see "url" contains "search/dresas/dorothy-perkins/casual-dresses#filter"
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
  And I should see "tcatHeaderText" as "Beauty" on "pspPage"
  When I "validate & click" subFilter option "Skin care" under "Categories" on commonPage bigscreen
  Then I should see "url" contains "/beauty/skin-care"
  And I should see "headerText" as "Skin Care" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DBED-660
Scenario: Validate searchbox under Brand facet on TCAT page and navigation to the selected brand filter
  Given I navigate to "homeURL"
  When I "validate & click" menu option "Women" on commonPage bigscreen
  Then I should see "tcatHeaderText" as "Women’s Clothing" on "pspPage"
  And I should see "url" contains "/women"
  When I "validate & click" subFilter option "View all Brands" under "Brand" on commonPage bigscreen
  Then I should see "searchPanel" exist on "pspPage"
  When I enter "Dorothy Perkins" in "searchPanel" on "pspPage"
  And I "validate & click" subFilter option "Dorothy Perkins" under "Brand" on commonPage bigscreen
  Then I should see "url" contains "/women/dorothy-perkins"
  And I should see "headerText" as "Women's clothing & accessories" on "pspPage"
  And I should see "pspHeader" as "Dorothy Perkins" on "pspPage"
  And I should validate "products" exist on "pspPage"

@notAutomated @DBED-660 @DBED-661
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

