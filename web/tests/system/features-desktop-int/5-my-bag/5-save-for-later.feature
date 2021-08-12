Feature: Test Debenhams Save For Later on My Bag Page

@automated @DEBD-795 @DEBD-329
Scenario: Validate that the empty My Bag And Save For Later For Guest User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  And I should not see "savedItemCarousal" on "myBagPage"

@automated @DEBD-795 @DEBD-329
Scenario: Validate that the empty My Bag And Items in Save For Later For Guest User
  When I navigate to "testSingleSKUPDPURL"
  Then I click on "saveLaterIcon" on "pdpPage"
  And I navigate to "basketCheckoutUrl"
  Then I should see "savedItemCarousal" exist on "myBagPage"
  And I should see "mySavedItemsProductNameList" exist on "myBagPage"
  And I should see "mySavedItemsProductImageList" exist on "myBagPage"
  And I should see "mySavedItemsProductNowPriceList" exist on "myBagPage"
  And I should see "mySavedItemsProductChooseOptionButtonList" exist on "myBagPage"
  And I should see "mySavedItemsProductPercentageOffList" exist on "myBagPage"
  And I should see "mySavedItemsProductWasPriceList" exist on "myBagPage"
  And I should see "mySavedItemsProductThenPriceList" exist on "myBagPage"
  And I should see "mySavedItemsFirstProductChooseOptionButtonText" as "Move to bag" on "myBagPage"
  When I "Remove" "all" products from "mySavedItems"
  Then I should not see "savedItemCarousal" on "myBagPage"
  And I should not see "mySavedItemsProductNameList" on "myBagPage"

@automated @DEBD-795 @DEBD-329
Scenario: Validate that the Items In My Bag And Items in Save For Later For Guest User & Remove Confirmation Pop Up
  When I navigate to "productWithAlphabetSizeSwatch"
  Then I click on "saveLaterIcon" on "pdpPage"
  And I select available size and add to bag on pdpPage
  When I navigate to "testSingleSKUPDPURL"
  Then I click on "saveLaterIcon" on "pdpPage"
  And I navigate to "basketCheckoutUrl"
  Then I should see "savedItemCarousal" exist on "myBagPage"
  And I should see "mySavedItemsProductNameList" exist on "myBagPage"
  And I should see "mySavedItemsProductImageList" exist on "myBagPage"
  And I should see "mySavedItemsProductNowPriceList" exist on "myBagPage"
  And I should see "mySavedItemsProductChooseOptionButtonList" exist on "myBagPage"
  And I should see "mySavedItemsProductPercentageOffList" exist on "myBagPage"
  And I should see "mySavedItemsProductWasPriceList" exist on "myBagPage"
  And I should see "mySavedItemsProductThenPriceList" exist on "myBagPage"
  And I should see "mySavedItemsFirstProductChooseOptionButtonText" as "Move to bag" on "myBagPage"
  And I should see "mySavedItemsSecondProductChooseOptionButtonText" as "Choose options" on "myBagPage"
  When I click on "firstSFLProductRemove" on "myBagPage"
  Then I should see "mySavedItemsRemoveConfirmationPopUpHeader" exist on "myBagPage"
  And I should see "mySavedItemsRemoveConfirmationPopUpHeaderText" as "Remove saved item" on "myBagPage"
  And I should see "mySavedItemsRemoveConfirmationPopUpSubHeaderText" as "Are you sure you want to remove this item?" on "myBagPage"
  And I should see "removePopUpYesButton" exist on "myBagPage"
  And I should see "mySavedItemsRemoveConfirmationPopUpKeepSavedItem" exist on "myBagPage"
  And I should see "removePopUpClose" exist on "myBagPage"
  When I click on "removePopUpClose" on "myBagPage"
  Then I should not see "mySavedItemsRemoveConfirmationPopUpHeader" on "myBagPage"
  And I should see "savedItemCarousal" exist on "myBagPage"
  And I should see "mySavedItemsProductNameList" exist on "myBagPage"
  When I click on "firstSFLProductRemove" on "myBagPage"
  And I click on "mySavedItemsRemoveConfirmationPopUpKeepSavedItem" on "myBagPage"
  Then I should not see "mySavedItemsRemoveConfirmationPopUpHeader" on "myBagPage"
  And I should see "savedItemCarousal" exist on "myBagPage"
  And I should see "mySavedItemsProductNameList" exist on "myBagPage"
  And I count number of "mySavedItemsProductList" to be "2" on "myBagPage"
  When I click on "firstSFLProductRemove" on "myBagPage"
  And I click on "removePopUpYesButton" on "myBagPage"
  Then I wait for "2000" milliseconds
  And I count number of "mySavedItemsProductList" to be "1" on "myBagPage"
  When I "Remove" "all" products from "mySavedItems"
  Then I should not see "savedItemCarousal" on "myBagPage"
  And I should not see "mySavedItemsProductNameList" on "myBagPage"
  And I "Remove" "all" products from "myBagPage"


