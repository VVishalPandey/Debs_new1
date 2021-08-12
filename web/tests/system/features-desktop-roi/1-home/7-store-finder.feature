Feature: Test Debenhams store finder on Desktop

@automated @DEBD-184 @Fixed
Scenario Outline: Verify the store finder functionality
  Given I logout
  And I should see "storeFinderLink" exist on "commonPage"
  And I click on "storeFinderLink" on "commonPage"
  Then I should see "url" contains "content/find-a-store"
  And I should see "headerText" as "Store Finder" on "storeFinderPage"
  And I should see "storeFinderField" exist on "storeFinderPage"
  And I should see "storeFinderButton" exist on "storeFinderPage"
  And I should not see "mapImage" on "storeFinderPage"
  When I enter "<storeFinderName>" in "storeFinderField" on "storeFinderPage"
  And I click on "storeFinderButton" on "storeFinderPage"
  And I should see "storeFindtext" containing "Stores closest to" on "storeFinderPage"
  Then I should see "storeFinderEnteredText" as "<storeFinderName>" on "storeFinderPage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"

  Examples:
    | storeFinderName            | max_count |
    | Dublin Henry Street        | 5         |

@automated @DEBD-184 @Fixed
Scenario Outline: Validate the first store locator details in result area
  Then I should see "firstStoreDetails" as "<firstStoreName>" on "storeFinderPage"
  When I click on "firstStoreDetails" on "storeFinderPage"
  Then I should see "storeDetailName" as "<firstStoreName>" on "storeFinderPage"
  And I should see "headerText" as "Store Finder" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"


  Examples:
    | firstStoreName         |
    | Dublin Henry Street    |

@automated @DEBD-184 @Fixed
Scenario Outline: Verify the store finder functionality with blank and invalid search
 Given I logout
  And I click on "storeFinderLink" on "commonPage"
  Then I should see "url" contains "content/find-a-store"
  And I click on "storeFinderField" on "storeFinderPage"
  And I click on "headerText" on "storeFinderPage"
  Then I should see "errorMessage" as "<errorMessage>" on "storeFinderPage"
  And I should not see "mapImage" on "storeFinderPage"
  When I enter "<storeFinderName>" in "storeFinderField" on "storeFinderPage"
  And I click on "storeFinderButton" on "storeFinderPage"
  And I should see "storeFindtext" containing "Stores closest to" on "storeFinderPage"
  Then I should see "storeFinderEnteredText" as "<storeFinderName>" on "storeFinderPage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"

  Examples:
    | storeFinderName | max_count|      errorMessage               |
    | fgfghdfgdf      | 5        |Please enter town or eircode   |

@manual @DEBD-184
Scenario Outline: Validate the first store locator details in result area
  Then I should see "firstStoreDetails" as "<firstStoreName>" on "storeFinderPage"
  When I click on "firstStoreDetails" on "storeFinderPage"
  Then I see a store details page <containing>
   Examples:
   |containing                                          |
   | back to results link (back to store list)          |
   |get directions link (opens google maps with directions)|
   |map location |
   |store name   |
   |opening times |
   |Store address |
   |Click & collect location|
   |Store service list with accordions for services info|
