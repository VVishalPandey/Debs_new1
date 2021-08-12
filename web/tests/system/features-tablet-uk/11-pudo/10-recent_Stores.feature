Feature: Test Debenhams Delivery Options on Checkout Delivery page validation

@notAutomated @DEBD-3224
Scenario: Validate the Click & Collect landing delivery section message for basket which is eligible for collection from store and Parcel shop both
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "deliveryOptionsURLPDP1"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  Then I navigate to delivery options as guest user
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I should see "clickCollectText1" as "Delivered to a Debenhams store (Free) or choose from over 4,500 ParcelShop locations now available (from £1.99)." on "deliveryOptionPage"

@notAutomated @DEBD-3224
Scenario: Validate the Click & Collect landing delivery section message for basket which is only eligible for collection from store
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "deliveryOptionsURLPDP1"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  Then I navigate to delivery options as guest user
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I should see "clickCollectText1" as "Delivered to a Debenhams store of your choice - simply collect at your convenience. Free on all orders" on "deliveryOptionPage"

@notAutomated @DEBD-3224
Scenario: Validate the Click & Collect landing delivery section message for basket which is not eligible for Click & Collect
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "deliveryOptionsURLPDP1"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  Then I navigate to delivery options as guest user
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I should see "clickCollectText1" as "Sorry, some of the items in your order are not available for Click & Collect. Please return to your shopping bag <link to bag> if you'd like to amend your order." on "deliveryOptionPage"  

@manual @DEBD-3299
  Scenario: Validate the switch off functionality for PUDO(both standard and express delivery) on delivery checkout page for guest user
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    When I enter "E16FQ" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should only see the Debenhams stores in list view and map view

 @manual @DEBD-3299
  Scenario: Validate the switch off functionality for PUDO(both standard and express delivery) on delivery checkout page for registered user with recently use CC from parcel store
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    Then I should not see "recentParcelStoreList" on "deliveryOptionPage"

  @manual @DEBD-3300
  Scenario: Validate the switch off functionality for PUDO(only express delivery) on delivery checkout page for guest user
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    When I enter "E16FQ" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should only see one option for Parcel store i.e "Click & Collect - 5 working days £x.xx Collection on Wednesday 15 Oct" in list view and map view
    When I select a parcel store
    And I should not see the tilte "When would you like to collect your order?" in the Collect confirmation section
    Then I should only see "Click & Collect - 5 working days £x.xx Collection on Wednesday 15 Oct" in Collection confirmation

 @manual @DEBD-3300
  Scenario: Validate the switch off functionality for PUDO(only express delivery) on delivery checkout page for registered user with recently use CC from parcel store
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    Then I should see "recentParcelStoreList" exist on "deliveryOptionPage"
    And I should only see "Click & Collect - 5 working days £x.xx Collection on Wednesday 15 Oct" detail for the "recentParcelStoreList" on myBagPage
    When I click on "recentParcelStore" on "deliveryOptionPage"
    And I should not see the tilte "When would you like to collect your order?" in the Collect confirmation section
    Then I should only see "Click & Collect - 5 working days £x.xx Collection on Wednesday 15 Oct" in Collection confirmation

@manual @DEBD-3227
  Scenario: Validate Use current location is working when it is enabled on the device
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"
    When I click on "useCurrentLocation" on "deliveryOptionPage"
    Then I should see "locateStoreFieldText" exist on "deliveryOptionPage"
    And I should see the appropriate store in list view and map view as per the current location 

 @manual @DEBD-3227
 Scenario: Validate Use current location is working when it is disabled on the device
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"
    When I click on "useCurrentLocation" on "deliveryOptionPage"
    Then I should see "errorMessage" as "We can’t access your current location, please turn on location services and try again or alternatively use the search bar" on "locateStorePage"
    And I should see "browserNotification" as "www.Debenhams.com wants to know your location Allow or Block" on "locateStorePage"
  