@automated @DEBD-795 @DEBD-329
Scenario Outline: Validate that the empty My Bag And Save For Later For Registered User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "2000" milliseconds
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  Then I wait for "2000" milliseconds
  And I should not see "savedItemCarousal" on "myBagPage"

Examples:
 |email                               |password        |
 |testsaveditemsmybag@test.com        |Sapient123      |

@automated @DEBD-795 @DEBD-329
Scenario: Validate that the empty My Bag And Items in Save For Later For Registered User
  When I navigate to "testSingleSKUPDPURL"
  Then I click on "saveLaterIcon" on "pdpPage"
  And I navigate to "basketCheckoutUrl"
  Then I should see "savedItemCarousal" exist on "myBagPage"
  And I should see "mySavedItemsProductNameList" exist on "myBagPage"
  And I should see "mySavedItemsProductImageList" exist on "myBagPage"
  And I should see "mySavedItemsProductNowPriceList" exist on "myBagPage"
  And I should see "mySavedItemsProductChooseOptionButtonList" exist on "myBagPage"
  And I should see "mySavedItemsProductPercentageOffList" exist on "myBagPage"
  And I should see "mySavedItemsProductWasPriceList" exist on "myBagPage"
  And I should see "mySavedItemsProductThenPriceList" exist on "myBagPage"
  And I should see "mySavedItemsFirstProductChooseOptionButtonText" as "Move to bag" on "myBagPage"
  When I "Remove" "all" products from "mySavedItems"
  Then I wait for "2000" milliseconds
  Then I should not see "savedItemCarousal" on "myBagPage"
  And I should not see "mySavedItemsProductNameList" on "myBagPage"

