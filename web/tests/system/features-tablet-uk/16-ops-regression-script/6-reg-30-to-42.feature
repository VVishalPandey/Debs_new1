Feature: Test Debenhams Regression scenarios 29 to 33

@automated @ops-TABLET @PDP @Sno.-29
Scenario: Verify that the bundle PDP page
  Given I logout
  And I wait for "3000" milliseconds
  Then I click on "debenhamsLogo" on "commonPage"
  And I empty mini bag
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Men" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Clothing" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Suits & formalwear" on "commonPage"
  Then I should see "url" contains "/men/suits-tailoring"
  # And I should see "galleryHeroImage" exist on "pspPage"
  # And I should see "galleryFilterMenu" exist on "pspPage"

@automated @ops-TABLET @PDP @Sno.-29
Scenario: Validate that user is able to select the Categories filter and SFL icon is not displayed on PSP page
  When I click on "filterButton" on "pspPage"
  Then I click on "bundleCategoryFilter" on "pspPage"
  And I wait for "3000" milliseconds
  And I click on "bundleSuitFilterOption" on "pspPage"
  And I wait for "2000" milliseconds
  And I click on "closeButton" on "pspPage"

@automated @ops-TABLET @Sno.-29
Scenario: Validate the header and urls
  Then I should see "headerText" as "Men's suits" on "pspPage"
  And I should see "url" contains "suits#filter"
  And I should not see "saveForLaterButton" on "pspPage"

@automated @ops-TABLET @PDP @Sno.-29
Scenario: Navigate to Bundle PDP page and verify the zoom functionality
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  And I should validate final price on "pdpPage"
  # When I click on "pdpImageToZoom" using jquery on "pdpPage"
  # Then I should not see "pdpCloseZoom" on "pdpPage"
  # And I should not see "zoomNextButton" on "pdpPage"

@automated @ops-TABLET @Sno.-29
Scenario: Verify the production description and each item listed with short description, price, size selector, quantity selector & add to bag button is displayed
  And I am in view of "productDescriptionLink" on "pdpPage"
  And I validate all the details for list bundle product "1" and choose size as "4" for add to bag
  Then I should see "addToCartButtonDisplayFinal" as "1" on "pdpPage"
  And I validate all the details for list bundle product "2" and choose size as "5" for add to bag
  Then I should see "addToCartButtonDisplayFinal" as "2" on "pdpPage"
  And I am in view of "productDescriptionLink" on "pdpPage"
  And I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescSection" exist on "pdpPage"
  Then I should see "bundleProductDescTitles" containing "Jacket" on "pdpPage"
  # Then I should see "bundleProductDescTitles" containing "Tousers" on "pdpPage"

@automated @ops-TABLET @SFL @Sno.-30
Scenario: Validated that the count of SFL products is displayed correctly on the header
  Given I logout
  And I wait for "3000" milliseconds
  Then I click on "debenhamsLogo" on "commonPage"
  Then I empty mini bag
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  Then I navigate to "beautyMakeupPspURL"
  # When I store value of first "1" products and select save item on pspPage
  When I store value of first "3" products and select save item on pspPage
  Then I click on "menuIcon" on "commonPage"
  And I click on "Saved Items" position "15"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should see "savedItemCount" as "3" on "mySavedItemPage"
  Then I validate products are saved on mySavedItemPage

@automated @ops-TABLET @SFL @Sno.-30
Scenario: Add a product to My bag from SFL page
  Then I click on "addToBagP1" on "mySavedItemPage"
  Then I should see "addToCartButtonDisplayFinal" as "1" on "pdpPage"

@automated @ops-TABLET @SFL @Sno.-30
Scenario: Validate the Remove product functionality on SFL page
  Then I click on "removeP1" on "mySavedItemPage"
  Then I should see "removeProductWarning" as "Are you sure you want to remove this item?" on "mySavedItemPage"
  And I should see "yesButton" exist on "mySavedItemPage"
  Then I click on "yesButton" on "mySavedItemPage"
  And I should see "savedItemCount" as "2" on "mySavedItemPage"
  When I am in view of "removeAllLink" on "mySavedItemPage"
  Then I click on "removeAllLink" on "mySavedItemPage"
  Then I should see "removeProductWarning" as "Are you sure you want to remove all of your saved items?" on "mySavedItemPage"
  And I should see "yesButton" exist on "mySavedItemPage"
  Then I click on "yesButton" on "mySavedItemPage"
  And I should see "savedItemCount" as "0" on "mySavedItemPage"

