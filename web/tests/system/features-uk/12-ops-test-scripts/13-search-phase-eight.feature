Feature: Test Debenhams ops test script journey number 23

@automated @opsTC
Scenario: Verify the price on psp and pdp page , delivery option , zoom functionality, credit card points and seeMore info link on the PDP page as per opsTC-23
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  And I wait for "2000" milliseconds
  When I click on "searchIcon" on "commonPage"
  Then I enter "Phase Eight" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "phase-eight"
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I click on "pdpImageToZoom" using jquery on "pdpPage"
  Then I should see "pdpCloseZoom" exist on "pdpPage"
  When I click on "pdpCloseZoom" on "pdpPage"
  Then I should not see "pdpCloseZoom" on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"
  And I select available size on "pdpPage"
  When I should see "addToBagButton" exist on "pdpPage"
  And I wait for "7000" milliseconds
  Then I click on "addToBagButton" on "pdpPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  And I should see "deliveryReturnDetails" exist on "pdpPage"
  And I should see "deliveryDetails" as "Home Delivery" on "pdpPage"
  And I should see "returnMessage" exist on "pdpPage"
  Then I verify "href" of "seeMoreInfoLink" as "seeMoreInfoUrl" on "pdpPage"
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