@automated @DEBD-795 @DEBD-329
Scenario: Validate that the Items In My Bag And Items in Save For Later For Registered User & Remove Confirmation Pop Up
  When I navigate to "productWithAlphabetSizeSwatch"
  Then I click on "saveLaterIcon" on "pdpPage"
  And I select available size and add to bag on pdpPage
  When I navigate to "testSingleSKUPDPURL"
  Then I click on "saveLaterIcon" on "pdpPage"
  And I navigate to "basketCheckoutUrl"
  Then I should see "savedItemCarousal" exist on "myBagPage"
  And I should see "mySavedItemsProductNameList" exist on "myBagPage"
  And I should see "mySavedItemsProductImageList" exist on "myBagPage"
  And I should see "mySavedItemsProductNowPriceList" exist on "myBagPage"
  And I should see "mySavedItemsProductChooseOptionButtonList" exist on "myBagPage"
  And I should see "mySavedItemsProductPercentageOffList" exist on "myBagPage"
  And I should see "mySavedItemsProductWasPriceList" exist on "myBagPage"
  And I should see "mySavedItemsProductThenPriceList" exist on "myBagPage"
  And I should see "mySavedItemsFirstProductChooseOptionButtonText" as "Move to bag" on "myBagPage"
  And I should see "mySavedItemsSecondProductChooseOptionButtonText" as "Choose options" on "myBagPage"
  When I click on "firstSFLProductRemove" on "myBagPage"
  Then I should see "mySavedItemsRemoveConfirmationPopUpHeader" exist on "myBagPage"
  And I should see "mySavedItemsRemoveConfirmationPopUpHeaderText" as "Remove saved item" on "myBagPage"
  And I should see "mySavedItemsRemoveConfirmationPopUpSubHeaderText" as "Are you sure you want to remove this item?" on "myBagPage"
  And I should see "removePopUpYesButton" exist on "myBagPage"
  And I should see "mySavedItemsRemoveConfirmationPopUpKeepSavedItem" exist on "myBagPage"
  And I should see "removePopUpClose" exist on "myBagPage"
  When I click on "removePopUpClose" on "myBagPage"
  Then I should not see "mySavedItemsRemoveConfirmationPopUpHeader" on "myBagPage"
  And I should see "savedItemCarousal" exist on "myBagPage"
  And I should see "mySavedItemsProductNameList" exist on "myBagPage"
  When I click on "firstSFLProductRemove" on "myBagPage"
  And I click on "mySavedItemsRemoveConfirmationPopUpKeepSavedItem" on "myBagPage"
  Then I should not see "mySavedItemsRemoveConfirmationPopUpHeader" on "myBagPage"
  And I should see "savedItemCarousal" exist on "myBagPage"
  And I should see "mySavedItemsProductNameList" exist on "myBagPage"
   And I count number of "mySavedItemsProductList" to be "2" on "myBagPage"
  When I click on "firstSFLProductRemove" on "myBagPage"
  And I click on "removePopUpYesButton" on "myBagPage"
  Then I wait for "2000" milliseconds
   And I count number of "mySavedItemsProductList" to be "1" on "myBagPage"
  When I "Remove" "all" products from "mySavedItems"
  Then I should not see "savedItemCarousal" on "myBagPage"
  And I should not see "mySavedItemsProductNameList" on "myBagPage"
  And I "Remove" "all" products from "myBagPage"

@automated @DEBD-329
Scenario: Validate My saved item carousal on My bag
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  Then I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  Then I navigate to "casualShirtPSPURL"
  Then I wait for "3000" milliseconds
  When I store value of first "1" products and select save item on pspPage
  When I store value of first "2" products and select save item on pspPage
  Then I navigate to "womenMaxiDressesPspUrl"
  Then I wait for "3000" milliseconds
  When I store value of first "2" products and select save item on pspPage
  When I click on "firstProductImage" on "pspPage"
  And I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "1" on "pdpPage"
  And I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "savedItemCarousal" exist on "myBagPage"
  And I should see "mySavedItemsProductNameList" exist on "myBagPage"
  And I should see "mySavedItemsProductImageList" exist on "myBagPage"
  And I count number of "mySavedItemsProductImageList" to be "4" on "myBagPage"
  And I count number of "mySavedItemsProductNameList" to be "4" on "myBagPage"
  And I count number of "mySavedItemsProductRemoveButtonList" to be "4" on "myBagPage"

