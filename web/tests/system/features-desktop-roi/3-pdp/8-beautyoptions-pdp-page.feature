Feature: Test Debenhams beauty pdp validation


@manual  @DEBD-575
Scenario: Verify the colour accordion for beauty product with 13 or more colour swatches
  Given I navigate to "beautyPdpUrl"
  Then I should see colour swatches
  And I should see 1.5 rows of swatches
  And I should see "Show More Colours" acoordion

@manual  @DEBD-575
Scenario: Verify the "Show More Colours" accordion for beauty product with 13 or more colour swatches
  When I click on "Show More Colours" accordion
  Then I should see the colour swatches expanding into a scrollable container
  And I should see 3.5 rows of swatches
  And I should see show less colours CTA

@manual  @DEBD-575
Scenario: Verify the "Show less Colours" accordion for beauty product with 13 or more colour swatches
  When I click on "Show less Colours" CTA
  Then I should see colour swatch container will collapse
  And I should see 1.5 rows of swatches
  And I should see "Show More Colours" acoordion

@manual  @DEBD-575
Scenario: Verify the colour accordion for beauty product with 7 or more colour swatches on larger view port
  Given I navigate to beauty PDP page
  Then I should see colour swatches
  And I should verify that 6 swatches per row as a maximum are displayed
  And I should see the colour and price per ml/g in one line

@manual  @DEBD-575
Scenario: Verify the colour accordion for beauty product with 7 or more colour swatches on smaller view port
  Given I navigate to beauty PDP page
  Then I should see colour swatches
  And I should verify that 4 swatches per row as a maximum are displayed
  And I should see the colour and price per ml/g stacked on top of each other

@manual @DEBD-575
Scenario: Verify that the tooltip is displayed on hovering colour swatches
  When I hover over a colour swatch
  Then I should see a tool tooltip
  And I should see the tool tip displays the colour name

@manual  @DEBD-576 @DEBD-575
Scenario: Verify that the user is able to see colour name, now price & low stock message on hovering over the low stock colour swatches PDP page
   When I hover on "lowInStockcolourSwatches" on "pdpPage"
   Then I should see the hover container
   And I should see the colour name in black inside hover conatiner
   And I should see now price in black inside hover conatiner
   And I should see low in stock message in amber inside hover conatiner

@manual  @DEBD-576 @DEBD-575
Scenario: Verify that the user is able to see colour name, now price & low stock message on hovering over the out of stock colour swatches PDP page
   When I hover on "lowInStockcolourSwatches" on "pdpPage"
   Then I should see the hover container
   And I should see the colour name in black inside hover conatiner
   And I should see now price in black inside hover conatiner
   And I should see low in stock message in red inside hover conatiner

@automated @PDP @Fixed  @DEBD-575
Scenario: Valdiate all espots and links on Beauty PDP
  Given I navigate to "beautylipstickPdp"
  # Then I should see "FreeGift anchor link" on "PdpPage"
  And I should see "rewardclubPointsRoi" exist on "pdpPage"
  And I should see "colourSwatches" exist on "pdpPage"
  When I am in view of "pricePermlRoi" on "pdpPage"
  And I should see "pricePermlRoi" exist on "pdpPage"
  # And I should see "free gift espot" on "PdpPage"
  When I am in view of "nonReturnableEspot" on "pdpPage"
  And I should see "nonReturnableEspot" exist on "pdpPage"
  When I am in view of "customerPhoto" on "pdpPage"
  And I should see "customerPhoto" exist on "pdpPage"
  When I am in view of "rewardclubPointsRoi" on "pdpPage"
  When I click on "rewardclubPointsRoi" on "pdpPage"
  Then I should see "url" contains "about-your-rewards-card"

@notautomated @DEBD-575
Scenario: Navigate to PDP page and validate the sizes available in dropdown with out of stock and low stock message
  Given I navigate to "beautyPdpUrl"
  Then I select "Out of Stock" size from "dropdown"
  And I validate "Out of Stock" message from  "dropdown" on  "pdpPage"
  Then I select "low stock" size from "dropdown"
  And I validate "low stock" message from  "dropdown" on  "pdpPage"
