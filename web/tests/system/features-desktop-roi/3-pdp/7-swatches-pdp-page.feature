Feature: Test Debenhams color swatches in pdp validation

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

   @manual  @DEBD-576
Scenario: Verify that the user is able to see colour swatches and dropdown on Lingerie PDP page
   Given I navigate to "braUrl"
   When I should see "colourSwatches" exist on "pdpPage"
   And I should see "sizeDropDown" exist on "pdpPage"
   Then I hover on "colourSwatches" on "pdpPage"
   And I should see the colour name and now price

@manual  @DEBD-576
Scenario: Verify that the user hover container on moving from one clour swatch to another on PDP page
  When I scroll the mouse in between 2 colour swatch
  Then I should not see the hover container if the mouse is between 2 colour swatches

@manual  @DEBD-576
Scenario: Verify that the user hover container for the first conatiner on PDP page
  When I scroll the mouse from one colour swatch to another
  Then I should not see the hover container of the 1st colour swatch
  And I should see the hover container for the 2nd colour swatch

@manual  @DEBD-576
Scenario: Verify that when user selects a colour swatch on PDP page, then redirected to the new colour PDP with chosen colour in orange border
  When I select a "availableColourSwatch" from "pdpPage"
  Then I verify page reload on selecting a different colour swatch
  And I should see chosen colour swatch having orange border
  And I should verify that the image and tumbnails are updated
  And I should verify the price is updated
  And I should see the colour name displayed in selected field
  And I should not see the size in selected field
   
@manual  @DEBD-576
Scenario: Verify that when user selects a size dropdown on PDP page, then it should be displayed in selected
  When I select a "availableSizeDropDown" from "pdpPage"
  Then I should see the selected size
  And I should see the colour name and size displayed in selected field

@manual  @DEBD-576
Scenario: Verify that the size dropdown consist of size in alpha numeric ascending order
  When I click on "sizeDropDown"
  Then I should see the sizes in alphanumberic ascending order

@manual  @DEBD-576
Scenario: Verify that on selecting OOS colour swatch the red border is displayed and the page is relaoded
  When I should see cross through the out of stock colour
  Then I select OOS colour swatch
  And I should see the page getting relaoded
  And I should see all the sizes as out of stock
  And I should see the out of stock inline error message
  And I should see the quantity + CTA and add to bag CTA as deactivated
  And I should see the OOS colour name in selected field

@manual  @DEBD-576
Scenario: Verify that on selecting OOS size from dropdown the OOS error message is displayed
  When I click on "sizeDropDown"
  Then I should see the out of stock size in grey with a strike through
  And I should see an (out of stock) message in red
  When I select the OOS size
  Then I will get a red border
  And I should see the out of stock inline error message
  And I should see the quantity + CTA and add to bag CTA as deactivated
  And I should see the OOS colour name in selected field  


@manual  @DEBD-576 
Scenario: Verify that the user is able to see colour swatches and dropdown on Lingerie PDP page
   Given I navigate to "knitwearUrl"
   When I should see "colourSwatches" exist on "pdpPage"
   And I should not see "sizeSwatches" on "pdpPage"
   Then I hover on "colourSwatches" on "pdpPage"
   And I should see the colour name and now price

@manual  @DEBD-576
Scenario: Verify that on selecting OOS size from swatches the OOS error message is displayed
  Then I should see cross through the OOS size
  When I select the OOS size
  Then I will get a red border
  And I should see the out of stock inline error message
  And I should see the quantity + CTA and add to bag CTA as deactivated
  And I should see the OOS size name in selected field 
