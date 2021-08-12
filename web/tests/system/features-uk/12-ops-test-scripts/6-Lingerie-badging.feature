Feature: Test Debenhams ops test script journey number 9, 10 and 11

@automated @opsTC
Scenario: Verify that the user is able to see more colour options' badging for the products on the PSP page and swatches, size selectors, shop more links on the PDP page for the product having more colour option badging as per opsTC-09 and 10
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Lingerie" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Bras" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Balcony bras" on "commonPage"
  And I wait for "2000" milliseconds
  When I am in view of "moreColourOptionBadging" on "pspPage"
  And I should see "moreColourOptionBadging" exist on "pspPage"
  And I click on "moreColourOptionBadging" on "pspPage"
  When I should see "colourSwatches" exist on "pdpPage"
  Then I verify page reload on selecting a different colour swatch
  When I am in view of "shopMoreText" on "pdpPage"
  Then I should see "shopMoreText" as "Shop more" on "pdpPage"
  And I verify "href" of "shopMoreTag1Text" as "shopMoreTag1Link" on "pdpPage"
  And I verify "href" of "shopMoreTag2Text" as "shopMoreTag2Link" on "pdpPage"
  And I verify "href" of "shopMoreTag3Text" as "shopMoreTag3Link" on "pdpPage"
  Then I add to bag quantity "1" and go to my bag page
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"

@automated @opsTC
Scenario:Verify PDP page scrolling, Buying guides, finance espot as per opsTC-11
  When I navigate to "braUrl"
  And I am in view of "productDescriptionLink" on "pdpPage"
  And I click on "productDescriptionLink" on "pdpPage"
  And I am in view of "buyGuideEspot" on "pdpPage"
  Then I should see "buyGuideText" as "Read our buying guide" on "pdpPage"
  And I verify "href" of "buyGuideText" as "buyGuideLink" on "pdpPage"
  Then I am in view of "financeBanner" on "pdpPage"
  And I verify "href" of "applyNowButton" as "applyNowLink" on "pdpPage"
