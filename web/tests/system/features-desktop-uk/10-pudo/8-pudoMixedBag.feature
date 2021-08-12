Feature: Test Delivery Journey for Mixed bag 

# DebParcelStoreCC - Product is available for both Debs & Parcel Shop Collection (standard and express)-pDpDsPsAvailableUrl
# DebParcelStoreExpressCC - Product is available for both Debs & an express service Parcel Shop Collection -pDpDsEPsAvailableUrl
# DebParcelStoreStandardCC - Product is available for both Debs & a standard service Parcel Shop Collection -pDpDsSPsAvailableUrl
# DebsCC - Product is available for Debs store collection but not available for Parcel Shop Collection -pDpDsOnlyAvailableUrl
# NoCC - Product is not available for Debs store collection and Parcel Shop Collection
  
@automatedPudoSanity @PUDO-MixedBag @PUDO @DEBD-3299
Scenario: Validate the logout
    # Given I navigate to "loginUrl"
    # When I click on "tab1" on "loginPage"
    # And I enter "testpudo@gmail.com" in "emailAddressFieldSignIn" on "loginPage"
    # And I enter "test1234" in "passwordField" on "loginPage"
    # And I click on "signInButton" on "loginPage"
    # And I wait for "5000" milliseconds
    Given I logout
    And I wait for "5000" milliseconds

@automatedPudoSanity @PUDO-MixedBag @PUDO @DEBD-3299
Scenario Outline: Add different products to verify the delivery options tooltip
    Given I navigate to "<pdPUrls>"
    And I store name of product and select save item on pdpPage

 Examples:
  |  pdPUrls               |
  |  pDpDsEPsAvailableUrl  |
  |  pDpDsSPsAvailableUrl  |
  |  pDpDsOnlyAvailableUrl |
#   |  pDpPsOnlyAvailableUrl |
#   |  pDpSPsOnlyAvailableUrl|
  |  pDpFurni2EspotAvailUrl|
  |  pdpCCNotAvialableUrl  |
#   |  ConcessionWomenswear  |

# DebParcelStoreExpressCC = DebParcelStoreCC + DebParcelStoreExpressCC
@automatedPudoSanity @PUDO-MixedBag @PUDO @DEBD-3299
Scenario: Validate the delivery journey for combination DebParcelStoreCC + DebParcelStoreExpressCC on My bag
   Given I navigate to "pDpDsPsAvailableUrl"
   And I store name of product and select save item on pdpPage
   And I select available size and add to bag on pdpPage
   When I click on "viewBasketCheckoutButton" on "pdpPage"
   Then I should see "myBagPageHeader" exist on "myBagPage"
   And I should see "pDpDsPsAvailableName" product name exist on myBagPage
   And I "add" product "pDpDsEPsAvailableName" from "myBagPage"
#    Then I store details from myBag to validate later
   Then I navigate to delivery options as guest user
   Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
   And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
   And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
   And I should see "clickCollectText1" as "Delivered to a Debenhams store for Free, or choose from over 4,500 ParcelShop locations from £1.99." on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3299
Scenario Outline: Validate the Store list in for to the above scenario on the Delivery Page   
    When I click on "clickCollectOption" on "deliveryOptionPage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
    And I count number of "listViewOptions" to be "<max_count>" on "locateStorePage"
    And I should see "mapView" exist on "locateStorePage"
    And I should see "firstDebsStoreListView" exist on "locateStorePage"
    And I should see "firstDebsStoreNameListView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "firstDebsStoreAddListView" exist on "locateStorePage"
    And I should see "firstDebsStoreMilesListView" exist on "locateStorePage"
    And I should see "storeNameMapView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

    Examples:
        | storeLocateName | max_count  | searchResultText       |
        | E16FQ           |         10 | 10 results for "E16FQ"   |  

