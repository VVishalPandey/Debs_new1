# ParcelStoreStandardCC - Product is available for a standard service Parcel Shop Collection but not available for Debs store & a express service Parcel Shop collection 
# PDP URL - http://uat-6-debenhams-progressive.mobify-storefront.com/webapp/wcs/stores/servlet/prod_10701_10001_057683453460_-1
# ParcelStoreExpressCC - Product is available for a express service Parcel Shop Collection but not available for Debs store & a standard service Parcel Shop collection 
# PDP URL - https://uat-6-debenhams-progressive.mobify-storefront.com/webapp/wcs/stores/servlet/prod_10701_10001_057612712763_-1


Feature: Test complete journey for a PUDO ParcelStoreStandardCC SKU

@automatedPudoSanity @DEBD-4039 @PUDO-MixedBag @PUDO @DEBD-3299
Scenario: Validate the logout
    # Given I navigate to "loginUrl"
    # When I click on "tab1" on "loginPage"
    # And I enter "testpudo@gmail.com" in "emailAddressFieldSignIn" on "loginPage"
    # And I enter "test1234" in "passwordField" on "loginPage"
    # And I click on "signInButton" on "loginPage"
    # And I wait for "5000" milliseconds
    Given I logout
    And I wait for "5000" milliseconds

@automatedPudoSanity @DEBD-4039 @PUDO @DEBD-3572  @DEBD-3221
Scenario: Validate the PUDO Click & Collect delivery options on pdp for ParcelStoreStandardCC products
    Given I navigate to "pDpSPsOnlyAvailableUrl"
    And I should see "prodDescSection" exist on "pdpPage"
    And I should see "deliveryReturnText" as "DELIVERY & RETURNS" on "pdpPage"
    Then I should see "deliveryReturnHomeDelivery" exist on "pdpPage"
    And I should see "pudoClickAndCollectOption" exist on "pdpPage"
    And I should see "pudoClickAndCollectOptionHeading" as "UK Click & Collect" on "pdpPage"
    And I should see "pudoClickAndCollectDebsOptionDisabled" exist on "pdpPage"
    And I should see "pudoClickAndCollectDebsOption" containing "Collect from store" on "pdpPage"
    And I should see "pudoClickAndCollectDebsOption" containing "(Within 2 working days)" on "pdpPage"
    And I should see "pudoClickAndCollectDebsOptionPrice" as "FREE" on "pdpPage"
    And I should see "pudoClickAndCollectStandardParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
    And I should see "pudoClickAndCollectStandardParcelOption" containing "(Within 5 working days)" on "pdpPage"
    And I should see "pudoClickAndCollectStandardParcelOptionPrice" as "£1.99" on "pdpPage"
    And I should see "pudoClickAndCollectExpressParcelOptionDisabled" exist on "pdpPage"
    And I should see "pudoClickAndCollectExpressParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
    And I should see "pudoClickAndCollectExpressParcelOption" containing "(Next day - order before 9pm)" on "pdpPage"
    And I should see "pudoClickAndCollectExpressParcelOptionPrice" as "£3.99" on "pdpPage"
    And I should see "pudoMoreInfoClickAndCollectLink" exist on "pdpPage"
    And I should see "pudoNonReturnMessaging" exist on "pdpPage"

@automatedPudoSanity @DEBD-4039 @PUDO @PUDO-MyBag @DEBD-3573 @DEBD-3222
Scenario: Validate the tooltip when Express PUDO Click & Collect delivery option is not available
    Then I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    And I should see "pDpSPsOnlyAvailableName" product name exist on myBagPage
    Then I am in view of "deliveryOptionSection" on "myBagPage"
    And I should see "deliveryOptionSection" exist on "myBagPage"
    And I should see "availableDeliveryOption" exist on "myBagPage"
    And I validate "Standard" fullfillment option "enable" on myBagPage
    And I validate "Next or nominated day" fullfillment option "enable" on myBagPage
    And I validate "Collect from store" fullfillment option "disable" on myBagPage
    And I validate "Collect from ParcelShop" fullfillment option "enable" on myBagPage
    And I validate "International" fullfillment option "enable" on myBagPage
    And I click and validate "Standard" fullfillment option text as "Standard delivery (Within 5 working days)£3.49 or FREE on orders £50 or over" on myBagPage
    And I click and validate "Next or nominated day" fullfillment option text as "Next day - 7 days a week between 8am to 6pm (Order by 9pm Sun-Fri, 6pm Sat)£3.99Nominated day - 7 days a week between 8am to 6pm (Order by 9pm Sun-Fri, 6pm Sat)£3.99" on myBagPage
    And I click and validate "Collect from ParcelShop" fullfillment option text as "Collect from Hermes ParcelShop (Within 5 working days)£1.99Collect from Hermes ParcelShop (Next day - order before 9pm)£3.99" on myBagPage
    And I click and validate "Unavailable Parcel Collection Option" fullfillment option text as "Collect from Hermes ParcelShop (Next day - order before 9pm)£3.99" on myBagPage
    And I click and validate "Collect from store" fullfillment option text as "Not available for this item" on myBagPage
    And I click and validate "International" fullfillment option text as "International delivery£5 or FREE on orders over £50" on myBagPage

@automatedPudoSanity @DEBD-4039 @PUDO @DEBD-3224
Scenario: Validate the Click & Collect Delivery landing page
    Then I store details from myBag to validate later
    Then I navigate to delivery options as guest user
    # When I click on "checkoutButton" on "myBagPage"
    Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
    And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
    And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
    And I should see "clickCollectText1" as "Delivered to a ParcelShop of your choice, choose from over 4,500 locations, from only £1.99." on "deliveryOptionPage"

