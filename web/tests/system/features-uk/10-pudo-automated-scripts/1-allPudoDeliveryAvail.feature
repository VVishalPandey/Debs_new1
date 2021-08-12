# DebParcelStoreCC - Product is available for both Debs & Parcel Shop Collection (standard and express)-pDpDsPsAvailableUrl

Feature: Test complete journey for a PUDO DebParcelStoreCC SKU

@automatedPudoSanity @PUDO @DEBD-3572  @DEBD-3221
Scenario: Login to Debenhams site
    Given I navigate to "loginUrl"
    When I click on "tab1" on "loginPage"
    And I enter "testpudo@gmail.com" in "emailAddressFieldSignIn" on "loginPage"
    And I enter "test1234" in "passwordField" on "loginPage"
    And I click on "signInButton" on "loginPage"
    And I wait for "5000" milliseconds

  @automatedPudoSanity @PUDO @DEBD-3572  @DEBD-3221
  Scenario: Validate the PUDO Click & Collect delivery options on pdp DebParcelStoreCC product
    Given I navigate to "pDpDsPsAvailableUrl"
    And I should see "deliveryReturnAccordion" exist on "pdpPage"
    And I should see "deliveryReturnText" as "Delivery / Returns" on "pdpPage"
    When I "open" "deliveryReturnAccordion" accordion on "pdpPage"
    Then I should see "deliveryReturnHomeDelivery" exist on "pdpPage"
    And I should see "pudoClickAndCollectOption" exist on "pdpPage"
    And I should see "pudoClickAndCollectOptionHeading" as "UK Click & Collect" on "pdpPage"
    And I should see "pudoClickAndCollectDebsOption" containing "Collect from store" on "pdpPage"
    And I should see "pudoClickAndCollectDebsOption" containing "(Within 2 working days)" on "pdpPage"
    And I should see "pudoClickAndCollectDebsOptionPrice" as "FREE" on "pdpPage"
    And I should see "pudoClickAndCollectStandardParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
    And I should see "pudoClickAndCollectStandardParcelOption" containing "(Within 5 working days)" on "pdpPage"
    And I should see "pudoClickAndCollectStandardParcelOptionPrice" as "£1.99" on "pdpPage"
    And I should see "pudoClickAndCollectExpressParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
    And I should see "pudoClickAndCollectExpressParcelOption" containing "(Next day - order before 9pm)" on "pdpPage"
    And I should see "pudoClickAndCollectExpressParcelOptionPrice" as "£3.99" on "pdpPage"
    And I should see "pudoMoreInfoClickAndCollectLink" exist on "pdpPage"
    And I should see "deliveryReturnIntDelivery" exist on "pdpPage"
    And I should see "pudoNonReturnMessaging" exist on "pdpPage"

@automatedPudoSanity @PUDO @DEBD-3573 @DEBD-3222
Scenario: Validate the tooltip when all PUDO Click & Collect delivery option are available
    Then I add the product to bag and go to my bag page
    And I should see "pDpDsPsAvailableName" product name exist on myBagPage
    Then I am in view of "deliveryOptionSection" on "myBagPage"
    And I should see "deliveryOptionSection" exist on "myBagPage"
    And I should see "availableDeliveryOption" exist on "myBagPage"
    And I validate "Standard" fullfillment option "enable" on myBagPage
    And I validate "Next or nominated day" fullfillment option "enable" on myBagPage
    And I validate "Collect from store" fullfillment option "enable" on myBagPage
    And I validate "Collect from ParcelShop" fullfillment option "enable" on myBagPage
    And I validate "International" fullfillment option "enable" on myBagPage
    And I click and validate "Standard" fullfillment option text as "Standard delivery of this product will be within 4 working days(£3.49) Free on orders £50 or over" on myBagPage
    And I click and validate "Next or nominated day" fullfillment option text as "Next day - 7 days a week between 8am to 6pm (Order by 9pm Sun-Fri, 6pm Sat)£3.99Nominated day - 7 days a week between 8am to 6pm (Order by 9pm Sun-Fri, 6pm Sat)£3.99" on myBagPage
    And I click and validate "Collect from ParcelShop" fullfillment option text as "Collect from Hermes ParcelShop (Within 5 working days)£1.99Collect from Hermes ParcelShop (Next day - order before 9pm)£3.99" on myBagPage
    And I click and validate "Collect from store" fullfillment option text as "Collect from store (Within 2 working days)FREE" on myBagPage
    And I click and validate "International" fullfillment option text as "FREE on orders over£50 or from £5" on myBagPage

