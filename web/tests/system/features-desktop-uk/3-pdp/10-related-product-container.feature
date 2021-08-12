Feature: Validate PDP related product container

@automated @PDP @Fixed @DEBD-118
Scenario: Navigate to Red Herring Turquoise shirred turtle neck top pdp page to validate Also in range and you may also like container
  Given I navigate to "homeURL"
  #Then I "Remove" "all" products from "myBagPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "Red Herring - sweatshirt" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "Red+Herring+-+sweatshirt"
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  And I should validate minibag count "before"
  When I am in view of "roundRobinSection" on "pdpPage"
  And I should see "roundRobinSection" exist on "pdpPage"
  Then I should see "roundRobinHeaderText" as "Also in the range" on "pdpPage"
  And I should see "baynoteHeaderText" as "You May Also Like" on "pdpPage"
  And I should see "baynoteProducts" exist on "pdpPage"
  And I should select available size for first product in alsoInRange column
  And I wait for "2000" milliseconds
  When I click on "addToBagFromRoundRobinContainer" on "pdpPage"
  Then I should validate minibag count "after"

@automated @PDP @Fixed @DEBD-118
Scenario: Validate that only baynote should be displayed if we have 0 round robin 0 cross sell and user is able to click on a product inside the baynote
  Given I navigate to "onlyBaynotepdpPage"
  And I should validate minibag count "before"
  Then I should scroll to "baynoteYMAL" on "pdpPage"
  Then I should see "baynoteYMAL" exist on "pdpPage"
  Then I should see "baynoteYMAL" as "You May Also Like" on "pdpPage"
  And I should see "YMAlNextButton" exist on "pdpPage"
  And I should see "YMAlPreviousButton" exist on "pdpPage"
  And I should see "4" products in "baynoteYMALProducts" on "pdpPage"
  And I should not see "roundRobin" on "pdpPage"
  And I should not see "crossSell" on "pdpPage"
  Then I click on "select1YMALProduct" on "pdpPage"
  When I select available size and add to bag on pdpPage
  Then I should validate minibag count "after"

@automated @PDP @Fixed @DEBD-118
Scenario: Validate that baynote and round robin should be displayed if we have 1 round robin 0 cross sell and user is able to click on a product inside the baynote and round robin
  Given I navigate to "roundRobin1BaynotepdpPage"
  And I should validate minibag count "before"
  Then I should scroll to "baynoteYMAL" on "pdpPage"
  Then I should see "baynoteYMAL" exist on "pdpPage"
  Then I should see "baynoteYMAL" as "You May Also Like" on "pdpPage"
  And I should see "YMAlNextButton" exist on "pdpPage"
  And I should see "YMAlPreviousButton" exist on "pdpPage"
  And I should see "2" products in "baynoteYMALProducts" on "pdpPage"
  And I should see "roundRobin" exist on "pdpPage"
  Then I should see "roundRobin" as "Also in the range" on "pdpPage"
  And I should see "1" products in "roundRobinCarousal" on "pdpPage"
  And I should not see "crossSell" on "pdpPage"
  Then I click on "select1YMALProduct" on "pdpPage"
  And I select available size and add to bag on pdpPage
  Then I should validate minibag count "after"
  Then I go back to previous page
  Then I click on "selectroundRobin1Carousal" on "pdpPage"
  And I should validate minibag count "before"
  And I select available size and add to bag on pdpPage
  Then I should validate minibag count "after"

@manual @DEBD-118
Scenario: Validate that baynote and round robin should be displayed if we have 2 round robin 0 cross sell and user is able to click on a product inside the baynote and round robin
  Given I navigate to "pdpPage"
  Then I should see "baynote" exist on "pdpPage"
  And I should see "2" products in "baynote" on "pdpPage"
  And I should see "roundRobin" exist on "pdpPage"
  And I should see "2" products in "roundRobin" on "pdpPage"
  And I should not see "crossSell" on "pdpPage"
  Then I click on "firstBaynote" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "5" on "pdpPage"
  And I navigate to previous page
  Then I click on "firstRoundRobin" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "6" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118 @awsManual
