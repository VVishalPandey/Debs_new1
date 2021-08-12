Feature: Test Debenhams end to end journey number 1 - Search

@automatedSanity @preprodSanity @e2e
Scenario: Set the mobify cookie & navigate to homepage with a signout out user and validate the search icon with field and apply button
  When I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I should see "searchBar" exist on "commonPage"
  When I click on "searchBar" on "commonPage"
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
  Then I click on "filterButton" on "pspPage"
  When I "validate & click" subFilter option "Debenhams" under "Brand" on commonPage bigscreen
  And I should see "headerText" containing ""Home sale"" on "pspPage"
  And I should see "url" contains "search/Home+sale/debenhams#filter"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on PSP if search for Faith
  When I click on "searchBar" on "commonPage"
  And I enter "Faith" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as ""FAITH"" on "pspPage"
  And I should see "url" contains "search/Faith"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user selected designers under Categories on brand room of Faith
  Then I click on "filterButton" on "pspPage"
  When I "validate & click" subFilter option "Sale" under "Categories" on commonPage bigscreen
  And I should see "headerText" containing ""FAITH"" on "pspPage"
  And I should see "url" contains "/search/Faith/sale#filter"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Women sale
  When I click on "searchBar" on "commonPage"
  And I enter "Women sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as ""WOMEN SALE"" on "pspPage"
  And I should see "url" contains "search/Women+sale"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user choose Dresses under Categories
  When I "validate & click" subFilter option "Women" under "Categories" on commonPage bigscreen
  And I "validate & click" subFilter option "Dresses" under "Categories" on commonPage bigscreen
  And I should see "headerText" containing ""Women sale"" on "pspPage"
  And I should see "url" contains "search/Women+sale/women/dresses#filter"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result psp page when user apply filter Brand - Principles
  When I "validate & click" subFilter option "Principles" under "Brand" on commonPage bigscreen
  And I should see "headerText" containing ""WOMEN SALE"" on "pspPage"
  And I should see "searchText" as "Dresses..." on "pspPage"
  And I should see "url" contains "search/Women+sale/women/dresses/principles#filter"
