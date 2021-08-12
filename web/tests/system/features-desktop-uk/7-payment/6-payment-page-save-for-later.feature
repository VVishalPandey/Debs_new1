Feature: Test Debenhams Payment page Save For Later

@manual @DEBD-285 @awsManual
Scenario: Validate that when a product becomes low in stock, a low stock messaging is dispplayed on Payment Page
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  And the product becomes low in stock
  Then I should see "lowStockMessaging" exist on "paymentPage"

@manual @DEBD-285 @awsManual
Scenario: Validate that when a product becomes out of stock, an out of stock messaging is dispplayed on Payment Page
  When I navigate to the Payment Page with an Out Of Stock Product
  Then I should see "outOfStockMessaging" exist on "paymentPage"
  And I should see "outOfStockMessaging" as "Please check your bag, some items in your bag are no longer in stock" on "paymentPage"
  And I should see "outOfStockMessaging" in "Red" on at the top of "paymentPage"
  And I should see "redOOSMessaging" for the Out Of Stock Products on "paymentPage"
  And I should see "removeLink" in "Red" on "paymentPage"
  And I should see "productQuantity" have a strike through on "paymentPage"
  And I should see "productPrice" have a strike through on "paymentPage"
  When I have chosen a tender type that covers the full balance
  And I have entered billing address on Payment Page
  Then I should see "placeOrderPayCTA" as "disabled" on "paymentPage"

@manual @DEBD-285
Scenario: Validate that when an Out Of Stock product is removed from Payment Page
  When I click on "removeLink" on "paymentPage"
  Then I should see "popUpModal" exist on "paymentPage"
  When I click on "yesOnModalPopUp" on "paymentPage"
  Then the product will be removed from "paymentPage"
  And I should see "paymentPageTotal" gets updated on "paymentPage"
  Then I should see "placeOrderPayCTA" as "enabled" on "paymentPage"
  And I validate the product count is decreased
  And I validate the Order total is updated accordingly
  And I validate that promo code related to the Out Of Stock product is removed
  And I should see "placeOrderPayCTA" should change from grey to orange and become clickable
  When I click on "placeOrderPayCTA" on "paymentPage"
  Then I should see "loaderIcon" exist on "paymentPage"
  And I should see "skelatonOrderConfirmation" exist on "orderConfirmationPage"

@manual @DEBD-285 @awsManual
Scenario: Validate that when a product is moved to SFL from Payment Page
  When I navigate to the Payment Page with an Out Of Stock Product
  Then I should see "outOfStockMessaging" exist on "paymentPage"
  And I should see "outOfStockMessaging" as "Please check your bag, some items in your bag are no longer in stock" on "paymentPage"
  And I should see "outOfStockMessaging" in "Red" on at the top of "paymentPage"
  And I should see "redOOSMessaging" for the Out Of Stock Products on "paymentPage"
  And I should see "removeLink" in "Red" on "paymentPage"
  And I should see "productQuantity" have a strike through on "paymentPage"
  And I should see "productPrice" have a strike through on "paymentPage"
  When I click on "removeLink" on "paymentPage"
  Then I should see "popUpModal" exist on "paymentPage"
  When I click on "saveForLaterOnPopUpModal" on "paymentPage"
  Then the product will be removed from "paymentPage"
  And the product should be added to My Saved Items
  And I should see "paymentPageTotal" gets updated on "paymentPage"
  Then I should see "placeOrderPayCTA" as "enabled" on "paymentPage"
  And I should see "placeOrderPayCTA" should change from grey to orange and become clickable
  When I click on "placeOrderPayCTA" on "paymentPage"
  Then I should see "loaderIcon" exist on "paymentPage"
  And I should see "skelatonOrderConfirmation" exist on "orderConfirmationPage"

