Feature: Test Debenhams ops test script journey number 3 and 4

@automated @opsTC
Scenario: Validate that the auto suggestion options are appearing and are relevant
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  And I click on "searchIcon" on "commonPage"
  And I enter "Gucci" in "searchField" on "commonPage"
  Then I should see "autoSuggestions" exist on "commonPage"
  Then I should see "autoSuggestions" containing "gucci" on "commonPage"

@automated @opsTC
Scenario: Validate that the auto suggestion appearing are relevant
  When I click on "searchApply" on "commonPage"
  Then I should see "url" contains "beauty/gucci"

@automated @opsTC
Scenario: Validate that the PSP banner is present at the top of the page and user is able to scroll up and down the page
  When I should see "pspBanner" as "Gucci" on "pspPage"
  And I am in view of "socialMediaSection" on "commonPage"
  Then I click on "backtoTopButton" on "pspPage"
  And I should see "pspBanner" as "Gucci" on "pspPage"

@automated @opsTC
Scenario: Verify that the user is able to alternate between single column and two column product display
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"

@automated @opsTC
Scenario: Verify that the images, short descriptions, prices & save for later button are displayed and functional for the products
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And I am in view of "saveForLaterButton" on "pspPage"
  When I click on "saveForLaterButton" on "pspPage"
  And I wait for "3000" milliseconds
#Then I should see "saveForLaterPopUpCloseButton" exist on "pspPage"
#Then I click on "continueShoppingButton" on "pspPage"

@automated @opsTC
Scenario: Verify that the user is able to see the size drop down, price per ml & beauty club messaging on the PDP page as per opsTC-4
  When I navigate to "productUrl"
  When I am in view of "sizeDropDown" on "pdpPage"
  And I should see "pricePerml" exist on "pdpPage"
  And I should see "beautyClubMessage" containing "points with the Beauty Club Card" on "pdpPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  And I should see "deliveryReturnDetails" exist on "pdpPage"
  And I should see "returnMessage" exist on "pdpPage"
  And I add to bag quantity "1" and go to my bag page
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
