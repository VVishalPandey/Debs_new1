Feature: Test Debenhams search page

@manual @DBMTE-133
Scenario: Validate the search page (portrait)

@manual @DBMTE-133
Scenario: Validate the auto suggest for the input search text on Home page (portrait)

@manual @DBMTE-133
Scenario: Validate the auto suggest for the input search text on My saved items page (portrait)

@manual @DBMTE-133
Scenario: Validate the auto suggest for the input search text on My bag page (portrait)

@manual @DBMTE-133
Scenario: Validate the search page (landscape)

@manual @DBMTE-133
Scenario: Validate the auto suggest for the input search page (landscape)

@manual @DBMTE-133
Scenario: Validate the auto suggest for the input search text on My saved items page (landscape)

@manual @DBMTE-133
Scenario: Validate the auto suggest for the input search text on My bag page (landscape)


@automated @Fixed
Scenario Outline: Validate that the search bar should be blanked out when user presses the clear 'x' CTA after entering a valid search term
    Given I navigate to "homeURL"
    Then I should see "searchIcon" exist on "commonPage"
	When I click on "searchIcon" on "commonPage"
	Then I enter "<searchTerm>" in "searchField" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I should see "searchResultHeader" containing "Search results for" on "commonPage"
    And I should see "searchResultHeaderSearchTerm" containing "<searchTerm>" on "commonPage"
    And I should see "url" contains "<url>"

    Examples:
    | searchTerm | url              |
    | Dresses    | search/Dresses   |
    | Shirts     | search/Shirts    |
    | Skirts     | search/Skirts    |

@automated @Fixed
Scenario Outline: Validate that the special characters should be removed from the search result when user have entered a search term with special characters
    Then I should see "searchIcon" exist on "commonPage"
	When I click on "searchIcon" on "commonPage"
	Then I enter "<searchTerm>" in "searchField" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I should see "searchResultHeader" containing "Search results for" on "commonPage"
    And I should see "searchResultHeaderSearchTerm" containing "<ExpectedSearchTerm>" on "commonPage"
    And I should see "url" contains "<url>"

Examples:
    | searchTerm      | ExpectedSearchTerm | url                 |
    | Men's Dresses   | Mens Dresses       | search/Mens+Dresses |

@automated @Fixed
Scenario: Validate that the user should not see any auto-suggestion items when user searches for a Chanel product
	Given I logout
    Then I should see "searchIcon" exist on "commonPage"
	When I click on "searchIcon" on "commonPage"
	And  I enter "chanel" in "searchField" on "commonPage"
	Then I should not see "autoSuggestions" on "commonPage"
	# Then I should see "autoSuggestions" containing "chanel" on "commonPage"
	When I click on "searchApply" on "commonPage"
	And I should see "url" contains "content/chanel"

@automated @Fixed
Scenario: Validate that user lands on SCAT if search for Home Sale
    When I click on "searchIcon" on "commonPage"
    And I enter "Home sale" in "searchField" on "commonPage"
	And I click on "searchApply" on "commonPage"
	Then I should see "headerText" as "Home" on "pspPage"
	And I should see "url" contains "sale/home"

@automated @Fixed
Scenario: Validate that user lands on brand room if search for Kat Von D
    When I click on "searchIcon" on "commonPage"
	And I enter "Kat Von D" in "searchField" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I wait for "3000" milliseconds
	Then I should see "headerText" as "Kat Von D" on "pspPage"
	And I should see "url" contains "beauty/kat-von-d"

@automated @Fixed
Scenario: Validate the search result psp page when user search for MAC
    When I click on "searchIcon" on "commonPage"
	And I enter "MAC" in "searchField" on "commonPage"
	And I click on "searchApply" on "commonPage"
	Then I should see "searchText" as "Search results for..." on "pspPage"
	And I should see "headerText" containing "MAC" on "pspPage"
	And I should see "url" contains "MAC"
    And I should see "productNumber" exist on "pspPage"
    And I should not see "seoContent" on "pspPage"
	And I should not see "pspSlimBanner" on "pspPage"
	And I should not see "merchSetProducts" on "pspPage"
	And I should not see "filteredByOptions" on "pspPage"
	

@automated @Fixed
Scenario: Validate that user lands on SCAT if search for Women sale
	Given I logout
    When I click on "searchIcon" on "commonPage"
	And I enter "Women sale" in "searchField" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I wait for "2000" milliseconds
	Then I should see "headerText" as "Women's sale" on "pspPage"
	And I should see "url" contains "sale/women"    
