Feature: Test Debenhams Size Selector feature International

@automated @Fixed @DDAI-91
Scenario: Navigate to Debenhams home page>Women Dress PDP>Verify size selector feature for Australia
  Given I navigate to "homeURL"
  When I navigate to "womenDressesPdpUrlInt"
  And I should see "sizeGuideLink" exist on "pdpPage"
  And I should see "sizedropdown1" exist on "pdpPage"
  And I should see "selectoptiontext" as "Please select an option..." on "pdpPage"
  When I click on "sizedropdown1" on "pdpPage"
  And I select available size from "dropdown"
  And I should not see "selectoptiontext" as "Please select an option..." on "pdpPage"
  When I click on "addToBagButton" on "pdpPage"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "ITEM ADDED TO BAG" on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should see "checkoutButton2" exist on "myBagPage"
  And I should see "headerItemsCount" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"

@automated @Fixed @DDAI-91
Scenario: Navigate to Debenhams home page>Kids Dress PDP>Verify size selector feature for Australia
  When I navigate to "kidsDressPdpUrlInt"
  And I should see "sizeGuideLink" exist on "pdpPage"
  And I should see "sizedropdown1" exist on "pdpPage"
  And I should see "selectoptiontext" as "Please select an option..." on "pdpPage"
  When I click on "sizedropdown1" on "pdpPage"
  And I select available size from "dropdown"
  And I should not see "selectoptiontext" as "Please select an option..." on "pdpPage"
  When I click on "addToBagButton" on "pdpPage"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "ITEM ADDED TO BAG" on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should see "checkoutButton2" exist on "myBagPage"
  And I should see "headerItemsCount" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"
  Then I remove all the items in my bag

@manual @DDAI-91
Scenario: Navigate to Debenhams home page>Women Dress PDP>Verify size selector feature for China
  Given I am on this PDP (Product No: 0730115037)
  When I am on the China site
  Then I will see a size drop down

@manual @DDAI-91
Scenario: Navigate to Debenhams home page>Women Dress PDP>Verify size selector feature for NewZelAnd
  Given I am on this PDP (Product No: 0730115037)
  When I am on the New ZealAnd site
  Then I will see size buttons

@manual @DDAI-91
Scenario: Navigate to Debenhams home page>Women Dress PDP>Verify Out of stock feature for size selector
  Given I am on a PDP (to be set)
  When a size is out of stock
  Then I will see out of stock messaging

@manual @DDAI-332
Scenario:Navigate to Debanhams International site>PDP Page>Verify following  references not availble
  Given I am on an international site (i.e. not UK or ROI)
  And I am on a PDP page
  Then I am unable to see any reference to
  Then I should not see beauty club points
  And I should not see reward club points
  And I should not see Debenhams credit card points

@manual @DDAI-89
Scenario: Navigate to Debenhams home page>Kids Dress PDP>Verify pdp Australia
  When I navigate to "beddingPDPUrl"
  And I wait for "1000" milliseconds
  Then I should see "productName" containing "Home Collection" on "pdpPage"
  And I should see "nowPrice" containing "Now" on "pdpPage"
  And I should see "nowPrice" containing "$" on "pdpPage"
  And I should see "wasPrice" containing "Was" on "pdpPage"
  And I should see "wasPrice" containing "$" on "pdpPage"
  And I should see "reviewsSection" exist on "pdpPage"
  And I should see "reviewsSection" containing "reviews" on "pdpPage"
  And I should see "productDescriptionLink" exist on "pdpPage"
  And I should see "sizeLink" exist on "pdpPage"
  And I should see "sizeLink" containing "Size" on "pdpPage"
  When I click on "sizedropdown1" on "pdpPage"
  And I select available size from "dropdown"
  And I should not see "selectoptiontext" as "Please select an option..." on "pdpPage"
  And I wait for "500" milliseconds
  When I click on "addToBagButton" on "pdpPage"
  When I click on "minibagicon" on "minibagPage"
  And I should see "firstProductPrice" containing "$" on "minibagPage"
  And I should see "firstProductPrice" as "$48.60" on "minibagPage"
  When I click on "secureCheckoutButton" on "minibagPage"
  Then I remove all the items in my bag

