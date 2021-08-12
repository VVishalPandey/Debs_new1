Feature: Test Debenhams fullfillment options on product on my bag

@manual @DBMTE-617
Scenario: Navigate to Debenhams my bag page with a dress added and validate all fullfillment options are available
  Given I logout
  Then I navigate to mybag and empty the bag
  When I navigate to pdp "dress" and add to bag
  Then I should see "testDressProductName" product name exist on myBagPage
  And I validate "Standard" fullfillment option "enable" on myBagPage
  And I validate "Next day" fullfillment option "enable" on myBagPage
  And I validate "Click & Collect" fullfillment option "enable" on myBagPage
  And I validate "Choose day or evening" fullfillment option not available on myBagPage
  And I validate "International" fullfillment option not available on myBagPage

@manual @DBMTE-617
Scenario: Navigate to Debenhams my bag page with a dress added from above scenario and validate text of all fullfillment options
  When I click and validate "Standard" fullfillment option text as "Standard delivery estimated within 4 working days (€4.95), free on orders €30 or over" on myBagPage
  And I click and validate "Next day" fullfillment option text as "Order by midday (Sun to Fri) for Next Day Delivery (€5.95)" on myBagPage
  And I click and validate "Click & Collect" fullfillment option text as "Collect from store the next day, 7 days a week - FREE Order before midday (Sun to Fri) for next day collection" on myBagPage

@manual @DBMTE-617 @dataNA
Scenario: Navigate to Debenhams my bag page with a furniture added and validate only standard fullfillment options is available
  Given I navigate to mybag and empty the bag
  When I navigate to pdp "furniture" and add to bag
  Then I should see "testFurnitureProductName" product name exist on myBagPage
  And I validate "Standard" fullfillment option "enable" on myBagPage
  And I validate "Next day" fullfillment option "disable" on myBagPage
  And I validate "Click & Collect" fullfillment option "disable" on myBagPage

@manual @DBMTE-617
Scenario: Navigate to Debenhams my bag page with a furniture added from above scenario and validate text of all available fullfillment options
  When I click and validate "Standard" fullfillment option text as "Standard delivery of this product will be within 9 weeks (normally €4.95)" on myBagPage
  And I click and validate "Next day" fullfillment option text as "Not available for this item" on myBagPage
  And I click and validate "Click & Collect" fullfillment option text as "Not available for this item" on myBagPage

@manual
Scenario: Navigate to Debenhams my bag page with a beuty having free gift added and validate text of all available fullfillment options
  Given I navigate to my bag with beauty with free gift added
  Then validate all the available fullfillment options for beauty and free gift

@manual @DBMTE-617
Scenario: Navigate to Debenhams my bag page with a perfume added and validate fullfillment options of perfurme should be same as for its gift
  Given I navigate to mybag and empty the bag
  When I navigate to pdp "perfume" and add to bag
  Then I should see "testPerfumeProductName" product name exist on myBagPage
  And I validate "Standard" fullfillment option "enable" on myBagPage
  And I validate "Next day" fullfillment option "enable" on myBagPage
  And I validate "Click & Collect" fullfillment option "enable" on myBagPage
  And I should see "testPerfumeFreeProductName" product name exist on myBagPage
  And I validate "Standard" fullfillment option "enable" on myBagPage
  And I validate "Next day" fullfillment option "enable" on myBagPage
  And I validate "Click & Collect" fullfillment option "enable" on myBagPage
