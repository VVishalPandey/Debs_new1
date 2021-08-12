Feature: Test Debenhams Save For Later on My Bag Page validation

@automated @DEBD-235 @DEBD-627
Scenario: Validate that the product added from My Bag to Save For Later For Guest User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
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
Scenario: Validate that the page should be scrolled to the top For Guest User
  Then I should see the page scrolled to the top

@automated @DEBD-235 @DEBD-627 @DEBD-979
Scenario: Validate that the product added to Save For Later from Remove Confirmation Pop Up For Guest User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
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

@automated @DEBD-235 @DEBD-979
Scenario: Validate that the product should not be added to Save For Later from Remove Confirmation Pop Up when user clicks the Close CTA For Guest User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I remove first product and select "Close" then I validate bag on myBagPage
  Then I should not see "removeConfirmationPopUp" on "myBagPage"
  And I should see "firstProductName" exist on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"


@manual @DEBD-235 @DEBD-979
Scenario: Validate that the product should not be added to Save For Later from Remove Confirmation Pop Up when user clicks the dark overlay For Guest User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I click on "firstProductRemove" on "myBagPage"
  Then I should see "removeConfirmationPopUp" exist on "myBagPage"
  And I should see "removePopUpYesButton" exist on "myBagPage"
  And I should see "removePopUpSaveLaterButton" exist on "myBagPage"
  And I should see "darkOverlay" exist on "myBagPage"
  When I click on "darkOverlay" on "myBagPage"
  Then I should see "removeConfirmationPopUp" closed
  And I should see "firstProductName" exist on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"

@automated @DEBD-235 @DEBD-627 @DEBD-979
Scenario: Validate that the product should be removed from My Bag when user clicks the Yes CTA on Remove Confirmation Pop Up For Guest User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I remove first product and select "Yes, remove it" then I validate bag on myBagPage
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"
  And I should see "emptyBagLogo" exist on "myBagPage"
  And I should see "continueShoppingCTA" exist on "myBagPage"
  And I should not see "removeConfirmationPopUp" on "myBagPage"
  Then I should not see "numberCountInMiniBag" on "commonPage"
  And I should not see "subtotalValue" on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"
  #And I should not see "savedItemCarousal" on "myBagPage"

@manual @DEBD-235
Scenario: Validate that the user should not be allowed to add more than 99 items in Save For Later when clicks Save For Later on My Bag
  Given I have multiple products in My Bag and 99 products in Save For Later
  When I click on "saveForLaterCTA" on "myBagPage"
  Then I should see "errorMessageOnMyBag" as "Error: Sorry, you have reached the limit of 99 saved items. Please remove the items from your list to save."
  And I should see product not removed from My Bag
  And I should not see "savedItemCarousal" on "myBagPage"
  And I should see product not added to SFL inline banner

@manual @DEBD-235
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

@automated @DEBD-235 @DEBD-627
Scenario: Validate that the product added from My Bag to Save For Later For Registered User
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
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

@automated @DEBD-235 @DEBD-627 @DEBD-979
Scenario: Validate that the product added to Save For Later from Remove Confirmation Pop Up for Registered User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
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

@automated @DEBD-235 @DEBD-979
Scenario: Validate that the product should not be added to Save For Later from Remove Confirmation Pop Up when user clicks the Close CTA for Registered User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I remove first product and select "Close" then I validate bag on myBagPage
  Then I should not see "removeConfirmationPopUp" on "myBagPage"
  And I should see "firstProductName" exist on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"

@manual @DEBD-235 @DEBD-979
Scenario: Validate that the product should not be added to Save For Later from Remove Confirmation Pop Up when user clicks the dark overlay For Registered User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I click on "firstProductRemove" on "myBagPage"
  Then I should see "removeConfirmationPopUp" exist on "myBagPage"
  And I should see "removePopUpYesButton" exist on "myBagPage"
  And I should see "removePopUpSaveLaterButton" exist on "myBagPage"
  And I should see "darkOverlay" exist on "myBagPage"
  When I click on "darkOverlay" on "myBagPage"
  Then I should see "removeConfirmationPopUp" closed
  And I should see "firstProductName" exist on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"

@automated @DEBD-235 @DEBD-627 @DEBD-979 @DEBD-359
Scenario: Validate that the product should be removed from My Bag when user clicks the Yes CTA on Remove Confirmation Pop Up for Registered User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I remove first product and select "Yes, remove it" then I validate bag on myBagPage
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"
  And I should see "emptyBagLogo" exist on "myBagPage"
  And I should see "continueShoppingCTA" exist on "myBagPage"
  And I should not see "removeConfirmationPopUp" on "myBagPage"
  Then I should not see "numberCountInMiniBag" on "commonPage"
  And I should not see "subtotalValue" on "myBagPage"
  And I should not see "mySavedItemsProductList" on "myBagPage"
  #And I should not see "savedItemCarousal" on "myBagPage"

@manual @DEBD-359
Scenario: Validate that the Saved Item Carousal
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I select save for later for first product then I validate bag on myBagPage
  And I should see "mySavedItemsProductList" exist on "myBagPage"
  And I should see "savedItemCarousal" exist on "myBagPage"
  And I should see "savedItemProductTitle" exist on "myBagPage"
  And I should see "savedItemProductPrice" exist on "myBagPage"
  And I should see "savedItemProductPercentOff" exist on "myBagPage"
  And I should see "MoveToBagCTA" exist on "myBagPage"

@manual @DEBD-359
Scenario: Validate that the Saved Item Carousal for a product with multiple sku in My Saved  Items
  When I have a multi-SKU product in my saved items
  Then I should see "chooseOptionsCTA" exist on "myBagPage"

@manual @DEBD-359
Scenario: Validate that the Saved Item Carousal for Next Arrow
  Given I am on my bag page
  And I have saved items
  When I press the "next" carousel arrow
  Then the next product will scroll into view

@manual @DEBD-359
Scenario: Validate that the Saved Item Carousal for Remove Pop Up & Remove from Saved Item
  Given I am on my bag page
  When I press remove on an item in the save for later carousel
  Then I will see the remove confirmation pop up overlay
  When I press yes - remove item
  Then the pop up will close
  And the product will be removed from my saved items
  And will not appear in the carousel
  And will not appear in my account - saved items

@manual @DEBD-359
Scenario: Validate that the Saved Item Carousal for Remove Pop Up & Keep Saved Item
  Given I am on my bag page
  When I press remove on an item in the save for later carousel
  Then I will see the remove confirmation pop up overlay
  When I press no - keep saved
  Then the pop up will close
  And the item will not be removed
  And will still be seen in the carousel
  And my account saved items

@manual @DEBD-359
Scenario: Validate that the Saved Item Carousal for Remove Pop Up & Close CTA
  Given I am on my bag page
  When I press remove on an item in the save for later carousel
  Then I will see the remove confirmation pop up overlay
  When I press close
  Then the remove confirmation pop up overlay will close
  And no products will be removed

@manual @DEBD-359
Scenario: Validate that the Saved Item Carousal for Remove Pop Up & Click dark overlay
  Given I am on my bag page
  When I press remove on an item in the save for later carousel
  Then I will see the remove confirmation pop up overlay
  When I click on the dark overlay
  Then the remove confirmation pop up overlay will close
  And no products will be removed
