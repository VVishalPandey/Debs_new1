Feature: Test Debenhams delivery options page


@automated @DEBD-178
Scenario: Navigate to Debenhams delivery options page as logged in user and validate the page with delivery options when user has both options available
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testshoePdpURL"
	And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"

@automated @DEBD-178 @DEBD-143 @DEBD-143
Scenario: Select saved address and navigate to delivery types
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
  Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  When I click on "loggedInuserUKOption" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"

@automated @DEBD-291
Scenario: Validate the delivery types and select next nominated delivery
  When I am in view of "deliveryTypeheaderText" on "deliveryOptionPage"
  Then I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"
  And I should see "nextNominatedOptionHeaderText" containing "Next" on "deliveryOptionPage"
  #And I should see "nextNominatedOptionText" containing "Get it" on "deliveryOptionPage"
  #And I should see "standardOptionHeaderText" containing "Standard UK Delivery" on "deliveryOptionPage"
  #And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
  #When I click on "nextNominatedOption" on "deliveryOptionPage"
  #Then I should see "nextNominatedSectionHeaderText" as "When would you like to receive your delivery?" on "deliveryOptionPage"



@automated @DEBD-1080
Scenario Outline: Validate the store locator field error message with blank value input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "findSoreErrorMessage" as "Please enter the town or postcode" on "locateStorePage"

  Examples:
    | storeLocateName |
    |                 |

@automated @DEBD-1080
Scenario Outline: Validate the store locator field error message with incorrect input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  #Then I should see "notificationErrorMessage" as "The town or postcode you entered was not recognised. Please try again." on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"

  Examples:
    | storeLocateName | max_count |
    | D02 AF30          | 5         |

@automated @DEBD-1080
Scenario Outline: Validate the store locator field error message with incorrect input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "notificationErrorMessage" as "The town or postcode you entered was not recognised. Please try again." on "locateStorePage"

  Examples:
    | storeLocateName |
    | D02 AF30         |


@automated @DEBD-1080
Scenario Outline: Validate the first store locator details in result area
  When I am in view of "locateStoreEnteredText" on "locateStorePage"
  And I click on "firstStoreDetails" on "locateStorePage"
  Then I should see "storeDetailCloseIcon" exist on "locateStorePage"
  #And I should see "storeDetailName" as "<firstStoreName>" on "locateStorePage"

  Examples:
    | firstStoreName              |
    | Staff only - Support Centre |

@automated @DEBD-1080
Scenario Outline: Close the above open store details and select the first store and validate the selected store in delivery area
  When I click on "storeDetailCloseIcon" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  #Then I should see "selectedStoreName" containing "<firstStoreName>" on "locateStorePage"
  And I should see "deliveryMessage" containing "Order now and your parcel should be available for collection" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

  Examples:
    | firstStoreName              |
    | Staff only - Support Centre |

@automated @DEBD-1080
Scenario Outline: Validate that the user is navigated back to store result section when selected change store
  When I click on "changeStoreLink" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"

  Examples:
    | storeLocateName | max_count |
    | D02 AF30          | 5         |

@automated @DEBD-1080 @DEBD-281
Scenario Outline: Validate that click and collect and delivery page with new postcode
  When I am in view of "collectFromheaderText" on "locateStorePage"
  And I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  Then I should see "selectedStoreName" containing "<firstStoreName>" on "locateStorePage"
  And I should see "deliveryMessage" containing "Order now and your parcel should be available for collection" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

  Examples:
    | storeLocateName | max_count | firstStoreName |
    | D02 AF30          | 5         | Dublin         |


@notAutomated @DEBD-1077
Scenario: Validate that user is able to update journey from home delivery (next nominated) to click & collect
  When I am in view of "deliveryOptionheaderText" on "deliveryOptionPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  Then I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
  And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
  And I should see "locateStoreButton" exist on "locateStorePage"
  And I should see "locateStoreField" exist on "locateStorePage"

@notAutomated @DEBD-1077
Scenario Outline: Validate the store locator result (maximum 5 value) when user enters correct input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I should see copy "Stores closest to "<storeLocateName>""
  And I should see "storename" , "Storedetailslink" ,"distance&label"
  And I should see "Choose this store CTA"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"


  Examples:
    | storeLocateName | max_count |
    | E16FQ           | 5         |

@notAutomated @DEBD-1077
Scenario Outline: Validate the store locator result updating with new search store
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I should see copy "Stores closest to "<storeLocateName>""
  And I amend the store search item
  Then the "Stores closest to" copy updates in line with the search field

@notAutomated @DEBD-1077
Scenario Outline: Validate the store locator result updating with new search store
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I click on the view store details CTA for a store
  Then I should see the following store details section

  | Store Details Section |
  | store name            |
  | change store link     |
  | interactive store map  |
  | contact details (address & phone number (if applicable)) |
  | opening times  |
  | C&C location (if applicable) |
  | choose store CTA |


@notAutomated @DEBD-1077
Scenario Outline: Validate the store details section on click of the store details CTA for the store
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  And I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I click on the view store details CTA for a store
  And I click on the press change store link
  Then I should taken back to the store search results list

@notAutomated @DEBD-1077
Scenario Outline: Validate the store details section on click of the store details CTA for the store
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  And I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  When I press choose store CTA
  Then I am scrolled down to the delivery lead time
  And proceed to payment CTA
  And clicking on the payment CTA should take to the Payment Page

@manual @DEBD-1076
Scenario: Navigate to Debenhams delivery options page as logged in user and validate the page with delivery options when user has both options available
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  And Click&Collect not available for the product
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see the choose delivery address section ("Where are we delivering to?")
  And I should see disabled "clickCollectOption" exist on "deliveryOptionPage"
  And I should see autoselected "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see C&C unavailable copy with no text links and "return to shopping bag" text without link


@manual @DEBD-1076
Scenario: Navigate to Debenhams delivery options page as logged in user and validate the page with delivery options when user has both options available
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see both delivery options available
  Then I should switch between the two options
  And Any data previously entered should be removed upon switching
