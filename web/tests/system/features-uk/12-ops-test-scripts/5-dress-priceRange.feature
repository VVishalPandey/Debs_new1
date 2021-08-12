Feature: Test Debenhams ops test script journey number 7 and 8

@automated @opsTC
Scenario: Verify that the user is able to see range prices for some products as per opsTC-07
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Kids" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Girls" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Dresses" on "commonPage"
  And I wait for "2000" milliseconds
  And I should validate final price on "pspPage"

@automated @opsTC
Scenario: Verify delivery urgency message, size selectors, cross sell, product information as per opsTC-08
  When I navigate to "kidsDressUrlNew"
  #And I am in view of "urgentDeliveryMessage" on "pdpPage"
  #Then I should see "urgentDeliveryMessage" exist on "pdpPage"
  And I should see "alsoInRangeOption" exist on "pdpPage"
  And I should select available size for first product in alsoInRange column
  And I wait for "4000" milliseconds
  Then I click on "addToBagFromAlsoInRangeContainer" on "pdpPage"
  And I click on "ProductDescription" on "pdpPage"
  Then I should see "productDescriptionDetails" exist on "pdpPage"
  And I click on "ProductDescription" on "pdpPage"
  When I am in view of "recentlyViewed" on "pdpPage"
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
  Then I add to bag quantity "1" and go to my bag page
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
