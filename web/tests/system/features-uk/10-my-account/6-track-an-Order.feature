Feature: Test Sprint 10 story DBNHST-294

@manual @DBNHST-294
Scenario: My Account - Page Setup :Senario-My Orders displayed  :Existing User
  Given I logout
  And I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I click on "rememberMe" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "titleOfPage" as "My details" on "my-details"
  And I should see "myOrders" exist on "my-details"

@manual @DBNHST-294
Scenario: My Account - Page Setup :Senario-My Orders :New User having no order
  When I click on "myOrders" on "my-details"
  Then I should see "titleOfPage" as "My orders" on "my-details"
  And I should see "backNavigationButton" exist on "my-details"
  And I should see "emptyOrderPageMessage" as "You have no orders placed" on "my-details"
  And I should see "continueShoppingButton" exist on "my-details"

@manual @DBNHST-294
Scenario: My Account - Page Setup :Senario-My Orders :Existing User having order numbers
  When I click on "myOrders" on "my-details"
  Then I should see "titleOfPage" as "My orders" on "my-details"
  And I should see "backNavigationButton" exist on "my-details"
  And I should see "returnsInformtionLink" exist on "my-details"
  And I should see "trackAnOrderLink" exist on "my-details"
  And I should see "viewMoreDetailslink" exist on "my-details"
  And I should see "orderNumber" as "Order number:" on "my-details"

@manual @DBNHST-294
Scenario: My Account - Page Setup :Senario-My Orders :Existing User having order numbers clicks on Track an order link and verify its functionality
  When I click on "trackAnOrderLink" on "my-details"
  Then I should see "formHeader" as "Order Tracking" on "my-details"
  And I should see "formTitle" as "Track your order number without signing in" on "my-details"
  And I should see "orderNumberInput" exist on "my-details"
  And I should see "postCodeInput" exist on "my-details"
  And I should see "emailAddressInput" exist on "my-details"
  And I should see "submitButton" exist on "my-details"

@manual @DBNHST-294
Scenario: My Account - Page Setup :Senario-My Orders :Existing User having order numbers verify the order tracking functionality by providing the postcode
  When I enter "<orderNumber>" in "orderNumberInput" on "my-details"
  And I enter "<postcode>" in "postCodeInput" on "my-details"
  When I click on "submitButton" on "my-details"
  Then I should see "sorryMessage" exist on "my-details"
  And I should see "formHeader" as "Order Tracking" on "my-details"
  And I should see "customerOrderNumber" as "<orderNumber>" on "my-details"
  Then I verify "href" of "returnDetailsLink" as "returnDetails" on "my-details"
  And I verify "href" of "orderBriefDescriptionLink" as "orderBriefDescription" on "my-details"
  And I verify "href" of "contactUsLink" as "contactUsDetails" on "my-details"
  Then I should see "orderColumn" exist on "my-details"
  And I should see "QuantityColumn" exist on "my-details"
  And I should see "StatusDateTimeColumn" exist on "my-details"
  And I should see "StatusColumn" exist on "my-details"
  And I should see "CarrierInfoColumn" exist on "my-details"
  And I should see "productName" exist on "my-details"
  And I should see "productQuantity" exist on "my-details"
  And I should see "orderDate" exist on "my-details"
  And I should see "orderStatus" exist on "my-details"
  And I should see "customerSignature" exist on "my-details"

@manual @DBNHST-294
Scenario: My Account - Page Setup :Senario-My Orders :Existing User having order numbers verify the order tracking functionality by providing the email
  When I enter "<orderNumber>" in "orderNumberInput" on "my-details"
  And I enter "<email>" in "postCodeInput" on "my-details"
  When I click on "submitButton" on "my-details"
  Then I should see "sorryMessage" exist on "my-details"
  And I should see "formHeader" as "Order Tracking" on "my-details"
  And I should see "customerOrderNumber" as "<orderNumber>" on "my-details"
  Then I verify "href" of "returnDetailsLink" as "returnDetails" on "my-details"
  And I verify "href" of "orderBriefDescriptionLink" as "orderBriefDescription" on "my-details"
  And I verify "href" of "contactUsLink" as "contactUsDetails" on "my-details"
  Then I should see "orderColumn" exist on "my-details"
  And I should see "QuantityColumn" exist on "my-details"
  And I should see "StatusDateTimeColumn" exist on "my-details"
  And I should see "StatusColumn" exist on "my-details"
  And I should see "CarrierInfoColumn" exist on "my-details"
  And I should see "productName" exist on "my-details"
  And I should see "productQuantity" exist on "my-details"
  And I should see "orderDate" exist on "my-details"
  And I should see "orderStatus" exist on "my-details"
  And I should see "customerSignature" exist on "my-details"

@manual @DBNHST-294
Scenario: Place an order and then get is cancelled.Now verify that the status in order tracking is displayed as Cancelled

@manual @DBNHST-294
Scenario: Place an order with standard delivery and view the order status in My Orders

@manual @DBNHST-294
Scenario: Place an order with Click and collect delivery option and view the status in My Orders

@manual @DBNHST-294
Scenario: Place an order with Next or nominated day delivery and view the status in My Orders

@manual @DBNHST-294
Scenario: Verify the status of a delivered product
