Feature: Test Debenhams fullfillment options on product on my bag

@automated  @Fixed @DBNHST-380
Scenario: Navigate to dress psp page and validate the brand and product name of first product should match the pdp page
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  And I should validate product name on "pdpPage"

@automated  @Fixed @DBNHST-380
Scenario: Navigate to dress pdp page from above and validate the final price of above product should match the pdp page and then validate the same on my bag
  And I should validate final price on "pdpPage"
  And I add the product to bag and go to my bag page
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should validate final price on "myBagPage"

@automated  @Fixed @DBNHST-382
Scenario: Navigate to dress pdp page from above scenario and validate the shop more tags that appears on the page
  Given I navigate to "testDressPdpURL"
  Then I should see "shopMoreText" as "Shop more" on "pdpPage"
  And I should see "shopMoreTag1Text" as "Women" on "pdpPage"
  And I should see "shopMoreTag2Text" as "Dresses" on "pdpPage"
  And I should see "shopMoreTag3Text" as "PRINCIPLES" on "pdpPage"

@automated  @WIP @DBNHST-380 @DBNHST-379 @DBNHST-378
Scenario: Navigate to dress pdp page and validate all size with out of stock message
  Given I navigate to "PDPOOSLingerie"
  And I validate all sizes on "pdpPage"
  Then I should see "pddpColourSwatches" exist on "pdpPage"
  And I should not see "sizeSwatches" on "pdpPage"
  When I select Out of Stock colour from Colourswatches
  And I should see all size swatches are out of Stock
  Then I should see "productSizeMessage" as "SORRY - THIS ITEM IS CURRENTLY OUT OF STOCK." on "pdpPage"


@automated  @Fixed @DBNHST-379 @DBNHST-378
Scenario: Navigate to pdp page from above scenario and validate low stock message if any when selected
  Then I validate low stock message on "pdpPage"

@automated  @Fixed @DBNHST-379 @DBNHST-378
Scenario: Navigate to my bag and validate colour and size from above scenario
  Then I validate size on my bag page from "pdpPage"

@automated  @Fixed @DBNHST-381
Scenario: Navigate to dress pdp page and validate product desction and delivery returns accordions exist on page with name
  Given I navigate to "testDressPdpURL"
  Then I should see "prodDescAccordion" exist on "pdpPage"
  And I should see "deliveryReturnAccordion" exist on "pdpPage"
  And I should see "prodDescAccordion" as "Product Description" on "pdpPage"
  And I should see "deliveryReturnAccordion" as "Delivery / Returns" on "pdpPage"

@manual @DBNHST-381
Scenario: Navigate to dress pdp page from above scenario and validate the text inside product desction and delivery returns accordion from desktop
  Then I should validate text inside product description from desktop
  And I should validate text inside Delivery / Returns from desktop

@manual @DBNHST-378
Scenario: Navigate to PDP page and validate the sizes available in dropdown with out of stock and low stock message
  Given I navigate to PDP page
  Then I validate the sizes available in dropdown with out of stock and low stock message

@manual @DBNHST-384
Scenario: Navigate to PDP page with credit card points and validate the same when product added in my bag
  Given I navigate to "testDressPdpURL"
  Then I validate credit card points and add product to bag
  And I navigate to My bag and validate the credit card points of the product added

@manual @DBNHST-384
Scenario: Navigate to PDP page with beauty club card points and validate the same when product added in my bag
  Given I navigate to "testPerfumePdpURL"
  Then I validate beauty club card points and add product to bag
  And I navigate to My bag and validate the beauty club card points of the product added

@manual @DBNHST-842
Scenario: Navigate to Debenhams PDP page and validate user able to select an out of stock size/colour for a product

@manual @DBNHST-842
Scenario: Navigate to Debenhams PDP page and validate user able to see an error when selecting an out of stock size/colour for a product

@automated  @Fixed
Scenario: Navigate to Debenhams PDP page and validate RoundRobin Crousel.
  Given I navigate to "roundRobin1BaynotepdpPage"
  Then I should see "roundRobinSection" exist on "pdpPage"
  Then I should see "roundRobinHeaderText" as "Also in the range" on "pdpPage"
  Then I should validate product brand matching in "roundRobinSection" on "pdpPage"
  Then I am in view of "roundRobinPrd1" on "pdpPage"
  And I wait for "1000" milliseconds
  And I should match product name of first product "roundRobinPrd1" in carousel on "pdpPage"
  #Then I navigate to "pdpCrossSale"
  #Then I should see "crossSellSection" exist on "pdpPage"
  #And  I should see "crossSellHeaderText" as "Also in the range" on "pdpPage"
  #Then I should validate product brand matching in "crossSellSection" on "pdpPage"
  #Then I am in view of "crossSellPrd1" on "pdpPage"
  #And I wait for "1000" milliseconds
  #And I should match product name of first product "crossSellPrd1" in carousel on "pdpPage"

