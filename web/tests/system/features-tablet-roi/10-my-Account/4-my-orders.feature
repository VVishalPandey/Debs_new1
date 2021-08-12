Feature: Test Debenhams my Account feature for ROI

@manual @DBMTE-667
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate order details
  Given I am signed in as a registered user
  And I have previously place 1 or more orders
  When I am on the My Orders page
  Then I will see Back link (returns to my account page)
  And I should see Returns information link (returns FAQ page)
  And I should not see Track an order link (track & trace page)
  And I should see On desktop there is a sort by filer - Remove the filtering drop down on mobile as the orders are automatically in chronological order
  And I should see My orders information 

@manual @DBMTE-667
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate When I have previously 0 orders
  Given I am signed in as a registered user
  And I have previously 0 orders
  When I am on the My Orders page
  Then  I will the “You have placed no orders” message

@manual @DBMTE-667
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate When I have placed multiple orders
  Given I am signed in as a registered user
  And I have previously place 1 or more orders
  When I am on the My Orders page
  Then I will see all my previously placed orders in chronological order (most recent first)
  And I will see the {Order number,Order placed (date),Total (cost),View Order Details (link to order details page)}

@manual @DBMTE-667
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate Order details section
  Given that I am signed in as a registered user
  And I have previously placed 1 order
  When I am on the Order Details page
  Then I will see the details of an individual order
  And I will see the following fields(Order number,Sub-total,Delivery,Discounts,Total,Order place (date),Delivery Address,Delivery Method)
  And I should see Products that were ordered – image (link to product PDP), title (link to product PDP), size, colour, price, quantity, sub-total
  And I should see Back to my orders (link to my orders page)
