Feature: Test Debenhams my orders page under my account

@notAutomated @DEBD-282 @awsmanual
Scenario Outline: Navigate to Debenhams my orders page under my account for an existing user and validate the same
  Given I logout
  When I wait for "4000" milliseconds
  And I click on "menuIcon" on "commonPage"
  And I wait for "2000" milliseconds
  And I click on "signInOption" on "commonPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "pageTitle" as "My account" on "myDetailsPage"
  Then I click on "myOrderButton" on "myDetailsPage"
  And I wait for "2000" milliseconds
  And I should verify "selectedMyAccMenuOption" "My orders" to be highlighted "font-weight" on "myDetailsPage"
  And I should see "title" as "My orders" on "myOrdersPage"
  And I should see "totalOrders" exist on "myOrdersPage"
  And I should see "returnInfoLink" exist on "myOrdersPage"
  And I should see "trackOrderLink" exist on "myOrdersPage"
  And I should see "orderDetailsContainers" exist on "myOrdersPage"

  Examples:
    | email                      | password  |
    | testautomationd3@gmail.com | password3 |

@notAutomated @DEBD-282 @awsmanual
Scenario Outline: Validate the content present in orderDetailsContainer for existing user
  Then I should see "orderNumberText" containing "Order number" on "myOrdersPage"
  And I should see "lastOrderNumber" containing "<orderNumber>" on "myOrdersPage"
  And I should see "lastOrderDateText" as "Order placed:" on "myOrdersPage"
  And I should see "lastOrderDate" as "<orderDate>" on "myOrdersPage"
  And I should see "viewOrderDetailsLink" exist on "myOrdersPage"
  And I should see "totalCost" exist on "myOrdersPage"

  Examples:
    | orderNumber  | orderDate        |
    | 700116681453 | 07 November 2017 |

@manual @DEBD-282 @awsmanual
Scenario Outline: Validate the Order details page for existing user
  Then I click on "viewOrderDetailsLink" on "myOrdersPage"
  And I should see "title" as "Order Details" on "myOrdersPage"
  Then I should see "orderNumberText" containing "Order number" on "myOrdersPage"
  #And I should see "lastOrderNumber" containing "<orderNumber>" on "myOrdersPage"
  And I should see "productDetails" exist on "myOrdersPage"
  And I should see "productColor" exist on "myOrdersPage"
  And I should see "productSize" exist on "myOrdersPage"
  #And I should see "productQuantity" exist on "myOrdersPage"
  And I should see "subTotalText" exist on "myOrdersPage"
  And I should see "subTotalAmount" exist on "myOrdersPage"
  And I should see "deliveryText" exist on "myOrdersPage"
  And I should see "deliveryAmount" exist on "myOrdersPage"
  And I should see "discountText" exist on "myOrdersPage"
  And I should see "discountAmount" exist on "myOrdersPage"
  And I should see "totalText" exist on "myOrdersPage"
  And I should see "totalAmount" exist on "myOrdersPage"
  And I should see "orderPlaceText" exist on "myOrdersPage"
  And I should see "orderPlaceDate" as "<orderDate>" on "myOrdersPage"
  And I should see "deliveryForText" exist on "myOrdersPage"
  And I should see "deliveryForName" exist on "myOrdersPage"
  And I should see "deliveryAddressText" exist on "myOrdersPage"
  And I should see "deliveryAddress" exist on "myOrdersPage"
  And I should see "deliveryMethodText" exist on "myOrdersPage"
  And I should see "deliveryMethodSelected" exist on "myOrdersPage"
  And I should see "trackOrderButton" exist on "myOrdersPage"

  Examples:
    | orderNumber  | orderDate       |
    | 700129611896 | 11 January 2018 |

@manual @DEBD-250
Scenario: Validate the track an order page for existing user from My order details page
  Then I click on "viewOrderDetailsLink" on "myOrdersPage"
  And I should see "trackOrderButton" exist on "myOrdersPage"
  Then I click on "trackOrderButton" on "myOrdersPage"
  And I should see "title" as "Order Tracking" on "myOrdersPage"

@manual @DEBD-250
Scenario: Validate the track an order page for existing user from My orders page
  Then I click on "backButton" on "myOrdersPage"
  Then I click on "myOrderButton" on "myDetailsPage"
  And I should see "trackOrderLink" exist on "myOrdersPage"
  Then I click on "trackOrderLink" on "myOrdersPage"
  And I should see "title" as "Order Tracking" on "myOrdersPage"
  And I should see "orderNumberInput" exist on "myOrdersPage"
  And I should see "emailIdInput" exist on "myOrdersPage"
  And I should see "postcodeInput" exist on "myOrdersPage"
  And I should see "submitButton" exist on "myOrdersPage"

@manual @DEBD-250
Scenario: Validate the track an order page submit page
  When I enter "700129611896" in "orderNumberInput" on "myOrdersPage"
  And I enter "domj.abbott@gmail.com" in "emailIdInput" on "myOrdersPage"
  Then I click on "submitButton" on "myOrdersPage"
  And I should see "OrderDetails" exist on "myOrdersPage"

@manual @DEBD-250
Scenario: Validate that an error is displayed on entering an incorrect order number on the track order page

@notAutomated @DEBD-282 @awsmanual
Scenario Outline: Navigate to Debenhams my orders page under my account for an new user and validate the same
  Given I logout
  When I wait for "4000" milliseconds
  And I click on "menuIcon" on "commonPage"
  And I wait for "2000" milliseconds
  And I click on "signInOption" on "commonPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "pageTitle" as "My account" on "myDetailsPage"
  Then I click on "myOrderButton" on "myDetailsPage"
  And I should verify "selectedMyAccMenuOption" "My orders" to be highlighted "font-weight" on "myDetailsPage"
  And I should see "title" as "My orders" on "myOrdersPage"
  And I should see "noOrdersMessageContainer" exist on "myOrdersPage"
  And I should see "noOrdersMessage" as "You haven’t ordered anything yet!" on "myOrdersPage"
  And I should see "startShoppingMessage" containing "<message>" on "myOrdersPage"
  And I should see "goShoppingButton" exist on "myOrdersPage"

  Examples:
    | email          | password | message                                                                          |
    | edcb@gmail.com | abcd123  | It’s time to browse through our amazing products. You can save them by using the |


@manual @DEBD-250
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate Track my order lik from my orders page
  Given I on the My Orders page
  And I have previously placed an orderr
  When I click the 'Track my order' link
  Then I am taken to the order tracking page
  And I can see a back button (back to my account homepage)

@manual @DEBD-250
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate Track my order lik from Order Details Page
  Given I on the Orders Details page
  And I have previously placed an order
  When I click the 'Track your order' link
  Then I am taken to the order tracking page
  And I can see a back button (back to my account homepage)

@manual @DEBD-250
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate details on Order tracking page
  Given I have previously placed an order
  And I am on the order tracking page
  When I enter my order number
  And my post code OR email address
  Then I will be taken to the relevant order tracking page (see screenshot)
  And I will be able to link to the returns, track your order, and contact us help pages