@automatedPudoSanity @DEBD-4039 @PUDO @DEBD-3226
Scenario: Validate the postcode search result fields
    When I click on "clickCollectOption" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Where would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"

@automatedPudoSanity @DEBD-4039 @PUDO @DEBD-3226
Scenario Outline: Validate the postcode search result
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
    And I should see "listView" as "List view" on "locateStorePage"
    And I should see "mapView" as "Map view" on "locateStorePage"
    And I count number of "listViewOptions" to be "<max_count>" on "locateStorePage"
    And I should not see "firstDebsStoreNameListView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "collapsedListView" exist on "locateStorePage"
    And I should see "showMoreShopLink" exist on "locateStorePage"
    And I click on "showMoreShopLink" on "locateStorePage"
    And I should see "expandedListView" exist on "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I should not see "storeNameMapView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "selectStoreButtonMapView" exist on "locateStorePage"

    Examples:
        | storeLocateName | max_count  | searchResultText       |
        | E16FQ           |         10 | 10 results for "E16FQ"   |  

@automatedPudoSanity @DEBD-4039 @PUDO @DEBD-3226
Scenario: Verify that user is able to select a Hermes Parcel store from the collection store list
    And I click on "listView" on "locateStorePage"
    And I click on "showMoreShopLink" on "locateStorePage"
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I should see "storeNameMapView" as "Nisa Local" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should not see "storeCollectionMapView" containing "Collection location" on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

# ===========================PUDO Parcel Store Collection Confirmation=======================================================================    

@automatedPudoSanity @DEBD-4039 @PUDO @DEBD-3230
Scenario: Verify Collection location section for Parcel store
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

@automatedPudoSanity @DEBD-4039 @PUDO @DEBD-3230
Scenario: Verify that user is getting only 1(Standard PUDO) delivery option when Hermes Parcel store is choosen
    And I should see "pudoCollectionConfirmationOptionsTitle" as "When would you like to collect your order?" on "deliveryOptionPage"
    And I should see "pudoStandardRadioButton" exist on "deliveryOptionPage"
    And I should not see "pudoExpressRadioButton" on "deliveryOptionPage"
    And I verify default selected delivery option is "StandardPudo"
    And I should see "pudoDeliveryConfirmationMsg" as "We'll email you once your order arrives in store." on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    And I should see "disclaimerMsg" as "We will keep your item in parcel shop for 10 days from this date, after which they will be returned to our warehouse." on "deliveryOptionPage"

# ===========================Standard PUDO Payment Page=======================================================================    

@automatedPudoSanity @DEBD-4039 @PUDO @DEBD-3230 @DEBD-3231
Scenario: Verify Payment Page for Standard PUDO delivery option
    Then I click on "pudoStandardRadioButton" on "deliveryOptionPage"
    Then I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "hermesStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "Nisa Local," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Standard delivery" on "paymentPage"
    And I should see "deliveryCost" as "£1.99" on "paymentPage"

# ==============================Change Store Collection Confirmation===========================================================

@automatedPudoSanity @DEBD-4039 @PUDO @DEBD-3257
Scenario Outline: Verify that user is able to change store using change store link under Collection confirmation
     Then I click on "changeDeliveryMethod" on "paymentPage"
    When I click on "clickCollectOption" on "deliveryOptionPage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
    And I click on "listView" on "locateStorePage"
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I click on "selectStoreButton" on "locateStorePage"
    And I should see "collectionConfirmationTitle" as "Collection location" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreName" as "Nisa Local" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreMiles" as "1.04 Miles" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreChangeStoreCTA" exist on "deliveryOptionPage"
    And I click on "collectionConfirmationStoreChangeStoreCTA" on "deliveryOptionPage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"    

Examples:
    | storeLocateName | searchResultText       |
    | E16FQ           | 10 results for "E16FQ"   |

# =========================================PUDO Standard Order Confirmation======================================================================================================

@automatedPudoSanity @DEBD-4039 @PUDO @DEBD-3232
Scenario Outline: Verify user is able to place order with Standard PUDO delivery
    And I click on "listView" on "locateStorePage"
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I click on "selectStoreButton" on "locateStorePage"
    Then I click on "pudoStandardRadioButton" on "deliveryOptionPage"
    Then I click on "proceedPaymentButton" on "deliveryOptionPage"
    And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
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
    And I should see "orderConfirmationStoreName" as "Nisa Local" on "orderConfirmationPage"
    And I should see "orderConfirmationStoreAdd" exist on "orderConfirmationPage"
    And I should see "orderConfirmationStoreCollectionLocation" exist on "orderConfirmationPage"
    And I should see "orderConfirmationStoreOpeningHours" exist on "orderConfirmationPage"
    And I should see "orderConfirmationMapView" exist on "orderConfirmationPage"
    And I should see "orderConfirmationMapViewHermesLogo" exist on "orderConfirmationPage"
    And I should see "orderConfirmationDeliveryType" as "Click & Collect - Standard delivery" on "orderConfirmationPage"
    And I should see "orderConfirmationDeliveryPrice" as "£1.99" on "orderConfirmationPage"
    And I should see "orderConfirmationMapViewCollectionMsg" containing "We'll email you once your order is ready to collect - please wait for this before heading into store." on "orderConfirmationPage"
    And I should see "orderConfirmationDeliveryLeadTime" containing "Your order will be ready to collect on" on "orderConfirmationPage"

# ===============================================================================================================================================