@manual @DDAI-333
Scenario: Navigate to Debenhams PDP Page>Validate baynote Carousel baynote carousel "You may also like" And "Customers who also bought" should not appear in PDP for International
  Given I am on an international site (i.e. not UK)
  And I am on a PDP page
  Then I am unable to see the baynote carousel "You may also like" And "Customers who also bought"

@manual @DDAI-333
Scenario: Navigate to Debenhams PDP Page>Validate baynote Carousel baynote carousel "you recently viewed" appear in PDP for International
  Given I am on an international site (i.e. not UK)
  And I am on a PDP page
  Then I am able to see the baynote carousel "you recently viewed"

@manual @DDAI-333
Scenario: Navigate to Debenhams PDP Page>When there is no round robin>Validate Cross Sell carousel appear in PDP for some of the products in international
  Given THAT I am on a Red Herring Dress PDP (http://www.debenhams.ie/webapp/wcs/stores/servlet/prod_10052_10001_178010115260_-1)
  When I scroll down to the carousel
  Then I should only see a range of products(How about?,style it with,complete the look) that matches this dress, with option dropdown And Add to bag button
  And I must not see the carousel called 'You may also like'

@manual @DDAI-333
Scenario: Navigate to Debenhams PDP Page>When there is round robin>Validat Round Robin carousel with "Add to Bag" appear in PDP for some of the products in international
  Given THAT I am on Jewellary PDP (http://m.debenhams.ie/webapp/wcs/stores/servlet/prod_10052_10001_37484+LSER057661_-1
  When I scroll down to the carousel
  Then I should only see ‘Also in the range’, ‘Matching items’  Carasoul And Add to bag button
  And I must not see the carousel called 'You may also like'


@manual @DDAI-333
Scenario: Navigate to Debenhams PDP Page>When there is neither Round Robin Or Cross Sale Carasoul exist, Then the carousel is hidden for  International
  Given THAT I am on pdp where CC And RR is hidden
  When I scroll down
  Then I should not see any carasoul for RR OR CS
  Then I am able to see the baynote carousel "you recently viewed"

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

@notAutomated @DEBD-2267
Scenario Outline: Validate that size dropdown is displayed on all PDP pages which have size selector
  Given I logout
  # Then I navigate to "<PDPurl>"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I should see "searchIcon" exist on "commonPage"
  When I click on "searchIcon" on "commonPage"
  And I enter "<Products>" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I should not see "sizeSwatches" on "pdpPage"
  And I should see "sizeDropdownOptionElements" exist on "pdpPage"
  Then I select available size and add to bag on pdpPage


  Examples:
  | Products    |
  |Phase Eight |
  |Coast |
  |Dorothy Perkins |
  |Quiz |
  |Wallis |
  |Debut |
  |Jenny Packham |
  |Mantaray |
  |RedHerring |
  |The Collection |
  |Star by Julien Macdonald |
  |Dress Studio by Preen |
  |Nine by Savannah Miller |
  |Knickers |
  |Nightwear |
  |Jeans |
  |Shoes |

@automated @Fixed @DEBD-2428
Scenario Outline: Valiadte the selected colour swatch is highlighted in Green except Chanel
Given I navigate to "<Products>"
Then I select available size and add to bag on pdpPage
Then I should verify "border-top-color" of "pdpSelectedSwatch" as "pdpSelectedBorderSwatchColor" on "pdpPage"

  Examples:
  | Products    |
  |braUrl |
  |pdpKnitWearProduct |

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

@manual @DEBD-2360
Scenario: Validate the size and location of Product Brand and Title on PDP
Given I am on a PDP
Then It will be above the product title
And have a reduced font size e.g."Mantaray Blue pattern dress"

@manual @DEBD-2360
Scenario: Validate the new Product description link on the PDP
Given I am on a PDP
When I view the product description link
Then I will see a new{color} icon to the left of the product description CTA
When I click on "productDescriptionLink" the "pdpPage"
Then I should be on the Product description link area on the page


@manual @DEBD-2360
Scenario: Validate the product reviews location in the PDP
Given I am on a PDP
When it has product reviews
Then I will see the review stars and rating underneath the product title
When I click on the review stars or review rating
Then It will anchor me down to the reviews section

@manual @DEBD-2360
Scenario: Validate price per ml for beauty/alochol products under the product price
Given I navigate to "alocholPdp"
Then I should see "priceperml" underneath the product price
