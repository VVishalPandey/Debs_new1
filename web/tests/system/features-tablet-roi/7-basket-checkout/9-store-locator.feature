Feature: Test Debenhams store locator page

@manual @DBMTE-633
Scenario: Navigate to store finder page and validate the page
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I click on "Store Finder" position "16"
  Then I should see "url" contains "content/find-a-store"
  And I should see "headerText" as "Store Finder" on "storeFinderPage"
  And I should see "storeFinderField" exist on "storeFinderPage"
  And I should see "storeFinderButton" exist on "storeFinderPage"
  And I should not see "mapImage" on "storeFinderPage"

@manual @DBMTE-633
Scenario Outline: Validate the store finder result (maximum 5 value) when user enters correct input
  When I enter "<storeFinderName>" in "storeFinderField" on "storeFinderPage"
  And I click on "storeFinderButton" on "storeFinderPage"
  Then I should see "storeFinderEnteredText" as "<storeFinderName>" on "storeFinderPage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"

  Examples:
    | storeFinderName | max_count |
    | W12 P584        | 5         |

@manual @DBMTE-633
Scenario Outline: Validate the first store locator details in result area
  Then I should see "firstStoreDetails" as "<firstStoreName>" on "storeFinderPage"
  When I click on "firstStoreDetails" on "storeFinderPage"
  Then I should see "storeDetailName" as "<firstStoreName>" on "storeFinderPage"
  And I should see "headerText" as "Store Finder" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"

  Examples:
    | firstStoreName |
    | Newbridge      |

@manual @DBMTE-633
Scenario: Navigate to store locator page and validate the page
  Given I logout
  Then I am on my details page
  And I navigate to mybag and remove "dress"
  And I navigate to mybag and remove "perfume"
  And I navigate to mybag and remove "furniture"
  And I navigate to pdp "dress" and add to bag
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  When I click on "clickCollectCTA" on "deliveryOptionPage"
  Then I should see "headerText" as "Which store would you like to collect from?" on "locateStorePage"
  And I should see "locateStoreField" exist on "locateStorePage"
  And I should see "locateStoreButton" exist on "locateStorePage"

@manual @DBMTE-633
Scenario Outline: Validate the store locator field error message with blank value input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreFieldError" as "Please enter the town or postcode" on "locateStorePage"

  Examples:
    | storeLocateName |
    |                 |

@manual @DBMTE-633
Scenario Outline: Validate the store locator field error message with incorrect input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "errorMessage" as "The town or postcode you entered was not recognised. Please try again." on "locateStorePage"
  And I click on "closeErrorNotification" on "locateStorePage"

  Examples:
    | storeLocateName |
    | E16FQ00         |

@manual @DBMTE-633
Scenario Outline: Validate the store locator result (maximum 5 value) when user enters correct input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"

  Examples:
    | storeLocateName | max_count |
    | Dublin          | 5         |

@manual @DBMTE-633
Scenario: Validate the first store locator details in result area

@manual @DBMTE-633
Scenario: Close the above open store details and select the first store to navigate to next page
  When I click on "storeDetailCloseIcon" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  Then I should see "deliveryMessage" containing "Order now and your parcel should be available for collection" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

@manual @DBMTE-633
Scenario: Navigate to store locator and validate the page when user has saved stores
