Feature: Test Debenhams psp filters

@automated @DDAI-297
Scenario: Navigate to Debenhams women -> dresses psp page and validate the options within filters
  Given I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "clearAllFilter" exist on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Fit" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Size" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Colour" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Sleeve length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Discount" on "pspPage"

@automated @DDAI-297
Scenario: Navigate to Debenhams women -> dresses psp page and validate result and filters for categories women -> dresses -> Occasion/Brand -> Evening/Yumi
  Then I "validate & click" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Occasion"  as "filterSubMenuInputList" as "Evening" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Occasion" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Yumi" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  #Then  I "should see" "Phase Eight" position "2" in filtered by
  #And   I "should see" "Evening" position "3" in filtered by
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And  I should see "headerSubText" as "Yumi, Evening" on "pspPage"
  And I should see "url" contains "/women/dresses/yumi/evening"
  And I should validate "products" exist on "pspPage"
  When I am in view of "filterButton" on "pspPage"
  And I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Size" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Colour" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Sleeve length" on "pspPage"
  And I "validate" option is available in "filterMenuList" as "Discount" on "pspPage"
  Then I click on "clearAllFilter" on "pspPage"
  Then I should see "url" contains "debenhams.ie/women"

@manual @DDAI-297
Scenario: Navigate to Debenhams beauty -> dress -> price -> Validate result and filters after applying filter for price
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  When I click to "expand" filter "Price" position "10"
  And I should see value of filter position "1" as "Under £10" under parentfilter "10" "Price"
  When I click on position "1" "Under £15" under parentfilter "10" "Price"
  Then I should see "filterTitle" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  And I "should see" "Under £15" position "2" in filtered by
  And I should see value of filter position "1" as "Under £15" under parentfilter "10" "Price" is not underlined
  And I should validate "price" of "products" exist on "pspPage"
  When I click on "clearAllFilter" on "pspPage"
  Then I should see "url" contains "debenhams.com/women"
  #And I "should see" "Dresses" position "1" in filtered by
  And I am in view of "IRpriceFilter" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Price" on "pspPage"
#Then I "validate & click" option from "filterMenuList" of "Price"  as "filterSubMenuLinkList" as "Under €15" on "pspPage"
#Then I should see "filterTitle" as "Dresses" on "pspPage"
#And I "should see" "Dresses" position "1" in filtered by
#And I "should see" "Under £15" position "2" in filtered by
#And I should see value of filter position "1" as "Under £15" under parentfilter "10" "Price" is not underlined
#And I should validate "price" of "products" exist on "pspPage"
#When I click on "clearAllFilter" on "pspPage"
#Then I should see "url" contains "debenhams.com/women"

@manual @DDAI-297
Scenario: Navigate to Debenhams beauty -> dress -> price -> Dresses and Brand psp page and validate result and filters after applying view less filter
  Given I navigate to "womenDressesPspUrl"
  When I click on "filterButton" on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  When I click to "expand" filter "Brand" position "3"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  Then I should see value "ViewMore" on "filterpage"
  And I should not see "SearchBrand" on"filterPage"
  When I click on "ViewMore" on "filterpage"
  Then I should see "SearchBrand" on"filterPage"
  Then I should count and validate "BrandFilterCountMore" on "filterpage"
  Then I click on "ViewMore" on "filterpage"
  Then I should count and validate "BrandFilterCountMore" on "filterpge"
  Then I should see value "ViewLess" on "filterpage"
  When I click on "ViewLess" on "filterpage"
  And I should not see "SearchBrand" on"filterPage"
  Then I should count and validate "BrandFilterCountLess" on "filterpge"

@manual @DDAI-297
Scenario: Navigate to Debenhams beauty -> dress -> price -> Dresses and Brand psp page and validate result and filters after applying view less filter
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  When I click to "expand" filter "Brand" position "4"
  Then I should see value "ViewMore" on "filterpage"
  Then I click on "ViewMore" on "filterpage"
  Then I should count and validate "BrandFilterCountMore" on "filterpge"
  Then I should see value "ViewLess" on "filterpage"
  When I click on "ViewLess" on "filterpage"
  And I should not see "SearchBrand" on"filterPage"
  Then I should count and validate "BrandFilterCountLess" on "filterpge"