@manual @DEBD-3227
Scenario: Validate Use current location is working when user enables location service on device in continuation to the above scenario
    When I click on "useCurrentLocation" on "deliveryOptionPage"
    And I should see "nativebrowserNotification" as "Allow Google to access your location with option of Allow while using app, Allow once, Don't allow" on "locateStorePage"
    
@manual @DEBD-3227
Scenario: Validate Use current location is working when user clicks on Allow button on the device 
    When I click on "allowCurrentLocationNative" on "locateStorePage"
    Then I should see "nativeNotification" as "Debenhams would like to use your current location Ok or Don't Allow" on "locateStorePage"
    And I click on "allowButton" on "locateStorePage"
    And I should not see "nativeNotification" on "locateStorePage"
    Then I should see "locateStoreFieldText" exist on "deliveryOptionPage"
    And I should see the appropriate store in list view and map view as per the current location

@manual @DEBD-3227
Scenario: Validate Use current location is working when user clicks on Block button on the device
    When I click on "blockCurrentLocation" on "locateStorePage"
    And I should not see "nativeNotification" on "locateStorePage"
    Then I should not see "locateStoreFieldText" on "deliveryOptionPage"
    And I should not see the appropriate store in list view and map view as per the current location

@manual @DEBD-3228
Scenario: Validate Recent Store is displayed with a product in bag eligible for Debenhams and Parcel store collection for a registered user who has already place order using CC delivery
    Given I logout
    Then I am on my details page
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    Then I should see "recentStore" as "Debenhams-Oxford Street" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"

@manual @DEBD-3228
Scenario: Validate Recent Store is displayed even after user search for a postcode using find nearest store
    Given I logout
    Then I am on my details page
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    Then I should see "recentStore" as "Debenhams-Oxford Street" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"
    When I enter "E16DU" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "totalSearchResultText" as "XX results for ABCDEF" on "locateStorePage"
    When I should scroll to "recentStore" on "myBagPage"
    Then I should see "recentStore" as "Debenhams-Oxford Street" on "deliveryOptionPage"

@manual @DEBD-3228
Scenario: Validate Debenhams store details in Recent Store section
    Then I should see "recentstoreDebenhamsLogo" exist on "deliveryOptionPage"
    Then I should see "recentstoreDebenhamsLocation" exist on "deliveryOptionPage"
    Then I should see "recentstoreDebenhamsStoreAddress" exist on "deliveryOptionPage"
    Then I should see "recentstoreDebenhamsDeliveryLeadTimesAndPrice" exist on "deliveryOptionPage"
    Then I should see "recentstoreDebenhamsSelectstoreCTA" exist on "deliveryOptionPage"

@manual @DEBD-3536
Scenario: Validate Collection confirmation section on selecting a Debenhams store from Recent Stores
   When I click on "recentstoreDebenhamsSelectstoreCTA" on "locateStorePage"
   Then I should see "collectionConfirmationTitle" as "Collection Location" on "deliveryOptionPage"
   And I should see "debenhamsLogoConfirmation" exist on "deliveryOptionPage" 
   And I should see "debenhamsLocationConfirmation" exist on "deliveryOptionPage"
   And I should see "debenhamsStoreAddressConfirmation" exist on "deliveryOptionPage"
   And I should see "debenhamsDeliveryLeadTimeConfirmation" exist on "deliveryOptionPage"
   And I should see "mapAndOpeningHoursLinkConfirmation" exist on "deliveryOptionPage"
   And I should see "changeStoreLinkConfirmation" exist on "deliveryOptionPage"
   And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
   And I should see "storeCollectionDetails" containing "We will keep your items in-store for 14 days from" on "deliveryOptionPage"

@manual @DEBD-3536
Scenario: Validate Map & Opening hours modal popup for Collection confirmation section on selecting a Debenhams store from Recent Stores
  When I click on "mapAndOpeningHoursLinkConfirmation" on "deliveryOptionPage"
  Then I should see "map" exist on "deliveryOptionPage"
  And I should see "debenhamsLocationConfirmation" exist on "deliveryOptionPage"
  And I should see "debenhamsStoreAddressConfirmation" exist on "deliveryOptionPage"
  And I should see "debenhamsStoreCollectionLocationConfirmation" exist on "deliveryOptionPage"
  And I should see "debenhamsStoreOpeningHoursConfirmation" exist on "deliveryOptionPage"
  And I should not see "selectStoreCTA" on "deliveryOptionPage"

