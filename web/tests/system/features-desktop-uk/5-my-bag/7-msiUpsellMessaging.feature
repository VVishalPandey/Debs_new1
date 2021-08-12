
Feature: Test Debenhams My Saved Items Upsell through delivery threshhold messaging

# Prerequisite: Below scenarios assume if bag total is more than £50 and is eligible for free Standard delivery.
# You should see the both FREE CLICK & COLLECT STANDARD DELIVERY banner on top of the bag page depending upon the conditions of bag and product


@automated @DEBD-3045
Scenario: Validate the hyperlink 'View saved items below' in free delivery message if the bag contains item which is eligible for Click & Collect and saved item exist

  Given I logout
  When I navigate to "testDressPdpURL"
  And I store name of product and select save item on pdpPage
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I validate the "banner price"
  And I click on "deliveryBannerSavedItemsLink" on "myBagPage"
  Then I should see "savedItemsCarousal" exist on "myBagPage"


@manual @DEBD-3045
Scenario: Validate the hyperlink should not be displayed in free delivery message if the bag subtotal is more than £50

  Given I logout
  When I navigate to "testDressPdpURL"
  When I add to bag quantity "3" and go to my bag page
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I validate the "banner message"
  Then I should not see "hyperLinkBannerMessage" on "myBagPage"
  Then I should see "bannerMessage" as "Your shopping bag qualifies for FREE Standard Delivery." on "myBagPage"

@manual @DEBD-3045
Scenario: Validate the banner message when there is no item in bag and it has saved item for product more than £50

  Given I logout
  When I navigate to "testDressPdpURL"
  And I store name of product and select save item on pdpPage
  When I navigate to "basketcheckouturl"
  Then I should not see "hyperLinkBannerMessage" on "myBagPage"
  And I add the product from saved item to bag
  And I should see the message as "Your shopping bag qualifies for FREE Standard Delivery."
  Then I should see "hyperLinkBannerMessage" as "View Saved Items Below" on "myBagPage"
  And I remove the product from saved items in bag
  And I should see the message as "Your shopping bag qualifies for FREE Standard Delivery."

@manual @DEBD-3045
Scenario: Validate the hyperlink 'View saved items below' in free delivery message if the bag contains item which is eligible for Click & Collect and saved item exist

  Given I logout
  When I navigate to "testDressPdpURL"
  And I store name of product and select save item on pdpPage
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  And I validate the "banner message"
  Then I should see "hyperLinkBannerMessage" as "View Saved Items Below" on "myBagPage"
  And I click on "viewSavedItemsBelow" on "myBagPage"
  Then I should see "upsellHeaderText" as "My Saved Items" on "myBagPage"

@manual @DEBD-3045
Scenario: Validate the change in delivery message when you increase the quanity for the selected product in bag

  Given I logout
  When I navigate to "testDressPdpURL"
  And I store name of product and select save item on pdpPage
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "hyperLinkBannerMessage" as "View Saved Items Below" on "myBagPage"
  And I should see the message as "You're £XX away from FREE Standard delivery."
  And I increase the steepeer quanity to 2 to get the subtotal as £40
  Then I should see "hyperLinkBannerMessage" as "View Saved Items Below" on "myBagPage"
  And I should see the message as "You're £XX away from FREE Standard delivery."
  And I increase the steepeer quanity to 3 to get the subtotal more than £50
  Then I should not see "hyperLinkBannerMessage" on "myBagPage"
  And I should see the message as "Your shopping bag qualifies for FREE Standard Delivery."


@manual @DEBD-3045
Scenario: Validate the hyperlink 'View saved items below' should  not be displayed in free delivery message if the bag contains no saved items and cart is less than £50

  Given I logout
  When I navigate to "testDressPdpURL"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I validate the "banner message"
  Then I should not see "hyperLinkBannerMessage" on "myBagPage"
  And I should see the message as "You're £XX away from FREE Standard delivery."


@manual @DEBD-3045
Scenario: Validate the hyperlink 'View saved items below' should  not be displayed in free delivery message if the bag contains no saved items and cart is more than £50

  Given I logout
  When I navigate to "testDressPdpURL"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I validate the "banner message"
  Then I should not see "hyperLinkBannerMessage" on "myBagPage"
  And I should see the message as "Your shopping bag qualifies for FREE Standard Delivery."


@manual @DEBD-3045
Scenario: Validate the hyperlink 'View saved items below' should not be displayed in free delivery message if the free delivery promocode is applied on the cart

  Given I logout
  When I navigate to "testDressPdpURL"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I validate the "banner message"
  When I enter "<SHA5>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "myBagPage"
  And I should validate "promoCodeRemove" exist on "myBagPage"
  Then I should not see "freeStandardDeliveryBanner" on "myBagPage"
  Then I should not see "cLick&COllectBanner" on "myBagPage"



@manual @DEBD-3045
Scenario: Validate the hyperlink 'View saved items below' should not be displayed in free delivery message if you remove the item from bag to saved items

  Given I logout
  When I navigate to "testDressPdpURL"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I remove products from "myBagPage"
  And I validate the "banner message"
  Then I should not see "hyperLinkBannerMessage" on "myBagPage"


@manual @DEBD-3045
Scenario: Validate the FREE CLICK AND COLLECT Banner message should be displayed if you have product with Click and Collect

  Given I logout
  When I navigate to "testDressPdpURL"
  And I store name of product and select save item on pdpPage
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should not see "BannerClick&Collect" on "myBagPage"


@manual @DEBD-3045
Scenario: Validate the FREE CLICK AND COLLECT Banner message should not be displayed if bag contains item which is not available for Click & collect

  Given I logout
  When I navigate to "testDressPdpURL" which doesnot have click and collect
  And I store name of product and select save item on pdpPage
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should not see "BannerClick&Collect" on "myBagPage"
  And I add the product to cart for which C&C is available
  Then I should not see "BannerClick&Collect" on "myBagPage"

@manual @DEBD-3045
Scenario: Validate hyper link View Saved items should not be displayed in FREE STandard delivery message when you remove the item from saved item

  Given I logout
  When I navigate to "testDressPdpURL"
  And I store name of product and select save item on pdpPage
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  And I validate the "banner message"
  Then I should see "hyperLinkBannerMessage" as "View Saved Items Below" on "myBagPage"
  And I remove products from "mySavedItems"
  Then I should not see "hyperLinkBannerMessage" as "View Saved Items Below" on "myBagPage"


@manual @DEBD-3045
Scenario: Validate the banner message when there is no item in bag and it has saved item for product less than £50

  Given I logout
  When I navigate to "testDressPdpURL"
  And I store name of product and select save item on pdpPage
  When I navigate to "basketcheckouturl"
  Then I should not see "hyperLinkBannerMessage" on "myBagPage"
  And I add the product from saved item to bag
  And I should see the message as "You're £XX away from FREE Standard delivery."
  Then I should see "hyperLinkBannerMessage" as "View Saved Items Below" on "myBagPage"
  And I remove the product from saved items in bag
  Then I should not see "hyperLinkBannerMessage" on "myBagPage"

@manual @DEBD-3045
Scenario: Validate the UI of banner messages and positioning as per design

  Given I logout
  When I navigate to "testDressPdpURL"
  And I store name of product and select save item on pdpPage
  When I navigate to "basketcheckouturl"
  Then I should not see "hyperLinkBannerMessage" on "myBagPage"
  And I should see the FREE standard delivery banner message as per UI design on top of the page
  And I should see the FREE Click and COllect banner message as per UI design on top of the page
