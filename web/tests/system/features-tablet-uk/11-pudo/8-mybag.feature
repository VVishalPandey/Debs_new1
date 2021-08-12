Feature: Test Debenhams Delivery Options on My Bag page validation

@notAutomated @DEBD-3573 @DEBD-3222
Scenario: Validate the UI of tooltip messaging

# DebParcelStoreCC - Product is available for both Debs & Parcel Shop Collection (standard and express)-pDpDsPsAvailableUrl
# DebParcelStoreExpressCC - Product is available for both Debs & an express service Parcel Shop Collection -pDpDsEPsAvailableUrl
# DebParcelStoreStandardCC - Product is available for both Debs & a standard service Parcel Shop Collection -pDpDsSPsAvailableUrl
# DebsCC - Product is available for Debs store collection but not available for Parcel Shop Collection -pDpDsOnlyAvailableUrl
  
@automated @PUDO @DEBD-3299
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

@automated @PUDO @DEBD-3299
Scenario: Validate the delivery tooltip for combination DebParcelStoreCC + DebParcelStoreExpressCC on My bag
   Given I navigate to "pDpDsPsAvailableUrl"
   And I store name of product and select save item on pdpPage
   And I select available size and add to bag on pdpPage
   When I click on "viewBasketCheckoutButton" on "pdpPage"
   Then I should see "myBagPageHeader" exist on "myBagPage"
   And I should see "pDpDsPsAvailableName" product name exist on myBagPage
   And I "add" product "pDpDsEPsAvailableName" from "myBagPage"

@automated @PUDO @DEBD-3299
Scenario: Validate the delivery tooltip for combination DebParcelStoreCC + DebParcelStoreStandardCC on My bag
   Given I navigate to "pDpDsPsAvailableUrl"
   And I store name of product and select save item on pdpPage
   And I select available size and add to bag on pdpPage
   When I click on "viewBasketCheckoutButton" on "pdpPage"
   Then I should see "myBagPageHeader" exist on "myBagPage"
   And I should see "pDpDsPsAvailableName" product name exist on myBagPage
   And I "Remove" product "pDpDsEPsAvailableName" from "myBagPage"
   And I "add" product "pDpDsSPsAvailableName" from "myBagPage"

@automated @PUDO @DEBD-3299
Scenario: Validate the delivery tooltip for combination DebParcelStoreCC + DebsCC on My bag
   Given I navigate to "pDpDsPsAvailableUrl"
   And I store name of product and select save item on pdpPage
   And I select available size and add to bag on pdpPage
   When I click on "viewBasketCheckoutButton" on "pdpPage"
   Then I should see "myBagPageHeader" exist on "myBagPage"
   And I should see "pDpDsPsAvailableName" product name exist on myBagPage
   And I "Remove" product "pDpDsSPsAvailableName" from "myBagPage"
   And I "add" product "pDpDsOnlyAvailableName" from "myBagPage"

@manual @DEBD-3299
Scenario: Validate the switch off functionality for PUDO(both standard and express delivery) on My bag page
   When I navigate to "testDressPdpURL"
   And I select available size and add to bag on pdpPage
   When I click on "viewBasketCheckoutButton" on "pdpPage"
   Then I should see "myBagPageHeader" exist on "myBagPage"
   And I should see "deliveryOptionSection" exist on "myBagPage"
   And I should see "availableDeliveryOption" exist on "myBagPage"
   And I should see "unavailableDeliveryOption" exist on "myBagPage"
   And I validate "Collect from store" fullfillment option "enable" on myBagPage
   And I validate "Collect from ParcelShop" fullfillment option "disable" on myBagPage

@manual @DEBD-3300
Scenario: Validate the switch off functionality for PUDO(only express delivery) on My bag page
   When I navigate to "testDressPdpURL"
   And I select available size and add to bag on pdpPage
   When I click on "viewBasketCheckoutButton" on "pdpPage"
   Then I should see "myBagPageHeader" exist on "myBagPage"
   And I should see "deliveryOptionSection" exist on "myBagPage"
   And I should see "availableDeliveryOption" exist on "myBagPage"
   And I should see "unavailableDeliveryOption" exist on "myBagPage"
   And I validate "Collect from store" fullfillment option "enable" on myBagPage
   And I validate "Collect from ParcelShop" fullfillment option "enable" on myBagPage
   And I hover over "Collect from ParcelShop" and validate the "Collect from parcel shop (within 5 working days) £1.99" is enabled on myBagPage
   And I hover over "Collect from ParcelShop" and validate the "Collect from parcel shop (next day (Express Delivery)- order before 9pm) £3.99" is disabled on myBagPage 
