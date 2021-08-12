# DebsCC - Product is available for Debs store collection but not available for Parcel Shop Collection -pDpDsOnlyAvailableUrl

Feature: Test complete journey for a PUDO DebsCC SKU

@automatedPudoSanity @PUDO @DEBD-3572  @DEBD-3221
Scenario: Logout from Debenhams site
    Given I navigate to "loginUrl"
    When I click on "tab1" on "loginPage"
    And I enter "testpudo@gmail.com" in "emailAddressFieldSignIn" on "loginPage"
    And I enter "test1234" in "passwordField" on "loginPage"
    And I click on "signInButton" on "loginPage"
    And I wait for "5000" milliseconds
    Given I logout

@automatedPudoSanity @PUDO @DEBD-3572  @DEBD-3221
Scenario: Validate the PUDO Click & Collect delivery options on pdp for DebsCC products
    Given I navigate to "pDpDsOnlyAvailableUrl"
    And I should see "deliveryReturnAccordion" exist on "pdpPage"
    And I should see "deliveryReturnText" as "Delivery / Returns" on "pdpPage"
    When I "open" "deliveryReturnAccordion" accordion on "pdpPage"
    Then I should see "deliveryReturnHomeDelivery" exist on "pdpPage"
    And I should see "pudoClickAndCollectOption" exist on "pdpPage"
    And I should see "pudoClickAndCollectOptionHeading" as "UK Click & Collect" on "pdpPage"
    And I should see "pudoClickAndCollectDebsOption" containing "Collect from store" on "pdpPage"
    And I should see "pudoClickAndCollectDebsOption" containing "(Within 2 working days)" on "pdpPage"
    And I should see "pudoClickAndCollectDebsOptionPrice" as "FREE" on "pdpPage"
    And I should see "pudoClickAndCollectStandardParcelOptionDisabled" exist on "pdpPage"
    And I should see "pudoClickAndCollectStandardParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
    And I should see "pudoClickAndCollectStandardParcelOption" containing "(Within 5 working days)" on "pdpPage"
    And I should see "pudoClickAndCollectStandardParcelOptionPrice" as "£1.99" on "pdpPage"
    And I should see "pudoClickAndCollectExpressParcelOptionDisabled" exist on "pdpPage"
    And I should see "pudoClickAndCollectExpressParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
    And I should see "pudoClickAndCollectExpressParcelOption" containing "(Next day - order before 9pm)" on "pdpPage"
    And I should see "pudoClickAndCollectExpressParcelOptionPrice" as "£3.99" on "pdpPage"
    And I should see "pudoMoreInfoClickAndCollectLink" exist on "pdpPage"
    And I should see "pudoMoreInfoClickAndCollectLink" exist on "pdpPage"
    And I should see "deliveryReturnIntDelivery" exist on "pdpPage"
    And I should see "pudoNonReturnMessaging" exist on "pdpPage"

@automatedPudoSanity @PUDO @DEBD-3573 @DEBD-3222
Scenario: Validate the tooltip when PUDO Parcel Click & Collect delivery options are not available
    Then I add the product to bag and go to my bag page
    And I should see "pDpDsOnlyAvailableName" product name exist on myBagPage
    Then I am in view of "deliveryOptionSection" on "myBagPage"
    And I should see "deliveryOptionSection" exist on "myBagPage"
    And I should see "availableDeliveryOption" exist on "myBagPage"
    And I validate "Standard" fullfillment option "enable" on myBagPage
    And I validate "Next or nominated day" fullfillment option "enable" on myBagPage
    And I validate "Collect from store" fullfillment option "enable" on myBagPage
    And I validate "Collect from ParcelShop" fullfillment option "disable" on myBagPage
    And I validate "International" fullfillment option "enable" on myBagPage
    And I click and validate "Standard" fullfillment option text as "Standard delivery (Within 5 working days)£3.49 or FREE on orders £50 or over" on myBagPage
    And I click and validate "Next or nominated day" fullfillment option text as "Next day - 7 days a week between 8am to 6pm (Order by 9pm Sun-Fri, 6pm Sat)£3.99Nominated day - 7 days a week between 8am to 6pm (Order by 9pm Sun-Fri, 6pm Sat)£3.99" on myBagPage
    And I click and validate "Collect from ParcelShop" fullfillment option text as "Not available for this item" on myBagPage
    And I click and validate "Collect from store" fullfillment option text as "Collect from store (Within 2 working days)FREE" on myBagPage
    And I click and validate "International" fullfillment option text as "FREE on orders over£50 or from £5" on myBagPage
    