# ===========================PUDO Delivery Landing Page=======================================================================    

@automatedPudoSanity @PUDO @DEBD-3224
Scenario: Validate the Click & Collect delivery page
    Then I store details from myBag to validate later
    # Then I navigate to delivery options as guest user
    Then I should scroll to "checkoutButton" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
    And I should see "homeDeliveryCTA" as "Home Delivery" on "deliveryOptionPage"
    And I should see "clickCollectCTA" as "Click & Collect" on "deliveryOptionPage"
    And I should see "clickCollectText1" as "Delivered to a Debenhams store for Free, or choose from over 4,500 ParcelShop locations from £1.99." on "deliveryOptionPage"

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
Scenario Outline: Validate the postcode search result for for the DebParcelStoreCC product added to bag
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
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
    And I should see "hermesParcelShopListView" exist on "locateStorePage"
    And I should see "collapsedListView" exist on "locateStorePage"
    And I should see "showMoreShopLink" exist on "locateStorePage"
    And I click on "showMoreShopLink" on "locateStorePage"
    And I should see "expandedListView" exist on "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I should see "storeNameMapView" as "Staff only - Support Centre" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "selectStoreButtonMapView" exist on "locateStorePage"

    Examples:
        | storeLocateName | max_count  | searchResultText       |
        | E16FQ           |         10 | 10 results for "E16FQ"   | 

@automatedPudoSanity @PUDO @DEBD-3226
Scenario: Verify that user is able to select a Hermes store from the List View
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

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify the Collection Location section on selecting a Parcel store
    And I click on "selectStoreButton" on "locateStorePage"
    And I should see "collectionConfirmationTitle" as "Collection location" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreName" as "Nisa Local" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreMiles" as "1.04 Miles" on "deliveryOptionPage"
    And I click on "collectionConfirmationStoreMapOpeningHoursCTA" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreOpeningHours" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationMap" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationMapHermesIcon" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreAddress" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreTelephone" exist on "deliveryOptionPage"
    And I click on "collectionConfirmationStoreMapOpeningHoursCloseCTA" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreChangeStoreCTA" exist on "deliveryOptionPage"
    And I should not see "collectionConfirmationStoreCollectionLocation" on "deliveryOptionPage"

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify that user is getting 2(Standard & Express PUDO) delivery option when a Hermes Parcel store is choosen as collection store
    And I should see "pudoCollectionConfirmationOptionsTitle" as "When would you like to collect your order?" on "deliveryOptionPage"
    And I should see "pudoStandardRadioButton" exist on "deliveryOptionPage"
    And I should see "pudoExpressRadioButton" exist on "deliveryOptionPage"
    And I verify default selected delivery option is "StandardPudo"
    And I should see "pudoDeliveryConfirmationMsg" as "We'll email you once your order arrives in store." on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    And I should see "disclaimerMsg" as "We will keep your item in parcel shop for 10 days from this date, after which they will be returned to our warehouse." on "deliveryOptionPage"

# ===========================Standard PUDO Payment Page=======================================================================    

@automatedPudoSanity @PUDO @DEBD-3230 @DEBD-3231
Scenario: Verify Payment page for Standard PUDO delivery option
    Then I click on "pudoStandardRadioButton" on "deliveryOptionPage"
    Then I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
    And I should see "placeOrderButton" exist on "paymentPage"
    Then I should scroll to "orderSummaryAccordion" on "paymentPage"
    When I "open" "orderSummaryAccordion" accordion on "paymentPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "hermesStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "Nisa Local," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Standard delivery" on "paymentPage"
    And I should see "deliveryCost" as "£1.99" on "paymentPage"

# ===========================Express PUDO Payment Page=======================================================================    

@automatedPudoSanity @PUDO @DEBD-3230 @DEBD-3231
Scenario Outline: Verify Payment page for Express PUDO delivery option
    Then I click on "changeDeliveryMethod" on "paymentPage"
    When I click on "clickCollectOption" on "deliveryOptionPage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I click on "selectStoreButton" on "locateStorePage"
    And I click on "pudoExpressRadioButton" on "deliveryOptionPage"
    Then I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
    And I should see "placeOrderButton" exist on "paymentPage"
    Then I should scroll to "orderSummaryAccordion" on "paymentPage"
    When I "open" "orderSummaryAccordion" accordion on "paymentPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "hermesStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "Nisa Local," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Next day delivery" on "paymentPage"
    And I should see "deliveryCost" as "£3.99" on "paymentPage"

