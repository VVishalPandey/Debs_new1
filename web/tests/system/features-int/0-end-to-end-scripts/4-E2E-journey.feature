Feature: Test Debenhams end to end journey number 4

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to coffee jar pdp page with a signed out customer
  And I logout
  Then I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I navigate to "testCoffeePdpURL"
  And I store name of product and select save item on pdpPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to saved items from global navigation and validate the page
  When I click on "menuIcon" on "commonPage"
  And I "validate & click" mainMenu option "Saved Items" on commonPage smallscreen
  And I wait for "3000" milliseconds
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the above saved coffee jar exist in saved item section
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
  When I navigate to "intHomeURL"
  When I click on "savedItemsButton" on "commonPage"
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"
  Then I validate products are saved on mySavedItemPage

@automatedSanity @e2e
Scenario Outline: Validate the shop more tags and select KITCHEN & FOOD STORAGE tag to navigate to psp page
  When I navigate to "testCoffeePdpURL"
  And I wait for "3000" milliseconds
  Then I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  And I wait for "5000" milliseconds
  When I click on "shopMoreTag2Text" on "pdpPage"
  Then I should see "headerText" as "KITCHEN & FOOD STORAGE" on "pspPage"
  And I should see "url" contains "/home/kitchenware/kitchen-food-storage"

  Examples:
    | tag_name_1 | tag_name_2             | tag_name_3       |
    | Home       | Kitchen & food storage | Debenhams        |

@automatedSanity @e2e
Scenario: Validate the filter applied for price less than 15.0
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Price"  as "filterSubMenuLinkList" as "$15 - $25" on "pspPage"
  And I wait for "3000" milliseconds
  And I click on "closeButton" on "pspPage"
  Then I should see "headerText" containing "Kitchen & food storage" on "pspPage"
  And I should see "pspHeader" as "$15 - $25" on "pspPage"

@preprodSanity
Scenario Outline: Validate the shop more tags and select Cups & saucers tag to navigate to psp page
  When I navigate to "testCoffeePdpURL"
  Then I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  When I click on "shopMoreTag2Text" on "pdpPage"
  Then I should see "headerText" as "Cups & saucers" on "pspPage"
  And I should see "url" contains "en-au/home/tableware/cups-saucers"
  When I "validate & click" subFilter option "$15 - $25" under "Price" on commonPage bigscreen
  Then I should see "headerText" containing "Cups & saucers" on "pspPage"
  And I should see "pspHeader" as "$15 - $25" on "pspPage"


  Examples:
    | tag_name_1 | tag_name_2             | tag_name_3       |
    | Home       | Cups & saucers | Keep cup        |

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (low-high) on abobe psp page with filter applied
  When I click on "sortOptionPriceLowHighAus" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*min_price"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (high-low) on abobe psp page with filter applied
  When I click on "sortOptionPriceHighLowAus" on "pspPage"
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
  And I wait for "3000" milliseconds
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds
  Then I should validate product name on "myBagPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to the payment page and validate the delivery option as International delivery
  When I should scroll to "checkoutButton" on "myBagPage"
  When I navigate to delivery options as already logged in with Australia address
  And I wait for "4000" milliseconds
  Then I should see "internationalOption" exist on "deliveryOptionPage"
  When I click on "internationalOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "2000" milliseconds
  Then I should see "headerText" as "Payment" on "paymentPage"
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I am in view of "creditCardAccordion" on "paymentPage"
  And I should see "creditCardAccordion" exist on "paymentPage"
  And I should see "payPalAccordion" exist on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"
  And I am in view of "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "international Delivery" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to Debenhams payment page and validate the billing address section
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  And I wait for "3000" milliseconds
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  And I should see "firstNameField" exist on "paymentPage"
  And I should see "lastNameField" exist on "paymentPage"
  And I should see "phoneNumberField" exist on "paymentPage"
  And I should see "countryAU" exist on "paymentPage"
  And I am in view of "billingzipcode" on "paymentPage"
  And I should see "billingzipcode" exist on "paymentPage"
  And I should not see "addressOne" on "paymentPage"
  And I should see "useAddressButton" exist on "paymentPage"
  And I should not see "findAnotherAddressLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Navigate to Debenhams payment page and validate the billing address
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  And I enter "<first_name>" in "firstNameField" on "paymentPage"
  And I enter "<last_name>" in "lastNameField" on "paymentPage"
  And I am in view of "suburbcityField" on "paymentPage"
  And I enter "<phone_number>" in "phoneNumberField" on "paymentPage"
  And I enter "<address_line1>" in "addressline1Field" on "paymentPage"
  And I enter "<suburb_city>" in "suburbcityField" on "paymentPage"
  And I enter "<postcode>" in "billingzipcode" on "paymentPage"
  And I should see "useAddressButton" exist on "paymentPage"
  When I click on "useAddressButton" on "paymentPage"
  And I should not see "billingzipcode" on "paymentPage"
  And I should not see "countryAU" on "paymentPage"

  Examples:
    | first_name | last_name | phone_number | postcode | address_line1 | suburb_city   |
    | Test       | User      | 9876543210   | 3000     | Debenhams     | Melbourne VIC |