@manual @DEBD-3228
Scenario: Validate Recent Stores are displayed with a product in bag eligible for Debenhams and Parcel store collection for a registered user who has already place order using CC delivery from Debenhams and Parcel store both
    Given I logout
    Then I am on my details page
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    Then I should see "firstRecentUsedStore" as "Debenhams-Oxford Street" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"

@manual @DEBD-3228
Scenario: Validate Recent Stores are displayed with a product in bag eligible only for Debenhams store collection for a registered user who has already place order using CC delivery from Debenhams and Parcel store both
    Given I logout
    Then I am on my details page
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    Then I should see "firstRecentUsedStore" as "Debenhams-Oxford Street" on "deliveryOptionPage"
    Then I should not see "parcelRecentUsedStore" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"

 @manual @DEBD-3228
Scenario: Validate Recent Stores are displayed with a product in bag eligible for Debenhams and Parcel store collection for a registered user who has already place order using CC delivery from only Parcel store
    Given I logout
    Then I am on my details page
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    Then I should see "parcelRecentUsedStore" as "Debenhams-Oxford Street" on "deliveryOptionPage"
    Then I should not see "debenhamsRecentUsedStore" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"

@manual @DEBD-3228
Scenario: Validate Parcel store details in Recent Store section
    Then I should see "recentstoreParcelShopLogo" exist on "deliveryOptionPage"
    Then I should see "recentstoreParcelShopLocation" exist on "deliveryOptionPage"
    Then I should see "recentstoreParcelShopStoreAddress" exist on "deliveryOptionPage"
    Then I should see "recentstoreParcelShopDeliveryLeadTimesAndPrice" exist on "deliveryOptionPage"
    Then I should see "recentstoreParcelShopSelectstoreCTA" exist on "deliveryOptionPage"

@manual @DEBD-3539
Scenario: Validate Change store functionality in Collection confirmation section when selected store is Debenhams store from Recent Stores
    When I click on "changeStoreLinkConfirmation" on "deliveryOptionPage"
    Then I should see "recentstoreDebenhamsLogo" exist on "deliveryOptionPage"
    Then I should see "recentstoreDebenhamsLocation" exist on "deliveryOptionPage"
    Then I should see "recentstoreDebenhamsStoreAddress" exist on "deliveryOptionPage"
    Then I should see "recentstoreDebenhamsDeliveryLeadTimesAndPrice" exist on "deliveryOptionPage"
    Then I should see "recentstoreDebenhamsSelectstoreCTA" exist on "deliveryOptionPage"
    Then I should not see "collectionConfirmationTitle" as "Collection Location" on "deliveryOptionPage"    

@manual @DEBD-3536
Scenario: Validate Collection confirmation section on selecting a Parcel store from Recent Stores
   When I click on "recentstoreParcelShopSelectstoreCTA" on "locateStorePage"
   Then I should see "collectionConfirmationTitle" as "Collection Location" on "deliveryOptionPage"
   And I should see "parcelShopLogoConfirmation" exist on "deliveryOptionPage" 
   And I should see "parcelShopNameConfirmation" exist on "deliveryOptionPage"
   And I should see "parcelShopTelephoneConfirmation" exist on "deliveryOptionPage"
   And I should see "parcelShopStoreAddressConfirmation" exist on "deliveryOptionPage"
   And I should see "parcelShopCollectConfirmation" as "When would you like to collect your order?" on "deliveryOptionPage"
   And I should see "parcelShopCollectRadio1Confirmation" containing "Click & Collect - 5 working day" on "deliveryOptionPage"
   And I should see "parcelShopCollectRadio2Confirmation" containing "Click & Collect - next day" on "deliveryOptionPage"
   And I should see "mapAndOpeningHoursLinkConfirmation" exist on "deliveryOptionPage"
   And I should see "changeStoreLinkConfirmation" exist on "deliveryOptionPage"
   And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
   And I should see "storeCollectionDetails" containing "We will keep your items in-store for 14 days from" on "deliveryOptionPage"
    
