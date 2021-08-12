Feature: Validation of the search functionality

@manual @DEBD-196
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

@automated @DEBD-196 @Fixed
Scenario: Enter a character in the search bar and validate that a clear 'x' CTA is displayed
	Given I navigate to "homeURL"
	Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
    Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "dr" in "searchBar" on "commonPage"
	Then I should see "clearXCTA" in the "searchBar" on "commonPage"

@automated @DEBD-151 @Fixed
Scenario Outline: Validate that the autosearch is not working when user tries to enter three characters in the serachbar
    Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	Then  I enter "a" in "searchBar" on "commonPage"
	Then I should not see "autoSuggestions" on "commonPage"
    And I click on "clearXCTA" on "commonPage"
	And  I enter "<TwoLetterTerm>" in "searchBar" on "commonPage"
	Then I should not see "autoSuggestions" on "commonPage"
    And I click on "clearXCTA" on "commonPage"
	And  I enter "<ThreeLetterTerm>" in "searchBar" on "commonPage"
	Then I should not see "autoSuggestions" on "commonPage"

    Examples:
    | TwoLetterTerm | ThreeLetterTerm  |
    | Dr            | Dre              |
    | Sh            | Shi              |
    | Sk            | Ski              |

@automated @DEBD-151 @Fixed
Scenario Outline: Validate that the selected search result should be shaded in grey when user hover over or tab/arrow through the search term results
    Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "<searchTerm>" in "searchBar" on "commonPage"
	Then I should not see "autoSuggestions" on "commonPage"

 Examples:
    | searchTerm |
    | Dresses    |
    | Shirts     |
    | Skirts     |


@automated @DEBD-196 @Fixed
Scenario Outline: Validate that the search bar should be blanked out when user presses the clear 'x' CTA after entering a valid search term
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
    | Skirts     | search/Skirts    |

@automated @DEBD-196 @Fixed
Scenario Outline: Validate that the special characters should be removed from the search result when user have entered a search term with special characters
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

@automated @DEBD-196 @Fixed
Scenario: Validate that user lands on SCAT if search for Home Sale
    And I enter "Home sale" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	Then I should see "headerText" as ""Home sale"" on "pspPage"
	And I should see "url" contains "search/Home+sale"

@automated @DEBD-196 @Fixed
Scenario: Validate that user lands on PSP if search for Faith
	When I click on "searchBar" on "commonPage"
	And I enter "Faith" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	Then I should see "headerText" as ""FAITH"" on "pspPage"
	And I should see "url" contains "search/Faith"

@automated @DEBD-196 @Fixed
Scenario: Validate that user lands on SCAT if search for Women sale
    When I click on "searchBar" on "commonPage"
	And I enter "Women sale" in "searchBar" on "commonPage"
	And I click on "searchApply" on "commonPage"
	And I wait for "2000" milliseconds
	Then I should see "headerText" as ""WOMEN SALE"" on "pspPage"
	And I should see "url" contains "search/Women+sale"
