Feature: Validation of the search functionality

@manual @DEBD-196 @awsManual
Scenario: Navigate to homepage and validate the search bar
	Given I logout
	Then I should see "searchBar" exist on "commonPage"
	And I should see "Search..." copy text in the "searchBar"
	And I should see Grey bottom border in the "searchBar"
	And I should see teal magnifying glass in the "searchBar"
	When I click on "searchBar" on "commonPage"
	Then I should see the bottom border of the component will turn from grey to teal of the "searchBar" on "commonPage"
	Then  I should see the "searchBar" should slightly increase in width

@automated @DEBD-196 @Fixed
Scenario: Enter a character in the search bar and validate that a clear 'x' CTA is displayed
	Given I logout
	Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "a" in "searchBar" on "commonPage"
	Then I should see "clearXCTA" exist on "commonPage"


@manual @DEBD-196 @DEBD-341 @awsManual
Scenario Outline: Validate that the autosearch is working when user tries to enter three characters in the serachbar
	Given I logout
    Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "a" in "searchBar" on "commonPage"
	Then I should not see "autoSuggestions" on "commonPage"
	And I click on "clearXCTA" on "commonPage"
	And  I enter "<TwoLetterTerm>" in "searchBar" on "commonPage"
	Then I should not see "autoSuggestions" on "commonPage"
	And I click on "clearXCTA" on "commonPage"
	And  I enter "<ThreeLetterTerm>" in "searchBar" on "commonPage"
    Then I should see ten "auto-suggestions" in a drop down container on "commonPage"
	And I should see the "auto-suggestions" should rank by number of products with highest number of products at the top
	And I should see the "clearXCTA" in the "searchBar" on "commonPage"
	And I should not see the "auto-suggestions" by department
	And I should be able to interact with the page behind it
	When I click out of the area of "auto-suggestions" on "commonPage"
	Then I should see the "auto-suggestions" container closed
	And I should see the "searchTerm" retained in the "searchBar" on "commonPage"
	When I refresh the existing page
	And I should see the "searchTerm" not retained in the "searchBar" on "commonPage"
	When I click on "searchBar" on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter a valid "searchTerm" in the "searchBar" on "commonPage"
	Then I should see the "auto-suggestions" on "commonPage"
	When I navigate to a new page
	Then I should see the "searchTerm" not retained in the "searchBar" on "commonPage"

Examples:
    | searchTerm |
    | Dresses    |
    | Shirts     |
    | Skirts     |


@manual @DEBD-196 @awsManual
Scenario Outline: Validate that the selected search result should be shaded in grey when user hover over or tab/arrow through the search term results
	Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "<searchTerm>" in "searchBar" on "commonPage"
	Then I should see "autoSuggestions" on "commonPage"
	When I hover over the "autoSuggestions" on "commonPage"
	Then I should see the selected "autoSuggestions" should be shaded in grey on "commonPage"
	When I tab over the "autoSuggestions" on "commonPage"
	Then I should see the selected "autoSuggestions" should be shaded in grey on "commonPage"
	When I arrow over the "autoSuggestions" on "commonPage"
	Then I should see the selected "autoSuggestions" should be shaded in grey on "commonPage"
	When I click on one of the "autoSuggestions" on "commonPage"
	Then I should be taken to the relevant page

Examples:
    | searchTerm |
    | Dresses    |
    | Shirts     |
    | Skirts     |


@manual @DEBD-196
Scenario Outline: Validate that user should see auto-suggestions based on my search input and the number of results for each suggested search up until I delete the final character
	Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "<searchTerm>" in "searchBar" on "commonPage"
	When I delete the characters from the "searchBar" on "commonPage"
	Then I should see the "autoSuggestions" based on my search input and the number of results for each suggested search on "commonPage"
	When I delete the last character from the "searchBar" on "commonPage"
	Then I should not see the "autoSuggestions" on "commonPage"

Examples:
    | searchTerm |
    | Dresses    |
    | Shirts     |
    | Skirts     |


