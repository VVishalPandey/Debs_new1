Feature: Test Debenhams store finder on Desktop

@automated @DEBD-286 @Fixed
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
    | storeFinderName | max_count |
    | Limerick        | 5         |

@automated @DEBD-286 @Fixed
Scenario Outline: Validate the first store locator details in result area
  Then I should see "firstStoreDetails" as "<firstStoreName>" on "storeFinderPage"
  When I click on "firstStoreDetails" on "storeFinderPage"
  Then I should see "storeDetailName" as "<firstStoreName>" on "storeFinderPage"
  And I should see "headerText" as "Store Finder" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"


  Examples:
    | firstStoreName         |
    | LIMERICK               |

@automated @DEBD-286 @Fixed
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
  Then I should see "invalidPostcode" as "<invalidPostcode>" on "storeFinderPage"
  # And I should see "storeFindtext" containing "Stores closest to" on "storeFinderPage"
  # Then I should see "storeFinderEnteredText" as "<storeFinderName>" on "storeFinderPage"
  # And I count number of "searchedStoreInfoElements" to be "<max_count>" on "storeFinderPage"
  # And I should see "mapImage" exist on "storeFinderPage"

  Examples:
    | storeFinderName | max_count|      errorMessage               |                           invalidPostcode                            |
    | fgfghdfgdf      | 5        |Please enter the town or postcode|The town or postcode you entered was not recognised. Please try again.|

@manual @DEBD-286 @awsManual
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


@deprecated @DEBD-1242
Scenario Outline: Verify the store finder functionality
  Given I navigate to "furnitureStoreLocator"
  Then I should see "url" contains "content/furniture-store-locator?jump=1"
  And I should see "headerText" as "Furniture Store Locator" on "storeFinderPage"
  Then I should see "furnitureSLDescription" as "<furnitureSLDescription>" on "storeFinderPage"
  And I should see "backButton" as "Back to furniture" on "storeFinderPage"
  And I should see "tab1" as "By Showrooms" on "storeFinderPage"
  And I should see "tab2" as "By Range" on "storeFinderPage"
  And I should see "storeFinderField" exist on "storeFinderPage"
  And I should see "storeFinderButton" exist on "storeFinderPage"
  And I should not see "mapImage" on "storeFinderPage"
  When I enter "<storeFinderName>" in "storeFinderField" on "storeFinderPage"
  And I click on "storeFinderButton" on "storeFinderPage"
  And I should see "storeFindtext" containing "Stores closest to" on "storeFinderPage"
  Then I should see "storeFinderEnteredText" as "<storeFinderName>" on "storeFinderPage"
  #And I count number of "searchedStoreInfoElements" to be "<max_count>" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"

  Examples:
    | storeFinderName | max_count |furnitureSLDescription|
    | London - Oxford Street | 5  |If you would like to take a closer look at our furniture before buying, simply enter your town or postcode to find the nearest showroom or search for a specific range.|

@manual @DEBD-1242 @awsManual
Scenario Outline: Verify the store finder functionality
  And I click on "tab2" on "storeFinderPage"
  And I should see "selectoptiontext" as "Select your furniture range" on "pdpPage"
  When I click on "rangeDropdown" on "pdpPage"
  And I select "anika" from "dropdown"
  When I enter "<storeFinderName>" in "storeFinderField" on "storeFinderPage"
  And I click on "storeFinderButton" on "storeFinderPage"
  And I should see "storeFindtext" containing "Stores closest to" on "storeFinderPage"
  Then I should see "storeFinderEnteredText" as "<storeFinderName>" on "storeFinderPage"
  #And I count number of "searchedStoreInfoElements" to be "<max_count>" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"

  Examples:
    | storeFinderName | max_count |furnitureSLDescription|
    | London - Oxford Street | 5  |If you would like to take a closer look at our furniture before buying, simply enter your town or postcode to find the nearest showroom or search for a specific range.|