@automatedPudoSanity @PUDO @DEBD-3226
Scenario: Verify that user is able to select a Hermes Parcel store from the collection store list
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
    And I should see "storeNameMapView" as "Nisa Local" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should not see "storeCollectionMapView" containing "Collection location" on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

# ===========================PUDO Parcel Store Collection Confirmation=======================================================================    

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify that user is able to see a Map showing the pointer and Parcel shop logo, Parcelshop logo, Store name, distance in miles, store address,Store telephone no., Change store CTA & Delivery lead time when a Parcel store is choosen as collection store
    And I click on "selectStoreButton" on "locateStorePage"
    And I should see "collectionConfirmationTitle" as "Collection location" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreName" as "Nisa Local" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreMiles" as "1.04 Miles" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreOpeningHours" as "Opening hours" on "deliveryOptionPage"
    And I should see "collectionConfirmationMap" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationMapHermesIcon" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreAddress" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreTelephone" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreChangeStoreCTA" exist on "deliveryOptionPage"
    And I should not see "collectionConfirmationStoreCollectionLocation" on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify that user is getting only one (Express PUDO) delivery option when a Hermes Parcel store is choosen as collection store
    And I should see "pudoCollectionConfirmationOptionsTitle" as "When would you like to collect your order?" on "deliveryOptionPage"
    And I should not see "pudoStandardRadioButton" on "deliveryOptionPage"
    And I should see "pudoExpressRadioButton" exist on "deliveryOptionPage"
    And I verify default selected delivery option is "ExpressPudo"
    And I should see "pudoDeliveryConfirmationMsg" as "We'll email you once your order arrives in store." on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    And I should see "disclaimerMsg" as "We will keep your item in parcel shop for 10 days from this date, after which they will be returned to our warehouse." on "deliveryOptionPage"

# ===========================Standard PUDO Payment Page=======================================================================    

@automatedPudoSanity @PUDO @DEBD-3230 @DEBD-3231
Scenario: Verify that user is able to select Standard PUDO delivery option for the selected hermes Parcel store and navigate to Payment Page
    Then I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "hermesStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "Nisa Local," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Next day delivery" on "paymentPage"
    And I should see "deliveryCost" as "£3.99" on "paymentPage"

# ============================================================================================================================

# DebParcelStoreStandardCC = DebParcelStoreCC + DebParcelStoreStandardCC
@automatedPudoSanity @PUDO @DEBD-3299
Scenario: Validate the delivery journey for combination DebParcelStoreCC + DebParcelStoreStandardCC on My bag
   Then I click on "editShoppingBagLink" on "paymentPage"
   Then I should see "myBagPageHeader" exist on "myBagPage"
   And I should see "pDpDsPsAvailableName" product name exist on myBagPage
   And I "Remove" product "pDpDsEPsAvailableName" from "myBagPage"
   And I "add" product "pDpDsSPsAvailableName" from "myBagPage"
#    Then I store details from myBag to validate later
   Then I click on "checkoutButton" on "myBagPage"
   Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
   And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
   And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
   And I should see "clickCollectText1" as "Delivered to a Debenhams store for Free, or choose from over 4,500 ParcelShop locations from £1.99." on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3299
Scenario Outline: Validate the Store list in for to the above scenario on the Delivery Page   
    When I click on "clickCollectOption" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Where would you like to collect from?" on "locateStorePage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
    And I count number of "listViewOptions" to be "<max_count>" on "locateStorePage"
    And I should see "mapView" exist on "locateStorePage"
    And I should see "firstDebsStoreListView" exist on "locateStorePage"
    And I should see "firstDebsStoreNameListView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "firstDebsStoreAddListView" exist on "locateStorePage"
    And I should see "firstDebsStoreMilesListView" exist on "locateStorePage"
    And I should see "storeNameMapView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

 Examples:
        | storeLocateName | max_count  | searchResultText       |
        | E16FQ           |         10 | 10 results for "E16FQ"   |    

