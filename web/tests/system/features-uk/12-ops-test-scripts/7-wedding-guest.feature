Feature: Test Debenhams ops test script journey number 13 and 14

@automated @opsTC
Scenario:Verify PSP, PSP Pricing, Sort by for the PSP page of Mother of the bride as per opsTC-13
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Weddings" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Wedding guest" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Mother of the bride" on "commonPage"
  And I wait for "2000" milliseconds
  When I am in view of "theEdit" on "commonPage"
  Then I click on "theEdit" on "commonPage"
  Then I should see "headerText" as "Mother of the bride edit" on "pspPage"
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*min_price"

@automated @opsTC
Scenario:Verify add and remove filter functionality on the PSP page for  Weddings > Wedding guest > Mother of the bride as per opsTC-13
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Mother of the bride edit" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Principles by Ben de Lisi" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Debut" on "pspPage"
  And I wait for "3000" milliseconds
  And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I wait for "3000" milliseconds
  And I click on "closeButton" on "pspPage"
  And I wait for "3000" milliseconds
  Then I should see "searchText" as "Debut & Principles by Ben de Lisi" on "pspPage"
  When I click on "filterButton" on "pspPage"
  And I should see "filterTitle" as "Mother of the bride edit" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Debut" on "pspPage"
  And I wait for "5000" milliseconds
  And I click on "closeButton" on "pspPage"
  And I wait for "3000" milliseconds
  Then I should see "searchText" as "Principles by Ben de Lisi" on "pspPage"

@automated @opsTC
Scenario:Verify Price, Size Selector, SFL, Quantity on the PDP page of a product for  Weddings > Wedding guest > Mother of the bride as per opsTC-14
  Then I should validate the name of product no. "1" on "pspPage"
  And I should validate final price of product no. "1" on "pspPage"
  And I click on the image of product no. "1" on pspPage
  Then I should validate the name of product no. "1" on "pdpPage"
  And I should validate final price of product no. "1" on "pdpPage"
  Then I should see "stepperIncrement" "enabled" on "pdpPage"
  And I store name of product and select save item on pdpPage
  #And I click on "saveLaterIcon" on "pdpPage"
  #And I wait for "5000" milliseconds
  #Then I should see "saveForLaterPopUpCloseButton" exist on "pdpPage"
  #Then I click on "continueShoppingButton" on "pdpPage"
  And I wait for "2000" milliseconds
  And I am in view of "creditCardValuePoints" on "pdpPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I should see value of position "2" as "Saved Items"
  When I click on "Saved Items" position "2"
  And I wait for "5000" milliseconds
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I validate products are saved on mySavedItemPage
