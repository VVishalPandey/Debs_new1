Feature: Verify the functionality of autosuggest depatments on search with varient-1 and varient-3

@automated @DEBD-2787
Scenario Outline: Validate that user lands on SCAT if search for Home Sale
  Given I navigate to "testDressPdpURL"
  When I set mvt test for "autoSuggest" as "<variation>"
  Then I click on "searchIcon" on "commonPage"
  And I enter "Hats" in "searchField" on "commonPage"
  And I should see "popularSearchText" as "POPULAR SEARCHES (6 RESULTS)" on "commonPage"
  Then I select the auto search department as "Women"
  Then I should see "headerText" as ""hats"" on "pspPage"
  And I should see "url" contains "/search/hats/women"
  Then I click on "searchIcon" on "commonPage"
  And I enter "Hats" in "searchField" on "commonPage"
  Then I select the auto search department as "ladies"
  Then I should see "headerText" as ""ladies hats"" on "pspPage"
  And I should see "url" contains "search/ladies+hats"
  Examples:
   | variation        |
   | variation1       |
   | variation3       |

@manual @DEBD-2787
Scenario: Validate ton seasrch ast option is fading on scroll
  Given I navigate to "testDressPdpURL"
  When I set mvt test for "autoSuggest" as "variation1"
  When I click on "searchIcon" on "commonPage"
  Then I enter "Hats" in "searchField" on "commonPage"
  And I should see that last option is fading on scroll

@manual @DEBD-2787
Scenario: Validate that user is getting scroll For more result on search
  Given I navigate to "testDressPdpURL"
  When I set mvt test for "autoSuggest" as "variation3"
  When I click on "searchIcon" on "commonPage"
  Then I enter "Hats" in "searchField" on "commonPage"
  And I should see "scroll For more result" at the bottom search

@manual @DEBD-2787
Scenario: Validate that above scenarios are applicable for UK Mobile only