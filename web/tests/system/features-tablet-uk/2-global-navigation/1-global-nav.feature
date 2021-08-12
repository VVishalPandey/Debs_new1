Feature: Test Debenhams global navigation

@automated @DBMTE-139
Scenario: Verify that the menu options are in correct sequence
  Given I logout
  When I click on "menuIcon" on "commonPage"
  And I should see the value of "menuOptions" in following "menuOptionsSignOut" on "commonPage"
  When I click on "Shop Departments" position "1"
  And I should see the value of "menuOptions" in following "menuOptionsShopDept" on "commonPage"
  Then I click on "closeIcon" on "commonPage"

@automated @DBMTE-139
Scenario: Verify that the menu options are in correct sequence
  Given I am on my details page
  When I click on "menuIcon" on "commonPage"
  And I should see the value of "menuOptions" in following "menuOptionsSignIn" on "commonPage"
  When I click on "Shop Departments" position "1"
  And I should see the value of "menuOptions" in following "menuOptionsShopDept" on "commonPage"
  Then I click on "closeIcon" on "commonPage"

@automated @DBMTE-139
Scenario: Validate Debenhams global navigation to women -> clothing -> dresses and validate retention of menu
  Given I logout
  When I click on "menuIcon" on "commonPage"
  And I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  And I "validate & click" option is available in "mainMenuList" as "Dresses" on "commonPage"
  And I "validate & click" option is available in "mainMenuList" as "All dresses" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "All dresses" on "commonPage"

@manual @DBMTE-139
Scenario: navigate to beauty -> shop by brand -> kat von d from dresses retention menu from above scenario
  When I click on "backOption" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Beauty" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Shop by brand" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Kat Von D" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Kat Von D" on "commonPage"

@manual @DBMTE-139
Scenario: Validate that menu option reset when user selects debenhams logo from psp page
