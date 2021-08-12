Feature: Test Debenhams my bag page validation

@automated @DBNHST-505
Scenario: Navigate to Debenhams my bag page and remove products and validate empty bag
  Given I logout
  Then I am on my details page
  Then I navigate to mybag and empty the bag
  Then I should see "emptyBagHeaderText" as "Your bag is currently empty." on "myBagPage"
  And I should see "emptyBagBodyText" as "Why not treat yourself to a little something?" on "myBagPage"
  And I should see "emptyBagContinueButton" exist on "myBagPage"

@automated @DBNHST-505
Scenario: Navigate to Debenhams my bag page and remove products and validate empty bag
  When I click on "emptyBagContinueButton" on "myBagPage"
  Then I should not see "emptyBagContinueButton" on "myBagPage"
  And I should not see "emptyBagHeaderText" on "myBagPage"
  And I should not see "emptyBagBodyText" on "myBagPage"

@automated @DBNHST-245
Scenario: Navigate to Debenhams my bag page and validate the banner price
  Given I navigate to "testDressPdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I navigate to "testDress2PdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I navigate to "basketCheckoutUrl"
  And I validate the "banner price"

@automated @DBNHST-245
Scenario: Navigate to Debenhams my bag page and validate the banner message
  Then I validate the "banner message"

@automated @DBNHST-151
Scenario: Navigate to Debenhams my bag page and validate the page
  Given I navigate to "basketCheckoutUrl"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should see "checkoutButton2" exist on "myBagPage"
  And I should see "creditCardInfo" exist on "myBagPage"
  And I should see "headerItemsCount" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"

@automated @DBNHST-151 @DBNHST-245
Scenario: Navigate to Debenhams my bag page and validate the total number of items in header & in total section with the total products in my bag
  Given I navigate to "basketCheckoutUrl"
  Then I validate the "total items"

@automated @DBNHST-245
Scenario: Navigate to Debenhams my bag page and validate the total product price
  Given I navigate to "basketCheckoutUrl"
  Then I validate the "total product price"

@automated @DBNHST-170 @DBNHST-245
Scenario: Navigate to Debenhams my bag page and validate the total discount
#Then I validate the "total product discounts"

@automated @DBNHST-245
Scenario: Navigate to Debenhams my bag page and validate the subtotal
  Then I validate the "subtotal"

@manual @DBNHST-169
Scenario: Navigate to Debenhams my bag page and validate stepper for product
  Given I navigate to "basketCheckoutUrl"
  Then I validate increase or decrease of product by changing steper with price also gettng changed with it

@manual @DBNHST-169
Scenario: Navigate to Debenhams my bag page and validate bag for out of stock product
  Given I navigate to "basketCheckoutUrl"
  Then I validate my bag in case of out of stock product
  And Secure checkout button to disable
  And Out of stock label to appear in place of product stepper
  And Out of stock banner to appear of myBagPage

@manual @DBNHST-151
Scenario: Navigate to Debenhams my bag page and validate the product details
  Given I navigate to "basketCheckoutUrl"
  Then I validate the product details (image, price, quantity & title)

@manual @DBNHST-151
Scenario: Navigate to Debenhams my bag page and validate the product details of free gift which got added from purchase
  Given I navigate to "basketCheckoutUrl"
  Then I validate the product details of free gift which got added from purchase

@manual @DBNHST-1296
Scenario: Navigate to Debenhams my bag page and validate the low stock messaging in yellow
  Given I have a product in my bag
  When it is low in stock
  Then I will see the low stock messaging by the product in yellow

@manual @DBNHST-1312
Scenario: Navigate to Debenhams my bag page and validate promo code field is empty when valid promo code is applied
  Given I have entered a valid promo code PS01
  When I press apply
  Then the promo code field will emptied

@manual @DBNHST-1312
Scenario: Navigate to Debenhams my bag page and validate promo code field is not empty when invalid promo code is applied
  Given I have entered a valid promo code PS02
  When I press apply
  Then the promo code field will not be emptied

@manual @DBNHST-230
Scenario: Navigate to Debenhams my bag page and validate that the user is able to see the skeleton for My saved item accordion product below the checkout button at the buttom

@manual @DBNHST-230
Scenario: Navigate to Debenhams my bag page and validate that the user is able to see the My saved item accordion below the checkout button

@manual @DBNHST-230
Scenario: Navigate to Debenhams my bag page and validate that the user is able to see the My saved item accordion closed by default

@manual @DBNHST-230
Scenario: Navigate to Debenhams my bag page and validate that the user is able to see the My saved item accordion with all saved for later products as on my saved item page

@manual @DBNHST-230
Scenario: Navigate to Debenhams my bag page and validate that the user is able to see all the product details the My saved item accordion for each product

@manual @DBNHST-130
Scenario: Navigate to Debenhams my bag page and validate that the user is able to select a size from dropdown for a product in my saved item section and then add the product to my bag.

@manual @DBNHST-130
Scenario: Navigate to Debenhams my bag page and validate that the user is able to select a size from Swatches for a product in my saved item section and then add the product to my bag.

@manual @DBNHST-130
Scenario: Navigate to Debenhams my bag page and validate that the user is able to select a colour from Swatches for a product in my saved item section and then add the product to my bag.

@manual @DBNHST-130
Scenario: Navigate to Debenhams my bag page and validate that the user is able to select a colour from dropdown for a product in my saved item section and then add the product to my bag.

@manual @DBNHST-130
Scenario: Navigate to Debenhams my bag page and validate that the user is able to select both colour and feet from dropdown for a furniture product in my saved item section and then add the product to my bag.

@manual @DBNHST-1514
Scenario: Navigate to Debenhams my bag page and validate that on clicking on an out of stock product size/colour drop down the out of stock message will be displayed below it and the add to bag button will be greyed out

@manual @DBNHST-1514
Scenario: Navigate to Debenhams my bag page and validate that on clicking on an out of stock product size/colour swatch the out of stock message will be displayed below it and the add to bag button will be greyed out

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
