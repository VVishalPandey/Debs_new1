Feature: Test Debenhams my Account feature for ROI

@manual @DDAI-137
Scenario: Navigate to Debenhams My Account page>Validate all CTA's
  Given THAT I am on My Account page
  And I should see follwing things(Name,Email address,Date of Birth,Newsletter preference)
  And is should see following CTA's(Edit Details,Manage Password,My Address Book,My Payment Cards,My Orders,My Saved Items,My Reward Club)

@manual @DDAI-328
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate order details
  Given I am signed in as a registered user
  And I have previously place 1 or more orders
  When I am on the My Orders page
  Then I will see Back link (returns to my account page)
  And I should see Returns information link (returns FAQ page)
  And I should see Track an order link (track & trace page)
  And I should see On desktop there is a sort by filer - Remove the filtering drop down on mobile as the orders are automatically in chronological order
  And I should see My orders information (as seen in DBNHST-285)

@manual @DDAI-328
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate When I have previously 0 orders
  Given I am signed in as a registered user
  And I have previously 0 orders
  When I am on the My Orders page
  Then  I will the “You have placed no orders” message

@manual @DDAI-328
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate When I have placed multiple orders
  Given I am signed in as a registered user
  And I have previously place 1 or more orders
  When I am on the My Orders page
  Then I will see all my previously placed orders in chronological order (most recent first)
  And I will see the {Order number,Order placed (date),Total (cost),View Order Details (link to order details page)}

@manual @DDAI-328
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate Order details section
  Given that I am signed in as a registered user
  And I have previously placed 1 order
  When I am on the Order Details page
  Then I will see the details of an individual order
  And I will see the following fields(Order number,Sub-total,Delivery,Discounts,Total,Order place (date),Delivery Address,Delivery Method)
  And I should see Products that were ordered – image (link to product PDP), title (link to product PDP), size, colour, price, quantity, sub-total
  And I should see Track your order (link to track & trace)
  And I should see Back to my orders (link to my orders page)

@manual @DDAI-329
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate Track my order lik from my orders page
  Given I on the My Orders page
  And I have previously placed an orderr
  When I click the 'Track my order' link
  Then I am taken to the order tracking page (https://www.debenhams.ie/webapp/wcs/stores/servlet/TrackTraceQueryView?storeId=10701&langId=-1&catalogId=10001&krypto=UioVfy0q8T%2BGAW4oX8DSHrcHpf2B9%2BNZvzDwFgwp6tzw5RM4%2F%2BanxjhVOR3JIefajYuELpAU41it3tsdHE%2F%2BS3HWaLfCRi7L4tlzsxW8EL64y829RQPsmXmTzuHYYtlL4XbgXSF5hLdW2q%2F6f06tWAyLzi05AL9pYM4d93pJkKo%3D&ddkey=https%3ALogon)

@manual @DDAI-329
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate Track my order lik from Order Details Page
  Given I on the Orders Details page
  And I have previously placed an order
  When I click the 'Track your order' link
  Then I am taken to the order tracking page (https://www.debenhams.ie/webapp/wcs/stores/servlet/TrackTraceQueryView?storeId=10701&langId=-1&catalogId=10001&krypto=UioVfy0q8T%2BGAW4oX8DSHrcHpf2B9%2BNZvzDwFgwp6tzw5RM4%2F%2BanxjhVOR3JIefajYuELpAU41it3tsdHE%2F%2BS3HWaLfCRi7L4tlzsxW8EL64y829RQPsmXmTzuHYYtlL4XbgXSF5hLdW2q%2F6f06tWAyLzi05AL9pYM4d93pJkKo%3D&ddkey=https%3ALogon)

@manual @DDAI-329
Scenario: Navigate to Debenhams My Account page-My Orders Page>Validate details on Order tracking page
  Given I have previously placed an order
  And I am on the order tracking page
  When I enter my order number
  And my eircode OR email address
  Then I will be taken to the relevant order tracking page (see screenshot)
  And I will be able to link to the returns, track your order, and contact us help pages
