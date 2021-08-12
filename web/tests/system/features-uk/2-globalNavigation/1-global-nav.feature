Feature: Test Debenhams global navigation

@automated @DBNHST-81
Scenario: Validate Debenhams global navigation first level
  Given I navigate to "loginUrl"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I should see the value of "menuOptions" in following "changedMenuOptionsSignOut" on "commonPage"
#When I click on "Shop Departments" position "1"
#And I should see the value of "menuOptions" in following "menuOptionsShopDept" on "commonPage"
#Then I click on "closeIcon" on "commonPage"

@automated @DBNHST-81
Scenario: Validate Debenhams global navigation to women -> clothing -> dresses and navigation when clicking on menu option on top
  Given I navigate to "loginUrl"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  When I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Dresses" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "All dresses" on "commonPage"
  When I click on "headerMenuText" on "globalNavigation"
  Then I should see value of position "1" as "Shop Departments"

@automated @DBNHST-81
Scenario: Validate Debenhams global navigation to women -> shoes & boots -> all shoes & boots and navigation when clicking on menu option on top
  Given I navigate to "loginUrl"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  When I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Shoes & boots" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "All shoes & boots" on "commonPage"
  When I click on "headerMenuText" on "globalNavigation"
  Then I should see value of position "1" as "Shop Departments"

@automated @DBNHST-81
Scenario: Validate Debenhams global navigation to beauty -> shop by brand -> kat von d and navigation when clicking on menu option on top
  Given I navigate to "loginUrl"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  When I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Beauty" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Shop by brand" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Kat Von D" on "commonPage"
  When I click on "headerMenuText" on "globalNavigation"
  Then I should see value of position "1" as "Shop Departments"

@automated @DBNHST-81
Scenario: Validate Debenhams global navigation on clicking menu
  Given I navigate to "loginUrl"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  When I click on "navCloseIcon" on "globalNavigation"
  Then I should not see "navCloseIcon" on "globalNavigation"

@automated @DBNHST-81 @Issue199
Scenario: Validate Debenhams global navigation to women -> clothing -> dresses and retention of menu option
  Given I navigate to "loginUrl"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  When I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "All dresses" on "commonPage"
  # And I should see "headerText" as "Dresses" on "pspPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Dresses" on "commonPage"
#Then I should see value of position "3" as "Dresses"

@automated @DBNHST-81 @Issue199
Scenario: Validate Debenhams global navigation when navigated to women -> shoes & boots -> shoes from women -> clothing -> dresses
  When I click on "backOption" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Shoes & boots" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Shoes" on "commonPage"
  # And I should see "headerText" as "Women's shoes" on "pspPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Shoes" on "commonPage"
#Then I should see value of position "3" as "Shoes"

@automated @DBNHST-81
Scenario Outline: Validate Debenhams global navigation first level after sign in
  Given I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I click on "rememberMe" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  # Then I should see "titleOfPage" as "My Account" on "myDetailsPage"
  Then I should not see "tab1" on "loginPage"
  And I should not see "tab2" on "loginPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I should see the value of "menuOptions" in following "menuOptionsSignIn" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Sign out" on "commonPage"
  # Then I should see "titleOfPage" as "Debenhams UK - Fashion, Beauty, Gifts, Furniture & Electricals" on "homePage"

  Examples:
    | email                      | password  |
    | testautomationd2@gmail.com | password2 |

@automated @DBNHST-1363 @Issue
Scenario: Validate Debenhams global navigation for signed out user
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I should see the value of "menuOptions" in following "changedMenuOptionsSignOut" on "commonPage"
  Then I click on "closeIcon" on "commonPage"

@automated @DBNHST-1363
Scenario Outline: Validate Debenhams global navigation for signed in user
  Given I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I click on "rememberMe" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "3000" milliseconds
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I should see the value of "menuOptions" in following "changedMenuOptionsSignIn" on "commonPage"

  Examples:
    | email                      | password  |
    | testautomationd2@gmail.com | password2 |

@manual @DBNHST-1363
Scenario: Verify that Shop departments is removed from LHN

@manual @DBNHST-1363
Scenario: Verify that the User links are now displayed below the main shopping menu link

@manual @DBNHST-1363
Scenario: Verify that the LHN is retained when navigation throught the any page

@manual @DBNHST-1374
Scenario: Navigate to any PSP/PDP/SCAT/TCAT page and click on Debenhams logo Menu should also come to the first page

@manual @DBNHST-1374
Scenario: Navigate to any PDP page and then click on any of the recently viewed product ,then Menu should also come to the first page.

@manual @DDAI-1034	
Scenario: Validation of the 6 tile modules on the Toys TCAT Page on mobile for UK/Ireland/International
  Given the user is logged in 
  When the user navigates to the Toys TCAT page i.e Toys 
  Then the user should view the 6 tile module beneath the hero carousel image
  And clicking on the module should navigate user to the desired page