Examples:
    | storeLocateName | searchResultText       |
    | E16FQ           | 10 results for "E16FQ"   |   

# ==============================Change Store Collection Confirmation===========================================================

@automatedPudoSanity @PUDO @DEBD-3257
Scenario Outline: Verify that user is able to change store using change store link under Collection confirmation
    Then I click on "changeDeliveryMethod" on "paymentPage"
    When I click on "clickCollectOption" on "deliveryOptionPage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
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

# =============================Debs Store Collection Confirmation==================================================================

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify the Collection Location section on selecting a Debenhams store
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
    # And I should see "collectionConfirmationStoreCollectionLocation" exist on "deliveryOptionPage"
    And I click on "collectionConfirmationStoreMapOpeningHoursCloseCTA" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreChangeStoreCTA" exist on "deliveryOptionPage"
    And I should see "debsDeliveryConfirmationMsg" containing "Your order will be ready to collect from" on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

# ===========================Debenhams Payment Page=======================================================================  

@automatedPudoSanity @PUDO @DEBD-3231
Scenario: Verify that Payment page when a Debenhams Store delivery choosen as a delivery method
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

# =========================================PUDO Standard Order Confirmation======================================================================================================

@automatedPudoSanity @PUDO @DEBD-3257
Scenario Outline: Verify that user is able to change delivery method from payment page
    Then I click on "changeDeliveryMethod" on "paymentPage"
    When I click on "clickCollectOption" on "deliveryOptionPage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"

Examples:
    | storeLocateName | searchResultText       |
    | E16FQ           | 10 results for "E16FQ"   | 

@automatedPudoSanity @PUDO @DEBD-3232
Scenario Outline: Verify that user is able to place order for Standard PUDO delivery
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I click on "selectStoreButton" on "locateStorePage"
    Then I click on "pudoStandardRadioButton" on "deliveryOptionPage"
    Then I click on "proceedPaymentButton" on "deliveryOptionPage"
    And I should see "creditCardAccordionUk" as "Pay with a Credit, Debit or Store card" on "paymentPage"
    # Then I select new billing address and provide UK address details and use this address
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
Scenario: Verify the Order Confirmation page for Standard PUDO delivery
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

# ========================================My Orders -PUDO Standard ==========================================================================================

@notAutomated @PUDO @DEBD-3233
Scenario: Verify the My Order details under My account
    And I "validate & click" mainMenu option "My Account" on commonPage smallscreen
    When I click on "myOrders" on "my-details"
    Then I should see "titleOfPage" as "My orders" on "my-details"
    And I should see "backNavigationButton" exist on "my-details"
    And I should see "returnsInformtionLink" exist on "my-details"
    And I should see "trackAnOrderLink" exist on "my-details"
    And I should see "viewMoreDetailslink" exist on "my-details"
    And I should see "orderNumber" as "Order number:" on "my-details"

@notAutomated @PUDO @DEBD-3233
Scenario: Verify the Order details for My Order
    Then I click on "viewOrderDetailsLink" on "myOrdersPage"
    And I should see "title" as "Order Details" on "myOrdersPage"
    Then I should see "orderNumberText" containing "Order number" on "myOrdersPage"
    And I should see "productDetails" exist on "myOrdersPage"
    And I should see "productColor" exist on "myOrdersPage"
    And I should see "productSize" exist on "myOrdersPage"
    And I should see "productQuantity" exist on "myOrdersPage"
    And I should see "subTotalText" exist on "myOrdersPage"
    And I should see "subTotalAmount" exist on "myOrdersPage"
    And I should see "deliveryText" exist on "myOrdersPage"
    And I should see "deliveryAmount" as "£1.99" on "myOrdersPage"
    And I should see "discountText" exist on "myOrdersPage"
    And I should see "discountAmount" exist on "myOrdersPage"
    And I should see "orderPlaceDate" exist on "myOrdersPage"
    And I should not see "deliveryForText" on "myOrdersPage"
    And I should not see "deliveryForName" on "myOrdersPage"
    And I should see "deliveryAddressText" exist on "myOrdersPage"
    And I should see "deliveryAddress" exist on "myOrdersPage"
    And I should see "deliveryMethodText" exist on "myOrdersPage"
    And I should see "deliveryMethodSelected" as "Click & Collect - Standard delivery" on "myOrdersPage"
    And I should see "trackOrderButton" exist on "myOrdersPage"