@automatedPudoSanity @PUDO @DEBD-3226
Scenario: Verify that user is able to select a Hermes Parcel store from the collection store list
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
    And I should see "storeNameMapView" as "Nisa Local" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should not see "storeCollectionMapView" containing "Collection location" on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

# ===========================PUDO Parcel Store Collection Confirmation=======================================================================    

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify that user is able to see a Map showing the pointer and Parcel shop logo, Parcelshop logo, Store name, distance in miles, store address,Store telephone no., Change store CTA & Delivery lead time when a Parcel store is choosen as collection store
    And I click on "selectStoreButton" on "locateStorePage"
    And I should see "collectionConfirmationTitle" as "Collection location" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreName" as "Nisa Local" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreMiles" as "1.04 Miles" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreOpeningHours" as "Opening hours" on "deliveryOptionPage"
    And I should see "collectionConfirmationMap" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationMapHermesIcon" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreAddress" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreTelephone" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreChangeStoreCTA" exist on "deliveryOptionPage"
    And I should not see "collectionConfirmationStoreCollectionLocation" on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify that user is getting only 1(Standard PUDO) delivery option when a Hermes Parcel store is choosen as collection store
    And I should see "pudoCollectionConfirmationOptionsTitle" as "When would you like to collect your order?" on "deliveryOptionPage"
    And I should see "pudoStandardRadioButton" exist on "deliveryOptionPage"
    And I should not see "pudoExpressRadioButton" on "deliveryOptionPage"
    And I verify default selected delivery option is "StandardPudo"
    And I should see "pudoDeliveryConfirmationMsg" as "We'll email you once your order arrives in store." on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    And I should see "disclaimerMsg" as "We will keep your item in parcel shop for 10 days from this date, after which they will be returned to our warehouse." on "deliveryOptionPage"

# ===========================Standard PUDO Payment Page=======================================================================    

@automatedPudoSanity @PUDO @DEBD-3230 @DEBD-3231
Scenario: Verify that user is able to select Standard PUDO delivery option for the selected hermes Parcel store and navigate to Payment Page
    Then I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "hermesStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "Nisa Local," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Standard delivery" on "paymentPage"
    And I should see "deliveryCost" as "£1.99" on "paymentPage"

# ===================================================================================================================================      

# DebsCC = DebParcelStoreCC + DebsCC
@automatedPudoSanity @PUDO @DEBD-3299
Scenario: Validate the delivery journey for combination DebParcelStoreCC + DebsCC on My bag
   Then I click on "editShoppingBagLink" on "paymentPage"
   Then I should see "myBagPageHeader" exist on "myBagPage"
   And I should see "pDpDsPsAvailableName" product name exist on myBagPage
   And I "Remove" product "pDpDsSPsAvailableName" from "myBagPage"
   And I "add" product "pDpDsOnlyAvailableName" from "myBagPage"
#    Then I store details from myBag to validate later
   Then I click on "checkoutButton" on "myBagPage"
   Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
   And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
   And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
   And I should see "clickCollectText1" as "Delivered to a Debenhams store of your choice - simply collect at your convenience. Free on all orders." on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3299
Scenario Outline: Validate the Store list in for to the above scenario on the Delivery Page   
    When I click on "clickCollectOption" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Where would you like to collect from?" on "locateStorePage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
    And I count number of "listViewOptions" to be "<max_count>" on "locateStorePage"
    And I should see "mapView" exist on "locateStorePage"
    And I should see "firstDebsStoreListView" exist on "locateStorePage"
    And I should see "firstDebsStoreNameListView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "firstDebsStoreAddListView" exist on "locateStorePage"
    And I should see "firstDebsStoreMilesListView" exist on "locateStorePage"
    And I should see "storeNameMapView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

 Examples:
        | storeLocateName | max_count  | searchResultText       |
        | E16FQ           |         5 | 5 results for "E16FQ"   |    

