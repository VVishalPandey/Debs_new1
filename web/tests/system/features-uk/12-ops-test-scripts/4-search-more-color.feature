Feature: Test Debenhams ops test script journey number 5 and 6

@automated @opsTC
Scenario: Search a product and verify the correct products are displayed in the search result along with 'more colour options' badging,images, short descriptions & prices as per opsTC-5
  Given I logout
  When I click on "searchIcon" on "commonPage"
  Then I enter "0340208601" in "searchField" on "commonPage"
  #Then I enter "The collection v neck cardigan women" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "0340208601"
  #Then I should see "url" contains "search/The+collection+v+neck+cardigan+women"
  And I should see "moreColourOptionBadging" exist on "pspPage"
  And I should see "imagesOnScreen" exist on "pspPage"
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  Then I should see "columnGridViewButton" exist on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  When I store value of first "2" products and select save item on pspPage

@automated @opsTC
Scenario: Select a product and verify Short description, price, swatches, size selector, size guide, add to bag, round robin, reviews as per opsTC-6
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I should see "colourSwatches" exist on "pdpPage"
  And I am in view of "colourSwatches" on "pdpPage"
  Then I verify page reload on selecting a different colour swatch
  And I wait for "4000" milliseconds
  And I am in view of "sizeGuideLink" on "pdpPage"
  Then I select the available size swatch
  When I should see "sizeGuideLink" exist on "pdpPage"
  Then I verify "href" of "sizeGuideHref" as "sizeGuideLink" on "pdpPage"
  When I should see "addToBagButton" exist on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"
  Then I click on "addToBagButton" on "pdpPage"
  And I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "has been added to your bag." on "pdpPage"
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
  And I wait for "2000" milliseconds
  And I should see "alsoInRangeOption" exist on "pdpPage"
  And I should select available size for first product in alsoInRange column
  And I wait for "4000" milliseconds
  Then I click on "addToBagFromAlsoInRangeContainer" on "pdpPage"
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
  And I click on "reviewsAccordion" on "pdpPage"
