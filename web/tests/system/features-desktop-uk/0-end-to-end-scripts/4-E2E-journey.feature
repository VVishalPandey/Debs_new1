Feature: Test Debenhams end to end journey number 4

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to coffee pdp page with a signed out customer
  Given I logout
  When I navigate to "testCoffeePdpURL"
  And I store name of product and select save item on pdpPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to saved items from global navigation and validate the page
  When I click on "savedItemsButton" on "commonPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the above saved coffee machine exist in saved item section
  Then I validate products are saved on mySavedItemPage

@automatedSanity  @preprodSanity@e2e
Scenario: Validate the header text message for non sign in customer
  Then I should see "headerTextNonSignIn" as "Items saved for this visit, to save these items to 'My Account', create an account now or sign in now." on "mySavedItemPage"

@automatedSanity @preprodSanity @e2e
Scenario: Click on sign in link on header text and sign in with e2e credentials
  When I sign in from my saved items

@automatedSanity @preprodSanity @e2e @DEBD-1820-Defect
Scenario: Validate that user is still on saved item page and coffee product still under saved items list
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the above saved coffee machine exist in saved item section
  When I navigate to "homeURL"
  When I click on "savedItemsButton" on "commonPage"
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"
  Then I validate products are saved on mySavedItemPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate back to the coffee machine pdp page and validate the review accordion and WEEE accordion with link within it
  When I navigate to "testCoffeePdpURL"
  When I am in view of "weeeSection" on "pdpPage"
  Then I should see "weeeFullForm" containing "Waste Electrical and Electronic Equipment Legislation (WEEE)" on "pdpPage"
  And I should see "weeeFindOutMoreLink" exist on "pdpPage"
  And I should see "reviewSection" exist on "pdpPage"
  Then I should see "reviewHeaderText" as "Reviews" on "pdpPage"
  And I should see "reviewSorting" exist on "pdpPage"
  And I should see "reviewWrite" exist on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the shop more tags and select coffee machine tag to navigate to psp page
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  When I click on "shopMoreTag2Text" on "pdpPage"
  Then I should see "headerText" as "Coffee Machines" on "pspPage"
  And I should see "url" contains "electricals/coffee-machines"

  Examples:
    | tag_name_1  |   tag_name_2    |     tag_name_3      |
    | Electricals | Coffee machines | Nescafé Dolce Gusto |

@automatedSanity @preprodSanity @e2e
Scenario: Validate the filter applied for price 50 to 100
  And I "validate & click" subFilter option "£50 - £100" under "Price" on commonPage bigscreen
  And I should see "headerText" containing "Coffee machines" on "pspPage"
  And I should see "pspHeader" as "£50 - £100" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (low-high) on abobe psp page with filter applied
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*price"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (high-low) on abobe psp page with filter applied
  When I click on "sortOptionPriceHighLow" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-price"

@automatedSanity @preprodSanity @e2e
Scenario: Select the first product save its detail and add to bag
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  And I should see "addToBagButton" exist on "pdpPage"
  When I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  #And I should see "addToBagRemainingText" containing "has been added to your bag." on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should validate product name on "myBagPage"

@preprodSanity
Scenario: Validate the click and collect functionality for configured sku on preprod
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "clickCollectPdpURL"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"

@automatedSanity @e2e
Scenario: Validate the click and collect functionality for configured sku on preprod
  And I "Remove" "all" products from "myBagPage"
  Given I navigate to "pDpDsPsAvailableUrl"
  Then I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"

@automatedSanity @preprodSanity @e2e @DEBD-4050
Scenario: Validate that the  reduced header is displayed when the mvt is  set to 2 and product is added for guest user
  And I set mvt test for "myBagHeader" as "variation2"
  Then I should see "logoDebenhamsCheckout" exist on "myBagPage"
  And I should see "progressBar" exist on "myBagPage"
  Then I should see "currentSelection" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should not see "searchIcon" on "commonPage"
  And I should not see "savedItemsButton" on "commonPage"
  And I should not see "myBagButton" on "commonPage"
  And I should not see "personalFinanceLink" on "commonPage"
  And I should not see "storeFinderLink" on "commonPage"
  And I should not see "createAccountLink" on "commonPage"
  And I should not see "myBeautyClubLink" on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  Then I should not see "footerMenuList" on "commonPage"
  Then I should not see "socialMediaSection" on "commonPage"

