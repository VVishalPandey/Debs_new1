Feature: Test Debenhams delivery options page

@automated @DBMTE-66
Scenario: Navigate to Debenhams delivery options page as logged in user and validate the page with delivery options when user has both options available
  Given I logout
  Then I am on my details page
  When I navigate to mybag and empty the bag
  And I navigate to "testDressPdpURL"
  And I am in view of "allSizeElements" on "pdpPage"
  And I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I should see "homeDeliveryText" as "Get your order delivered to a location of your choice on a day and time that suits you." on "deliveryOptionPage"
  And I should see "clickCollectText1" as "Delivered to your nearest UK store the Next Day - simply collect at your convenience" on "deliveryOptionPage"
  And I should see "clickCollectText2" containing "Orders £20 or over - FREE" on "deliveryOptionPage"
  And I should see "clickCollectText2" containing "Orders under £20 - £2" on "deliveryOptionPage"

@automated @DBMTE-83
Scenario: Select saved address and navigate to delivery types
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
  Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  When I click on "loggedInuserUKOption" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"

@automated @DBMTE-68
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

@automated @DBMTE-68
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

@automated @DBMTE-68
Scenario: Validate that user is able to update journey from next nominated to standard delivery
  When I am in view of "deliveryTypeheaderText" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should not see "nextNominatedSectionHeaderText" on "deliveryOptionPage"
  And I should not see "daytimeTab" on "deliveryOptionPage"
  And I should not see "eveningTab" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

@automated @DBMTE-68
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

@automated @DBMTE-72
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

@automated @DBNHST-72
Scenario Outline: Validate the store locator field error message with blank value input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "findSoreErrorMessage" as "Please enter the town or postcode" on "locateStorePage"

  Examples:
    | storeLocateName |
    |                 |

@automated @DBNHST-72
Scenario Outline: Validate the store locator field error message with incorrect input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "notificationErrorMessage" as "The town or postcode you entered was not recognised. Please try again." on "locateStorePage"

  Examples:
    | storeLocateName |
    | E16FQ00         |

@automated @DBNHST-72
Scenario Outline: Validate the store locator result (maximum 5 value) when user enters correct input
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"

  Examples:
    | storeLocateName | max_count |
    | E16FQ           | 5         |

@automated @DBNHST-72
Scenario Outline: Validate the first store locator details in result area
  When I am in view of "locateStoreEnteredText" on "locateStorePage"
  And I click on "firstStoreDetails" on "locateStorePage"
  Then I should see "storeDetailCloseIcon" exist on "locateStorePage"
  And I should see "storeDetailName" as "<firstStoreName>" on "locateStorePage"

  Examples:
    | firstStoreName              |
    | Staff only - Support Centre |

@automated @DBNHST-72
Scenario Outline: Close the above open store details and select the first store and validate the selected store in delivery area
  When I click on "storeDetailCloseIcon" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  Then I should see "selectedStoreName" containing "<firstStoreName>" on "locateStorePage"
  And I should see "deliveryMessage" containing "Order now and your parcel should be available for collection" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

  Examples:
    | firstStoreName              |
    | Staff only - Support Centre |

@automated @DBNHST-72
Scenario Outline: Validate that the user is navigated back to store result section when selected change store
  When I click on "changeStoreLink" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"

  Examples:
    | storeLocateName | max_count |
    | E16FQ           | 5         |

@automated @DBNHST-72
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
    | E152QB          | 5         | Ilford         |

@automated @DBMTE-66
Scenario: Navigate to Debenhams delivery options page as logged in user and validate the page with delivery options when user has only home delivery option available
  Given I logout
  Then I am on my details page
  When I navigate to mybag and empty the bag
  When I navigate to "testDressNoCCPdpURL"
  And I am in view of "allSizeElements" on "pdpPage"
  And I add the product to bag and go to my bag page
  And I should see "testDressNoCCProductName" product name exist on myBagPage
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I should see "homeDeliveryText" as "Get your order delivered to a location of your choice on a day and time that suits you." on "deliveryOptionPage"
  And I should see "clickCollectText1" as "Some of the items in your order are not available for Click & Collect. Return to your shopping bag if you'd like to amend your order." on "deliveryOptionPage"

