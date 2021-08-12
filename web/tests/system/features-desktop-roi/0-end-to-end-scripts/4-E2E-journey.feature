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

@automatedSanity @preprodSanity @e2e
Scenario: Validate the header text message for non sign in customer
  Then I should see "headerTextNonSignIn" as "Items saved for this visit, to save these items to 'My Account', create an account now or sign in now." on "mySavedItemPage"

@automatedSanity @preprodSanity @e2e @Issue_with_the_sign_In_button
Scenario: Click on sign in link on header text and sign in with e2e credentials
  When I sign in from my saved items

@automatedSanity @preprodSanity @e2e @DEBD-1820-Defect
Scenario: Validate that user is still on saved item page and coffee product still under saved items list
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the above saved coffee machine still exist in saved item section
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
  #And I should see "reviewSorting" exist on "pdpPage"
  #And I should see "reviewWrite" exist on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the shop more tags and select coffee machine tag to navigate to psp page
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  When I click on "shopMoreTag2Text" on "pdpPage"
  Then I should see "headerText" as "Coffee machines" on "pspPage"
  And I should see "url" contains "electricals/coffee-machines"

  Examples:
    | tag_name_1  | tag_name_2      | tag_name_3   |
    | Electricals | Coffee machines | Nescafé Dolce Gusto  |


@automatedSanity @preprodSanity @e2e
Scenario: Validate the filter applied for price €35 to €55
  And I "validate & click" subFilter option "€55 - 105" under "Price" on commonPage bigscreen
  Then I should see "headerText" containing "Coffee machines" on "pspPage"
  And I should see "searchText" as "€55 - 105" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (low-high) on abobe psp page with filter applied
  When I click on "sortOptionPriceLowHighIE" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*min_price"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (high-low) on abobe psp page with filter applied
  When I click on "sortOptionPriceHighLowIE" on "pspPage"
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
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "clickCollectPdpURL"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payments page with saved address and delivery option as standard
  Then I store details from myBag to validate later
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should not see "homeDeliveryHeaderText" on "deliveryOptionPage"
  And I should not see "clickCollectHeaderText" on "deliveryOptionPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  When I am in view of "deliveryTypeheaderText" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should not see "nextNominatedSectionHeaderText" on "deliveryOptionPage"
  And I should not see "daytimeTab" on "deliveryOptionPage"
  And I should not see "eveningTab" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page delivery selected, credit card points as selected by user
  # And I validate "beauty card points" value from mybag
  Then I should see "deliveryType" as "Standard Delivery" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to Debenhams payment page and validate the billing address section
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  #And I should see "savedAddressText" as "Same as delivery address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  #Then I should see "titleMrs" exist on "paymentPage"
  And I should see "firstNameField" exist on "paymentPage"
  And I should see "lastNameField" exist on "paymentPage"
  And I should see "phoneNumberField" exist on "paymentPage"
  And I should see "addressInput" exist on "paymentPage"
  And I should see "city" exist on "paymentPage"
  And I should see "county" exist on "paymentPage"
  And I should see "eirCode" exist on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Navigate to Debenhams payment page and validate the billing address lookup
  When I am in view of "newAddressText" on "paymentPage"
  #When I click on "titleMrs" on "paymentPage"
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
  When I click on "useAddressButton" on "paymentPage"

  Examples:
    | first_name | last_name | phone_number | house_number | postcode | city     | county           | address                                         |
    | Test       | User      | 9876543210   | 10           | V94D2F9  | LIMERICK | O'CONNELL STREET | DEBENHAMS - O'CONNELL STREET, LIMERICK, V94D2F9 |

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to Debenhams payment page and validate the billing address lookup
  Then I should see "editAddressLink" exist on "paymentPage"
  #And I should see "addNewAddressLink" exist on "paymentPage"
  And I should not see "findAddressButton" on "paymentPage"
  And I should not see "useAddressButton" on "paymentPage"
  And I should not see "bfpoLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"
  And I should not see "enterAddressManuallyLink" on "paymentPage"