# ===========================PUDO Delivery Landing Page=======================================================================

@automatedSanity @e2e
Scenario: Validate the Delivery Landing page
    Then I store details from myBag to validate later
    # Then I navigate to delivery options as guest user
    When I click on "checkoutButton" on "myBagPage"
    Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
    And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
    And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
    # And I should see "clickCollectText1" as "Delivered to a Debenhams store for Free, or choose from over 4,500 ParcelShop locations from £1.99." on "deliveryOptionPage"
    And I should see "clickCollectText1" as "Delivered to a ParcelShop of your choice, choose from over 4,500 locations, from only £1.99." on "deliveryOptionPage"

@automatedSanity @e2e
Scenario: Validate the postcode search field for basket which is eligible for collection from store and Parcel shop both
    When I click on "clickCollectOption" on "deliveryOptionPage"
    And I should see "collectFromheaderText" as "Where would you like to collect from?" on "locateStorePage"
    And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"
    And I should see "locateStoreField" exist on "locateStorePage"
    And I should see "useCurrentLocation" exist on "locateStorePage"

# ===========================PUDO List/Map View=======================================================================

@automatedSanity @e2e
Scenario Outline: Validate the postcode search result for for the DebParcelStoreCC product added to bag
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    # And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
    And I count number of "listViewOptions" to be "<max_count>" on "locateStorePage"
    And I should see "mapView" exist on "locateStorePage"
    # And I should see "firstDebsStoreListView" exist on "locateStorePage"
    # And I should see "firstDebsStoreNameListView" as "London - Oxford Street" on "locateStorePage"
    # And I should see "firstDebsStoreAddListView" exist on "locateStorePage"
    # And I should see "firstDebsStoreMilesListView" exist on "locateStorePage"
    # And I should see "storeNameMapView" as "London - Oxford Street" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

    Examples:
        | storeLocateName | max_count  | searchResultText       |
        | E16FQ           |         10 | 10 results for "E16FQ"   |

@automatedSanity @e2e
Scenario: Verify that user is able to select a Hermes store from the List View
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
    And I should see "storeNameMapView" as "Nisa Local" on "locateStorePage"
    And I should see "storeAddMapView" exist on "locateStorePage"
    And I should see "storeOpeningMapView" exist on "locateStorePage"
    And I should see "storeCollectionMapView" exist on "locateStorePage"
    And I should not see "storeCollectionMapView" containing "Collection location" on "locateStorePage"
    And I should see "storeCollectionMapView" containing "Telephone" on "locateStorePage"
    And I should see "storePriceMapView" exist on "locateStorePage"
    And I should see "locateStoreButton" exist on "locateStorePage"

# ===========================PUDO Parcel Store Collection Confirmation=======================================================================

@automatedSanity @e2e
Scenario: Verify the Collection Location section on selecting a Parcel store
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

@automatedSanity @e2e
Scenario: Verify that user is getting 2(Standard & Express PUDO) delivery option when a Hermes Parcel store is choosen as collection store
    And I should see "pudoCollectionConfirmationOptionsTitle" as "When would you like to collect your order?" on "deliveryOptionPage"
    And I should see "pudoStandardRadioButton" exist on "deliveryOptionPage"
    And I should see "pudoExpressRadioButton" exist on "deliveryOptionPage"
    And I verify default selected delivery option is "StandardPudo"
    And I should see "pudoDeliveryConfirmationMsg" as "We'll email you once your order arrives in store." on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    And I should see "disclaimerMsg" as "We will keep your item in parcel shop for 10 days from this date, after which they will be returned to our warehouse." on "deliveryOptionPage"

# ===========================Standard PUDO Payment Page=======================================================================
@automatedSanity @e2e
Scenario: Verify Payment page for Standard PUDO delivery option
    Then I click on "pudoStandardRadioButton" on "deliveryOptionPage"
    Then I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "hermesStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "Nisa Local," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Standard delivery" on "paymentPage"
    And I should see "deliveryCost" as "£1.99" on "paymentPage"

