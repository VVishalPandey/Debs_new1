Feature: Test Debenhams fullfillment options on product on my bag

@automated @DBNHST-118
Scenario: Navigate to Debenhams my bag page with a dress added and validate all fullfillment options are available
  Given I navigate to pdp "dress" and add to bag
  Then I should see "testDressProductName" product name exist on myBagPage
  And I validate "Standard" fullfillment option "enable" on myBagPage
  And I validate "Next day" fullfillment option "enable" on myBagPage
  And I validate "Choose day or evening" fullfillment option "enable" on myBagPage
  And I validate "Click & Collect" fullfillment option "enable" on myBagPage
  And I validate "International" fullfillment option "enable" on myBagPage

@automated @DBNHST-118
Scenario: Navigate to Debenhams my bag page with a dress added from above scenario and validate text of all fullfillment options
  When I click and validate "Standard" fullfillment option text as "Standard delivery estimated within 5 working days (£3.49),  free on orders £45 or over" on myBagPage
  And I click and validate "Next day" fullfillment option text as "7 days a week between 8am to 6pm - £3.99(Order by 9pm Sun to Fri, 6pm Sat)" on myBagPage
  And I click and validate "Choose day or evening" fullfillment option text as "Daytime delivery 8am to 6pm - £3.99(Sun to Fri - order by 9pm)(Sat - order by 6pm)Evening delivery 6pm to 10pm - £6.99(Order by midnight)" on myBagPage
  And I click and validate "Click & Collect" fullfillment option text as "Collect from store - order by 9pm for next day collection after midday.Orders £20 or over - FREEOrders under £20 - £2." on myBagPage
  And I click and validate "International" fullfillment option text as "From £5.00 - FREE on orders £50 or over" on myBagPage

@automated @DBNHST-118
Scenario: Navigate to Debenhams my bag page with a furniture added and validate only standard fullfillment options is available
  Given I navigate to pdp "furniture" and add to bag
  Then I should see "testFurnitureProductName" product name exist on myBagPage
  And I validate "Standard" fullfillment option "enable" on myBagPage
  And I validate "Next day" fullfillment option "disable" on myBagPage
  And I validate "Choose day or evening" fullfillment option "disable" on myBagPage
  And I validate "Click & Collect" fullfillment option "disable" on myBagPage
  And I validate "International" fullfillment option "disable" on myBagPage

@automated @DBNHST-118
Scenario: Navigate to Debenhams my bag page with a furniture added from above scenario and validate text of all available fullfillment options
  When I click and validate "Standard" fullfillment option text as "Standard delivery of this product will be within 8 weeks (£3.49),  free on orders £45 or over" on myBagPage
  And I click and validate "Next day" fullfillment option text as "Not available for this item" on myBagPage
  And I click and validate "Choose day or evening" fullfillment option text as "Not available for this item" on myBagPage
  And I click and validate "Click & Collect" fullfillment option text as "Not available for this item" on myBagPage
  And I click and validate "International" fullfillment option text as "Not available for this item" on myBagPage

@manual
Scenario: Navigate to Debenhams my bag page with a beuty having free gift added and validate text of all available fullfillment options
  Given I navigate to my bag with beauty with free gift added
  Then validate all the available fullfillment options for beauty and free gift

@manual @DBNHST-118
Scenario: Navigate to Debenhams my bag page with a perfume added and validate fullfillment options of perfurme should be same as for its gift
  Given I navigate to pdp "perfume" and add to bag
  Then I should see "testPerfumeProductName" product name exist on myBagPage
  And I should see "testPerfumeProductName" product name exist on myBagPage
  And I validate "Standard" fullfillment option "enable" on myBagPage
  And I validate "Next day" fullfillment option "enable" on myBagPage
  And I validate "Choose day or evening" fullfillment option "enable" on myBagPage
  And I validate "Click & Collect" fullfillment option "enable" on myBagPage
  And I validate "International" fullfillment option "disable" on myBagPage
  #And I should see "testPerfumeFreeProductName" product name exist on myBagPage
  #And I validate "Standard" fullfillment option "enable" on myBagPage
  #And I validate "Next day" fullfillment option "enable" on myBagPage
  #And I validate "Choose day or evening" fullfillment option "enable" on myBagPage
  #And I validate "Click & Collect" fullfillment option "enable" on myBagPage
  #And I validate "International" fullfillment option "disable" on myBagPage