# =========================================PUDO Express Order Confirmation======================================================================================================

@automatedPudoSanity @PUDO
Scenario Outline: Add DebParcelStoreCC product to bag and navigate Delivery page 
    Given I navigate to "pDpDsPsAvailableUrl"
    Then I add the product to bag and go to my bag page
    And I should see "pDpDsPsAvailableName" product name exist on myBagPage
    When I click on "checkoutButton" on "myBagPage"
    Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
    When I click on "clickCollectOption" on "deliveryOptionPage"
    And I should see "headerText" as "Where would you like to collect from?" on "locateStorePage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"

Examples:
    | storeLocateName | searchResultText       |
    | E16FQ           | 10 results for "E16FQ"   | 

@automatedPudoSanity @PUDO @DEBD-3232
Scenario: Verify that payment page for Express PUDO delivery
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
    And I click on "mapView" on "locateStorePage"
    And I click on "selectStoreButton" on "locateStorePage"
    Then I click on "pudoExpressRadioButton" on "deliveryOptionPage"
    Then I click on "proceedPaymentButton" on "deliveryOptionPage"
    # Then I select new billing address and provide UK address details and use this address
    Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
    And I should see "placeOrderButton" exist on "paymentPage"
    Then I should scroll to "orderSummaryAccordion" on "paymentPage"
    When I "open" "orderSummaryAccordion" accordion on "paymentPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "hermesStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "Nisa Local," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Next day delivery" on "paymentPage"
    And I should see "deliveryCost" as "£3.99" on "paymentPage"

@automatedPudoSanity @PUDO @DEBD-3232
Scenario Outline: Verify that user is able to place order with Express PUDO delivery  
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
Scenario: Verify that Order Confirmation page for Express PUDO delivery
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
    And I should see "orderConfirmationDeliveryType" as "Click & Collect - Next day delivery" on "orderConfirmationPage"
    And I should see "orderConfirmationDeliveryPrice" as "£3.99" on "orderConfirmationPage"
    And I should see "orderConfirmationMapViewCollectionMsg" containing "We'll email you once your order is ready to collect - please wait for this before heading into store." on "orderConfirmationPage"
    And I should see "orderConfirmationDeliveryLeadTime" containing "Your order will be ready to collect on" on "orderConfirmationPage"

# ========================================My Orders -Express PUDO==========================================================================================

@notAutomated @PUDO @DEBD-3233
Scenario: Verify the My Order details under My account
    And I "validate & click" mainMenu option "My Account" on commonPage smallscreen
    When I click on "myOrders" on "my-details"
    Then I should see "titleOfPage" as "My orders" on "my-details"
    And I should see "backNavigationButton" exist on "my-details"
    And I should see "returnsInformtionLink" exist on "my-details"
    And I should see "trackAnOrderLink" exist on "my-details"
    And I should see "viewMoreDetailslink" exist on "my-details"
    And I should see "orderNumber" as "Order number:" on "my-details"

@notAutomated @PUDO @DEBD-3233
Scenario: Verify the Order details for My Order
    Then I click on "viewOrderDetailsLink" on "myOrdersPage"
    And I should see "title" as "Order Details" on "myOrdersPage"
    Then I should see "orderNumberText" containing "Order number" on "myOrdersPage"
    And I should see "productDetails" exist on "myOrdersPage"
    And I should see "productColor" exist on "myOrdersPage"
    And I should see "productSize" exist on "myOrdersPage"
    And I should see "productQuantity" exist on "myOrdersPage"
    And I should see "subTotalText" exist on "myOrdersPage"
    And I should see "subTotalAmount" exist on "myOrdersPage"
    And I should see "deliveryText" exist on "myOrdersPage"
    And I should see "deliveryAmount" as "£3.99" on "myOrdersPage"
    And I should see "discountText" exist on "myOrdersPage"
    And I should see "discountAmount" exist on "myOrdersPage"
    And I should see "orderPlaceDate" exist on "myOrdersPage"
    And I should not see "deliveryForText" on "myOrdersPage"
    And I should not see "deliveryForName" on "myOrdersPage"
    And I should see "deliveryAddressText" exist on "myOrdersPage"
    And I should see "deliveryAddress" exist on "myOrdersPage"
    And I should see "deliveryMethodText" exist on "myOrdersPage"
    And I should see "deliveryMethodSelected" as "Click & Collect - Next day delivery" on "myOrdersPage"
    And I should see "trackOrderButton" exist on "myOrdersPage"

