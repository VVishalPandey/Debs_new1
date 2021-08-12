Feature: Test Debenhams Delivery Options on My Bag page validation

@automated @DEBD-202
Scenario: Validate that the tooltip should open when user hovers on available delivery option
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I should see "deliveryOptionSection" exist on "myBagPage"
  And I should see "availableDeliveryOption" exist on "myBagPage"
  And I validate "Standard" fullfillment option "enable" on myBagPage
  And I validate "Next day" fullfillment option "enable" on myBagPage
  And I validate "Choose day or evening" fullfillment option "enable" on myBagPage
  And I validate "Click & Collect" fullfillment option "enable" on myBagPage
  And I validate "International" fullfillment option "enable" on myBagPage
  And I click and validate "Standard" fullfillment option text as "Standard delivery estimated within 5 working days (£3.49),  free on orders £50 or over" on myBagPage
  And I click and validate "Next day" fullfillment option text as "7 days a week between 8am to 6pm - £3.99(Order by 9pm Sun to Fri, 6pm Sat)" on myBagPage
  And I click and validate "Choose day or evening" fullfillment option text as "Daytime delivery 8am to 6pm - £3.99(Sun to Fri - order by 9pm)(Sat - order by 6pm)" on myBagPage
  #And I click and validate "Click & Collect" fullfillment option text as "Collect from store - order before midnight for collection in 2 working days. Collection after 2pm.Orders £30 or over - FREE Orders under £30 - £2." on myBagPage
  And I click and validate "International" fullfillment option text as "From £5.00 - FREE on orders £50 or over" on myBagPage

@automated @DEBD-202
Scenario: Validate that the tooltip should open when user hovers on available delivery option
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testFurniturePdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "testFurnitureProductName" product name exist on myBagPage
  And I should see "deliveryOptionSection" exist on "myBagPage"
  And I should see "availableDeliveryOption" exist on "myBagPage"
  And I should see "unavailableDeliveryOption" exist on "myBagPage"
  And I validate "Standard" fullfillment option "enable" on myBagPage
  And I validate "Next day" fullfillment option "disable" on myBagPage
  And I validate "Choose day or evening" fullfillment option "disable" on myBagPage
  And I validate "Click & Collect" fullfillment option "disable" on myBagPage
  And I validate "International" fullfillment option "disable" on myBagPage
  And I click and validate "Standard" fullfillment option text as "Standard delivery of this product will be within 9 weeks (£3.49),  free on orders £50 or over" on myBagPage
  And I click and validate "Next day" fullfillment option text as "Not available for this item" on myBagPage
  And I click and validate "Choose day or evening" fullfillment option text as "Not available for this item" on myBagPage
  And I click and validate "Click & Collect" fullfillment option text as "Not available for this item" on myBagPage
  And I click and validate "International" fullfillment option text as "Not available for this item" on myBagPage

@automated @DEBD-202
Scenario: Validate that the tooltip should open showing "Not available for this item" when user hovers on unavailable delivery option
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testChanelPerfPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "testChanelPerfProductName" product name exist on myBagPage
  And I should see "deliveryOptionSection" exist on "myBagPage"
  And I should see "availableDeliveryOption" exist on "myBagPage"
  And I should see "unavailableDeliveryOption" exist on "myBagPage"
  And I validate "Standard" fullfillment option "enable" on myBagPage
  And I validate "Next day" fullfillment option "enable" on myBagPage
  And I validate "Choose day or evening" fullfillment option "enable" on myBagPage
  And I validate "Click & Collect" fullfillment option "enable" on myBagPage
  And I validate "International" fullfillment option "disable" on myBagPage
  And I click and validate "Standard" fullfillment option text as "Standard delivery estimated within 5 working days (£3.49),  free on orders £50 or over" on myBagPage
  And I click and validate "Next day" fullfillment option text as "7 days a week between 8am to 6pm - £3.99(Order by 9pm Sun to Fri, 6pm Sat)" on myBagPage
  And I click and validate "Choose day or evening" fullfillment option text as "Daytime delivery 8am to 6pm - £3.99(Sun to Fri - order by 9pm)(Sat - order by 6pm)" on myBagPage
  And I click and validate "Click & Collect" fullfillment option text as "Collect from store - order before midnight for collection in 2 working days. Collection after 2pm.Orders £30 or over - FREEOrders under £30 - £2." on myBagPage
  And I click and validate "International" fullfillment option text as "Not available for this item" on myBagPage

@automated @DEBD-202
Scenario: Validate that the tooltip should close when user mouse offs the icon or focuses on another element
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I should see "deliveryOptionSection" exist on "myBagPage"
  And I should see "availableDeliveryOption" exist on "myBagPage"
  When I mouse hover on "availableDeliveryOption" on "myBagPage"
  Then I should see "deliveryOptionTooltip" exist on "myBagPage"
  When I mouse hover on "checkoutButton" on "myBagPage"
  Then I should not see "deliveryOptionTooltip" on "myBagPage"
