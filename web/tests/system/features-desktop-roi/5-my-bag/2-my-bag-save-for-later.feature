Feature: Test Debenhams Save For Later on My Bag Page validation

@automated @DEBD-986 @DEBD-972 @DEBD-937
Scenario: Validate that the product added from My Bag to Save For Later For Guest User
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I select save for later for first product then I validate bag on myBagPage
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"
  And I should see "emptyBagLogo" exist on "myBagPage"
  And I should see "continueShoppingCTA" exist on "myBagPage"
  And I should see "mySavedItemsProductList" exist on "myBagPage"
  And I should see "savedItemCarousal" exist on "myBagPage"
  Then I should not see "numberCountInMiniBag" on "commonPage"
  And I should not see "subtotalValue" on "myBagPage"

@manual
Scenario: Validate that the page should be scrolled to the top after adding product to SFL For Guest User
 Then I should see page scrolled to the top

@automated @DEBD-986 @DEBD-972 @DEBD-986 @DEBD-937
Scenario: Validate that the product added to Save For Later from Remove Confirmation Pop Up For Guest User
  Given I logout
  Then I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I remove first product and select "Save for later" then I validate bag on myBagPage
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"
  And I should see "emptyBagLogo" exist on "myBagPage"
  And I should see "continueShoppingCTA" exist on "myBagPage"
  And I should see "mySavedItemsProductList" exist on "myBagPage"
  And I should see "savedItemCarousal" exist on "myBagPage"
  Then I should not see "numberCountInMiniBag" on "commonPage"
  And I should not see "subtotalValue" on "myBagPage"


@automated @DEBD-986 @DEBD-937
Scenario: Validate that the product should not be added to Save For Later from Remove Confirmation Pop Up when user clicks the Close CTA For Guest User
  Given I logout
  Then I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I remove first product and select "Close" then I validate bag on myBagPage
  Then I should not see "removeConfirmationPopUp" on "myBagPage"
  And I should see "firstProductName" exist on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"


@manual @DEBD-986 @DEBD-937
Scenario: Validate that the product should not be added to Save For Later from Remove Confirmation Pop Up when user clicks the dark overlay For Guest User
  Given I logout
  Then I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I click on "firstProductRemove" on "myBagPage"
  Then I should see "removeConfirmationPopUp" exist on "myBagPage"
  And I should see "removePopUpYesButton" exist on "myBagPage"
  And I should see "removePopUpSaveLaterButton" exist on "myBagPage"
  And I should see "darkOverlay" exist on "myBagPage"
  When I click on "darkOverlay" on "myBagPage"
  Then I should not see "removeConfirmationPopUp" on "myBagPage"
  And I should see "firstProductName" exist on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"

@automated @DEBD-986 @DEBD-972 @DEBD-937
Scenario: Validate that the product should be removed from My Bag when user clicks the Yes CTA on Remove Confirmation Pop Up For Guest User
  Given I logout
  Then I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I remove first product and select "Yes, remove it" then I validate bag on myBagPage
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"
  And I should see "emptyBagLogo" exist on "myBagPage"
  And I should see "continueShoppingCTA" exist on "myBagPage"
  And I should not see "removeConfirmationPopUp" on "myBagPage"
  Then I should not see "numberCountInMiniBag" on "commonPage"
  And I should not see "firstProductName" on "myBagPage"
  And I should not see "subtotalValue" on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"
  And I should not see "savedItemCarousal" on "myBagPage"

@manual @DEBD-937
Scenario: Validate that the user should not be allowed to add more than 99 items in Save For Later whnen clicks Save For Later on My Bag
  Given I have multiple products in My Bag and 99 products in Save For Later
  When I click on "saveForLaterCTA" on "myBagPage"
  Then I should see "errorMessageOnMyBag" as "Error: Sorry, you have reached the limit of 99 saved items. Please remove the items from your list to save."
  And I should see product not removed from My Bag
  And I should not see "savedItemCarousal" on "myBagPage"
  And I should see product not added to SFL inline banner