@manual @DDAI-297
Scenario Outline: Navigate to Debenhams beauty -> dress -> price -> Dresses psp page and validate result and filters after applying filter for Price Range -> £55 - £99
  Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  When I click to "expand" filter "Price" position "10"
  Then I should see "pricedefinerange" on "filterPage"
  And I enter "<range1l>" in "pricedefinerange1" on "filterPage"
  And I enter "<range2>" in "pricedefinerange12" on "filterPage"
  And I click on "GoButton" on "filterPage"
  Then I should see "£55 - £99" position "2" in filtered by
  When I click on "clearAllFilter" button on "pspPage"
  Then I should not see "headerText" as "Dresses" on "pspPage"
  And I should not see "url" contains "women/dresses"

  Examples:
    | pricedefinerange1 | pricedefinerange2 |
    | 55                | 99                |


@manual @DDAI-297
Scenario: Navigate to Debenhams women -> dresses psp page and validate the image size should be large
  Given I navigate to "womenDressesPspUrl"
  And I click on "largeImageIcon" on "pspPage"
  Then I should see "large" images

@manual @DDAI-297
Scenario: Navigate to Debenhams beauty -> makeup psp page and validate result and filters after applying filter for brand -> Benefit & ARMANI (using search)
  Given I navigate to "beautyMakeupPspURL"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Makeup" on "pspPage"
  #And I "should see" "Make up" position "1" in filtered by
  When I click to "expand" filter "Brand" position "2"
  Then I should see value of filter position "3" as "Benefit" under parentfilter "2" "Brand"
  When I click on position "3" "Benefit" under parentfilter "2" "Brand"
  And I should see value of filter position "23" as "View" under parentfilter "2" "Brand"
  And I click on position "19 "View" under parentfilter "2" "Brand"
  Then I should see "searchPanel" exist on "pspPage"
  And I enter "ADIDAS" in "searchPanel" on "pspPage"
  Then I should see value as "ADIDAS" in position "2" in filter search result under parentfilter "2"
  And I click on "ADIDAS" in position 21" in filter search result under parentfilter "2"
  Then I should see "filterTitle" as "Makeup" on "pspPage"
  And I "should see" "Make up" position "1" in filtered by
  And I "should see" "ARMANI" position "3" in filtered by
  And I "should see" "Benefit" position "2" in filtered by
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should see "url" contains "beauty/make-up/armani:benefit"
  And I should validate "products" exist on "pspPage"
  And I should see "headerFilterText" as "ARMANI & Benefit" on "pspPage"
  When I click on "clearAllFilter" on "pspPage"
  Then I should see "url" contains "debenhams.com/women"

@manual @DDAI-297
Scenario: Navigate to Debenhams beauty -> makeup -> brand -> Benefit & ARMANI psp page then validate result and filters after applying filter for price
  Given I navigate to "brandFilterMakeupPspUrl"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Makeup" on "pspPage"
  When I click to "expand" filter "Price" position "5"
  And I should see value of filter position "1" as "£10 - £20" under parentfilter "5" "Price"
  When I click on position "1" "£10 - £20" under parentfilter "5" "Price"
  Then I should see "filterTitle" as "Makeup" on "pspPage"
  And I "should see" "Make up" position "1" in filtered by
  And I "should see" "ARMANI" position "2" in filtered by
  And I "should see" "Benefit" position "3" in filtered by
  And I "should see" "£10 - £20" position "4" in filtered by
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should validate "products" exist on "pspPage"
  And I should see "headerFilterText" as "ARMANI & Benefit, £10 - £20" on "pspPage"
  When I click on "clearAllFilter" on "pspPage"
  Then I should see "url" contains "debenhams.com/women"

