Feature: Validation of the search functionality

@manual @DEBD-196
Scenario: Navigate to homepage and validate the search bar
	Given I logout
	Then I should see "searchBar" exist on "commonPage"
	And I should see "Search..." copy text in the "searchBar"
	And I should see Grey bottom border in the "searchBar"
	And I should see teal magnifying glass in the "searchBar"
	When I click on "searchBar" on "commonPage"
	Then I should see the bottom border of the component will turn from grey to teal of the "searchBar" on "commonPage"
	Then  I should see the "searchBar" should slightly increase in width

@notAutomated @DEBD-196
Scenario: Enter a character in the search bar and validate that a clear 'x' CTA is displayed
	Then I should see "searchBar" exist on "commonPage"
	And my cursor is in the "searchBar" on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "a" in "searchBar" on "commonPage"
	Then I should see the "clearXCTA" in the "searchBar" on "commonPage"

@automated @DEBD-580 @DEBD-582 @IssueAutoSuggestion @Fixed
Scenario Outline: Validate that the autosearch is working when user tries to enter three characters in the serachbar
	Given I navigate to "homeURL"
	Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	When I enter "<character1>" in "searchBar" on "commonPage"
	And I should not see "autoSuggestions" on "commonPage"
	When I enter "<character2>" in "searchBar" on "commonPage"
	And I should not see "autoSuggestions" on "commonPage"
	When I enter "<character3>" in "searchBar" on "commonPage"
	And I should see "autoSuggestions" containing "<ExpectedSearchTerm>" on "commonPage"
	And I count number of "autoSuggestions" to be "<max_count>" on "commonPage"
	Then I should see "clearXCTA" exist on "commonPage"
	When I click on "clickOutsideSugeestionBox" on "commonPage"
	And I verify "value" of "searchBar" as "emptySeachBarValue" on "commonPage"
	When I enter "<ExpectedSearchTerm>" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I should see "url" contains "<url>"
	And I verify "value" of "searchBar" as "emptySeachBarValue" on "commonPage"

	  Examples:
    | character1 |character2|character3|max_count |ExpectedSearchTerm|url           |
    | d          |dr         |dre      |10        |dresses           |search/dresses|


@notAutomated @DEBD-580 @DEBD-582
Scenario Outline: Validate ranking and highest number of products in autoSuggestions dropdown
	Given I navigate to "homeURL"
	Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	When I enter "<character3>" in "searchBar" on "commonPage"
	And I should see "autoSuggestions" containing "<ExpectedSearchTerm>" on "commonPage"
    And I should see the "auto-suggestions" should rank by number of products with highest number of products at the top
	And I should not see the "auto-suggestions" by department

	  Examples:
    |character|ExpectedSearchTerm|
    | dre     |dresses           |

@manual @DEBD-196
Scenario: Validate that the selected search result should be shaded in grey when user hover over or tab/arrow through the search term results
	Then I should see "searchBar" exist on "commonPage"
	And my cursor is in the "searchBar" on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter a valid "searchTerm" in the "searchBar" on "commonPage"
	Then I should see the "auto-suggestions" on "commonPage"
	When I hover over the "auto-suggestions" on "commonPage"
	Then I should see the selected "auto-suggestions" should be shaded in grey on "commonPage"
	When I tab over the "auto-suggestions" on "commonPage"
	Then I should see the selected "auto-suggestions" should be shaded in grey on "commonPage"
	When I arrow over the "auto-suggestions" on "commonPage"
	Then I should see the selected "auto-suggestions" should be shaded in grey on "commonPage"
	When I click on one of the "auto-suggestions" on "commonPage"
	Then I should be taken to the relevant page

@notAutomated @DEBD-196
Scenario: Validate that user should see auto-suggestions based on my search input and the number of results for each suggested search up until I delete the final character
	Then I should see "searchBar" exist on "commonPage"
	And my cursor is in the "searchBar" on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter a valid "searchTerm" in the "searchBar" on "commonPage"
	Then I should see the "searchResult" on "commonPage"
	When I delete the characters from the "searchBar" on "commonPage"
	Then I should see the "auto-suggestions" based on my search input and the number of results for each suggested search on "commonPage"
	When I delete the last character from the "searchBar" on "commonPage"
	Then I should not see the "auto-suggestions" on "commonPage"

@notAutomated @DEBD-196
Scenario: Validate that user should see same auto-suggestions when I delete all the characters from the search bar and type the same first character as previous search term
	Then I should see "searchBar" exist on "commonPage"
	And my cursor is in the "searchBar" on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter a valid "searchTerm" in the "searchBar" on "commonPage"
	Then I should see the "searchResult" on "commonPage"
	When I delete few characters from the "searchBar" on "commonPage"
	Then I should see the "auto-suggestions" based on my search input and the number of results for each suggested search on "commonPage"
	When I delete all characters from the "searchBar" on "commonPage"
	Then I should not see the "auto-suggestions" on "commonPage"
	Then I enter the same first character as my previous "searchTerm" in the "searchBar" on "commonPage"

@notAutomated @DEBD-196
Scenario: Validate that the search bar should be blanked out when user presses the clear 'x' CTA after entering a valid search term
	Then I should see "searchBar" exist on "commonPage"
	And my cursor is in the "searchBar" on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter a valid "searchTerm" in the "searchBar" on "commonPage"
	And I click the "clearXCTA" in the "searchBar" on "commonPage"
	Then I should see the "searchBar" should be blanked out on "commonPage"
	When I enter a valid "searchTerm" in the "searchBar" on "commonPage"
	And I click on the "searchIcon" on "commonPage"
	Then I should be taken to the relevant page