# =============================Debs Store Collection Confirmation==================================================================

@automatedPudoSanity @PUDO
Scenario Outline: Add DebParcelStoreCC product to bag and navigate to Delivery page
    Given I navigate to "pDpDsPsAvailableUrl"
    Then I add the product to bag and go to my bag page
    And I should see "pDpDsPsAvailableName" product name exist on myBagPage
    When I click on "checkoutButton" on "myBagPage"
    Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
    When I click on "clickCollectOption" on "deliveryOptionPage"
    And I should see "headerText" as "Where would you like to collect from?" on "locateStorePage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"

Examples:
    | storeLocateName | searchResultText       |
    | E16FQ           | 10 results for "E16FQ"   | 

@automatedPudoSanity @PUDO @DEBD-3230
Scenario: Verify the Collection location when Debenhams store is choosen
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
    # And I should see "collectionConfirmationStoreCollectionLocation" exist on "deliveryOptionPage"
    And I click on "collectionConfirmationStoreMapOpeningHoursCloseCTA" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreChangeStoreCTA" exist on "deliveryOptionPage"
    And I should see "debsDeliveryConfirmationMsg" containing "Your order will be ready to collect from" on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    
@automatedPudoSanity @PUDO @DEBD-3231
Scenario: Verify that Payment page when a Debenhams Store delivery choosen as a delivery method
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
    # Then I select new billing address and provide UK address details and use this address
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
Scenario: Verify that Order Confirmation page when a Debenhams store delivery choosen as a delivery method
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

# ========================================My Orders -Debenhams==========================================================================================

@notAutomated @PUDO @DEBD-3233
Scenario: Verify the My Order details under My account
    And I "validate & click" mainMenu option "My Account" on commonPage smallscreen
    When I click on "myOrders" on "my-details"
    Then I should see "titleOfPage" as "My orders" on "my-details"
    And I should see "backNavigationButton" exist on "my-details"
    And I should see "returnsInformtionLink" exist on "my-details"
    And I should see "trackAnOrderLink" exist on "my-details"
    And I should see "viewMoreDetailslink" exist on "my-details"
    And I should see "orderNumber" as "Order number:" on "my-details"

@notAutomated @PUDO @DEBD-3233
Scenario: Verify the Order details for My Order
    Then I click on "viewOrderDetailsLink" on "myOrdersPage"
    And I should see "title" as "Order Details" on "myOrdersPage"
    Then I should see "orderNumberText" containing "Order number" on "myOrdersPage"
    And I should see "productDetails" exist on "myOrdersPage"
    And I should see "productColor" exist on "myOrdersPage"
    And I should see "productSize" exist on "myOrdersPage"
    And I should see "productQuantity" exist on "myOrdersPage"
    And I should see "subTotalText" exist on "myOrdersPage"
    And I should see "subTotalAmount" exist on "myOrdersPage"
    And I should see "deliveryText" exist on "myOrdersPage"
    And I should see "deliveryAmount" as "FREE" on "myOrdersPage"
    And I should see "discountText" exist on "myOrdersPage"
    And I should see "discountAmount" exist on "myOrdersPage"
    And I should see "orderPlaceDate" exist on "myOrdersPage"
    And I should not see "deliveryForText" on "myOrdersPage"
    And I should not see "deliveryForName" on "myOrdersPage"
    And I should see "deliveryAddressText" exist on "myOrdersPage"
    And I should see "deliveryAddress" exist on "myOrdersPage"
    And I should see "deliveryMethodText" exist on "myOrdersPage"
    And I should see "deliveryMethodSelected" as "Click & Collect - Debenhams store" on "myOrdersPage"
    And I should see "trackOrderButton" exist on "myOrdersPage"

# ===============================================================================================================================================