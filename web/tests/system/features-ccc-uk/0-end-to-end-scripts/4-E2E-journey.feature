Feature: Test Debenhams Customer Enactment end to end journey number 4 for CCC Users

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to coffee pdp page with a signed out customer
  Given I logout
  When I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  Then I should see "cccshopOnBehalfBanner" containing "You are shopping on behalf of a Guest Customer" on "cccLoginPage"
  When I navigate to "testCoffeePdpURL"
  And I store name of product and select save item on pdpPage

@automatedSanity @preprodSanity  @e2e
Scenario: Navigate to saved items from global navigation and validate the page
  When I click on "savedItemsButton" on "commonPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"

@automatedSanity @preprodSanity  @e2e
Scenario: Validate the above saved coffee machine exist in saved item section
  Then I validate products are saved on mySavedItemPage

@automatedSanity @preprodSanity  @e2e @DEBD-1820-Defect
Scenario: Validate that user is still on saved item page and coffee product still under saved items list
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"

@automatedSanity @preprodSanity  @e2e
Scenario: Validate the above saved coffee machine exist in saved item section
  When I navigate to "homeURL"
  When I click on "savedItemsButton" on "commonPage"
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"
  Then I validate products are saved on mySavedItemPage

@automatedSanity @preprodSanity  @e2e
Scenario: Navigate back to the coffee machine pdp page and validate the review accordion and WEEE accordion with link within it
  When I navigate to "testCoffeePdpURL"
  When I am in view of "weeeSection" on "pdpPage"
  Then I should see "weeeFullForm" containing "Waste Electrical and Electronic Equipment Legislation (WEEE)" on "pdpPage"
  And I should see "weeeFindOutMoreLink" exist on "pdpPage"
  And I should see "reviewSection" exist on "pdpPage"
  Then I should see "reviewHeaderText" as "Reviews" on "pdpPage"
  And I should see "reviewSorting" exist on "pdpPage"
  And I should see "reviewWrite" exist on "pdpPage"

@automatedSanity @preprodSanity  @e2e
Scenario Outline: Validate the shop more tags and select coffee machine tag to navigate to psp page
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  When I click on "shopMoreTag2Text" on "pdpPage"
  Then I should see "headerText" as "Coffee machines" on "pspPage"
  And I should see "url" contains "electricals/coffee-machines"

  Examples:
    | tag_name_1  |   tag_name_2    |   tag_name_3      |
    | Electricals | Coffee machines |   DeLonghi        |

@automatedSanity @preprodSanity  @e2e
Scenario: Validate the filter applied for price 50 to 100
  And I "validate & click" subFilter option "£50 - £100" under "Price" on commonPage bigscreen
  Then I should see "headerText" as "Coffee machines" on "pspPage"
  And I should see "searchText" as "£50 - £100" on "pspPage"

@automatedSanity @preprodSanity  @e2e
Scenario: Validate sort by price (low-high) on abobe psp page with filter applied
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*price"

@automatedSanity @preprodSanity  @e2e
Scenario: Validate sort by price (high-low) on abobe psp page with filter applied
  When I click on "sortOptionPriceHighLow" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-price"

@automatedSanity @preprodSanity  @e2e
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

@automatedSanity @preprodSanity @e2e
Scenario Outline: Navigate to click & collect store locator page and validate the number of stores in result page with valid postcode search
  Then I store details from myBag to validate later
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  Then I should not see "useThisAddressButton" on "deliveryOptionPage"
  And I should not see "standardOption" on "deliveryOptionPage"
  And I should not see "nextNominatedOption" on "deliveryOptionPage"
  And I should not see "proceedPaymentButton" on "deliveryOptionPage"
  And I should see "collectFromheaderText" as "Which store would you like to collect from?" on "locateStorePage"
  And I should see "findtStoreText" as "Find your nearest store" on "locateStorePage"
  And I should see "locateStoreButton" exist on "locateStorePage"
  And I should see "locateStoreField" exist on "locateStorePage"
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"

  Examples:
    | storeLocateName | max_count |
    | E16FQ           |         5 |

@preprodSanity
Scenario Outline: Navigate to the payment page and validate the delivery option as click & collect
  And I click on "firstStoreChoose" on "locateStorePage"
  And I am in view of "changeStoreLink" on "locateStorePage"
  Then I should see "selectedStoreName" containing "<firstStoreName>" on "locateStorePage"
  And I should see "deliveryMessage" containing "Your order will be ready to collect from" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

  Examples:
    |       firstStoreName      |
    |      Staff only - Support Centre      |

@automatedSanity @e2e
Scenario Outline: Navigate to the payment page and validate the delivery option as click & collect
  And I click on "firstStoreChoose" on "locateStorePage"
  And I am in view of "changeStoreLink" on "locateStorePage"
  Then I should see "selectedStoreName" containing "<firstStoreName>" on "locateStorePage"
  And I should see "deliveryMessage" containing "Your order will be ready to collect from" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

  Examples:
    |       firstStoreName      |
    |      London - Oxford      |

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page delivery selected, credit card points as selected by user
  Then I should see "creditCardPointText" containing "points by paying with your Debenhams Credit Card." on "paymentPage"
  And I validate "credit card points" value from mybag
  Then I should see "deliveryType" as "Click & Collect" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to Debenhams payment page and validate the billing address section
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  Then I select new billing address and provide UK address details and use this address

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to Debenhams payment page and validate the billing address lookup
  Then I should see "editAddressLink" exist on "paymentPage"
  And I should not see "findAddressButton" on "paymentPage"
  And I should not see "useAddressButton" on "paymentPage"
  And I should not see "bfpoLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"
  And I should not see "enterAddressManuallyLink" on "paymentPage"