@automatedPudoSanity @PUDO @DEBD-3226
Scenario: Verify that user is able to select a different Debenhams store from the collection store list
    Then I "select" "London - Oxford Street" store "3.03 Miles" from "locateStorePage"
    And I should see "storeNameMapView" as "London - Oxford Street" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should not see "storeCollectionMapView" containing "Telephone" on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

# ===========================Debenhams Store Collection Confirmation=======================================================================    

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify that user is able to see a Map showing the pointer and Parcel shop logo, Parcelshop logo, Store name, distance in miles, store address,Store telephone no., Change store CTA & Delivery lead time when a Debenhams store is choosen as collection store
    And I click on "selectStoreButton" on "locateStorePage"
    And I should see "collectionConfirmationTitle" as "Collection location" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreName" as "London - Oxford Street" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreMiles" as "3.03 Miles" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreOpeningHours" as "Opening hours" on "deliveryOptionPage"
    And I should see "collectionConfirmationMap" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationMapDebsIcon" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreAddress" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreCollectionLocation" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreChangeStoreCTA" exist on "deliveryOptionPage"
    And I should not see "collectionConfirmationStoreTelephone" on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify that user is does not get 2(Standard & Express PUDO) delivery option when a Debenhams store is choosen as collection store
    And I should not see "pudoStandardRadioButton" on "deliveryOptionPage"
    And I should not see "pudoExpressRadioButton" on "deliveryOptionPage"
    And I should see "debsDeliveryConfirmationMsg" containing "Your order will be ready to collect from" on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    And I should see "disclaimerMsg" as "*We will keep your items in-store for 14 days from this date, after which they will be returned to our warehouse." on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3231
Scenario: Verify that Payment page when a Debenhams Store delivery choosen as a delivery method
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "headerText" as "Your order" on "paymentPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "debsStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "London - Oxford Street," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Debenhams store" on "paymentPage"
    And I should see "deliveryCost" as "FREE" on "paymentPage"

# ==============================================================================================================================================       

# NoCC = DebParcelStoreCC + NoCC(furniture)
@notAutomated @PUDO @DEBD-3299
Scenario: Validate the delivery journey for combination DebParcelStoreCC + NoCC(furniture) on My bag
   Then I click on "editShoppingBagLink" on "paymentPage"
   Then I should see "myBagPageHeader" exist on "myBagPage"
   And I should see "pDpDsPsAvailableName" product name exist on myBagPage
   And I "Remove" product "pDpDsSPsAvailableName" from "myBagPage"
   And I "add" product "pDpFurni2EspotAvailName" from "myBagPage"
#    Then I store details from myBag to validate later
   Then I click on "checkoutButton" on "myBagPage"
   Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
   And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
   And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
   And I should see "clickCollectOptionDisabled" exist on "deliveryOptionPage"
   And I should see "clickCollectText1" as "Sorry, some of the items in your order are not available for Click & Collect. Please return to your shopping bag <link to bag> if you'd like to amend your order." on "deliveryOptionPage"
  
# NoCC = DebParcelStoreCC + NoCC(Dress)
@automatedPudoSanity @PUDO @DEBD-3299
Scenario: Validate the delivery journey for combination DebParcelStoreCC + NoCC(Dress) on My bag
#    Given I navigate to "basketCheckoutUrl"
   Then I click on "editShoppingBagLink" on "paymentPage"
   Then I should see "myBagPageHeader" exist on "myBagPage"
   And I should see "pDpDsPsAvailableName" product name exist on myBagPage
   And I "Remove" product "pDpDsOnlyAvailableName" from "myBagPage"
   And I "add" product "pdpCCNotAvialableName" from "myBagPage"
#    Then I store details from myBag to validate later
   Then I click on "checkoutButton" on "myBagPage"
   Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
   And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
   And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
   And I should see "clickCollectOptionDisabled" exist on "deliveryOptionPage"
   And I should see "clickCollectText1" as "Sorry, some of the items in your order are not available for Click & Collect. Please return to your shopping bag if you'd like to amend your order." on "deliveryOptionPage"   

