Feature: Test Debenhams delivery options page

# Home and CC both active
# Next Nominated is validated
# Standard Delivery is validated
# Click and collect is validated
# Used saved address from drop down

@automated @DEBD-178
Scenario: Navigate to Debenhams delivery options page as logged in user and validate the page with delivery options when user has both options available
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
	And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I should see "homeDeliveryText" as "Get your order delivered to a location of your choice on a day and time that suits you." on "deliveryOptionPage"
  #And I should see "clickCollectText1" as "Delivered to your nearest UK store the Next Day - simply collect at your convenience" on "deliveryOptionPage"
  And I should see "clickCollectText1" as "Delivered in 2 days to a UK store of your choice - simply collect at your convenience." on "deliveryOptionPage"
  And I should see "clickCollectText2" containing "Orders £30 or over - FREE" on "deliveryOptionPage"
  And I should see "clickCollectText2" containing "Orders under £30 - £2" on "deliveryOptionPage"

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
  And I should see "nextNominatedOptionText" containing "Get it" on "deliveryOptionPage"
  And I should see "standardOptionHeaderText" containing "Standard UK Delivery" on "deliveryOptionPage"
  And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
  When I click on "nextNominatedOption" on "deliveryOptionPage"
  Then I should see "nextNominatedSectionHeaderText" as "When would you like to receive your delivery?" on "deliveryOptionPage"

@automated @DEBD-304
Scenario: Validate the daytime delivery options and select first available option to validate delivery text before payment page
  When I am in view of "nextNominatedSectionHeaderText" on "deliveryOptionPage"
  Then I should see "daytimeTab" exist on "deliveryOptionPage"
  And I should see "eveningTab" exist on "deliveryOptionPage"
  And I should see "daytimeTabText" as "Daytime" on "deliveryOptionPage"
  And I should see "eveningTabText" as "Evening" on "deliveryOptionPage"
  And I validate all options under daytime
  When I validate first evening and daytime option navigation
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

@automated @DEBD-203 @DEBD-281
Scenario: Validate that user is able to update journey from next nominated to standard delivery
  When I am in view of "deliveryTypeheaderText" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should not see "nextNominatedSectionHeaderText" on "deliveryOptionPage"
  And I should not see "daytimeTab" on "deliveryOptionPage"
  And I should not see "eveningTab" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

@automated @DEBD-304 @DEBD-281
Scenario: Validate that user is able to update journey from standard to next nominated delivery
  When I am in view of "deliveryTypeheaderText" on "deliveryOptionPage"
  And I click on "nextNominatedOption" on "deliveryOptionPage"
  When I am in view of "nextNominatedSectionHeaderText" on "deliveryOptionPage"
  Then I should see "daytimeTab" exist on "deliveryOptionPage"
  And I should see "eveningTab" exist on "deliveryOptionPage"
  And I should see "daytimeTabText" as "Daytime" on "deliveryOptionPage"
  And I should see "eveningTabText" as "Evening" on "deliveryOptionPage"
  And I validate all options under evening time
  When I validate first evening and daytime option navigation
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

@automated @DEBD-178
Scenario: Validate that user is able to update journey from home delivery (next nominated) to click & collect
  When I am in view of "deliveryOptionheaderText" on "deliveryOptionPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  Then I should not see "useThisAddressButton" on "deliveryOptionPage"
  And I should not see "standardOption" on "deliveryOptionPage"
  And I should not see "nextNominatedOption" on "deliveryOptionPage"
  And I should not see "proceedPaymentButton" on "deliveryOptionPage"
  And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
  And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
  And I should see "locateStoreButton" exist on "locateStorePage"
  And I should see "locateStoreField" exist on "locateStorePage"

@automated @DEBD-234
Scenario Outline: Validate the store locator field error message with blank value input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "findSoreErrorMessage" as "Please enter the town or postcode" on "locateStorePage"

  Examples:
    | storeLocateName |
    |                 |

@automated @DEBD-234
Scenario Outline: Validate the store locator field error message with incorrect input
  Given I logout
  Then I am on my details page
  Then I navigate to "clickCollectDeliveryPdp"
  Then I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds
  Then I should scroll to "checkoutButton" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage" 
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  #Then I should see "notificationErrorMessage" as "The town or postcode you entered was not recognised. Please try again." on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"

  Examples:
    | storeLocateName | max_count |
    | E16FQ00         | 5         |

@automated @DEBD-234
Scenario Outline: Validate the store locator result (maximum 5 value) when user enters correct input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"

  Examples:
    | storeLocateName | max_count |
    | E16FQ           | 5         |

@automated @DEBD-234
Scenario Outline: Validate the first store locator details in result area
  When I am in view of "locateStoreEnteredText" on "locateStorePage"
  And I click on "firstStoreDetails" on "locateStorePage"
  Then I should see "storeDetailCloseIcon" exist on "locateStorePage"
  And I should see "storeDetailName" containing "<firstStoreName>" on "locateStorePage"

  Examples:
    | firstStoreName              |
    | Staff only - Support Centre |

@automated @DEBD-234
Scenario Outline: Close the above open store details and select the first store and validate the selected store in delivery area
  When I click on "storeDetailCloseIcon" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  Then I should see "selectedStoreName" containing "<firstStoreName>" on "locateStorePage"
  And I should see "deliveryMessage" containing "Your order will be ready to collect" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

  Examples:
    | firstStoreName              |
    | Staff only - Support Centre |

@automated @DEBD-234
Scenario Outline: Validate that the user is navigated back to store result section when selected change store
  When I click on "changeStoreLink" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"

  Examples:
    | storeLocateName | max_count |
    | E16FQ           | 5         |

@automated @DEBD-234 @DEBD-281
Scenario Outline: Validate that click and collect and delivery page with new postcode
  When I am in view of "collectFromheaderText" on "locateStorePage"
  And I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  Then I should see "selectedStoreName" containing "<firstStoreName>" on "locateStorePage"
  And I should see "deliveryMessage" containing "Your order will be ready to collect" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

  Examples:
    | storeLocateName | max_count | firstStoreName |
    | E152QB          | 5         | Ilford         |


@manual @DEBD-281
Scenario: Validate deivery lead times
	Given I am on DOTINT
	When I hover over or focus on the delivery lead time
	Then I will see the tool tip explaining the working day business rules
	Given I can see the delivery lead time tool tip
	When I hover or focus away
	Then the tool tip will close
	When QA: Different countries will have different delivery lead times


@manual @DEBD-1076 @awsManual
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
 

@manual @DEBD-1076 @awsManual
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