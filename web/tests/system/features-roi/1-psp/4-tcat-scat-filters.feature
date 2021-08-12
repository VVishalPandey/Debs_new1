Feature: Test Debenhams scat & tcat filters

@automated @DDAI-117
Scenario: Navigate to Debenhams beauty tcat page and validate the options within filters
  Given I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  Given I navigate to "tcatBeautyUrl"
  Then I should see "pspHeaderText" as "Beauty" on "pspPage"
  And I should not see "filterButton" on "pspPage"
  And I should not see "closeIcon" on "pspPage"
  And I should see "filterMenuList" exist on "pspPage"
  And I should see "newArrivalsFilter" exist on "pspPage"
  And I "validate" option is available in "tcatfilterMenuList" as "Categories" on "pspPage"
  And I "validate" option is available in "tcatfilterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "tcatfilterMenuList" as "Price" on "pspPage"
  And I "validate" option is available in "tcatfilterMenuList" as "Discount" on "pspPage"
  When I click to "expand" filter "Brand" position "3"
  And I should see value of filter position "2" as "bareMinerals" under parentfilter "3" "Brand"
  When I click on position "2" "bareMinerals" under parentfilter "3" "Brand"
  And I wait for "3000" milliseconds
  Then I should see "headerText" containing "Beauty" on "pspPage"
  And I should see "pspHeader" as "bareMinerals" on "pspPage"
  And I should see "filterButton" exist on "pspPage"

@automated @DDAI-117
Scenario: Navigate to Debenhams women clothing tcat page and validate the options within filters
  Given I navigate to "tcatWomenClothingUrl"
  Then I should see "pspHeaderText" as "Women's clothing & accessories" on "pspPage"
  And I should not see "filterButton" on "pspPage"
  And I should not see "closeIcon" on "pspPage"
  And I should see "filterMenuList" exist on "pspPage"
  And I should see "newArrivalsFilter" exist on "pspPage"
  And I "validate" option is available in "tcatfilterMenuList" as "Categories" on "pspPage"
  And I "validate" option is available in "tcatfilterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "tcatfilterMenuList" as "Fit" on "pspPage"
  And I "validate" option is available in "tcatfilterMenuList" as "Discount" on "pspPage"
  When I click to "expand" filter "Brand" position "3"
  And I should see value of filter position "1" as "The Collection" under parentfilter "3" "Brand"
  When I click on position "1" "The Collection" under parentfilter "3" "Brand"
  And I wait for "3000" milliseconds
  Then I should see "headerText" containing "Women's clothing & accessories" on "pspPage"
  And I should see "pspHeader" as "The Collection" on "pspPage"
  And I should see "filterButton" exist on "pspPage"

@automated @DDAI-117
Scenario: Navigate to Debenhams Kat von D scat page and validate the options within filters
  Given I navigate to "scatKatvonDUrl"
  And I should see "filterButton" exist on "pspPage"
  And I should see "closeIcon" exist on "pspPage"
  And I should see "filterMenuList" exist on "pspPage"
  And I click on "filterButton" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Categories" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Travel size" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Price" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Discount" on "pspPage"
  When I click to "expand" filter "Travel size" position "2"
  And I should see value of filter position "1" as "Travel Beauty" under parentfilter "2" "Travel size"
  When I click on position "1" "Travel Beauty" under parentfilter "2" "Travel size"
  And I wait for "3000" milliseconds
  Then I should see "headerText" containing "Beauty" on "pspPage"
  And I should see "pspHeader" as "KVD Vegan Beauty, Travel Beauty" on "pspPage"
  And I should see "filterButton" exist on "pspPage"

@automated @DDAI-117
Scenario: Navigate to Debenhams Home decor scat page and validate the options within filters
  Given I navigate to "scatHomeDecorUrl"
  Then I should see "headerText" containing "Home accessories" on "pspPage"
  And I should see "filterButton" exist on "pspPage"
  And I should see "closeIcon" exist on "pspPage"
  And I should see "filterMenuList" exist on "pspPage"
  And I click on "filterButton" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Categories" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Scent" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Price" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Discount" on "pspPage"
  And I "validate & click" option is available in "scatfilterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "scatfilterMenuList" of "Brand"  as "filterSubMenuInputList" as "J by Jasper Conran" on "pspPage"
  And I click on "doneButton" on "pspPage"
  And I wait for "3000" milliseconds
  Then I should see "headerText" containing "Home accessories" on "pspPage"
  And I should see "pspHeader" as "J by Jasper Conran" on "pspPage"
  And I should see "filterButton" exist on "pspPage"

@deprecated @DDAI-117
Scenario: Navigate to Debenhams Home decor scat page and validate the options within filters
  Given I navigate to "scatFurnitureUrl"
  Then I should see "pspHeaderText" as "Living room furniture" on "pspPage"
  And I should not see "filterButton" on "pspPage"
  And I should not see "closeIcon" on "pspPage"
  And I should see "filterMenuList" exist on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Categories" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Colour" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Discount" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Range" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Quick delivery" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Debenhams" on "pspPage"
  And I wait for "3000" milliseconds
  Then I should see "pspHeaderText" as "Furniture" on "pspPage"
  And I should see "searchText" as "Debenhams, Living room" on "pspPage"
  And I should see "filterButton" exist on "pspPage"

@automated @DDAI-117
Scenario: Navigate to Debenhams Home decor scat page and validate the options within filters
  Given I navigate to "scatKidsUrl"
  Then I should see "headerText" containing "Partywear" on "pspPage"
  And I should see "filterButton" exist on "pspPage"
  And I should see "closeIcon" exist on "pspPage"
  And I should see "filterMenuList" exist on "pspPage"
  And I click on "filterButton" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Gender" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Age" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Colour" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Price" on "pspPage"
  And I "validate" option is available in "scatfilterMenuList" as "Discount" on "pspPage"
  And I "validate & click" option is available in "scatfilterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "scatfilterMenuList" of "Brand"  as "filterSubMenuInputList" as "Yumi Girl" on "pspPage"
  And I click on "doneButton" on "pspPage"
  And I wait for "3000" milliseconds
  Then I should see "headerText" containing "Partywear" on "pspPage"
  And I should see "pspHeader" as "Yumi Girl" on "pspPage"
  And I should see "filterButton" exist on "pspPage"