@manual @DEBD-937
Scenario: Validate that the user should not be allowed to add more than 99 items in Save For Later whnen clicks Save For Later on Remove Confirmation Pop Up
  Given I have multiple products in My Bag and 99 products in Save For Later
  When I click "removeLink" on "myBagPage"
  Then I should see "removeConfirmationPopUp" exist on "myBagPage"
  And I should see "saveForLaterButtonOnPopUp" exist on "myBagPage"
  When I click on "saveForLaterButtonOnPopUp" on "myBagPage"
  Then I should see "errorMessageOnMyBag" as "Error: Sorry, you have reached the limit of 99 saved items. Please remove the items from your list to save."
  And I should see product not removed from My Bag
  And I should not see "savedItemCarousal" on "myBagPage"
  And I should see product not added to SFL inline banner

@automated @DEBD-986 @DEBD-972
Scenario: Validate that the product added from My Bag to Save For Later For Registered User
  Given I logout
  Then I am on my details page
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I select save for later for first product then I validate bag on myBagPage
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"
  And I should see "emptyBagLogo" exist on "myBagPage"
  And I should see "continueShoppingCTA" exist on "myBagPage"
  And I should see "mySavedItemsProductList" exist on "myBagPage"
  And I should see "savedItemCarousal" exist on "myBagPage"
  Then I should not see "numberCountInMiniBag" on "commonPage"
  And I should not see "subtotalValue" on "myBagPage"

@automated @DEBD-986 @DEBD-972 @DEBD-937
Scenario: Validate that the product added to Save For Later from Remove Confirmation Pop Up For Registered User
  Given I logout
  Then I am on my details page
  Then I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I remove first product and select "Save for later" then I validate bag on myBagPage
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"
  And I should see "emptyBagLogo" exist on "myBagPage"
  And I should see "continueShoppingCTA" exist on "myBagPage"
  And I should see "mySavedItemsProductList" exist on "myBagPage"
  And I should see "savedItemCarousal" exist on "myBagPage"
  Then I should not see "numberCountInMiniBag" on "commonPage"
  And I should not see "subtotalValue" on "myBagPage"

@automated @DEBD-986 @DEBD-937
Scenario: Validate that the product should not be added to Save For Later from Remove Confirmation Pop Up when user clicks the Close CTA For Registered User
  Given I logout
  Then I am on my details page
  Then I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I remove first product and select "Close" then I validate bag on myBagPage
  Then I should not see "removeConfirmationPopUp" on "myBagPage"
  And I should see "firstProductName" exist on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"

@manual @DEBD-986 @DEBD-937
Scenario: Validate that the product should not be added to Save For Later from Remove Confirmation Pop Up when user clicks the dark overlay For Registered User
  Given I logout
  Then I am on my details page
  Then I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I click on "firstProductRemove" on "myBagPage"
  Then I should see "removeConfirmationPopUp" exist on "myBagPage"
  And I should see "removePopUpYesButton" exist on "myBagPage"
  And I should see "removePopUpSaveLaterButton" exist on "myBagPage"
  And I should see "darkOverlay" exist on "myBagPage"
  When I click on "darkOverlay" on "myBagPage"
  Then I should not see "removeConfirmationPopUp" on "myBagPage"
  And I should see "firstProductName" exist on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"

@automated @DEBD-986 @DEBD-972 @DEBD-937
Scenario: Validate that the product should be removed from My Bag when user clicks the Yes CTA on Remove Confirmation Pop Up For Registered User
  Given I logout
  Then I am on my details page
  Then I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I remove first product and select "Yes, remove it" then I validate bag on myBagPage
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"
  And I should see "emptyBagLogo" exist on "myBagPage"
  And I should see "continueShoppingCTA" exist on "myBagPage"
  And I should not see "removeConfirmationPopUp" on "myBagPage"
  Then I should not see "numberCountInMiniBag" on "commonPage"
  And I should not see "firstProductName" on "myBagPage"
  And I should not see "subtotalValue" on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"
  And I should not see "savedItemCarousal" on "myBagPage"
