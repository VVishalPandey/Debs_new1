Feature: Validate My Bag Page

@manual @DBMTE-356
Scenario:Verify delivery threshold messaging on My Bag
  Given that I am on My Bag
  And I am on DOTINT
  When I see a notification box stating the amount to reach for free delivery
  Then it should be shown in my local currency
  And the threshold should be localised e.g. Australia $100 And France 30
  And the messaging states "free delivery"

@manual @DBMTE-356
Scenario:Verify delivery threshold messaging on My Bag
  Given I am on my bag
  And I am on DOTINT
  When I have met the threshold
  Then I see messaging with "free delivery" rather than "free stAndard delivery"

@manual @DBMTE-361
Scenario: Validate My Bag Page
  Given I Navigate to My Bag Page
  Then I should see Global promotional banner
  And H1 title - My Bag
  And H2 - number of item(s)
  And One orange Secure Checkout CTA
  And sticky secure checkout section
  Then I should shee Product layout - Image, Title and short description, Size/colour selection, Final price
  And If there is a free gift(s) from the purchases, this must appear in the bag with no Price, Quantity selector, Save for later link, or Remove link.
  And Quantity selector - when there is x product left, the + button must be greyed out telling customers they can't add as there is no more in stock
  Then I should see save for later link (loader appears and product transferred out of My bag to My Saved Items)
  And Remove link (pop up appears with product image, 'Yes, remove it' or 'Save for later' buttons)
  And delivery options drawer with icons shown for Standard international delivery, selection will open an tool tip info container which has Close link.

@manual @DBMTE-361
Scenario: Validate My Bag Page OOS and Low stock products
  Given I Navigate to My Bag Page and I have one oos product and one low stock product in my bag
  Then I should see low in stock state - Yellow text displayed with the product in bag
  And I should see out of stock state - 'Go to checkout' buttons must be greyed out with corresponding banner error message & stepper disabled

@manual @DBMTE-361
Scenario:When user click on Secure checkout link on My bag , is shuold navigate to address entry page
  Given THAT I am signed in
  When I select Secure Checkout button
  Then it must navigate me to address entry page

@manual @DBMTE-361
Scenario: Checkout login for guest user
  Given THAT I am not signed in
  When I select Go to Checkout button
  Then it should navigate me to the Welcome page

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
