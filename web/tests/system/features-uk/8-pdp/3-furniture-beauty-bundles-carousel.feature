Feature: Test Debenhams furniture, beauty, bundles and carousel

@manual @DBNHST-385
Scenario: Navigate to dress PDP page and validate the link ‘Product description’ opens the Product Description accordion 
  Given that I am on the dress PDP
  When I clicked on the Product Description link
  Then I should be navigated to the Product Description accordion 

@manual @DBNHST-206
Scenario: Navigate to handbag (Radley) PDP and validate carousel exist with text as ‘You may also like’ and there are products recommended.Link: http://m.debenhams.com/webapp/wcs/stores/servlet/prod_10701_10001_089011836660_-1
  Given that I am “testhandbagPDPURL”
  When I clicked on the first product in the ‘You may also like’ carousel
  Then I should be navigated to “testhandbagPDPURL” selected

@manual @DBNHST-206
Scenario: Navigate to nightwear PDP and validate carousel has text as ‘Style it with’, drop down selector and Add to bag button exist. Link: http://m.debenhams.com/webapp/wcs/stores/servlet/prod_10701_10001_161010890305_-1
  Given that I am “testNightwearPDPURL”
  When I click on "addToBagButton" in the carousel
  Then I should see "sizeSelectError" as "Please select an option"

@manual @DBNHST-206
Scenario: Navigate to nightwear PDP and validate when user add to bad then tick comes
  Given that I am “testNightwearPDPURL”
  When I select a size from the dropdown on the carousel
  And click on "addToBagButton" 
  Then I should see "addToBagButton" turn to a tick and in green 


@manual @DBNHST-163 @Bundles
Scenario: Navigate to Men Suits PDP and validate the information, price, relevant products and Add to bag button exist
  Given that I am “SuitsPDPURL”
  When I click on "addToBagButton" for a product
  Then I should see "sizeSelectError" as "Please select an option"
  When I select available size on “pdpPage”   
  And I click on "addToBagButton" for a product
  Then I should see "addToBagRemainingText" as " has been added to your bag" on “pdpPage”
  When I click on “viewBasketCheckoutButton” on “pdpPage”
  Then I should see “headerText” as “My Bag” on “myBagPage”
  And I should see “checkoutButton” exist on “myBagPage”
  And I should validate final price on “myBagPage”
  When I select available size on “pdpPage”   
  And I increase quantity to “2”
  And I click on "addToBagButton" for a product
  Then I should see "addToBagRemainingText" as " has been added to your bag" on “pdpPage”
  When I click on “viewBasketCheckoutButton” on “pdpPage”
  Then I should see quantity as “2” on “myBagPage”

@manual @DBNHST-163
Scenario: Navigate to Men Suits PDP and validate low stock message if any when selected 
  Given that I am “SuitsPDPURL”
  When I select a low in stock size on “pdpPage”   
  Then I should see “Hurry x left” message 

@manual @DBNHST-160 @Furniture
Scenario: Navigate to Sofa beds PSP page and validate the brand and product name of first product should match the PDP page
  Given I navigate to "SofabedsPspUrl"
  Then I should see "headerText" as "Sofa beds" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  And I should validate product name on "pdpPage"

@manual @DBNHST-160
Scenario: Navigate to Furniture PDP and validate the information, price, relevant products and Add to bag button exist
  Given I navigate to "SofabedsPdpUrl"
  Then I should see "prodDescAccordion" exist on "pdpPage"
  And I should see "deliveryReturnAccordion" exist on "pdpPage"
  And I should see "prodDescAccordion" as "Product Description" on "pdpPage"
  And I should see "deliveryReturnAccordion" as "Delivery / Returns" on "pdpPage"

@manual @DBNHST-160
Scenario: Navigate to Sofa beds PDP page from above scenario and validate the text inside product description and delivery returns accordions are similar from desktop
  Given I am on the "SofabedsPDPpage" 
  Then I should validate text inside product description from desktop
  And I should validate text inside Delivery / Returns from desktop

@manual @DBNHST-160
Scenario: Navigate to Sofa beds PDP and validate carousel exist with text as ‘'Also in the range' and products exist http://m.debenhams.com/webapp/wcs/stores/servlet/prod_10701_10001_322002179163_-1?pdpsku=8583978
  Given that I on “sofabedsPDPURL”
  When I clicked on the first product in the ‘Also in the range’ carousel
  Then I should be navigated to "sofabedsURL"

@manual @DBNHST-160
Scenario: Navigate to Sofa beds PDP and validate changing colour swatches for fabric and feet
  Given I navigate to "SofabedsPdpUrl" http://m.debenhams.com/webapp/wcs/stores/servlet/prod_10701_10001_322002164002_-1?pdpsku=8455625
  When I click on "changelink1", the "Choose Fabric" pop up must appear
  And when I select a colour "darkblue" in Velvet 
  Then the "sofabedsPDPpage" must update with "darkblue" selected 
  And I click on "changelink2", the "Choose Feet" pop up must appear
  And I select a "darkwood"
  Then the "sofabedsPDPpage" must update with "darkwood" selected 

@manual @DBNHST-160
Scenario: Navigate to Sofa beds PDP and validate order swatches page and address form validation
  Given I navigate to "SofabedsPdpUrl"
  When I select "Order swatches" link
  Then I should see form "OrderFREEswatches" 
  And I select "dark blue", "light green" "red", "taupe"
  When I click on "orderswatchesnow" button
  And I should see "firstName" exist on "YouraddressPage"  
  And I should see "lastName" exist on "YouraddressPage" 
  And I should see "emailAddress" exist on "YouraddressPage" 
  And I should see "houseNumber" exist on "YouraddressPage" 
  And I should see "addressline1" exist on "YouraddressPage" 
  And I should see "addressline2" exist on "YouraddressPage" 
  And I should see "towncity" exist on "YouraddressPage" 
  And I should see "postcode" exist on "YouraddressPage"

@manual @DBNHST-160
Scenario: Navigate to Sofa beds PDP, Order swatches and validate address form submission 
  When I click on "findYourAddressButton" on "YouraddressPage"  
  And I enter "<firstName>" in "firstName" on "YouraddressPage"  
  And I enter "<lastName>" in "lastName" on "YouraddressPage"  
  And I enter "<emailaddress>" in "emailAddress" on "YouraddressPage"  
  And I enter "<houseNumber>" in "houseNumber" on "YouraddressPage"  
  And I enter "<addressline1>" in "addressline1" on "YouraddressPage"  
  And I enter "<towncity>" in "towncity" on "YouraddressPage"  
  And I enter "<postcode>" in "postcode" on "YouraddressPage"    
  And I click on "orderSwatchesnowButton" on "YouradderssPage"
  Then I should see text as "Your swatches have been ordered"
  And I should see "continueShoppingbutton"
  And I should see "closebutton"


@manual @DBNHST-160
Scenario: Validate the Furniture Store Locator container and Find out more URL pointing to http://m.debenhams.com/content/furniture-store-locator