@manual @DDAI-297
Scenario: Navigate to Debenhams beauty -> makeup -> brand -> Benefit & ARMANI psp page then validate result and filters after removing Benefit and adding Kat Von D brand in filter
  Given I navigate to "brandFilterMakeupPspUrl"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should see "headerSubText" as "ARMANI &  Benefit" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Makeup" on "pspPage"
  When I click to "expand" filter "Brand" position "3"
  Then I should see value of filter position "3" as "Benefit" under parentfilter "3" "Brand"
  When I click on position "3" "Benefit" under parentfilter "3" "Brand"
  And I should see value of filter position "20" as "View" under parentfilter "3" "Brand"
  And I click on position "20" "View" under parentfilter "3" "Brand"
  Then I should see "searchPanel" exist on "pspPage"
  And I enter "Kat Von D" in "searchPanel" on "pspPage"
  Then I should see value as "Kat Von D" in position "1" in filter search result under parentfilter "3"
  And I click on "Kat Von D" in position "1" in filter search result under parentfilter "3"
  Then I should see "filterTitle" as "Makeup" on "pspPage"
  And I "should see" "Make up" position "1" in filtered by
  And I "should see" "ARMANI" position "2" in filtered by
  And I "should see" "Kat Von D" position "3" in filtered by
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should see "url" contains "beauty/make-up/armani:kat-von-d"
  And I should validate "products" exist on "pspPage"
  And I should see "headerFilterText" as "ARMANI & Kat Von D" on "pspPage"
  When I click on "clearAllFilter" on "pspPage"
  Then I should see "url" contains "debenhams.com/women"


@manual @DDAI-297
Scenario: Navigate to Debenhams search -> blue dresses psp page and validate result and filters for categories women -> dresses -> casual dresses and validate result
  Given I navigate to "searchBlueDressesPspUrl"
  Then I should see "url" contains "search/blue+dresses"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Search" on "pspPage"
  And I should not see "clearAllFilter" on "pspPage"
  And I should not see "filteredByText" on "pspPage"
  And I should see value of parentfilter position "1" as "Categories"
  When I click to "expand" filter "Categories" position "1"
  Then I should see value of filter position "1" as "Women" under parentfilter "1" "Categories"
  When I click on position "1" "Women" under parentfilter "1" "Categories"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Women's clothing & accessories" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I should not see "clearAllFilter" on "pspPage"
  And I should not see "filteredByText" on "pspPage"
  When I click to "expand" filter "Categories" position "1"
  Then I should see value of filter position "1" as "Dresses" under parentfilter "1" "Categories"
  When I click on position "1" "Dresses" under parentfilter "1" "Categories"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women/dresses"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  Then I should see "clearAllFilter" exist on "pspPage"
  And I should see "filteredByText" exist on "pspPage"
  # And I "should see" "Dresses" position "1" in filtered by
  When I click to "expand" filter "Categories" position "1"
  And I should see value of filter position "2" as "Casual dresses" under parentfilter "1" "Categories"
  When I click on position "2" "Casual dresses" under parentfilter "1" "Categories"
  And I click on "closeIcon" on "pspPage"
  Then I should see "headerText" as "Women's casual dresses" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women/dresses/casual-dresses"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  And I "should see" "Casual dresses" position "2" in filtered by

@manual @DDAI-297
Scenario: Navigate to Debenhams search -> blue dresses -> women -> dresses -> casual dresses psp page from above scenario and validate filter result after removing dresses from filtered by
  When I "remove" "Dresses" position "1" in filtered by
  Then I should see "headerText" as "Women's clothing & accessories" on "pspPage"
  And I should see "url" contains "search/blue+dresses/women"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I should not see "clearAllFilter" on "pspPage"
  And I should not see "filteredByText" on "pspPage"
  When I click to "expand" filter "Categories" position "1"
  Then I should see value of filter position "1" as "Dresses" under parentfilter "1" "Categories"

@automated @DDAI-297
Scenario: Navigate to Debenhams women -> dresses -> Evening dress -> brand -> Dorothy Perkins & Phase Eight psp page then validate result and filters after applying filter for size
  Given I navigate to "brandFilterDressesPspUrl"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  When I click to "expand" filter "Size" position "3"
  And I should see value of filter position "5" as "12" under parentfilter "3" "Size"
  When I click on position "5" "12" under parentfilter "3" "Size"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "2" in filtered by
  And I "should see" "Casual dresses" position "4" in filtered by
  And I "should see" "Dorothy Perkins" position "3" in filtered by
  And I "should see" "12" position "5" in filtered by
  When I click on "closeIcon" on "pspPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"

@automated @DDAI-297
Scenario: Navigate to Debenhams women -> dresses -> casual dresses -> brand -> Dorothy Perkins & Phase Eight psp page then validate result and filters after removing Phase Eight and then validate after clear all
  Given I navigate to "brandFilterDressesPspUrl"
  Then I should see "headerText" containing "Dorothy Perkins & Wallis, Casual dresses" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  When I "remove" "Wallis" position "2" in filtered by
  Then I should see "headerText" containing "Dorothy Perkins, Casual dresses" on "pspPage"
  # And I should see "headerFilterText" as "Dorothy Perkins" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "2" in filtered by
  And I "should see" "Casual dresses" position "4" in filtered by
  And I "should see" "Dorothy Perkins" position "3" in filtered by
  When I click on "clearAllFilter" on "pspPage"
  Then I should see "url" contains "debenhams.com/women"

