
Feature: Validate Debenhams delivery page

@manual @DBMTE-353
Scenario: Navigate to Debenhams delivery page>Validate delivery lead time for Internation Sites(Australia,China)
  Given I am on the delivery confirmation page
  When I have entered my delivery address
  Then I will see a delivery lead time specific to my delivery country
  And the proceed to payment CTA

@manual @DBMTE-360
Scenario:Validate only international delivery option available to select delivery method 
  Given I am on DOTINT
  When I click secure checkout from my bag
  Then I am taken to the delivery address entry form 
  And there is no option to select delivery method as only international delivery is available

@manual @DBMTE-363
Scenario:Validate only standard delivery with airplane icon must appear in the Delivery container for all products in My Bag
  Given I am an International customer shopping on Debenhams.com/en-(country)  
  And I have navigated to the Header, PDP, My Bag, Delivery options and Payment page
  When the pages are displayed
  Then I should see the airplane icon as the only delivery option available to me
  And it should flow through the journey till Payment page

@manual @DBMTE-369
Scenario: Verify enter a delivery address page layout.
  Given I am on enter a delivery address page
  Then I verify Local country address format - 2 layouts (field layout and names)
  And local country auto-populated as default country in the drop down address form
  And mandatory/optional validation on fields is localised
  And no QAS postcode look up
  And no BFPO link

@manual @DBMTE-369
Scenario: Verify that as a customer I want to enter a delivery address so that my purchase can be sent there.
  Given I have entered a valid address
  When I press use this address
  Then I am scrolled down to the delivery lead time
  And the proceed to payment CTA

@manual @DBMTE-414
Scenario: Validate Delivery - Edit address
  Given I have entered an address
  When I press edit this address
  Then I will be presented with the full address form where the fields are still completed but amendable
  And a cancel link
  And a use this address CTA
  