@manual @DEBD-196
Scenario Outline: Validate that user should see same auto-suggestions when I delete all the characters from the search bar and type the same first character as previous search term
	Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	Then I enter "<searchTerm>" in "searchBar" on "commonPage"
	Then I should see the "searchResult" on "commonPage"
	When I delete few characters from the "searchBar" on "commonPage"
	Then I should see the "auto-suggestions" based on my search input and the number of results for each suggested search on "commonPage"
	When I delete all characters from the "searchBar" on "commonPage"
	Then I should not see the "auto-suggestions" on "commonPage"
	Then I enter the same first character as my previous "searchTerm" in the "searchBar" on "commonPage"
Examples:
    | searchTerm |
    | Dresses    |
    | Shirts     |
    | Skirts     |

@automated @DEBD-196 @Fixed
Scenario Outline: Validate that the search bar should be blanked out when user presses the clear 'x' CTA after entering a valid search term
    Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	Then I enter "<searchTerm>" in "searchBar" on "commonPage"
	And I click on "clearXCTA" on "commonPage"
	Then I should see value of "searchBar" as "" on "commonPage"
	Then I enter "<searchTerm>" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I should see "searchResultHeader" containing "Search results for" on "commonPage"
    And I should see "searchResultHeaderSearchTerm" containing "<searchTerm>" on "commonPage"
    And I should see "url" contains "<url>"

    Examples:
    | searchTerm | url              |
    | Dresses    | search/Dresses   |
    | Shirts     | search/Shirts    |
    | Skirts     | search/Skirts    |

@automated @DEBD-196 @Fixed
Scenario Outline: Validate that the special characters should be removed from the search result when user have entered a search term with special characters
    Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "<searchTerm>" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I should see "searchResultHeader" containing "Search results for" on "commonPage"
    And I should see "searchResultHeaderSearchTerm" containing "<ExpectedSearchTerm>" on "commonPage"
    And I should see "url" contains "<url>"

Examples:
    | searchTerm    | ExpectedSearchTerm | url                 |
    | Men's Dresses   | Mens Dresses     | search/Mens+Dresses |

@automated @DEBD-196 @Fixed
Scenario: Validate that the user should not see any auto-suggestion items when user searches for a Chanel product
	Given I logout
    Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "chanel" in "searchBar" on "commonPage"
	Then I should not see "autoSuggestions" on "commonPage"
	# Then I should see "autoSuggestions" containing "chanel" on "commonPage"
	When I click on "searchApply" on "commonPage"
	And I should see "url" contains "content/chanel"

@automated @DEBD-196 @Fixed
Scenario: Validate that user lands on SCAT if search for Home Sale
    When I click on "searchBar" on "commonPage"
    And I enter "Home sale" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	Then I should see "headerText" as "Home" on "pspPage"
	And I should see "url" contains "sale/home"

@automated @DEBD-196 @Fixed
Scenario: Validate that user lands on brand room if search for Kat Von D
    When I click on "searchBar" on "commonPage"
	And I enter "Kat Von D" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I wait for "2000" milliseconds
	Then I should see "headerText" as "Kat Von D" on "pspPage"
	And I should see "url" contains "beauty/kat-von-d"

@automated @DEBD-196 @DEBD-766 @Fixed
Scenario: Validate the search result psp page when user search for MAC
    When I click on "searchBar" on "commonPage"
	And I enter "MAC" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	Then I should see "searchText" as "Search results for..." on "pspPage"
	And I should see "headerText" containing "MAC" on "pspPage"
	And I should see "url" contains "MAC"
    And I should see "productNumber" exist on "pspPage"
    And I should not see "seoContent" on "pspPage"
	And I should not see "pspSlimBanner" on "pspPage"
	And I should not see "merchSetProducts" on "pspPage"
	And I should not see "filteredByOptions" on "pspPage"
	And I should see "secondBreadcrumb" as "MAC" on "pspPage"

@automated @DEBD-196 @Fixed
Scenario: Validate that user lands on SCAT if search for Women sale
	Given I logout
    When I click on "searchBar" on "commonPage"
	And I enter "Women sale" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I wait for "2000" milliseconds
	Then I should see "headerText" as "Women's sale" on "pspPage"
	And I should see "url" contains "sale/women"


@automated @Fixed
Scenario: Validate that user lands on SCAT if search for hats using autodepartment
When I click on "searchIcon" on "commonPage"
And I enter "Hats" in "searchField" on "commonPage"
Then I select the auto search department as "hats"
Then I should see "headerText" as ""hats"" on "pspPage"
And I should see "url" contains "search/hats"