Feature: Validate search terms to persist & be edited on Search results pages

@manual @DEBD-3888
Scenario: Validate Search PSP is displayed along with the search term in the search bar
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  And I enter "dress" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "searchText" as "Search results for..." on "pspPage"
  And I should see "headerText" containing "dress" on "pspPage"
  When I click on "searchBar" on "commonPage"
  And I should see "dress" in "searchBar" on "commonPage"

@manual @DEBD-3888
Scenario: Validate Search term is not shown in the search bar when searched for a Brand
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  And I enter "Chanel" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "headerText" containing "Chanel" on "pspPage"
  When I click on "searchBar" on "commonPage"
  And I should not see "Chanel" in "searchBar" on "commonPage"

@manual @DEBD-3888
Scenario: Validate Search term is shown in the search bar when user lands on No search result page
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  Then I enter "hjsfdsdfs" in "searchField" on "commonPage"
  And I should see "clearXCTA" exist on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "searchText" contains "Search results for..."
  Then I should see "headerText" contains "hjsfdsdfs"
  And I should see "url" contains "search/hjsfdsdfs"
  And I should see "noResultsearchtext1" contains "Sorry, no results"
  When I click on "searchBar" on "commonPage"
  And I should not see "hjsfdsdfs" in "searchBar" on "commonPage"

@manual @DEBD-3888
Scenario: Validate Search term changes on applying filters on Search PSP
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  And I enter "dress" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "searchText" as "Search results for..." on "pspPage"
  And I should see "headerText" containing "dress" on "pspPage"
  When I click on "searchBar" on "commonPage"
  And I should see "dress" in "searchBar" on "commonPage"
  When I "validate & click" subFilter option "Women" under "Categories" on commonPage bigscreen
  When I click on "searchBar" on "commonPage"
  And I should see "Women dress" in "searchBar" on "commonPage"

@manual @DEBD-3888
Scenario: Validate Search term can be amended
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  And I enter "dress" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "searchText" as "Search results for..." on "pspPage"
  And I should see "headerText" containing "dress" on "pspPage"
  When I click on "searchBar" on "commonPage"
  And I should see "dress" in "searchBar" on "commonPage"
  And I enter "dresses" in "searchBar" on "commonPage"
  And I should see "dresses" in "searchBar" on "commonPage"

@manual @DEBD-3888
Scenario: Validate Search term is not shown on Mobile
  Given I navigate to "homeURL"
  When I click on "searchBar" on "commonPage"
  And I enter "dress" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "searchText" as "Search results for..." on "pspPage"
  And I should see "headerText" containing "dress" on "pspPage"
  When I click on "searchBar" on "commonPage"
  And I should not see "dress" in "searchBar" on "commonPage"