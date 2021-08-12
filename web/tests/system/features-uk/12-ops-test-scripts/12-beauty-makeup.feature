Feature: Test Debenhams ops test script journey number 20, 21 and 22

@automated @opsTC
Scenario:Verify Makeup PDP, Sku level imagery, mini bag as per opsTC-20
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Beauty" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Shop by category" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Make up" on "commonPage"
  And I wait for "2000" milliseconds
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I click to "expand" filter "Categories" position "1"
  And I should see value of parentfilter position "2" as "Brand"
  And I click on position "13" "Lipstick" under parentfilter "1" "Categories"
  Then I click on "closeButton" on "pspPage"
  And I should see "url" contains "beauty/make-up/lipstick#filter"
  And I should see "moreColourOptionBadging" exist on "pspPage"
  And I click on "moreColourOptionBadging" on "pspPage"
  When I should see "beautyColourSwatches" exist on "pdpPage"
  And I should see selected colour as "A-Go-Go"
  And I select available colour "2" as "Ayesha" from "colourSwatch"
  And I should see selected colour as "Ayesha"
  Then I should see "colourDropDown" exist on "pdpPage"
  And I should see selected colour as "Ayesha"
  Then I select available colour "3" as "Bachelorette" from "colourDropDown"
  And I should see selected colour as "Bachelorette"
  And I should see "addToCartButtonDisplayInitially" as "No items in the cart." on "mySavedItemPage"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "1" on "mySavedItemPage"
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"

@automated @opsTC
Scenario:Verify DDN, Clickout Facet as per opsTC-21
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Beauty" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Shop by category" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Make up" on "commonPage"
  And I wait for "2000" milliseconds
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I click to "expand" filter "Categories" position "1"
  And I should see value of parentfilter position "2" as "Brand"
  And I click on position "14" "Lip balms & treatments" under parentfilter "1" "Categories"
  Then I click on "closeButton" on "pspPage"
  And I should see "url" contains "beauty/skin-care/lip-balm-treatments#filter"

@automated @opsTC
Scenario: Navigate to beauty product "DIOR - 'Dior Addict' lip glow colour reviver lip balm 3.5g" and validate the max qauntity that can be added as per opsTC-22
  When I navigate to "testBeautyLipGlowfPdpURL"
  And I enter "7" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "errorNotification" as "You have exceeded the maximum quantity allowed for this item" on "pdpPage"
  And I enter "1" in "stepperCount" on "pdpPage"
  And I should see "addToCartButtonDisplayInitially" as "No items in the cart." on "mySavedItemPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "1" on "mySavedItemPage"
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
