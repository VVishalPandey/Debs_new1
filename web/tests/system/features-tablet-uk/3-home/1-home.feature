Feature: Test Debenhams home page

@manual @DBMTE-64
Scenario: Navigate to Debenhams home page and validate the page layout as per the PREPROD env where all conponents are turned on

@manual @DBMTE-64
Scenario: Navigate to Debenhams home page and validate the page layout as per the current live env

@manual @DBMTE-64 @Issue73
Scenario: Navigate to Debenhams home page and validate all the links of the components as per the current live env

@manual @DBMTE-64 @Issue73
Scenario: Navigate to Debenhams home page and validate the financial banners on PREPROD and live env

@manual @DBMTE-64
Scenario: Navigate to Debenhams home page and validate the home delivery options as per live environment

@manual @DBMTE-191
Scenario: Validate the header should be visible once menu is opened
  Given I have opened the LHN
  Then the header will be still visible

@manual @DBMTE-191
Scenario: Validate the header menu interaction
  Given I have opened the LHN
  When I interact with the header
  Then the LHN will close
  And I will be taken to where I clicked on the header

@manual @DBMTE-174
Scenario: Validate the header with delivery options on home page (portrait)

@manual @DBMTE-174
Scenario: Validate the header with banner on pdp page (portrait)

@manual @DBMTE-174
Scenario: Validate the header with empty minibag (portrait)

@manual @DBMTE-174
Scenario: Validate the header with products in minibag (portrait)

@manual @DBMTE-175
Scenario: Validate the header in landscape mode
  Given I am on any page
  And my tablet is in landscape view
  Then I will see (labels & icons) at the top right Personal finance, Store finder, Create account/sign in, My beauty club
  And beneath I will see Search bar, Debenhams logo, Saved items CTA, My bag CTA

@manual @DBMTE-189
Scenario: Validate the global banners on portrit and landscape mode
  Given I am on any page apart from homepage
  Then I will see a global banner across the site e.g. Valentines day, sale, black Friday, credit card promotion

@manual @DBMTE-140
Scenario: Validate the Global Fulfillment Espots on portrit and landscape mode
  Given I am on any page 
  Then I will see the global fulfillment espots

@manual @DBMTE-591
Scenario: Validate the delivery options banner in landscapre and portrait on homepage
  Given I am on the homepage
  Then I can see the delivery banner (fulfillment options)
  And For Portrait I see two pieces of content and in Landscape I see three
  When I navigate to the homepage
  Then I will see the delivery banner (fulfillment options)

@manual @DBMTE-591
Scenario: Validate the delivery options banner in landscapre and portrait on pages other than homepage
  Given I am on the homepage
  When I navigate away from the homepage to any other page
  Then I no longer see the delivery banner (fulfillment options)
