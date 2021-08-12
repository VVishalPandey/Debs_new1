Feature: Validate search psp Page

@automated @Fixed @DEBD-766
Scenario: Validate the search result psp page when user search for misspelled text
    Given I navigate to "homeURL"
	When I click on "searchBar" on "commonPage"
	And I enter "redr" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	Then I should see "searchText" as "Search results for..." on "pspPage"
	And I should see "headerText" containing "redr" on "pspPage"
	And I should see "url" contains "/search/redr"
	And I should see "searchSuggestText" contains "Did you mean:"
	And I should see "searchSuggestText" contains "? See our selection below for"
	And I should see "searchSuggestText" contains "or try searching again."
	And I should see "searchSuggestText" contains "red"
	And I should validate "products" exist on "pspPage"
	And I should see "sortDropdown" exist on "pspPage"
	And I should see "filterSection" exist on "pspPage"
	And I should see "nextButton" exist on "pspPage"
	And I should see "pageNumberText" exist on "pspPage"
	#And I should see "totalCountOfProducts" exist on "pspPage"
	And I should not see "seoContent" on "pspPage"
	And I should not see "pspSlimBanner" on "pspPage"
	And I should not see "merchSetProducts" on "pspPage"
	And I should not see "filteredByOptions" on "pspPage"
	And I should see "secondBreadcrumb" as "redr" on "pspPage"

@automated @Fixed @DEBD-265
Scenario Outline: Navigate to Debenhams search towel psp page and validate sort by Best selling and Relevance
	When I click on "searchBar" on "commonPage"
	Then I enter "<searchTerm>" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I should see "searchText" containing "Search results for" on "pspPage"
	And I should see "headerText" containing "<searchTerm>" on "pspPage"
	When I should scroll to "sortDropdown" on "pspPage"
	When I click on "sortOptionBestSelling" on "pspPage"
	Then I should see "url" contains "sid=*product_availability%2C-units_sold"
	And I should see "filterSection" exist on "pspPage"
	And I should see "paginationSectionHeader" exist on "pspPage"
	And I should see "paginationSectionFooter" exist on "pspPage"
	And I should see "sortDropdown" exist on "pspPage"
	When I should scroll to "subscribeToNewsletter" on "commonPage"
	And I should count and validate "imagesOnScreen" on "pspPage"
	When I should scroll to "sortDropdown" on "pspPage"
	When I click on "sortOptionRelevanceDefault" on "pspPage"
	And I click on "headerText" on "pspPage"
	Then I should see "url" contains "sid=*Newest"
	And I should see "filterSection" exist on "pspPage"
	And I should see "paginationSectionHeader" exist on "pspPage"
	And I should see "paginationSectionFooter" exist on "pspPage"
	And I should see "sortDropdown" exist on "pspPage"
	When I should scroll to "subscribeToNewsletter" on "commonPage"
	And I should count and validate "imagesOnScreen" on "pspPage"

    Examples:
    | searchTerm | url         |
    | towel     | search/towel |