@manual @DBNHST-1324
Scenario: Navigate to Kat Von D product PDP page and validate that user is able to see the customer images

@manual @DBNHST-1324
Scenario: Navigate to Kat Von D product PDP page and validate that on clicking customer image user is navigated to apop out modal consisting of related products with shop more CTA

@manual @DBNHST-1324
Scenario: Navigate to Urban Decay product PDP page and validate that user is able to see the customer images

@manual @DBNHST-1324
Scenario: Navigate to Urban Decay product PDP page and validate that on clicking customer image user is navigated to apop out modal consisting of related products with shop more CTA

@manual @DBNHST-1793
Scenario: Validation of the Add to Bag Confirmation drawer on PDP on mobile
  Given the user is logged in
  And the user is on the PDP page
  When the user clicks the add to bag
  Then the drawer should open up with the confirmation
  And user should view the options to either close the drawer to proceed to My Bag

@manual @DBNHST-1793
Scenario: Validation of the Add to Bag Confirmation drawer on PDP on mobile
  Given the user is logged in
  And the user is on the PDP page
  When the user clicks the add to bag
  Then the product should be added to the My Bag
  And user should be able to view the Product added in my bag

@manual @DBNHST-1793
Scenario: Verification of the Check Tick on the Add to Bag Confirmation drawer on PDP on mobile
  Given the user is logged in
  And the user is on the PDP page
  When the user clicks the add to bag
  Then the user should view the confirmation drawer with the Check Tick indicating that bag is added to the drawer

@manual @DBNHST-1793
Scenario: Validate add to bag Confirmation drawer on Bundle, furniture and concession products

@automated @Fixed @DEBD-2428
Scenario Outline: Valiadte the selected colour swatch is highlighted in Green except Chanel
Given I navigate to "<Products>"
Then I select available size and add to bag on pdpPage
Then I should verify "border-top-color" of "pdpSelectedSwatch" as "pdpSelectedBorderSwatchColor" on "pdpPage"
# Then I should verify "font-weight" of "pdpSelectedSwatchText" as "700" on "pdpPage"

  Examples:
  | Products    |
  |beautyLipstickPdpUrl |
  |braUrl |
  |pdpKnitWearProduct |

@manual @DEBD-2428
Scenario: Valiadte the selected colour swatch is highlighted in Black for Chanel
Given I navigate to "chanelLipstickPdp"
Then I select available size and add to bag on pdpPage
Then I should verify "border-top-color" of "pdpSelectedSwatch" as "pdpChanelSelectedBorderSwatchColor" on "pdpPage"

@manual @DEBD-2428
Scenario: Validate the low stock message displayed next to colour selected
  Given I am on a non beauty PDP (eg lingere/knitwear)
  When I select a colour swatch that has low stock availability
  Then the (low in stock) message will display next to the colour selected
  And the hurry less the X left message will appear underneath the swatches

@manual @DEBD-2428
Scenario: Validate the out of stock message displayed next to colour selected
Given I am on a non beauty PDP (eg lingere/knitwear)
When I select a colour swatch is out of stock
Then the (out of stock) message will display next to the colour selected
And the hurry less the Sorry - this item is currently out of stock message will appear underneath the swatches
And the size container (where applicable) will have a red border

@manual @DEBD-2428
Scenario: Validate the colour name is displayed on mouse hover on desktop
Given I am on a PDP
When I hoover the mouse over the colour swatches
Then the colour name will display

@manual @DEBD-2429
Scenario: Validate the prompt text is displayed when in view if size selector
  Given I am on a PDP
  When I view the size selector container
  Then the prompt text will read "Select a size"

@manual @DEBD-2429
Scenario: Validate the selected size is displayed within size selector container
  Given I have selected a size
  Then I will see the size within the size selector container

@manual @DEBD-2429
Scenario: Validate the OOS error message is displayed underneath the size container
  Given I am on a PDP
  When I select a size that is out of stock
  Then I will see the "Sorry this item is currently out of stock" underneath the size container
  And against the selected colour
  And the size will have a grey strikethrough
  And the size container will have a red border
  And a white cross inside the swatch

@manual @DEBD-2429
Scenario: Validate the low stock message is displayed underneath the size container
  Given I am on a PDP
  When I select a size that is low in stock
  Then I will see "hurry less than x left" underneath the size container
  And against the selected colour within the colour drop down

@manual @DEBD-2429
Scenario: Validate the size guide will sit underneath the size container for mobile and tablet
  Given I am on a mobile or tablet PDP
  Then the size guide will sit underneath the size container

@manual @DEBD-2504
Scenario: Validate the ATB button and quanitity selector are displayed inline
Given I AM on a PDP
Then the ATB button and quanitity selector will be inline

@manual @DEBD-2504
Scenario: Validate the save for later icon will be positioned inline with the Brand
Given I AM on a PDP
Then the save for later icon will be positioned inline with the Brand and Product Title
