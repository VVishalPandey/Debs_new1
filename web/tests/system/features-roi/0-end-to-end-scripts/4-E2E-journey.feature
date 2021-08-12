Feature: Test Debenhams end to end journey number 4

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to coffee pdp page with a signed out customer
  Then I logout
  Then I navigate to "testCoffeePdpURL"
  And I am in view of "productName" on "pdpPage"
  And I store name of product and select save item on pdpPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to saved items from global navigation and validate the page
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I "validate & click" mainMenu option "Saved Items" on commonPage smallscreen
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the above saved coffee machine exist in saved item section
  Then I validate products are saved on mySavedItemPage

@automatedSanity @preprodSanity @e2e
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
  When I click on "logoDebenhams" on "commonPage"
  When I click on "savedItemsButton" on "commonPage"
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"
  Then I validate products are saved on mySavedItemPage
  And I empty mini bag

@automatedSanity @preprodSanity @e2e
Scenario: Navigate back to the coffee machine pdp page and validate the review accordion and WEEE accordion with link within it
  When I navigate to "testCoffeePdpURL"
  #When I am in view of "weeeAccordion" on "pdpPage"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "weeeAccordion" as "WEEE Legislation" on "pdpPage"
  And I should see "reviewsAccordion" exist on "pdpPage"
  When I "open" "weeeAccordion" accordion on "pdpPage"
  Then I should see "weeeFullForm" as "Waste Electrical and Electronic Equipment Legislation (WEEE)" on "pdpPage"
  And I should see "findOutMoreLink" exist on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the shop more tags and select coffee machine tag to navigate to psp page
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  When I click on "shopMoreTag2Text" on "pdpPage"
  Then I should see "headerText" containing "Coffee machines" on "pspPage"
  And I should see "url" contains "electricals/coffee-machines"

  Examples:
    | tag_name_1  | tag_name_2      | tag_name_3 |
    | Electricals | Coffee machines | NESCAFÉ Dolce Gusto |

@automatedSanity @preprodSanity @e2e
Scenario: Validate the filter applied for price 50 to 100
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Price"  as "filterSubMenuLinkList" as "€35 - 55" on "pspPage"
  And I click on "closeButton" on "pspPage"
  Then I should see "headerText" containing "Coffee machines" on "pspPage"
  And I should see "filterText" as "€35 - 55" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (low-high) on abobe psp page with filter applied
  When I click on "sortOptionPriceLowHighRoi" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*min_price"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (high-low) on abobe psp page with filter applied
  When I click on "sortOptionPriceHighLowRoi" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-min_price"

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
  And I empty mini bag
  When I navigate to "clickCollectPdpURL"
  Then I add the product to bag and go to my bag page

@automated @preprodSanity @e2e @click&CollectRemoved
Scenario Outline: Navigate to click & collect store locator page and validate the number of stores in result page with valid postcode search
  Then I store details from myBag to validate later
  Then I should scroll to "checkoutButton" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryTypeheaderTextInt" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  When I click on "clickCollectCTA" on "deliveryOptionPage"
  Then I should see "headerText" as "Which store would you like to collect from?" on "deliveryOptionPage"
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"

  Examples:
    | storeLocateName | max_count |
    | Dublin          | 5         |

@automated @preprodSanity @e2e @click&CollectRemoved
Scenario: Navigate to the payment page and validate the delivery option as click & collect
  When I click on "firstStoreChoose" on "locateStorePage"
  Then I should see "deliveryMessage" containing "Order now and your parcel should be available for collection" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Payment" on "paymentPage"
  And I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordionUk" as "Pay with a Credit or Debit card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payments page with saved address and delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as user already loggedIn with IE savedAddress
  And I should see "deliveryTypeheaderTextInt" as "Choose your delivery option" on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Payment" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page delivery selected, credit card points as selected by user
  When I am in view of "headerText" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  # Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
  Then I should see "deliveryType" as "Standard Delivery" on "paymentPage"
  When I "collapse" "orderSummaryAccordion" accordion on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to Debenhams payment page and validate the billing address section
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  And I should see "firstNameField" exist on "paymentPage"
  And I should see "lastNameField" exist on "paymentPage"
  And I should see "phoneNumberField" exist on "paymentPage"
  And I should see "countryGB" exist on "paymentPage"
  And I should see "addressInput" exist on "paymentPage"
  And I should see "city" exist on "paymentPage"
  And I should see "county" exist on "paymentPage"
  And I should see "eirCode" exist on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Navigate to Debenhams payment page and validate the billing address lookup
  When I am in view of "newAddressText" on "paymentPage"
  When I am in view of "firstNameField" on "paymentPage"
  And I enter "<first_name>" in "firstNameField" on "paymentPage"
  And I enter "<last_name>" in "lastNameField" on "paymentPage"
  And I enter "<phone_number>" in "phoneNumberField" on "paymentPage"
  And I enter "<house_number>" in "addressInput" on "paymentPage"
  And I enter "<city>" in "city" on "paymentPage"
  And I enter "<county>" in "county" on "paymentPage"
  And I enter "<postcode>" in "eirCode" on "paymentPage"
  And I should see "useAddressButton" exist on "paymentPage"
  And I should not see "bfpoLink" on "paymentPage"

  Examples:
    | first_name | last_name | phone_number | house_number | postcode | city     | county           | address                                         |
    | Test       | User      | 9876543210   | 10           | V94D2F9  | LIMERICK | O'CONNELL STREET | DEBENHAMS - O'CONNELL STREET, LIMERICK, V94D2F9 |

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to Debenhams payment page and validate the billing address lookup
  When I click on "useAddressButton" on "paymentPage"
  And I should not see "findAddressButton" on "paymentPage"
  And I should not see "useAddressButton" on "paymentPage"
  And I should not see "bfpoLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"
  And I should not see "enterAddressManuallyLink" on "paymentPage"