Scenario: Validate that baynote and round robin should be displayed if we have 3 round robin 0 cross sell and user is able to click on a product inside the baynote and round robin
  Given I navigate to "pdpPage"
  Then I should see "baynote" exist on "pdpPage"
  And I should see "2" products in "baynote" on "pdpPage"
  And I should see "roundRobin" exist on "pdpPage"
  And I should see "2" products in "roundRobin" on "pdpPage"
  And I should see "scrollArrow" for "roundRobin" on "rightSide"
  And I should not see "crossSell" on "pdpPage"
  Then I click on "lastBaynote" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "7" on "pdpPage"
  And I navigate to previous page
  Then I click on "lastRoundRobin" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "8" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118 @awsManual
Scenario: Validate that baynote and round robin should be displayed if we have 4+ round robin 0 cross sell and user is able to click on a product inside the baynote and round robin
  Given I navigate to "pdpPage"
  Then I should see "baynote" exist on "pdpPage"
  And I should see "2" products in "baynote" on "pdpPage"
  And I should see "roundRobin" exist on "pdpPage"
  And I should see "2" products in "roundRobin" on "pdpPage"
  And I should see "scrollArrow" for "roundRobin" on "rightSide"
  And I should see "scrollArrow" for "roundRobin" on "leftSide"
  And I should not see "crossSell" on "pdpPage"
  Then I click on "lastBaynote" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "9" on "pdpPage"
  And I navigate to previous page
  Then I click on "lastRoundRobin" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "10" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118 @awsManual
Scenario: Validate that baynote and cross sell should be displayed if we have 0 round robin 1 cross sell and user is able to click on a product inside the baynote and cross sell
  Given I navigate to "pdpPage"
  Then I should see "baynote" exist on "pdpPage"
  And I should see "2" products in "baynote" on "pdpPage"
  And I should see "crossSell" exist on "pdpPage"
  And I should see "1" products in "crossSell" on "pdpPage"
  And I should not see "roundRobin" on "pdpPage"
  Then I click on "lastBaynote" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "11" on "pdpPage"
  And I navigate to previous page
  Then I click on "firstCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "12" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118
Scenario: Validate that baynote and cross sell should be displayed if we have 0 round robin 2 cross sell and user is able to click on a product inside the baynote and cross sell
  Given I navigate to "pdpPage"
  Then I should see "baynote" exist on "pdpPage"
  And I should see "2" products in "baynote" on "pdpPage"
  And I should see "crossSell" exist on "pdpPage"
  And I should see "2" products in "crossSell" on "pdpPage"
  And I should not see "roundRobin" on "pdpPage"
  Then I click on "firstBaynote" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "13" on "pdpPage"
  And I navigate to previous page
  Then I click on "lastCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "14" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118
Scenario: Validate that baynote and cross sell should be displayed if we have 0 round robin 3 cross sell and user is able to click on a product inside the baynote and cross sell
  Given I navigate to "pdpPage"
  Then I should see "baynote" exist on "pdpPage"
  And I should see "2" products in "baynote" on "pdpPage"
  And I should see "crossSell" exist on "pdpPage"
  And I should see "2" products in "crossSell" on "pdpPage"
  And I should not see "leftScrollArrow" on "pdpPage"
  And I should not see "roundRobin" on "pdpPage"
  Then I click on "firstBaynote" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "15" on "pdpPage"
  And I navigate to previous page
  Then I click on "lastCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "16" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118 @awsManual
Scenario: Validate that baynote and cross sell should be displayed if we have 0 round robin 4 cross sell and user is able to click on a product inside the baynote and cross sell
  Given I navigate to "pdpPage"
  Then I should see "baynote" exist on "pdpPage"
  And I should see "2" products in "baynote" on "pdpPage"
  And I should see "crossSell" exist on "pdpPage"
  And I should see "2" products in "crossSell" on "pdpPage"
  And I should not see "leftScrollArrow" on "pdpPage"
  And I should not see "roundRobin" on "pdpPage"
  Then I click on "firstBaynote" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "17" on "pdpPage"
  And I navigate to previous page
  Then I click on "lastCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "18" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118
