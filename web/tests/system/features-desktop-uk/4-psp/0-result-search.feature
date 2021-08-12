Feature: Validation of the 0 result search PSP

  @automated @Fixed @DEBD-662 
  Scenario: Navigate to Debenhams home page >SearchPage>searched for a term that has no products or no similar products
    Given I navigate to "homeURL"
    Then I should see "searchIcon" exist on "commonPage"
    When I click on "searchBar" on "commonPage"
    Then I enter "hjsfdsdfs" in "searchField" on "commonPage"
    And I should see "clearXCTA" exist on "commonPage"
    And I click on "searchApply" on "commonPage"
    Then I should see "searchText" contains "Search results for..."
    Then I should see "headerText" contains "hjsfdsdfs"
    And I should see "url" contains "search/hjsfdsdfs"
    And I should see "noResultsearchtext1" contains "Sorry, no results"
    And I should see "noResultsearchtext2" contains "We're afraid the search you asked us to perform for "
    And I should see "noResultsearchtext2" contains " hasn't delivered any results."
    And I should see "noResultsearchtext3" contains "We're really sorry but we don't think you're going to find this item using these terms"
    And I should see "noResultsearchtext4" contains "Try a new search or remove some filters"
    And I should not see "products" on "pspPage"
    And I should see "filterMenuList" exist on "pspPage"
    And I "validate" filter option "Categories" on commonPage bigscreen
    And I "validate" filter option "Brand" on commonPage bigscreen
    And I "validate" filter option "Price" on commonPage bigscreen
    And I should see "breadcrumbSection" exist on "pspPage"
    And I should not see "sortBy" on "pspPage"
    And I should not see "pagination" on "pspPage"
    And I should not see "filteredBy" on "pspPage"
    When I click on "noResultsearchField" on "pspPage"
    Then I enter "dresses" in "noResultsearchField" on "pspPage"
    And I click on "noResultsearchApply" on "pspPage"
    Then I should see "headerText" contains "dresses"

  @notautomated @DEBD-662  @awsManual
  Scenario: Navigate to Debenhams PSP page and validate the 0 search result page
    Given I naviage to "PSP Page"
    Then I "validate & click" option is available in "filterMenuList" as "Price" on "pspPage"
    And I enter "£1000" in "From" input box and "£5000" in "to" Input boxes
    Then I should see product count as 0
    And I should see the "0 message" container
    And I should see "0 message" container containing message "We're afraid the search"
    And I should see "search field" inside the container
    And I should see the "search button"