@automated @DBNHST-83
Scenario: Navigate to Debenhams home delivery address page with saved address and validate the page when new address is selected
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "savedAddressRadioButton" exist on "homeDeliveryPage"
  And I should see "newAddressRadioButton" exist on "homeDeliveryPage"
  And I should see "savedAddressText" as "Use saved address" on "homeDeliveryPage"
  And I should see "newAddressText" as "Add a new address" on "homeDeliveryPage"
  When I click on "newAddressRadioButton" on "homeDeliveryPage"
  And I am in view of "newAddressRadioButton" on "homeDeliveryPage"
  Then I should not see "useAddressDropDown" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I should see "country" exist on "homeDeliveryPage"
  And I should see "houseNumber" exist on "homeDeliveryPage"
  And I should see "postcode" exist on "homeDeliveryPage"
  And I should see "findYourAddressButton" exist on "homeDeliveryPage"
  And I should see "enterAddressManuallyLink" exist on "homeDeliveryPage"
  And I should not see "useThisAddressButton" on "homeDeliveryPage"
  And I should not see "addressLine1" on "homeDeliveryPage"
  And I should not see "addressLine2" on "homeDeliveryPage"
  And I should not see "city" on "homeDeliveryPage"
  And I should not see "county" on "homeDeliveryPage"
  And I should not see "findAnotherAddressLink" on "homeDeliveryPage"
  And I should not see "bfpoLink" on "homeDeliveryPage"
  And I should not see "address" on "homeDeliveryPage"

@automated @DBNHST-83
Scenario: Navigate to Debenhams home delivery address page from above scenario and validate the page with bfpo details when selected enter address manually
  When I am in view of "enterAddressManuallyLink" on "homeDeliveryPage"
  And I click on "enterAddressManuallyLink" on "homeDeliveryPage"
  Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I should see "country" exist on "homeDeliveryPage"
  And I should see "houseNumber" exist on "homeDeliveryPage"
  And I should see "postcodeManual" exist on "homeDeliveryPage"
  And I should see "addressLine1" exist on "homeDeliveryPage"
  And I should see "addressLine2" exist on "homeDeliveryPage"
  And I should see "city" exist on "homeDeliveryPage"
  And I should see "county" exist on "homeDeliveryPage"
  And I should see "findAnotherAddressLink" exist on "homeDeliveryPage"
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"
  And I should not see "address" on "homeDeliveryPage"
  And I should not see "enterAddressManuallyLink" on "homeDeliveryPage"
  And I should not see "findYourAddressButton" on "homeDeliveryPage"
  And I should see "bfpoLink" exist on "homeDeliveryPage"
  When I am in view of "bfpoLink" on "homeDeliveryPage"
  And I click on "bfpoLink" on "homeDeliveryPage"
  Then I should see "bfpoHeaderText" as "BFPO address format" on "homeDeliveryPage"
  And I should see "bfpoPara1Text" as "It is important that all mail sent through the BFPO system is addressed correctly to ensure a smooth delivery to its destination address." on "homeDeliveryPage"
  And I should see "bfpoPara2Text" as "The following information is provided as a guide when addressing mail to BFPO locations including Exercise & Operation:" on "homeDeliveryPage"
  And I should see "bfpoCloseLink" exist on "homeDeliveryPage"
  And I should see "bfpoCloseButton" exist on "homeDeliveryPage"
  And I click on "bfpoCloseButton" on "homeDeliveryPage"

@automated @DBNHST-83
Scenario Outline: Navigate to Debenhams home delivery address page from above scenario and validate postcode lookup in new address
  When I am in view of "findAnotherAddressLink" on "homeDeliveryPage"
  And I click on "findAnotherAddressLink" on "homeDeliveryPage"
  Then I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcode" on "homeDeliveryPage"
  When I click on "findYourAddressButton" on "homeDeliveryPage"
  Then I should see "address" exist on "homeDeliveryPage"
  And I should see "addressSelectDebenhams" exist on "homeDeliveryPage"
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "firstNameError" as "The first name field cannot be empty." on "homeDeliveryPage"
  And I should see "lastNameError" as "The last name field cannot be empty." on "homeDeliveryPage"
  And I should see "phoneNumberError" as "Please enter a valid phone number." on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | houseNumber | postcode |
    | Test1     | User1    | 9876543210  | 0           | E16DU    |