Scenario: Validate that baynote and cross sell should be displayed if we have 0 round robin 5+ cross sell and user is able to click on a product inside the baynote and cross sell
  Given I navigate to "pdpPage"
  Then I should see "baynote" exist on "pdpPage"
  And I should see "2" products in "baynote" on "pdpPage"
  And I should see "crossSell" exist on "pdpPage"
  And I should see "2" products in "crossSell" on "pdpPage"
  And I should see "leftScrollArrow" exist on "pdpPage"
  And I should not see "roundRobin" on "pdpPage"
  Then I click on "firstBaynote" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "19" on "pdpPage"
  And I navigate to previous page
  Then I click on "lastCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "20" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118
Scenario: Validate that round robin and cross sell should be displayed if we have 1 round robin 1 cross sell and user is able to click on a product inside the cross sell and round robin
  Given I navigate to "pdpPage"
  Then I should not see "baynote" on "pdpPage"
  And I should see "roundRobin" on "pdpPage"
  And I should see "1" products in "roundRobin" on "pdpPage"
  And I should see "crossSell" exist on "pdpPage"
  And I should see "1" products in "crossSell" on "pdpPage"
  And I should not see "leftScrollArrow" on "pdpPage"
  And I should not see "rightScrollArrow" on "pdpPage"
  Then I click on "firstRoundRobin" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "21" on "pdpPage"
  And I navigate to previous page
  Then I click on "lastCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "22" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118
Scenario: Validate that round robin and cross sell should be displayed if we have 2 round robin 2 cross sell and user is able to click on a product inside the cross sell and round robin
  Given I navigate to "pdpPage"
  Then I should not see "baynote" on "pdpPage"
  And I should see "roundRobin" on "pdpPage"
  And I should see "2" products in "roundRobin" on "pdpPage"
  And I should see "crossSell" exist on "pdpPage"
  And I should see "2" products in "crossSell" on "pdpPage"
  And I should not see "leftScrollArrow" on "pdpPage"
  And I should not see "rightScrollArrow" on "pdpPage"
  Then I click on "firstRoundRobin" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "23" on "pdpPage"
  And I navigate to previous page
  Then I click on "lastCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "24" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118
Scenario: Validate that round robin and cross sell should be displayed if we have 1 round robin 3 cross sell and user is able to click on a product inside the cross sell and round robin
  Given I navigate to "pdpPage"
  Then I should not see "baynote" on "pdpPage"
  And I should see "roundRobin" on "pdpPage"
  And I should see "1" products in "roundRobin" on "pdpPage"
  And I should see "crossSell" exist on "pdpPage"
  And I should see "2" products in "crossSell" on "pdpPage"
  And I should not see "leftScrollArrow" on "pdpPage"
  And I should see "rightScrollArrow" on "pdpPage"
  Then I click on "firstRoundRobin" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "25" on "pdpPage"
  And I navigate to previous page
  Then I click on "lastCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "26" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118
Scenario: Validate that round robin and cross sell should be displayed if we have 1 round robin 2 cross sell and user is able to click on a product inside the cross sell and round robin
  Given I navigate to "pdpPage"
  Then I should not see "baynote" on "pdpPage"
  And I should see "roundRobin" on "pdpPage"
  And I should see "1" products in "roundRobin" on "pdpPage"
  And I should see "crossSell" exist on "pdpPage"
  And I should see "2" products in "crossSell" on "pdpPage"
  And I should not see "leftScrollArrow" on "pdpPage"
  And I should not see "rightScrollArrow" on "pdpPage"
  Then I click on "firstRoundRobin" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "27" on "pdpPage"
  And I navigate to previous page
  Then I click on "lastCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "28" on "pdpPage"
  And I navigate to previous page

@manual @DEBD-118
Scenario: Validate that round robin and cross sell should be displayed if we have 4+ round robin 4+ cross sell and user is able to click on a product inside the cross sell and round robin
  Given I navigate to "pdpPage"
  Then I should not see "baynote" on "pdpPage"
  And I should see "roundRobin" on "pdpPage"
  And I should see "1" products in "roundRobin" on "pdpPage"
  And I should see "crossSell" exist on "pdpPage"
  And I should see "1" products in "crossSell" on "pdpPage"
  And I should see "leftScrollArrow" exist on "pdpPage"
  And I should see "rightScrollArrow" exist on "pdpPage"
  Then I click on "firstRoundRobin" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "29" on "pdpPage"
  And I navigate to previous page
  Then I click on "lastCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "30" on "pdpPage"
  And I navigate to previous page
