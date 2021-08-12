Feature: Test Debenhams ops test script journey number 2

@automated @opsTC
Scenario: Verify that the user is able to select the discount filter products are dispalyed as per the applied discount filter
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Accessories" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Scarves" on "commonPage"
  And I wait for "2000" milliseconds
  Then I should see "headerText" as "Women's scarves" on "pspPage"
  And I click on "filterButton" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Discount" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Discount"  as "filterSubMenuLinkList" as "50% and over" on "pspPage"
  #And I should see value of parentfilter position "5" as "Discount"
  #When I click to "expand" filter "Discount" position "5"
  #And I wait for "2000" milliseconds
  #When I click on position "3" "50% and over" under parentfilter "5" "Discount"
  And I wait for "2000" milliseconds
  And I click on "closeButton" on "pspPage"
  And I should see "searchText" as "50% and over" on "pspPage"
  Then I should see "url" contains "sfv=50%25+and+over"

@automated @opsTC
Scenario: Verify that the price of 1st product is same on PSP and PDP page
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  And I should see "alsoLikeText" as "You May Also Like" on "pdpPage"