@notAutomated @DEBD-196
Scenario: Validate that the special characters should be removed from the search result when user have entered a search term with special characters
	Then I should see "searchBar" exist on "commonPage"
	And my cursor is in the "searchBar" on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter a valid "searchTerm" with special characters in the "searchBar" on "commonPage"
	Then I should see the special character removed from "searchResult" on "commonPage"

@notAutomated @DEBD-196
Scenario: Validate that the user should not see any auto-suggestion items when user searches for a Chanel product
	Then I should see "searchBar" exist on "commonPage"
	And my cursor is in the "searchBar" on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter a valid "searchTerm" for Chanel product in the "searchBar" on "commonPage"
	Then Then I should not see the "auto-suggestions" on "commonPage"
	When I click on "searchIcon" on "commonPage"
	Then I should be taken to the Chanel content page

@notAutomated @DEBD-196
Scenario: Validate that user lands on SCAT if search for Home Sale
	And I enter "Home sale" in "searchField" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I wait for "3000" milliseconds
	Then I should see "headerText" as "Home" on "pspPage"
	And I should see "url" contains "sale/home"

@notAutomated @DEBD-196
Scenario: Validate that user lands on brand room if search for Kat Von D
	When I click on "searchIcon" on "commonPage"
	And I enter "Kat Von D" in "searchField" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I wait for "3000" milliseconds
	#Then I should see "headerText" as "Beauty" on "pspPage"
	And I should see "url" contains "beauty/kat-von-d"

@notAutomated @DEBD-196
Scenario: Validate the search result psp page when user search for Gucci
	When I click on "searchIcon" on "commonPage"
	And I enter "Gucci" in "searchField" on "commonPage"
	And I click on "searchApply" on "commonPage"
	Then I should see "searchText" as "GUCCI" on "pspPage"
	And I should see "headerText" containing "Beauty" on "pspPage"
	And I should see "url" contains "gucci"

@notAutomated @DEBD-196
Scenario: Validate that user lands on SCAT if search for Women sale
	When I click on "searchIcon" on "commonPage"
	And I enter "Women sale" in "searchField" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I wait for "2000" milliseconds
	Then I should see "headerText" as "Women's clothing & accessories" on "pspPage"
	And I should see "url" contains "sale/women"


@manual @DEBD-580
Scenario: Navigate to homepage and validate the search bar
	Given I logout
	Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
	Then I should see "searchBar" exist on "commonPage"
	And I should see "Search..." copy text in the "searchBar"
	And I should see Grey bottom border in the "searchBar"
	And I should see teal magnifying glass "searchIcon" in the "searchBar"
	When I click on "searchBar" on "commonPage"
	Then I should see the bottom border of the component will turn from grey to teal of the "searchBar" on "commonPage"
	Then  I should see the "searchBar" should slightly increase in width

@automated @DEBD-580 @Fixed
Scenario: Enter a character in the search bar and validate that a clear 'x' CTA is displayed
	Given I logout
    Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "a" in "searchBar" on "commonPage"
	Then I should see "clearXCTA" in the "searchBar" on "commonPage"

@automated @DEBD-580 @Fixed
Scenario Outline: Validate that the search bar should be blanked out when user presses the clear 'x' CTA after entering a valid search term
    Given I navigate to "homeURL"
    Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "<searchTerm>" in "searchBar" on "commonPage"
	And I click on "clearXCTA" on "commonPage"
    Then I should see value of "searchBar" as "" on "commonPage"
	When I enter "<searchTerm>" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I should see "searchResultHeader" containing "Search results for" on "commonPage"
    And I should see "searchResultHeaderSearchTerm" containing "<searchTerm>" on "commonPage"
    And I should see "url" contains "<url>"

    Examples:
    | searchTerm | url              |
    | Dresses    | search/Dresses   |
    | Shirts     | search/Shirts    |
    | Skirts     | search/Skirts    |

@automated @DEBD-580 @Fixed
Scenario Outline: Validate that the special characters should be removed from the search result when user have entered a search term with special characters
     Given I logout
    Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
    And I enter "<searchTerm>" in "searchBar" on "commonPage"
    And I click on "searchApply" on "commonPage"
	And I should see "searchResultHeader" containing "Search results for" on "commonPage"
    And I should see "searchResultHeaderSearchTerm" containing "<ExpectedSearchTerm>" on "commonPage"
    And I should see "url" contains "<url>"
Examples:
    | searchTerm      | ExpectedSearchTerm | url                 |
    | Men's Dresses   | Mens Dresses       | search/Mens+Dresses |

@automated @DEBD-580 @Fixed
Scenario: Validate that user lands on SCAT if search for Home Sale
    And I enter "Home sale" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	Then I should see "headerText" as "Home" on "pspPage"
	And I should see "url" contains "/sale/home"

@automated @DEBD-580 @Fixed
Scenario: Validate that user lands on PSP if search for Faith
	When I click on "searchBar" on "commonPage"
	And I enter "Faith" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	Then I should see "headerText" as ""FAITH"" on "pspPage"
	And I should see "url" contains "search/Faith"

@automated @DEBD-580 @Fixed
Scenario: Validate that user lands on SCAT if search for Women sale
	Given I logout
    When I click on "searchBar" on "commonPage"
	And I enter "Women sale" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I wait for "2000" milliseconds
	Then I should see "headerText" as "Women's clothing & accessories" on "pspPage"
	And I should see "url" contains "/sale/women"

