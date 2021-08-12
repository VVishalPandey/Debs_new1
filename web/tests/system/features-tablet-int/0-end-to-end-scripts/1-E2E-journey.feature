Feature: Test Debenhams end to end journey number 1

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to homepage with a signout out user and validate the search icon with field and apply button
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I should see "searchIcon" exist on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I should see "searchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  And I enter "Home sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as ""Home sale"" on "pspPage"
  And I should see "url" contains "search/Home+sale"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user choose Choose 'J by Jasper Conran' under Brand
  And I should see "filterButton" exist on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Debenhams" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as ""Home sale"" on "pspPage"
  And I should see "filterText" as "Debenhams" on "pspPage"
  And I should see "url" contains "search/Home+sale/debenhams#filter"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on PSP if search for Faith
  When I click on "searchIcon" on "commonPage"
  And I enter "Faith" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as ""FAITH"" on "pspPage"
  And I should see "url" contains "search/Faith"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user selected designers under Categories on brand room of Faith
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Categories" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Categories"  as "filterSubMenuLinkList" as "Sale" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as ""FAITH"" on "pspPage"
  And I should see "url" contains "/search/Faith/sale#filter"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Women sale
  When I click on "searchIcon" on "commonPage"
  And I enter "Women sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as ""WOMEN SALE"" on "pspPage"
  And I should see "url" contains "search/Women+sale"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user choose Occasion & evening wear under Categories
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Categories" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Categories"  as "filterSubMenuLinkList" as "Women" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Categories" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Categories"  as "filterSubMenuLinkList" as "Dresses" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as ""WOMEN SALE"" on "pspPage"
  And I should see "url" contains "search/Women+sale/women/dresses#filter"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result psp page when user apply filter Brand - The Collection
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  #And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewList" as "View" on "pspPage"
  #And I wait for "3000" milliseconds
  #Then I should see "searchPanel" exist on "pspPage"
  #When I am in view of "searchPanel" on "pspPage"
  #And I enter "Debut" in "searchPanel" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Debut" on "pspPage"
  #Then I should see value as "Debut" in position "1" in filter search result under parentfilter "3"
  #When I click on "Debut" in position "1" in filter search result under parentfilter "3"
  And I click on "closeButton" on "pspPage"
  Then I should see "headerText" as ""Women sale"" on "pspPage"
  And I should see "searchText" as "Dresses..." on "pspPage"
  And I should see "filterText" as "Debut" on "pspPage"
  And I should see "url" contains "sale/women/dresses/debut"
