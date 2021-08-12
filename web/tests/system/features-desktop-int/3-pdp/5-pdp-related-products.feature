Feature: Test Debenhams pdp page validation

@notAutomated @DEBD-349
Scenario: Validate that user able to click and add product which is visible under Customers who bought this also bought section
  Given I navigate to "pdpRelatedPrdBoughtTogether"
  When I am in view of "customerWhoAlsoBoughtContainer" on "pdpPage"
  Then I should see "customerWhoAlsoBoughtHeader" as "Customer who bought this item also bought" on "pdpPage"
  And I should match product name of first product "customerWhoAlsoBoughtPrd1" in carousel on "pdpPage"
  When I select available size on "pdpPage"
  And I addtobag the product and validate minibag count
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "has been added to your bag." on "pdpPage"

@manual @DEBD-349
Scenario: Validate the UI and product against desktop production for Customers who bought this also bought section
  Given I navigate to "pdpPage"
  When I am in view of "customerWhoAlsoViewed" on "pdpPage"
  Then I can see the customers who bought this also bought carousel above the reviews section
  And I validate products against desktop production
  And I validate products price against desktop production
  When I click on an arrow or pip
  Then next set of products scrolls through

@manual @DEBD-349
Scenario: Validate the UI and product against desktop production for Customers who bought this also bought section wiht less than 4 products
  Given I navigate to "pdpPage"
  When I am in view of "customerWhoAlsoViewed" on "pdpPage"
  Then I can see the customers who bought this also bought carousel above the reviews section
  And I validate the Ui against style guide
  When there are less than 4 products
  Then I will see no arrows or pips