@manual @DEBD-285 @awsManual
Scenario: Validate that when a product is moved to SFL  and user has 99 saved items from Payment Page
  When I navigate to the Payment Page with an Out Of Stock Product
  Then I should see "outOfStockMessaging" exist on "paymentPage"
  And I should see "outOfStockMessaging" as "Please check your bag, some items in your bag are no longer in stock" on "paymentPage"
  And I should see "outOfStockMessaging" in "Red" on at the top of "paymentPage"
  And I should see "redOOSMessaging" for the Out Of Stock Products on "paymentPage"
  And I should see "removeLink" in "Red" on "paymentPage"
  And I should see "productQuantity" have a strike through on "paymentPage"
  And I should see "productPrice" have a strike through on "paymentPage"
  When I click on "removeLink" on "paymentPage"
  Then I should see "popUpModal" exist on "paymentPage"
  When I click on "saveForLaterOnPopUpModal" on "paymentPage"
  Then I should see "errorMessage" exist on "paymentPage"
  And I should see "errorMessage" as "Error: Sorry, you have reached the limit of 99 saved items. Please remove the items from your list to save." on "paymentPage"
  And the product will not be removed from "paymentPage"
  And the product will not be added to My Saved Items

@manual @DEBD-285
Scenario: Validate that when user clicks out of Remove pop up on Payment Page
  When I navigate to the Payment Page with an Out Of Stock Product
  Then I should see "outOfStockMessaging" exist on "paymentPage"
  And I should see "outOfStockMessaging" as "Please check your bag, some items in your bag are no longer in stock" on "paymentPage"
  And I should see "outOfStockMessaging" in "Red" on at the top of "paymentPage"
  And I should see "redOOSMessaging" for the Out Of Stock Products on "paymentPage"
  And I should see "removeLink" in "Red" on "paymentPage"
  And I should see "productQuantity" have a strike through on "paymentPage"
  And I should see "productPrice" have a strike through on "paymentPage"
  When I click on "removeLink" on "paymentPage"
  Then I should see "popUpModal" exist on "paymentPage"
  When I click out of "popUpModal" on "paymentPage"
  Then I should see "popUpModal" closed
  And the product will not be removed from "paymentPage"
  And the product will not be added to My Saved Items
  And I should see "placeOrderPayCTA" as "disabled" on "paymentPage"

@manual @DEBD-285 @awsManual
Scenario: Validate that when an Out Of Stock product having a linked promo code is removed from Payment Page
  When I have an item in my bag linked with a promo code
  And I am on payment page
  When I click on "removeLink" on "paymentPage"
  Then I should see "popUpModal" exist on "paymentPage"
  When I click on "yesOnModalPopUp" on "paymentPage"
  Then the product will be removed from "paymentPage"
  And I should see "paymentPageTotal" gets updated on "paymentPage"
  Then I should see "placeOrderPayCTA" as "enabled" on "paymentPage"
  And I validate the product count is decreased
  And I validate the Order total is updated accordingly
  And I validate that promo code related to the Out Of Stock product is removed
  And I should see "placeOrderPayCTA" should change from grey to orange and become clickable
  When I click on "placeOrderPayCTA" on "paymentPage"
  Then I should see "loaderIcon" exist on "paymentPage"
  And I should see "skelatonOrderConfirmation" exist on "orderConfirmationPage"

@manual @DEBD-285 @awsManual
Scenario: Validate that when an Out Of Stock product with a free gift is removed from Payment Page
  When I have an item in my bag linked with a free gift
  And I am on payment page
  When I click on "removeLink" on "paymentPage"
  Then I should see "popUpModal" exist on "paymentPage"
  When I click on "yesOnModalPopUp" on "paymentPage"
  Then the product will be removed from "paymentPage"
  And I should see "paymentPageTotal" gets updated on "paymentPage"
  Then I should see "placeOrderPayCTA" as "enabled" on "paymentPage"
  And I validate the product count is decreased
  And I validate the Order total is updated accordingly
  And I validate that free gift product is removed
  And I should see "placeOrderPayCTA" should change from grey to orange and become clickable
  When I click on "placeOrderPayCTA" on "paymentPage"
  Then I should see "loaderIcon" exist on "paymentPage"
  And I should see "skelatonOrderConfirmation" exist on "orderConfirmationPage"
