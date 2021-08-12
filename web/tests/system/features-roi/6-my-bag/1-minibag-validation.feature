Feature: Test Debenhams minibag feature for ROI

@automated @DDAI-304
Scenario: Navigate to Debenhams home page>MiniBag>Validate Empty MiniBag Feature for ROI
  Given I navigate to "homeURL"
  And I wait for "1000" milliseconds
  Then I logout
  #And I click on "countrySelectorpopupclose" on "commonPage"
  Then I should see "minibagicon" exist on "minibagPage"
  Then I click on "minibagicon" on "minibagPage"
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "minibagPage"
  And I should see "continueshoppingButton" exist on "minibagPage"
  And I should see "emptyCartSubtitleMessage" as "Why not treat yourself to a little something?" on "minibagPage"

@automated @DDAI-304
Scenario: Navigate to Debenhams home page>MiniBag>Validate product details on minibag for ROI
  #Given I navigate to "homeURL"
  #And I wait for "1000" milliseconds
  #And I click on "countrySelectorpopupclose" on "commonPage"
  Then I click on "minibagicon" on "minibagPage"
  And I should validate minibag count "before"
  When I navigate to "womenDressesPdpUrl"
  Then I select the available size swatch
  When I click on "addToBagButton" on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 1"
  When I navigate to "kidsDresspdpUrl"
  When I click on "sizedropdown1" on "pdpPage"
  And I select available size from "dropdown"
  When I click on "addToBagButton" on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I click on "minibagicon" on "minibagPage"
  And I should see "firstProductTitle" as "Light blue multiway maxi dress" on "minibagPage"
  And I should see "firstProductImage" exist on "minibagPage"
  When I click on "firstProductImage" on "minibagPage"
  Then I should see "addToBagButton" exist on "pdpPage"
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 2"
  Then I click on "minibagicon" on "minibagPage"
  And I should see "firstProductColor" as "Light Blue" on "minibagPage"
  And I should see "firstProductSize" exist on "minibagPage"
  And I should see "firstProductPrice" exist on "minibagPage"
  And I should see "firstProductQuantity" as "Qty: 1" on "minibagPage"
  And I should see "firstProductPrice" containing "€" on "minibagPage"
  And I should see "secondProductColor" as "Navy" on "minibagPage"
  And I should see "secondProductSize" exist on "minibagPage"
  And I should see "secondProductPrice" exist on "minibagPage"
  And I should see "secondProductQuantity" as "Qty: 1" on "minibagPage"
  And I should see "secondProductPrice" containing "€" on "minibagPage"
  Then I should see "subTotal" containing "Subtotal: €" on "minibagPage"
  And I should validate final price of product no. "2" on "minibagPage"
  And I should validate subtotal after removing the product "1" on minibag page

@manual @DDAI-304
Scenario: Navigate to Debenhams home page>MiniBag>More than 6 items to bag functioanlity for ROI
  Given I have added six items to my bag
  When I open the mini bag
  Then I will see five products
  And a more link that takes me to the bag
  And the mini bag will be scrollable

@manual @DDAI-304
Scenario: Navigate to Debenhams home page>MiniBag>Verify minibagicon number once the product is added or removed for ROI
  Given I have added or removed a new product to the bag
  Then the mini bag icon number will update

@manual @DDAI-304
Scenario: Navigate to Debenhams home page>MiniBag>Verify closeicon on minibag for ROI
  Given I have the mini bag open
  When I press the x
  Then the mini bag will close

@manual @DDAI-304
Scenario: Navigate to Debenhams home page>MiniBag>clicking on Secure Checkout navigate to my bag page for ROI
  Given I have one or more product in the bag
  When I open the mini bag
  And press secure checkout
  Then I am taken to the my bag page

@manual @DDAI-304
Scenario: Navigate to Debenhams home page>MiniBag>Out of Stock for ROI
  Given I have a product in the bag
  And it is out of stock
  When I open mini bag
  Then I will not be notified that it is out of stock (until I go to my bag)

@manual @DDAI-304
Scenario: Navigate to Debenhams home page>MiniBag>Back to top for ROI
  Given that I am on any page (except payment page)
  When I scroll past 2000px
  Then I can see the back to top button
  And When I press it
  Then I am taken back to the top of the page