@manual @DEBD-3536
Scenario: Validate Map & Opening hours modal popup for Collection confirmation section on selecting a Parcel store from Recent Stores
  When I click on "mapAndOpeningHoursLinkConfirmation" on "deliveryOptionPage"
  Then I should see "map" exist on "deliveryOptionPage"
  And I should see "parcelShopNameConfirmation" exist on "deliveryOptionPage"
  And I should see "parcelShopStoreAddressConfirmation" exist on "deliveryOptionPage"
  And I should see "parcelShopTelephoneConfirmation" exist on "deliveryOptionPage"
  And I should see "parcelShopOpeningHoursConfirmation" exist on "deliveryOptionPage"
  And I should not see "selectStoreCTA" on "deliveryOptionPage"
  And I should see "closeCTA" exist on "deliveryOptionPage"
  When I click on "closeCTA" on "deliveryOptionPage"

@manual @DEBD-3539
Scenario: Validate Change store functionality in Collection confirmation section when selected store is Parcel store from Recent Stores
    When I click on "changeStoreLinkConfirmation" on "deliveryOptionPage"
    Then I should see "recentstoreParcelShopLogo" exist on "deliveryOptionPage"
    Then I should see "recentstoreParcelShopLocation" exist on "deliveryOptionPage"
    Then I should see "recentstoreParcelShopStoreAddress" exist on "deliveryOptionPage"
    Then I should see "recentstoreParcelShopDeliveryLeadTimesAndPrice" exist on "deliveryOptionPage"
    Then I should see "recentstoreParcelShopSelectstoreCTA" exist on "deliveryOptionPage"
    Then I should not see "collectionConfirmationTitle" as "Collection Location" on "deliveryOptionPage"

@manual @DEBD-3228
Scenario: Validate Parcel store express delivery details in Recent Store section if order is being placed on Saturday
    Then I should see "recentstoreParcelShopExpressDeliveryMsg" containing "Collection on Monday" on "deliveryOptionPage"
    Then I should not see "recentstoreParcelShopExpressDeliveryMsg" containing "Collection on Sunday" on "deliveryOptionPage"

@manual @DEBD-3228
Scenario: Validate Parcel store express delivery details in Recent Store section if order is being placed a day before bank holiday
 
@manual @DEBD-3228
Scenario: Validate Recent Stores section with a product in bag eligible for only Parcel store collection for a registered user who has already place order using CC delivery from only Debenhams store
    Given I logout
    Then I am on my details page
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    And I should not see "recentStores" on "deliveryOptionPage"
    Then I should not see "parcelRecentUsedStore" on "deliveryOptionPage"
    Then I should not see "debenhamsRecentUsedStore" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"

@manual @DEBD-3228
Scenario: Validate Recent Stores section with a product in bag eligible for only Debenhams store collection for a registered user who has already place order using CC delivery from only Parcel store
    Given I logout
    Then I am on my details page
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    And I should not see "recentStores" on "deliveryOptionPage"
    Then I should not see "parcelRecentUsedStore" on "deliveryOptionPage"
    Then I should not see "debenhamsRecentUsedStore" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"

@manual @DEBD-3228
Scenario: Validate Recent Stores section when Hermes does not provide details of a store from which order has been placed before, with a product in bag eligible for only Parcel store collection for a registered user who has already place order using CC delivery from only Parcel store
    Given I logout
    Then I am on my details page
    When I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I click on "clickCollectOption" on "deliveryOptionPage"
    And I should see "recentStores" as "not available location" on "deliveryOptionPage"
    Then I should not see "parcelRecentUsedStore" on "deliveryOptionPage"
    Then I should not see "debenhamsRecentUsedStore" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"    