@automated @DEBD-329 @DEBD-313
Scenario: Add a product from My saved item carousal on My bag and validate My bag
  Then I should see "savedItemCarousal" exist on "myBagPage"
  And I am in view of "savedItemCarousal" on "myBagPage"
  And I click on "mySavedItemsFirstProductChooseOptionButton" on "myBagPage"
  Then I should see "mySavedItemsChooseOptionPopUp" exist on "myBagPage"
  And I should see "mySavedItemsChooseOptionPopUpHeading" as "Choose options" on "myBagPage"
  And I should see "mySavedItemsChooseOptionPopUpCloseIcon" exist on "myBagPage"
  And I should see "mySavedItemsChooseOptionPopUpFieldLabel" containing "Size" on "myBagPage"
  And I should see "mySavedItemsChooseOptionPopUpFieldDropdown" exist on "myBagPage"
  And I should see "mySavedItemsChooseOptionPopUpFieldOptions" exist on "myBagPage"
  And I should see "mySavedItemsChooseOptionPopUpAddToBagButton" "disabled" on "myBagPage"
  And I click on "mySavedItemsChooseOptionPopUpCloseIcon" on "myBagPage"
  And I should not see "mySavedItemsChooseOptionPopUpHeading" on "myBagPage"
  And I click on "mySavedItemsFirstProductChooseOptionButton" on "myBagPage"
  And I select available size from "dropdown"
  Then I should see "mySavedItemsChooseOptionPopUpAddToBagButton" "enabled" on "myBagPage"
  Then I click on "mySavedItemsChooseOptionPopUpAddToBagButton" on "myBagPage"
  Then I should see "addToCartButtonDisplayFinal" as "2" on "pdpPage"
  And I validate the "banner price"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"
  And I count number of "mySavedItemsProductImageList" to be "4" on "myBagPage"
  And I count number of "mySavedItemsProductNameList" to be "4" on "myBagPage"
  And I count number of "mySavedItemsProductRemoveButtonList" to be "4" on "myBagPage"

@automated @DEBD-329
Scenario: Remove a product from My saved item carousal on My bag and validate My bag
  Then I should see "savedItemCarousal" exist on "myBagPage"
  When I click on "firstSFLProductRemove" on "myBagPage"
  Then I should see "mySavedItemsRemoveConfirmationPopUpSubHeaderText" as "Are you sure you want to remove this item?" on "myBagPage"
  And I should see "removePopUpYesButton" exist on "myBagPage"
  Then I click on "removePopUpYesButton" on "myBagPage"
  And I count number of "mySavedItemsProductImageList" to be "3" on "myBagPage"
  And I count number of "mySavedItemsProductNameList" to be "3" on "myBagPage"
  And I count number of "mySavedItemsProductRemoveButtonList" to be "3" on "myBagPage"

@manual @DEBD-313
Scenario: Validate two choose option pop up should not be opened at a time
  Given I have pressed choose options for one product
  And the drop down is open
  When I press choose options for another product
  Then the original drop down will close
  And the new one will open i.e. only one drop down will be open at one time.

@manual @DEBD-321
Scenario: Validate OOS messaging for single SKU product
  Given I am on the bag page
  When a product in the saved items carousel is out of stock
  Then I will see no price information
  And the out of stock message beneath it
  And the move to bag/choose options CTA is hidden

@manual @DEBD-321
Scenario: Validate OOS messaging for multiple SKU product
  Given I am on the bag page
  When a saved SKU (size and/or colour) in the saved items carousel is out of stock
  Then I will see the SKU and price information
  And I will see the out of stock message beneath it
  And the move to bag/choose options CTA is hidden

@manual @DEBD-321
Scenario: Validate OOS messaging for Some SKU OOS for a product
  Given I am on the saved items carousel
  When I press choose options
  And a size/colour is out of stock in a drop down
  Then I will see "out of stock" next to the SKU size or colour
  Given I have pressed choose options CTA
  When I select a size/colour that is out of stock
  Then I will see the out of stock message next to it
  And the "This item is out of stock" message below it
  And the move to bag/choose options CTA is hidden

@manual @DEBD-321
Scenario: Validate Low Stock messaging for Some SKU Low Stock for a product
  Given I am on the saved items carousel
  When I press choose options
  And a size/colour is low stock in a drop down
  Then I will see "low stock" next to the SKU size or colour
  Given I have pressed choose options CTA
  When I select a size/colour that is low in stock
  Then I will see the "low in stock" message next to it
  And the "Hurry this item is low in stock" message below it