@manual @DDAI-297
Scenario: Navigate to Debenhams women -> dresses -> Black Color Dresses>Black color dress psp page then validate result and filters after applying filter for colors
  Given I navigate to "ColorFilterDressPspUrl"
  Then I should see "url" contains "debenhams.com/women/dresses/black"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And  I should see "headerSubText" as "black" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  And I "should see" "black" position "1" in filtered by
  And I "should see" "clearAllFilter" on "pspPage"
  When I click to "expand" filter "Color" position "6"
  And I should see value of filter position "1" as "black" under parentfilter "6" "Color"
  When I click on position "5" "gold" under parentfilter "6" "Color"
  And I "should see" "Dresses" position "1" in filtered by
  And I "should see" "black" position "2" in filtered by
  And I "should see" "gold" position "3" in filtered by
  When I click on "closeIcon" exist on "pspPage"
  Then I should see "url" contains "debenhams.com/women/dresses/gold"
  And I should see "headerText" as "Dresses" on "pspPage"
  And  I should see "headerSubText" as "gold" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "should see" "Dresses" position "1" in filtered by
  And I "should see" "gold" position "2" in filtered by
  Then I should see "url" contains "debenhams.com/women"
  When I click on "filterButton" on "pspPage"
  When I click on "clearAllFilter" on "pspPage"
  Then I should see "url" contains "debenhams.com/women"

@manual @DDAI-297
Scenario: Navigate to Debenhams women -> dresses -> dress psp page then validate result and filters after applying filter for size
  Given I navigate to "MenShoesPspUrl"
  Then I should see "url" contains "debenhams.com/men/shoes-boots"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I "should see" "clearAllFilter" on "pspPage"
  And I should see "filterTitle" as "Men's footwear" on "pspPage"
  And I "should see" "Shoes & boots" position "1" in filtered by
  And I should see value of parentfilter position "1" as "Categories"
  And I should see value of parentfilter position "2" as "Size"
  And I should see value of parentfilter position "3" as "Brand"
  And I should see value of parentfilter position "4" as "Colour"
  And I should see value of parentfilter position "5" as "Price"
  And I should see value of parentfilter position "6" as "Discount"
  When I click to "expand" filter "Size" position "3"
  And I should see value of filter position "6" as "8" under parentfilter "2" "Size"
  When I click on position "5" "12" under parentfilter "2" "Size"
  And I "should see" "Shoes & boots" position "1" in filtered by
  And I "should see" "12" position "2" in filtered by
  When I click on "closeIcon" exist on "pspPage"
  Then I should see "url" contains "size_description"
  And I should see "headerText" as "Men's shoes & boots" on "pspPage"
  And  I should see "headerSubText" as "size 12" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  When I click to "expand" filter "Size" position "2"
  And I should see value of filter position "3" as "11" under parentfilter "2" "Size"
  When I click on position "3" "11" under parentfilter "2" "Size"
  Then I "should see" "Shoes & boots" position "1" in filtered by
  And I "should see" "11" position "2" in filtered by
  When I click on  "8" position "2" in filtered by
  Then I should see "7" position "2" in filtered by
  And I should not see "8" position "2" in filtered by
  When I click on "closeIcon" exist on "pspPage"
  And I should see "headerText" as "Men's shoes & boots" on "pspPage"
  And  I should see "headerSubText" as "size 7" on "pspPage"
  And I should validate "products" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  When I click on "clearAllFilter" on "pspPage"
  Then I should see "url" contains "debenhams.com/women"

@manual @DDAI-50
Scenario: Navigate to Debenhams Brands A-Z via the Menu (Shop Departments > Women > Clothing > Brands A-Z) and verify the brands
  Given THAT I have navigated to Womens Brands A-Z via the Menu (Shop Departments > Women > Clothing > Brands A-Z)
  When I land on the Womens Brand A-Z page (http://www.debenhams.ie/content/brand-directory/brand-directory-womens)
  Then I should be able to use the drop down and filter by alphabet
  And I should be able to click on a brand and navigate to its PSP
