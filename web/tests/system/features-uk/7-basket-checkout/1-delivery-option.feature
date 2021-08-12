Feature: Test Debenhams delivery options page

@automated @DBNHST-117
Scenario: Navigate to Debenhams delivery options page as guest and validate the page with delivery options when user has both options available

  Given I navigate to "testDressPdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I navigate to delivery option as guest
  Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  And I should see "homeDeliveryCTA" exist on "deliveryOptionPage"
  And I should see "clickCollectCTA" exist on "deliveryOptionPage"
  And I should see "homeDeliveryText" as "Get your order delivered to a location of your choice on a day and time that suits you." on "deliveryOptionPage"
  And I should see "clickCollectText1" as "Delivered to your nearest UK store the Next Day - simply collect at your convenience" on "deliveryOptionPage"
  #And I should see "clickCollectText2" containing "Orders over £20 - FREE" on "deliveryOptionPage"
  Then I navigate to mybag and empty the bag

@automated @DBNHST-117
Scenario: Navigate to Debenhams delivery options page as guest and validate the page with delivery options when user has only home delivery option available
  Given I navigate to "testFurniturePdpURL"
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  And I click on "checkoutButton" on "myBagPage"
  Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  And I should see "homeDeliveryCTA" exist on "deliveryOptionPage"
  #And I should not see "clickCollectCTA" on "deliveryOptionPage"
  And I should see "homeDeliveryText" as "Get your order delivered to a location of your choice on a day and time that suits you." on "deliveryOptionPage"
  And I should see "clickCollectText1" containing "Some of the items in your order are not available for Click & Collect. Return to your shopping bag if you'd like to amend your order" on "deliveryOptionPage"
  Then I navigate to mybag and empty the bag

@automated @DBNHST-117
Scenario: Navigate to Debenhams delivery options page as guest and validate the page with delivery options when user has only home delivery option available
  Given I navigate to "testFurniturePdpURL"
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  And I click on "checkoutButton" on "myBagPage"
  Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "clickCollectText1" containing "Some of the items in your order are not available for Click & Collect. Return to your shopping bag if you'd like to amend your order" on "deliveryOptionPage"
  When I click on "returnShoppingBag" on "deliveryOptionPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should see "checkoutButton2" exist on "myBagPage"

@automated @DBNHST-117
Scenario: Navigate to Debenhams delivery options page as guest and validate the page with delivery options when user has both options available
  Given I navigate to "testDressPdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  And I click on "checkoutButton" on "myBagPage"
  Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "homeDeliveryText" as "Get your order delivered to a location of your choice on a day and time that suits you." on "deliveryOptionPage"
  When I click on "homeDeliveryCTA" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"

@manual @DBNHST-431
Scenario: Navigate to back from payment page to delivery type page(delivery option as Home delivery) as guest and validate that the already entered address breadcrumb is displayed on the top

@manual @DBNHST-431
Scenario: Navigate to back from delivery type page to delivery type page(delivery option as Home delivery) as guest and validate that the already entered address breadcrumb is displayed on the top

@manual @DBNHST-431 @Issue
Scenario: Navigate to from payment page to home page and then to delivery type page(delivery option as Home delivery) as guest and validate that the already entered address breadcrumb is displayed on the top

@manual @DBNHST-431
Scenario: Navigate to back from payment page to delivery type page(delivery option as Home delivery) as logged In and validate that the already entered address breadcrumb is displayed on the top

@manual @DBNHST-431
Scenario: Navigate to back from delivery type page to delivery type page(delivery option as Home delivery) as logged In and validate that the already entered address breadcrumb is displayed on the top

@manual @DBNHST-431 @Issue
Scenario: Navigate to from payment page to home page and then to delivery type page(delivery option as Home delivery) as logged In and validate that the already entered address breadcrumb is displayed on the top

@manual @DBNHST-431
Scenario: Navigate to back from payment page to delivery type page(delivery option as Click & collect) as logged In and validate that the already entered postcode is displayed on the top

@manual @DBNHST-431
Scenario: Navigate to back from delivery type page to delivery type page(delivery option as Click & collect) as logged In and validate that the already entered postcode is displayed on the top

@manual @DBNHST-431 @Issue
Scenario: Navigate to from payment page to home page and then to delivery type page(delivery option as Click & collect) as logged In and validate that the already entered postcode is displayed on the top