# ===========================PUDO Delivery Landing Page=======================================================================    

@automatedPudoSanity @PUDO @DEBD-3224
Scenario: Validate the Click & Collect Delivery landing Page
    Then I store details from myBag to validate later
    Then I navigate to delivery options as guest user
    Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
    And I should see "homeDeliveryCTA" as "Home Delivery" on "deliveryOptionPage"
    And I should see "clickCollectCTA" as "Click & Collect" on "deliveryOptionPage"
    And I should see "clickCollectText1" as "Delivered to a Debenhams store of your choice - simply collect at your convenience. Free on all orders." on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3226
Scenario: Validate the elements displayed when user selects Click & Collect
    When I click on "clickCollectOption" on "deliveryOptionPage"
    And I should see "headerText" as "Where would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"

# ===========================PUDO List/Map View======================================================================= 

@automatedPudoSanity @PUDO @DEBD-3226
Scenario Outline: Validate the postcode search result
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
    And I should see "listView" as "List view" on "locateStorePage"
    And I should see "mapView" as "Map view" on "locateStorePage"
    And I count number of "listViewOptions" to be "<max_count>" on "locateStorePage"
    And I should see "firstDebsStoreNameListView" as "STAFF ONLY - SUPPORT CENTRE" on "locateStorePage"
    And I should see "firstDebsStoreListView" exist on "locateStorePage"
    And I should see "firstDebsStorePriceListView" exist on "locateStorePage"
    And I should see "firstDebsStoreMilesListView" exist on "locateStorePage"
    And I should see "firstDebsStoreStoreOpeningListView" exist on "locateStorePage"
    And I should see "firstDebsStoreSelectStoreButtonListView" exist on "locateStorePage"
    And I should not see "hermesParcelShopListView" on "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I should see "storeNameMapView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "selectStoreButtonMapView" exist on "locateStorePage"

    Examples:
        | storeLocateName | max_count | searchResultText       |
        | E16FQ           |         5 | 5 results for "E16FQ"   | 

@automatedPudoSanity @PUDO @DEBD-3226
Scenario: Verify that user is able to select a different Debenhams store from the collection store list
    And I click on "listView" on "locateStorePage"
    Then I "select" "London - Oxford Street" store "3.03 Miles" from "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I should see "storeNameMapView" as "London - Oxford Street" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should not see "storeCollectionMapView" containing "Telephone" on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

# =============================Debs Store Collection Confirmation==================================================================

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify the Collection Location section for Debenhams store
    And I click on "listView" on "locateStorePage"
    Then I "select" "Staff only - Support Centre" store "2.71 Miles" from "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I should see "storeNameMapView" as "Staff only - Support Centre" on "locateStorePage"
    And I click on "selectStoreButton" on "locateStorePage"
    And I should see "collectionConfirmationTitle" as "Collection location" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreName" as "Staff only - Support Centre" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreMiles" as "2.71 Miles" on "deliveryOptionPage"
    And I click on "collectionConfirmationStoreMapOpeningHoursCTA" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreOpeningHours" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationMap" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationMapDebsIcon" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreAddress" exist on "deliveryOptionPage"
    And I should not see "collectionConfirmationStoreTelephone" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreCollectionLocation" exist on "deliveryOptionPage"
    And I click on "collectionConfirmationStoreMapOpeningHoursCloseCTA" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreChangeStoreCTA" exist on "deliveryOptionPage"
    And I should see "debsDeliveryConfirmationMsg" containing "Your order will be ready to collect from" on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify that user is does not get 2(Standard & Express PUDO) delivery option when a Debenhams store is choosen
    And I should not see "pudoStandardRadioButton" on "deliveryOptionPage"
    And I should not see "pudoExpressRadioButton" on "deliveryOptionPage"
    And I should see "debsDeliveryConfirmationMsg" containing "Your order will be ready to collect from" on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    And I should see "disclaimerMsg" as "*We will keep your items in-store for 14 days from this date, after which they will be returned to our warehouse." on "deliveryOptionPage"

