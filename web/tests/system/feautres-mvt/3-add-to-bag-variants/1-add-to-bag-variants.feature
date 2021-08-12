Feature: Validate Mobile ATB notification MVT variants

@manual @DEBD-3945
Scenario: Validate the "Variant1" on add to bag notification
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  And I should see "addToBagButton" exist on "pdpPage"
  When I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation1"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "exploreMoreDresses" exist on "pdpPage"
  Then I click on "exploreMoreDresses" on "pdpPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"

@manual @DEBD-3945
Scenario: Validate the "Variant2" on add to bag notification
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  And I should see "addToBagButton" exist on "pdpPage"
  When I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation2"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "Explore more dresses" exist on "pdpPage"
  And I should see "productImg" exist on "pdpPage"
  And I should see "productTitle" exist on "pdpPage"
  And I should see "productPrice" exist on "pdpPage"
  And I should see "productQuanity" exist on "pdpPage"
  Then I click on "exploreMoreDresses" on "pdpPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"

@manual @DEBD-3945
Scenario: Validate the "Variant3" on add to bag notification
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  And I should see "addToBagButton" exist on "pdpPage"
  When I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation3"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "continueShopping" exist on "pdpPage"
  Then I click on "continueShopping" on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"

@manual @DEBD-3945
Scenario: Validate the "Variant4" on add to bag notification
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  And I should see "addToBagButton" exist on "pdpPage"
  When I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation4"
  And I should see "productImg" exist on "pdpPage"
  And I should see "productTitle" exist on "pdpPage"
  And I should see "productPrice" exist on "pdpPage"
  And I should see "productQuanity" exist on "pdpPage"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "continueShopping" exist on "pdpPage"
  Then I click on "continueShopping" on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"

@manual @DEBD-3945
Scenario Outline: Validate the "Variant5" on add to bag notification
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "<Product>" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "<Category>" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  And I should see "addToBagButton" exist on "pdpPage"
  When I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation5"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "shopMore" exist on "pdpPage"
  And I should see "<Product>" exist on "pdpPage"
  And I should see "<Category>" exist on "pdpPage"
  And I should see "<Brand>" exist on "pdpPage"
  Then I click on "<Brand>" on "pdpPage"
  And I should see "url" contains "<Brand>"

  |Examples:
      | Product | Category | Brand |
      | Women  | Dresses | Principle |

@manual @DEBD-3945
Scenario Outline: Validate the "Variant6" on add to bag notification
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "<Product>" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "<Category>" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  And I should see "addToBagButton" exist on "pdpPage"
  When I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation6"
  And I should see "productImg" exist on "pdpPage"
  And I should see "productTitle" exist on "pdpPage"
  And I should see "productPrice" exist on "pdpPage"
  And I should see "productQuanity" exist on "pdpPage"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "shopMore" exist on "pdpPage"
  And I should see "<Product>" exist on "pdpPage"
  And I should see "<Category>" exist on "pdpPage"
  And I should see "<Brand>" exist on "pdpPage"
  Then I click on "<Brand>" on "pdpPage"
  And I should see "url" contains "<Brand>"

  |Examples:
      | Product | Category | Brand |
      | Women  | Dresses | Principle |

@manual @DEBD-3945
Scenario: Validate the "No Variant (As is)" on add to bag notification
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "<Product>" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "<Category>" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  And I should see "addToBagButton" exist on "pdpPage"
  When I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"

@manual @DEBD-3945
Scenario: Validate the "Close CTA" on add to bag notification for all Variants
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "<Product>" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "<Category>" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  And I should see "addToBagButton" exist on "pdpPage"
  When I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation1"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation2"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation3"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation4"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation5"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation6"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"

@manual @DEBD-3945
Scenario: Validate the behaviour for adding to bag from a bundle PDP 
  Given I logout
  Then I navigate to "ListBundleProductUrl"
  And I validate all the details for list bundle product "1" and choose size as "4" for add to bag
  And I validate all the details for list bundle product "2" and choose size as "5" for add to bag
  And I should not see "addToBagNotification" on "pdpPage"



@manual @DEBD-3945
Scenario: Validate the behaviour of ATB variants for adding a furniture from PDP 
  Given I logout
  Then I navigate to "furnitureUrl"
  And I should see "productDimensions" exist on "pdpPage"
  And I should see "selectedFabricSection" exist on "pdpPage"
  And I should see "selectedFeetSection" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation1"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation2"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation3"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation4"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation5"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation6"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"

@manual @DEBD-3945
Scenario: Validate that the ATB variant behaviour for Free-Gift product when I add a product that is subject to a 3 for 2 offer
  When I navigate to "3For2OfferPdpURL"
  And And I select available size enter quantity as "3" and add to bag on pdpPage
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation1"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation2"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation3"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation4"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation5"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "addToBagNotification" on "pdpPage"
  When I set mvt test for "addToBag" as "variation6"
  And I close the "addToBagNotification" on pdpPage
  And I should see "addToBagButton" exist on "pdpPage"
