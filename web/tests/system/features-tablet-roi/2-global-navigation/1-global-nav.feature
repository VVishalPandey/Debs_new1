Feature: Test Debenhams global navigation

@manual @DBMTE-618
Scenario: Verify that the menu options are in correct sequence
  Given I logout
  When I click on "menuIcon" on "commonPage"
  And I should see the value of "menuOptions" in following "MenuOptionsSignOut" on "commonPage"
  Then I click on "closeIcon" on "commonPage"

@manual @DBMTE-618
Scenario: Verify that the menu options are in correct sequence
  Given I am on my details page
  When I click on "menuIcon" on "commonPage"
  And I should see the value of "menuOptions" in following "MenuOptionsSignIn" on "commonPage"
  Then I click on "closeIcon" on "commonPage"

@manual @DBMTE-618
Scenario: Validate Debenhams global navigation to women -> clothing -> dresses and validate retention of menu
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  And I "validate & click" option is available in "mainMenuList" as "Dresses" on "commonPage"
  And I "validate & click" option is available in "mainMenuList" as "All dresses" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "All dresses" on "commonPage"
  And I should see nav menu back option as "Dresses"

@manual @DBMTE-618
Scenario: navigate to beauty -> shop by brand -> kat von d from dresses retention menu from above scenario
  Then I should see nav menu back option as "Dresses"
  When I click on nav menu back option as "Dresses"
  Then I should see nav menu back option as "Women"
  When I click on nav menu back option as "Women"
  Then I "validate & click" option is available in "mainMenuList" as "Beauty" on "commonPage"
  And I "validate & click" option is available in "mainMenuList" as "Shop by brand" on "commonPage"
  And I "validate & click" option is available in "mainMenuList" as "Kat Von D" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Kat Von D" on "commonPage"
  And I should see nav menu back option as "Shop by brand"

@manual @DBMTE-618 @Issue
Scenario: Validate that menu option reset when user selects debenhams logo from psp page

@manual @DBMTE-618
Scenario: Validate that menu option reset when user refreshes the page when on any page
