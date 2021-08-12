Feature: Test Debenhams Ireland save for later and remove product from my bag

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the remove pop up
  Given I navigate to "testDressPdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I navigate to "testDress2PdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I navigate to "basketCheckoutUrl"
  When I click on "firstProductRemove" on "myBagPage"
  Then I should see "removepopUpHeaderText" as "Do you want to remove this item?" on "myBagPage"
  And I should see "removePopUpImage" exist on "myBagPage"
  And I should see "removePopUpClose" exist on "myBagPage"
  And I should see "removePopUpYesButton" exist on "myBagPage"
  And I should see "removePopUpSaveLaterButton" exist on "myBagPage"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the removal of product from bag
  Given I navigate to "basketCheckoutUrl"
  When I remove first product and select "Yes, remove it" then I validate bag on myBagPage
  Then I validate the "total items"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the save for later from remove pop up
  Given I navigate to "testDressPdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I navigate to "basketCheckoutUrl"
  When I remove first product and select "Save for later" then I validate bag on myBagPage
  Then I validate the "total items"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the close of remove product pop up
  Given I navigate to "testDressPdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I navigate to "basketCheckoutUrl"
  When I remove first product and select "Close" then I validate bag on myBagPage
  Then I validate the "total items"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate save for later of product from bag
  Given I navigate to "testDressPdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I navigate to "testDress2PdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I navigate to "basketCheckoutUrl"
  When I select save for later for first product then I validate bag on myBagPage
  Then I validate the "total items"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate Removal of products with free gifts or product discounts must remove that free gift and update the subtotal price accordingly

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the my bag page after removal of all the products from my bag

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the products is getting added in My saved items once selected for save for later on my bag

@manual @DDAI-769
Scenario Outline: Navigate to Debenhams My bag page and validate that user is able to move products from saved items into my bag
	Given I navigate to my bag page with saved items
	When I move an "<Item>" from saved items into my bag
	Then the product should be transfered
	Then the page should pin to where the product has been added into bag
	Then the notification should appear
	And the mini bag should update

	Examples:
		| Items       |
		| Women Dress |
		| Mens Jeans  |
		| Sofa        |
		| T-shirt bras|
		| Chanel      |
		| Lipstick    |