# ===========================Express PUDO Payment Page=======================================================================
@automatedSanity @e2e
Scenario Outline: Verify Payment page for Standard PUDO delivery option
    Then I click on "changeDeliveryMethod" on "paymentPage"
    When I click on "clickCollectOption" on "deliveryOptionPage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    # And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
    And I click on "selectStoreButton" on "locateStorePage"
    And I click on "pudoExpressRadioButton" on "deliveryOptionPage"
    Then I click on "proceedPaymentButton" on "deliveryOptionPage"
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
@automatedSanity @e2e
Scenario Outline: Verify that user is able to change store using change store link under Collection confirmation
    Then I click on "changeDeliveryMethod" on "paymentPage"
    When I click on "clickCollectOption" on "deliveryOptionPage"
    When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
    And I click on "locateStoreButton" on "locateStorePage"
    # And I click on "locateStoreButton" on "locateStorePage"
    Then I should see "pudoStoreSearchResultText" as "<searchResultText>" on "locateStorePage"
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
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

# ===========================Debenhams Collection Location Page=======================================================================

@automatedSanity23 @e2e @debenhamsStoreClosed
Scenario: Verify the Collection Location section on selecting a Debenhams store
    Then I "select" "London - Oxford Street" store "3.03 Miles" from "locateStorePage"
    And I should see "storeNameMapView" as "London - Oxford Street" on "locateStorePage"
    And I click on "selectStoreButton" on "locateStorePage"
    And I should see "collectionConfirmationTitle" as "Collection location" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreName" as "London - Oxford Street" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreMiles" as "3.03 Miles" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreOpeningHours" as "Opening hours" on "deliveryOptionPage"
    And I should see "collectionConfirmationMap" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationMapDebsIcon" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreAddress" exist on "deliveryOptionPage"
    And I should not see "collectionConfirmationStoreTelephone" on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreCollectionLocation" exist on "deliveryOptionPage"
    And I should see "collectionConfirmationStoreChangeStoreCTA" exist on "deliveryOptionPage"
    And I should see "debsDeliveryConfirmationMsg" containing "Your order should be available for collection" on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

 # ===========================Debenhams Payment Page=======================================================================

@automatedSanity @e2e
Scenario: Verify that Payment page when a Parcel Store delivery choosen as a delivery method
    Then I "select" "Nisa Local" store "1.04 Miles" from "locateStorePage"
    And I click on "selectStoreButton" on "locateStorePage"
    And I click on "pudoExpressRadioButton" on "deliveryOptionPage"
    Then I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "hermesStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "Nisa Local," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Next day delivery" on "paymentPage"
    And I should see "deliveryCost" as "£3.99" on "paymentPage"

@automatedSanity23 @e2e @debenhamsStoreClosed
Scenario: Verify that Payment page when a Debenhams Store delivery choosen as a delivery method
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "headerText" as "Your order" on "paymentPage"
    Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
    And I should see "debsStoreLogo" exist on "paymentPage"
    And I should see "storeName" as "London - Oxford Street," on "paymentPage"
    And I should see "changeDeliveryMethod" exist on "paymentPage"
    And I should see "deliveryMode" as "Click & Collect - Debenhams store" on "paymentPage"
    And I should see "deliveryCost" as "FREE" on "paymentPage"
# ===========================================================================================================================

@automatedSanity  @e2e
Scenario: Navigate to the payment page and validate the delivery option as click & collect
  # When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  #And I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page delivery selected, credit card points as selected by user
#   Then I should see "creditCardPointText" containing "points by paying with your Debenhams Credit Card." on "paymentPage"
  # And I validate "credit card points" value from mybag
  Then I should see "deliveryType" as "Click & Collect" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to Debenhams payment page and validate the billing address section
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  Then I am in view of "newAddressText" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  Then I select new billing address and provide UK address details and use this address

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to Debenhams payment page and validate the billing address lookup
  Then I should see "editAddressLink" exist on "paymentPage"
  #And I should see "addNewAddressLink" exist on "paymentPage"
  And I should not see "findAddressButton" on "paymentPage"
  And I should not see "useAddressButton" on "paymentPage"
  And I should not see "bfpoLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"
  And I should not see "enterAddressManuallyLink" on "paymentPage"