@automated @ops-TABLET @MiniBag @Sno.-31
Scenario: Validated that the count of Mini bag products is displayed correctly on the header and mini bag when adding product to cart
  Given I logout
  And I wait for "3000" milliseconds
  Then I empty mini bag
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  And I click on "searchIcon" on "commonPage"
  And I enter "jeans" in "searchField" on "commonPage"
  When I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I wait for "3000" milliseconds
  And I select available size and add to bag on pdpPage
  Then I should see "addToCartButtonDisplayFinal" as "1" on "pdpPage"
  And I click on "miniBagButton" on "pdpPage"
  And I should see "closeButton" exist on "minibagPage"
  And I count number of "productMiniBag" to be "1" on "minibagPage"
  And I count number of "productImg" to be "1" on "minibagPage"
  And I count number of "productTitle" to be "1" on "minibagPage"
  And I count number of "productPrice" to be "2" on "minibagPage"
  And I count number of "productRemove" to be "1" on "minibagPage"
  And I click on "closeButton" on "minibagPage"
  Then I click on "searchIcon" on "commonPage"
  And I enter "OpsWomenDressSFLTestText" in "searchField" on "commonPage"
  When I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I wait for "3000" milliseconds
  And I select available size and add to bag on pdpPage
  Then I should see "addToCartButtonDisplayFinal" as "2" on "pdpPage"
  And I click on "miniBagButton" on "pdpPage"
  And I should see "closeButton" exist on "minibagPage"
  And I count number of "productMiniBag" to be "2" on "minibagPage"
  And I count number of "productImg" to be "2" on "minibagPage"
  And I count number of "productTitle" to be "2" on "minibagPage"
  And I count number of "productPrice" to be "3" on "minibagPage"
  And I count number of "productRemove" to be "2" on "minibagPage"
  And I click on "closeButton" on "minibagPage"
  Then I click on "searchIcon" on "commonPage"
  And I enter "OpsFurnitureSingleSKUTestText" in "searchField" on "commonPage"
  When I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I wait for "3000" milliseconds
  Then I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "3" on "pdpPage"
  And I click on "miniBagButton" on "pdpPage"
  And I should see "closeButton" exist on "minibagPage"
  And I count number of "productMiniBag" to be "3" on "minibagPage"
  And I count number of "productImg" to be "3" on "minibagPage"
  And I count number of "productTitle" to be "3" on "minibagPage"
  And I count number of "productPrice" to be "4" on "minibagPage"
  And I count number of "productRemove" to be "3" on "minibagPage"

@automated @ops-TABLET @MiniBag @Sno.-31
Scenario: Validated that the count of Mini bag products is displayed correctly on the header and mini bag when removing product from mini bag
  And I click on "firstProductRemove" on "minibagPage"
  And I count number of "productMiniBag" to be "2" on "minibagPage"
  And I count number of "productImg" to be "2" on "minibagPage"
  And I count number of "productTitle" to be "2" on "minibagPage"
  And I count number of "productPrice" to be "3" on "minibagPage"
  And I count number of "productRemove" to be "2" on "minibagPage"
  And I should see "closeButton" exist on "minibagPage"
  And I click on "closeButton" on "minibagPage"
  Then I click on "searchIcon" on "commonPage"
  And I enter "lipstick" in "searchField" on "commonPage"
  When I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I wait for "3000" milliseconds
  Then I click on "addToBagButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "3" on "pdpPage"
  And I click on "miniBagButton" on "pdpPage"
  And I should see "closeButton" exist on "minibagPage"
  And I count number of "productMiniBag" to be "3" on "minibagPage"
  And I count number of "productImg" to be "3" on "minibagPage"
  And I count number of "productTitle" to be "3" on "minibagPage"
  And I count number of "productPrice" to be "4" on "minibagPage"
  And I count number of "productRemove" to be "3" on "minibagPage"

@automated @ops-TABLET @MyBag @Sno.-31
Scenario: Validated My Bag when navigating from mini bag and increase the quantity of 1st product
  Then I click on "secureCheckoutButton" on "minibagPage"
  And I should see "headerText" as "My Bag" on "myBagPage"
  Then I click on "incrementStepper" on "myBagPage"
  Then I should see value of "countInputField" as "2" on "myBagPage"
  Then I should see "addToCartButtonDisplayFinal" as "4" on "pdpPage"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

@automated @ops-TABLET @MyBag @Sno.-31
Scenario: Validate that product is removed from my bag successfully when clicking on remove link for the product
  Given I logout
  And I click on "miniBagButton" on "pdpPage"
  Then I click on "secureCheckoutButton" on "minibagPage"
  And I remove first product and select "Yes, remove it" then I validate bag on myBagPage
  Then I should see "addToCartButtonDisplayFinal" as "2" on "pdpPage"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

@automated @ops-TABLET @MyBag @Sno.-31
Scenario: Validate that product is removed from by bag successfully when clicking on SFL link for the product
  Given I logout
  Then I am on my details page
  And I click on "miniBagButton" on "pdpPage"
  Then I click on "secureCheckoutButton" on "minibagPage"
  When I remove first product and select "Save for later" then I validate bag on myBagPage
  Then I should see "addToCartButtonDisplayFinal" as "1" on "pdpPage"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

@automated @ops-TABLET @MyBag @Sno.-31
Scenario Outline: Validate that apply promo code functionality on My bag
  When I click on "promoCodeAccordion" on "myBagPage"
  Then I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "myBagPage"
  And I should validate "promoCodeRemove" exist on "myBagPage"
  Then I should see "productDiscountValue" exist on "myBagPage"
  Then I validate "discountValue" as "<discount>" on mybagPage
  # And I validate the "banner price"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

  Examples:
    | promoCode | promoMessage  | discount |
    | PS01      | PS01: Applied | -£0.01   |