# ==============================Change Store Collection Confirmation===========================================================

@automatedPudoSanity @PUDO @DEBD-3257
Scenario Outline: Verify that user is able to change store using change store link under Collection confirmation
    And I click on "collectionConfirmationStoreChangeStoreCTA" on "deliveryOptionPage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"    

Examples:
    | storeLocateName | searchResultText       |
    | E16FQ           | 5 results for "E16FQ"   | 

 # ===========================Debs Payment Page=======================================================================    

@automatedPudoSanity @PUDO @DEBD-3231
Scenario: Verify that Payment page when a Debenhams Store delivery choosen as a delivery method
    Then I "select" "Staff only - Support Centre" store "2.71 Miles" from "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I should see "storeNameMapView" as "Staff only - Support Centre" on "locateStorePage"
    And I click on "selectStoreButton" on "locateStorePage"
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "headerText" as "Payment" on "paymentPage"
    Then I should scroll to "orderSummaryAccordion" on "paymentPage"
    When I "open" "orderSummaryAccordion" accordion on "paymentPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "debsStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "Staff only - Support Centre," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Debenhams store" on "paymentPage"
    And I should see "deliveryCost" as "FREE" on "paymentPage"

# ===============================Debs Order Confirmation=============================================================================================

@automatedPudoSanity @PUDO @DEBD-3232
Scenario Outline: Verify that user is able to place order with Debenhams store delivery option
    Then I select new billing address and provide UK address details and use this address
    When I am in view of "creditCardIDField" on "paymentPage"
    And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
    Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
    And I should see "creditCardExpiryMonth" exist on "paymentPage"
    And I should see "creditCardExpiryYear" exist on "paymentPage"
    And I should see "creditCardSecurityNumber" exist on "paymentPage"
    And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
    When I am in view of "creditCardIDField" on "paymentPage"
    Then I click on "creditCardDateJanMonth" on "paymentPage"
    And I click on "creditCardDateNextYear" on "paymentPage"
    And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
    Then I click on "placeOrderButton" on "paymentPage"

  Examples:
    | credit_card_number | sec_num_digits_text  | cc_number           | security_num |
    | 4111111111111111   | 3 digits on the back | 4111 1111 1111 1111 | 123          |

@automatedPudoSanity @PUDO @DEBD-3232
Scenario: Verify that Order Confirmation page when a Standard PUDO delivery choosen as a delivery method
    Then I wait for "30000" milliseconds
    Then I should see "webLoyaltyPopUp" exist on "orderConfirmationPage"
    And I should see "webLoyaltySection" exist on "orderConfirmationPage"
    Then I click on "webLoyaltyPopUpCloseIcon" on "orderConfirmationPage"
    And I should see "orderConfirmationTitle" as "We’ve received your order" on "orderConfirmationPage"
    And I should see "orderConfirmationStoreName" as "Staff only - Support Centre" on "orderConfirmationPage"
    And I should see "orderConfirmationStoreAdd" exist on "orderConfirmationPage"
    And I should see "orderConfirmationStoreCollectionLocation" exist on "orderConfirmationPage"
    And I should see "orderConfirmationStoreOpeningHours" exist on "orderConfirmationPage"
    And I should see "orderConfirmationMapView" exist on "orderConfirmationPage"
    And I should see "orderConfirmationMapViewDebsLogo" exist on "orderConfirmationPage"
    And I should see "orderConfirmationTitle" as "We’ve received your order" on "orderConfirmationPage"
    And I should see "orderConfirmationDeliveryType" as "Click & Collect - Debenhams store" on "orderConfirmationPage"
    And I should see "orderConfirmationDeliveryPrice" as "FREE" on "orderConfirmationPage"
    And I should see "orderConfirmationMapViewCollectionMsg" containing "We'll email you once your order is ready to collect - please wait for this before heading into store." on "orderConfirmationPage"
    And I should see "orderConfirmationDeliveryLeadTime" containing "Your order will be ready to collect on" on "orderConfirmationPage"

# ===============================================================================================================================================