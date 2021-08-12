Feature: Test Debenhams ops test script journey number 18 and 19

@automated @opsTC
Scenario:Validate that is user is landing on correct PSP page as per opsTC-18
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Men" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Clothing" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Casual shirts" on "commonPage"
  And I wait for "2000" milliseconds
  Then I should see "headerText" as "Men's casual shirts" on "pspPage"

@automated @opsTC
Scenario:Verify that the filter is functional as per opsTC-18
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Men's casual shirts" on "pspPage"
  And I should see value of parentfilter position "7" as "Price"
  When I click to "expand" filter "Price" position "7"
  And I should see value of parentfilter position "8" as "Discount"
  And I wait for "3000" milliseconds
  And I should see value of filter position "3" as "£20 - £30" under parentfilter "7" "Price"
  When I click on position "3" "£20 - £30" under parentfilter "7" "Price"
  And I wait for "3000" milliseconds
  And I click on "closeButton" on "pspPage"
  And I wait for "3000" milliseconds
  Then I should see "searchText" as "£20 - £30" on "pspPage"

@automated @opsTC
Scenario:Validate that the user is able to sort products and add for later on the psp page as per opsTC-18
  When I should see "sortOptionBestSelling" exist on "pspPage"
  Then I click on "sortOptionName" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*name"
  And I click on "saveForLaterButton" on "pspPage"
  And I wait for "5000" milliseconds
  Then I should see "saveForLaterPopUpCloseButton" exist on "pspPage"
  Then I click on "continueShoppingButton" on "pspPage"

@automated @opsTC
Scenario: Navigate to saved items from global navigation and validate the page as per opsTC-19
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I should see value of position "2" as "Saved Items"
  When I click on "Saved Items" position "2"
  And I wait for "5000" milliseconds
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"

@automated @opsTC
Scenario: Validate the saved product is appearing and then add to bag from my saved items page as per opsTC-19
  Then I validate products are saved on mySavedItemPage
  And I should see "addToCartButtonDisplayInitially" as "No items in the cart." on "mySavedItemPage"
  And I click on "chooseItemOption" on "mySavedItemPage"
  And I select available size from "dropdown"
  And I click on "addToBagButton" on "mySavedItemPage"
  And I should see "addToCartButtonDisplayFinal" as "1" on "mySavedItemPage"
  Then I click on "removeLink" on "mySavedItemPage"
  And I click on "removeLink" on "mySavedItemPage"
  And I click on "removeItemButton" on "mySavedItemPage"
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
