Feature: Test Debenhams Regression scenarios 15 to 20 covering TCAT Pages, Beauty PDP page(Dropdown size selection, Swatch size selection, Single SKU), Gallery Landing Page(Bundle PDP) and Checkout Journey Furniture Product Guest User

@automated @ops-INT @Sno.-15
Scenario: Verify that the TCAT page template works
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Men" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Clothing" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "All mens clothing" on "commonPage"
  Then I should see "url" contains "/men"
  Then I should see "headerText" as "Men's clothing & accessories" on "pspPage"
  And I should see "tcatHeroImage" exist on "pspPage"
  And I should see "tcatShopMoreLink" exist on "pspPage"
  And I should see "tcatImages" exist on "pspPage"

@automated @ops-INT @Sno.-15
Scenario: Verify that the TCAT adspot is clickable and user land so n correct page  
  When I click on "tcatHeroImage" on "pspPage"
  Then I should see "url" contains "/men/"
  Then I go back to previous page
  And I should see "headerText" as "Men's clothing & accessories" on "pspPage"
  Then I should see "url" contains "/men"

@automated @ops-INT @Sno.-15
Scenario: Verify that the TCAT filter is clickable and user land on correct page and is able to SFL products
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I "validate & click" option is available in "tcatfilterMenuList" as "Price" on "pspPage"
  And I click on "filterSubMenuPrice1020Option" on "pspPage"
  #And I "validate & click" option from "tcatfilterMenuList" of "Price"  as "filterSubMenuInputList" as "£20 - £30" on "pspPage"
  Then I should see "url" contains "30.0"
  When I store value of first "2" products and select save item on pspPage