@automated @ops-TABLET @MyBag @Sno.-31
Scenario: Validate that unavailable delivery options are greyed out
  Then I should see "unavailableDeliveryOption" as "International" on "myBagPage"
  And I click on "unavailableDeliveryOption" on "myBagPage"
  And I should validate "unavailableDeliveryOptionTooltip" exist on "myBagPage"

@automated @ops-TABLET @MyBag @Sno.-31
Scenario: Validate that beauty card and credit card info is displayed for beauty product in My bag
  And I should see "creditCardInfo" exist on "myBagPage"
  And I should see "beautyCardInfo" exist on "myBagPage"
  When I am in view of "headerText" on "myBagPage"
  Then I remove first product and select "Yes, remove it" then I validate bag on myBagPage
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"
  And I should see "emptyBagLogo" exist on "myBagPage"
  And I should see "continueShoppingCTA" exist on "myBagPage"
  #Then I click on "saveForLaterAccordion" on "myBagPage"

@automated @ops-TABLET @MyBag @Sno.-31
Scenario: Validate available delivery options are same on My bag and PDP
  When I am in view of "addToBag" on "myBagPage"
  And I should see "addToBag" exist on "myBagPage"
  And I click on "addToBag" on "myBagPage"
  Then I should see "addToCartButtonDisplayFinal" as "1" on "pdpPage"
  And I validate the "banner price"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"
  And I should see "creditCardInfo" exist on "myBagPage"
  And I should not see "beautyCardInfo" on "myBagPage"
  Then I should see "availableDeliveryOption" as "Standard" on "myBagPage"
  And I click on "productImage" on "myBagPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  And I should see "deliveryReturnHomeDelivery" exist on "pdpPage"

@automated @ops-TABLET @MyBagSFL @Sno.-32
Scenario: Validate My saved item accordion on My bag
  Given I logout
  And I wait for "3000" milliseconds
  Then I click on "debenhamsLogo" on "commonPage"
  Then I empty mini bag
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  Then I navigate to "chanelpspPage"
  When I store value of first "3" products and select save item on pspPage
  Then I navigate to "womenDressesPspUrl"
  When I store value of first "3" products and select save item on pspPage
  When I click on "firstProductImage" on "pspPage"
  And I select available size and add to bag on pdpPage
  # Then I should see "viewBasketCloseButton" exist on "pdpPage"
  # And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "addToCartButtonDisplayFinal" as "1" on "pdpPage"
  And I click on "miniBagButton" on "pdpPage"
  Then I click on "secureCheckoutButton" on "minibagPage"
  And I should see "headerText" as "My Bag" on "myBagPage"
  Then I am in view of "sflProducts" on "myBagPage"
  And I count number of "sflProductsImg" to be "6" on "myBagPage"
  And I count number of "sflProductsTitle" to be "6" on "myBagPage"
  And I count number of "sflProductRemove" to be "6" on "myBagPage"
  Then I should scroll to "sflProduct5" on "myBagPage"
  And I do a vertical scroll to "sflProduct5" on "myBagPage"


@automated @ops-TABLET @MyBagSFL @Sno.-32
Scenario: Add a product from My saved item accordion on My bag and validate My bag
  Then I am in view of "sflProducts" on "myBagPage"
  Then I do a vertical scroll to "sflProduct1" on "myBagPage"
  And I click on "sflChooseOptionsP1" on "myBagPage"
  And I select the available size swatch
  Then I click on "sflAddToBagP1" on "myBagPage"
  Then I should see "addToCartButtonDisplayFinal" as "2" on "pdpPage"
  And I validate the "banner price"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

@automated @ops-TABLET @MyBagSFL @Sno.-32
Scenario: Remove a product from My saved item accordion on My bag and validate My bag
  Then I am in view of "sflProducts" on "myBagPage"
  Then I click on "sflRemoveP1" on "myBagPage"
  Then I should see "removepopUpHeaderText" as "Are you sure you want to remove this item?" on "myBagPage"
  And I should see "removePopUpYesButton" exist on "myBagPage"
  Then I click on "removePopUpYesButton" on "myBagPage"
  And I count number of "sflProductsImg" to be "5" on "myBagPage"
  And I count number of "sflProductsTitle" to be "5" on "myBagPage"
  And I count number of "sflProductRemove" to be "5" on "myBagPage"

@automated @ops-TABLET @MyBagSFL @Sno.-33
Scenario: Validate the Dynamic delivery and finance banner
  Then I am in view of "sflProducts" on "myBagPage"
  Then I do a vertical scroll to "sflProduct1" on "myBagPage"
  And I click on "sflChooseOptionsP1" on "myBagPage"
  And I select the available size swatch
  Then I click on "sflAddToBagP1" on "myBagPage"
  Then I should see "addToCartButtonDisplayFinal" as "3" on "pdpPage"
  And I validate the "banner price"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"
  And I am in view of "finanaceBannerApplyLink" on "myBagPage"
  Then I verify "href" of "finanaceBannerApplyLink" containing "myBagFinanaceApplyNowLink" on "myBagPage"

















