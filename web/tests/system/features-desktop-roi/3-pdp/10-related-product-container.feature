Feature: Validate PDP related product container

@automated @PDP @Fixed  @DEBD-722
Scenario: Navigate to pdp page to validate both round robin (Also In the range) and cross sell container (How about)

  Given I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "Debenhams - Aqua soap dispenser" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  # And I select available size on "pdpPage"
  When I am in view of "roundRobin" on "pdpPage"
  And I should see "roundRobin" exist on "pdpPage"
  Then I should see "roundRobin" as "Also in the range" on "pdpPage"
  And I should see "roundRobinCarousal" exist on "pdpPage"
  And I should see "crossSell" as "How about?" on "pdpPage"
  And I should see "crossSellCarousal" exist on "pdpPage"
  And I should not see "baynoteYMAL" on "pdpPage"
  # And I should select available size for first product in alsoInRange column
  And I wait for "2000" milliseconds
  When I click on "addToBagFromRoundRobinContainer" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" exist on "pdpPage"
  When I click on "addToBagFromCrossSellContainer" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" exist on "pdpPage"


@automated @PDP @Fixed  @DEBD-722
Scenario: Navigate to pdp page to validate both round robin (Matching Items) and cross sell container (Style it with)
  Given I navigate to "homeURL"
  When I click on "searchIcon" on "commonPage"
  Then I enter "Debenhams - White 'Mia' Lace Underwired Padded Balcony Bra" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  # And I select available size on "pdpPage"
  When I am in view of "roundRobin" on "pdpPage"
  And I should see "roundRobin" exist on "pdpPage"
  Then I should see "roundRobin" as "Matching items" on "pdpPage"
  And I should see "roundRobinCarousal" exist on "pdpPage"
  And I should see "crossSell" as "Style it with" on "pdpPage"
  And I should see "crossSellCarousal" exist on "pdpPage"
  And I should not see "baynoteYMAL" on "pdpPage"
  And I should select available size for first product in alsoInRange column
  And I wait for "2000" milliseconds
  When I click on "addToBagFromRoundRobinContainer" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" exist on "pdpPage"


@manual @DEBD-722
Scenario: Validate that round robin  and cross sell should be displayed if we have 1 round robin 1 cross sell and user is able to click on a product inside the roundrobin and cross sell
  Given I navigate to "pdpPage"
  Then I should see "roundrobin" exist on "pdpPage"
  And I should see "2" products in "baynote" on "pdpPage"
  And I should see "crossSell" exist on "pdpPage"
  And I should see "1" products in "crossSell" on "pdpPage"
  And I should not see "roundRobin" on "pdpPage"
  Then I click on "roundrobin" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "11" on "pdpPage"
  And I navigate to previous page
  Then I click on "firstCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "12" on "pdpPage"
  And I navigate to previous page


@manual @DEBD-722
Scenario: Validate that only round robin should be displayed if we have 1 round robin 0 cross sell and user is able to click on a product inside the roundrobin
  Given I navigate to "pdpPage"
  Then I should see "roundrobin" exist on "pdpPage"
  And I should see "1" products in "roundrobin" on "pdpPage"
  And I should not  see "crossSell" exist on "pdpPage"
  And I should not see "crossSell" on "pdpPage"
  Then I click on "roundrobin" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "11" on "pdpPage"
  And I navigate to previous page
  Then I click on "firstCrossSell" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "12" on "pdpPage"
  And I navigate to previous page


@manual @DEBD-722
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

@manual @DEBD-722
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

@manual @DEBD-722
Scenario: Validate the UI of round robin container and cross sell container
  Given I navigate to "pdpPage"
  Then I should see Add to Bag button aligned in center
  And I should see Out Of Stock message in red for the OOS items
  And I should see low stock message and product in the dropdwon
