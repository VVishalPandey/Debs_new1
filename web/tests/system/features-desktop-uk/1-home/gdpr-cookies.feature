Feature: Validate cookie banner in footer


@manual @DEBD-259 @awsManual
Scenario: Validate cookie banner on smaller viewport
   Given I navigate to "HomeURL" for the first time
   And I'm on viewports size  1023 and less
   Then I should see full width "cookie banner"
   And I should see "Accept Cookies" on "cookie banner"
   And I should see "Manage cookie" on "cookie banner"
   And I should see "Cookies Disclaimer" text with "Click Here" link
   When I navigate to other pages
   Then I should see full width "cookie banner" on every page except basket and checkout pages
   When I click "Click here" link from  "Cookies Disclaimer" text
   Then I am taken to the cookie notice FAQ page in new tab
   When I click "Manage Cookies" button on "cookie banner"
   Then I am taken to the cookie notice FAQ page in new tab
   When I click "Accept Cookies" button on "cookie banner"
   Then I should not see cookie banner
   Then I validate navigating to other pages we are not able to see the cookie notification


@manual @DEBD-259 @awsManual
Scenario: Validate cookie banner on larger viewport
   Given I navigate to "HomeURL" for the first time
   And I'm on viewports size  1024 and higher
   Then I should see smaller "cookie banner"
   And I should see "Accept Cookies" on "cookie banner"
   And I should see "Manage cookie" on "cookie banner"
   And I should see "Cookies Disclaimer" text with "Click Here" link
   When I navigate to other pages
   Then I should see smaller "cookie banner" on every page except basket and checkout pages
   When I click "Click here" link from  "Cookies Disclaimer" text
   Then I am taken to the cookie notice FAQ page in new tab
   When I click "Manage Cookies" button on "cookie banner"
   Then I am taken to the cookie notice FAQ page in new tab
   When I click "Accept Cookies" button on "cookie banner"
   And I should not see "cookie banner" on any page
   Then I validate navigating to other pages we are not able to see the cookie notification


@manual @DEBD-259 @awsManual
Scenario: Validate new cookie addition when click on Accpt coookie from Cookie banner
    When I click "Accept Cookies" button on "cookie banner"
    Then I should see "DebCNshown-1" gets added in cookies list
    And it should have expired date of 1 year from the time I accpeted the cookie
    And I should not see "cookie banner" on any page
    When I delete all the cookies
    Then I should see  "cookie banner" on every page except basket and checkout pages
    When a new cookie is introduced 
    Then the cookie name would increment i.e. DebCNshown-2 
    And the existing cookie is invalidated
    And I would see the cookie banner again.