Feature: Test Debenhams My bag feature When there is no products in my bag for International

@manual @DDAI-60
Scenario: Navigate to Debenhams mini bag page And remove all products
  Given THAT I have added one or more products to my shopping bag
  When I navigate to My Bag (through Add to bag confirmation or Minibag)
  And remove all my products
  Then I should see the 'Your bag is currently empty' page as per screenshot
  And a continue shopping CTA (links to homepage)

@manual @DDAI-60
Scenario: Navigate to Debenhams mini bag page And verify empty minibag
  Given I have no products in my bag
  When I press my mini bag
  Then I see your page is empty
  And a continue shopping CTA (closes mini bag)

@manual @DBNHST-1514
Scenario: Navigate to Debenhams my bag page and validate that on clicking on an out of stock product size/colour drop down the out of stock message will be displayed below it and the add to bag button will be greyed out

@manual @DBNHST-1514
Scenario: Navigate to Debenhams my bag page and validate that on clicking on an out of stock product size/colour swatch the out of stock message will be displayed below it and the add to bag button will be greyed out

@manual @DBNHST-1568
Scenario: Navigate to Debenhams my bag page with a product which is eligible for next day delivery and validate that countdown timer between the delivery threshold message along with first go to checkout CTA is displayed

@manual @DBNHST-1568
Scenario: Navigate to Debenhams my bag page from PDP page with a product which is eligible for next day delivery and validate that countdown timer between the delivery threshold message along with first go to checkout CTA is displayed for MVT variation-1

@manual @DBNHST-1568
Scenario: Navigate to Debenhams my bag page from PDP page with a product which is eligible for next day delivery and validate that countdown timer between the delivery threshold message along with first go to checkout CTA is displayed for MVT variation-1

@manual @DBNHST-1568
Scenario: Navigate to Debenhams my bag page from PDP page with a product which is eligible for next day delivery and validate that countdown timer is not displayed for MVT variation-1 when we add a product eligible for next day delivery from the my saved item section on my bag.

@manual @DBNHST-1568
Scenario: Navigate to Debenhams my bag page from PDP page with 2 products one qualifies for next day delivery and other does not then validate that countdown timer is displayed for MVT variation-1 when we remove the product not eligible for next day delivery from the my bag.

@manual @DBNHST-1568
Scenario: Navigate to Debenhams my bag page from PDP page with 2 products which qualifies for next day delivery and  validate that least countdown timer is displayed for MVT variation-1.

@manual @DBNHST-1568
Scenario: Navigate to Debenhams my bag page from PDP page with a product which is eligible for next day delivery and validate that countdown timer is not displayed for MVT variation-1 when we add a product not eligible for next day delivery from the my saved item section on my bag.

@manual @DBNHST-1568
Scenario: Navigate to Debenhams my bag page from PDP page with a product which is eligible for next day delivery and validate that countdown timer is not displayed for MVT variation-1 when refresh the my bag.

@manual @DBNHST-1626
Scenario: Navigate to Debenhams my bag page and validate that the sticky CTA is displayed

@manual @DBNHST-1626
Scenario: Navigate to Debenhams my bag page and validate that only one checkout button is displayed

@manual @DBNHST-1626
Scenario: Navigate to Debenhams my bag page and validate that on updating product count the total price is getting updatd in the sticky CTA

@manual @DBNHST-1626
Scenario: Navigate to Debenhams my bag page and validate that on removing all the products from my bag the sticky CTA is not displayed

@manual @DBNHST-1693
Scenario: Navigate to Debenhams my bag page and validate that newsletter subscription section is not displayed

@manual @DBNHST-1693
Scenario: Navigate to Debenhams my bag page and validate that Social media icons is not displayed

@manual @DBNHST-1693
Scenario: Navigate to Debenhams my bag page and validate that Country selector link is not displayed

@manual @DDAI-800
Scenario: Validate guest user basket with some products(Beauty and Dresses) in it gets merged with registered user's empty basked if guest user gets login with valid user name and password from checkout login page, basket should contain Beauty and dresses products

@manual @DDAI-800
Scenario: Validate guest user basket with some products(Furniture) in it gets merged with registered user's basket which is already having some products(Beauty) in it if guest user gets login with valid user name and password from checkout PSP, basket should contain both Beauty and Furniture products

@manual @DDAI-800
Scenario: Validate guest user empty basket gets merged with registered user's basket which is already having some products(Bundle) in it if guest user gets login with valid user name and password from checkout PDP, basket should contain bundle products

@manual @DDAI-800
Scenario: Validate guest user basket with some products(Beauty) in it , should not get merged with registered user's basked with some products(Dresses) if guest user gets login with valid user name and password from checkout login page, basket should contain dresses products of guest basket and other products(Beauty) should get removed.

@manual @DDAI-800
Scenario: Validate below scenario : Mobile 1 -> login -> add product x , Now  on Tablet 1 -> guest -> add product y -> login at checkout, Now Mobile 1 -> add product z -> minibag should be updated with y+z (x to be removed)

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
