Feature: Test Debenhams end to end journey number 5

@deScoped @preprodSanity @e2e
Scenario: Navigate to store finder page and validate the page
  Then I logout
  Given I navigate to "homeURL"
  When I click on "menuIcon" on "commonPage"
  And I "validate" mainMenu option "Saved Items" on commonPage smallscreen
  And I "validate" mainMenu option "Store Finder" on commonPage smallscreen
  And I "validate" mainMenu option "Create Account/Sign In" on commonPage smallscreen
  And I "validate" mainMenu option "Help & Support" on commonPage smallscreen
  And I "validate & click" mainMenu option "Store Finder" on commonPage smallscreen
  Then I should see "headerText" as "Store Finder" on "storeFinderPage"
  And I should see "storeFinderField" exist on "storeFinderPage"
  And I should see "storeFinderButton" exist on "storeFinderPage"
  And I should not see "mapImage" on "storeFinderPage"

@deScoped @preprodSanity @e2e
Scenario Outline: Validate the store finder result (maximum 5 value) when user enters correct input
  When I enter "<storeFinderName>" in "storeFinderField" on "storeFinderPage"
  And I click on "storeFinderButton" on "storeFinderPage"
  Then I should see "storeFinderEnteredText" as "<storeFinderName>" on "storeFinderPage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"

  Examples:
    | storeFinderName | max_count |
    | Limerick        | 5         |

@deScoped @preprodSanity @e2e
Scenario Outline: Validate the first store locator details in result area
  Then I should see "firstStoreDetails" as "<firstStoreName>" on "storeFinderPage"
  When I click on "firstStoreDetails" on "storeFinderPage"
  Then I should see "storeDetailName" as "<firstStoreName>" on "storeFinderPage"
  And I should see "headerText" as "Store Finder" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"
  And I should see "url" contains "content/find-a-store"

  Examples:
    | firstStoreName |
    | LIMERICK       |