# DebsCC = DebParcelStoreStandardCC + DebParcelStoreExpressCC
@automatedPudoSanity @PUDO @DEBD-3299
Scenario: Validate the delivery journey for combination DebParcelStoreStandardCC + DebParcelStoreExpressCC on My bag
   Given I navigate to "basketCheckoutUrl"
   Then I should see "myBagPageHeader" exist on "myBagPage"
   And I should see "pDpDsPsAvailableName" product name exist on myBagPage
   And I "Remove" product "pdpCCNotAvialableName" from "myBagPage"
   And I "add" product "pDpDsSPsAvailableName" from "myBagPage"
   And I "Remove" product "pDpDsPsAvailableName" from "myBagPage"
   And I "add" product "pDpDsEPsAvailableName" from "myBagPage"
#    Then I store details from myBag to validate later
   Then I click on "checkoutButton" on "myBagPage"
   Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
   And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
   And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
   And I should see "clickCollectText1" as "Delivered to a Debenhams store of your choice - simply collect at your convenience. Free on all orders." on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3299
Scenario Outline: Validate the Store list in for to the above scenario on the Delivery Page   
    When I click on "clickCollectOption" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Where would you like to collect from?" on "locateStorePage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
    And I count number of "listViewOptions" to be "<max_count>" on "locateStorePage"
    And I should see "mapView" exist on "locateStorePage"
    And I should see "firstDebsStoreListView" exist on "locateStorePage"
    And I should see "firstDebsStoreNameListView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "firstDebsStoreAddListView" exist on "locateStorePage"
    And I should see "firstDebsStoreMilesListView" exist on "locateStorePage"
    And I should see "storeNameMapView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

 Examples:
        | storeLocateName | max_count  | searchResultText       |
        | E16FQ           |         5 | 5 results for "E16FQ"   |    

@automatedPudoSanity @PUDO @DEBD-3226
Scenario: Verify that user is able to select a different Debenhams store from the collection store list
    Then I "select" "London - Oxford Street" store "3.03 Miles" from "locateStorePage"
    And I should see "storeNameMapView" as "London - Oxford Street" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should not see "storeCollectionMapView" containing "Telephone" on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

# ===========================Debenhams Store Collection Confirmation=======================================================================    

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify that user is able to see a Map showing the pointer and Parcel shop logo, Parcelshop logo, Store name, distance in miles, store address,Store telephone no., Change store CTA & Delivery lead time when a Debenhams store is choosen as collection store
    And I click on "selectStoreButton" on "locateStorePage"
    And I should see "collectionConfirmationTitle" as "Collection location" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreName" as "London - Oxford Street" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreMiles" as "3.03 Miles" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreOpeningHours" as "Opening hours" on "deliveryOptionPage"
    And I should see "collectionConfirmationMap" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationMapDebsIcon" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreAddress" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreCollectionLocation" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreChangeStoreCTA" exist on "deliveryOptionPage"
    And I should not see "collectionConfirmationStoreTelephone" on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify that user is does not get 2(Standard & Express PUDO) delivery option when a Debenhams store is choosen as collection store
    And I should not see "pudoStandardRadioButton" on "deliveryOptionPage"
    And I should not see "pudoExpressRadioButton" on "deliveryOptionPage"
    And I should see "debsDeliveryConfirmationMsg" containing "Your order will be ready to collect from" on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    And I should see "disclaimerMsg" as "*We will keep your items in-store for 14 days from this date, after which they will be returned to our warehouse." on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3231
Scenario: Verify that Payment page when a Debenhams Store delivery choosen as a delivery method
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "headerText" as "Your order" on "paymentPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "debsStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "London - Oxford Street," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Debenhams store" on "paymentPage"
    And I should see "deliveryCost" as "FREE" on "paymentPage"