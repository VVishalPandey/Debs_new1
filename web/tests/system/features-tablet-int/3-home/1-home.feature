Feature: Test Debenhams home page

@manual @DBMTE-140
Scenario: Validate the Global Fulfillment Espots on portrit and landscape mode
  Given I am on any page 
  Then I will see the global fulfillment espots

@manual @DBMTE-392
Scenario: Validate the header landscape for signed In User

@manual @DBMTE-392
Scenario: Validate the header landscape for signed Out User

@manual @DBMTE-392
Scenario: Validate that the DOTINT homepage has the same layout/espot as that of DOTCOM

@manual @DBMTE-392
Scenario: Validate that the DOTINT homepage has country specific homepage espot banners

@manual @DBMTE-392 @DBMTE-393
Scenario: Validate that the DOTINT homepage should not have personal finance banners, beauty club or reward club

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