@automated @DBNHST-83
Scenario Outline: Navigate to Debenhams home delivery address page from above scenario and pre filled address when valid address id provided
  When I am in view of "findAnotherAddressLink" on "homeDeliveryPage"
  And I click on "findAnotherAddressLink" on "homeDeliveryPage"
  And I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcode" on "homeDeliveryPage"
  And I click on "findYourAddressButton" on "homeDeliveryPage"
  Then I should see value of "houseNumber" as "<houseNoPreFill>" on "homeDeliveryPage"
  And I should see value of "addressLine1" as "<addressL1PreFill>" on "homeDeliveryPage"
  And I should see value of "country" as "<country>" on "homeDeliveryPage"
  And I should see value of "city" as "<city>" on "homeDeliveryPage"
  And I should see value of "postcodeManual" as "<postcode1>" on "homeDeliveryPage"
  And I should not see "findYourAddressButton" on "homeDeliveryPage"
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"
  When I am in view of "useThisAddressButton" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"

  Examples:
    | firstName | lastName | phoneNumber | houseNumber | postcode | houseNoPreFill    | addressL1PreFill | country | city   | postcode1 |
    | Test      | User     | 9876542210  | 11          | E14BA    | 11 Anchor Terrace | Cephas Avenue    | GB      | LONDON | E1 4BA    |

@automated @DBNHST-83
Scenario Outline: Validate the above filled saved address on checkout page
  When I am in view of "addressContainer" on "homeDeliveryPage"
  Then I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "savedNewAddressLine1" as "<deliveryAddressLine1>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine2" as "<deliveryAddressLine2>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine3" as "<deliveryAddressLine3>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine4" as "<deliveryAddressLine4>" on "homeDeliveryPage"

  Examples:
    | deliveryAddressLine1 | deliveryAddressLine2            | deliveryAddressLine3 | deliveryAddressLine4 |
    | Mrs Test User        | 11 Anchor Terrace Cephas Avenue | LONDON E1 4BA        | United Kingdom       |

@automated @DBNHST-70
Scenario: Validate the delivery option where next nominated option should be disabled as product not available for the same
  When I am in view of "deliveryTypeheaderText" on "deliveryOptionPage"
  Then I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"
  And I should see "nextNominatedOptionHeaderText" containing "Next or Nominated Day or Evening" on "deliveryOptionPage"
  And I should see "nextNominatedOptionText" containing "Sorry - we are unable to offer this option. Return to your shopping bag if you'd like to amend your order" on "deliveryOptionPage"
  And I should see "standardOptionHeaderText" containing "Standard UK Delivery" on "deliveryOptionPage"
  And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"

@automated @DBNHST-83
Scenario Outline: Validate the delivery address field values when edit address link is selected
  When I am in view of "addressContainer" on "homeDeliveryPage"
  And I click on "editAddressLink" on "homeDeliveryPage"
  Then I should see value of "firstName" as "<firstName>" on "homeDeliveryPage"
  And I should see value of "lastName" as "<lastName>" on "homeDeliveryPage"
  And I should see value of "phoneNumber" as "<phoneNumber>" on "homeDeliveryPage"
  #And I should see value of "country" as "<country>" on "homeDeliveryPage"
  And I should see value of "houseNumber" as "<houseNo>" on "homeDeliveryPage"
  And I should see value of "addressLine1" as "<addressLine1>" on "homeDeliveryPage"
  And I should see value of "city" as "<city>" on "homeDeliveryPage"
  And I should see value of "country" as "<country>" on "homeDeliveryPage"
  And I am in view of "postcodeManual" on "homeDeliveryPage"
  And I should see value of "postcodeManual" as "<postcode>" on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | country | houseNo           | addressLine1  | city   | postcode |
    | Test      | User     | 9876542210  | GB      | 11 Anchor Terrace | Cephas Avenue | LONDON | E1 4BA   |

@automated @DBNHST-83
Scenario Outline: Validate user is able to edit the name and postcode and save the new address
  When I am in view of "firstName" on "homeDeliveryPage"
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I am in view of "postcodeManual" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcodeManual" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  When I am in view of "addressContainer" on "homeDeliveryPage"
  Then I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "savedNewAddressLine1" as "<deliveryAddressLine1>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine2" as "<deliveryAddressLine2>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine3" as "<deliveryAddressLine3>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine4" as "<deliveryAddressLine4>" on "homeDeliveryPage"

  Examples:
    | firstName | lastName | postcode | deliveryAddressLine1 | deliveryAddressLine2            | deliveryAddressLine3 | deliveryAddressLine4 |
    | Debs      | Tester   | E1 6DU   | Mrs Debs Tester      | 11 Anchor Terrace Cephas Avenue | LONDON E1 6DU        | United Kingdom       |

@manual @DBNHST-
Scenario: Validate home address section inline errors with empty fields

@manual @DBNHST-
Scenario: Validate home address section for international country

@manual @DBNHST- @Issue
Scenario: Validate saved home address for international country

@manual @DBNHST- @Issue
Scenario: Validate saved home address when user navigated back from payment page to delivery section using change delivery option link
