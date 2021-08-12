Feature: Test Debenhams end to end journey number 2

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to sign page and login with e2e credentials
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I am on my details page
  And I empty mini bag
  When I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  # And I click on "debenhamsLogo" on "commonPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to women dresses psp page from menu global navigation
  When I click on "menuIcon" on "commonPage"
  And I "validate" mainMenu option "Saved Items" on commonPage smallscreen
  And I "validate" mainMenu option "Sign out" on commonPage smallscreen
  And I "validate" mainMenu option "My Account" on commonPage smallscreen
  And I "validate" mainMenu option "Help & Support" on commonPage smallscreen
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Clothing" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I should see "headerText" as "Dresses" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  And I should count and validate "totalBrandCount" on "pspPage"
  And I should count and validate "totalProductCount" on "pspPage"
  And I should count and validate "totalSaveIconCount" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the merch set, seo content and large images on women dresses psp page
  #Then I should not see "seoContent" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  #And I should not see "merchSetSection" on "pspPage"
  And I should see "merchSetSection" exist on "pspPage"
  And I count number of "merchSetProducts" to be "<merchSetProductCount>" on "pspPage"
  And I should see "normal" images

  Examples:
    | merchSetProductCount |
    | 3                    |

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to the next page of women's dresses psp page and validate the pagination
  Then I should scroll to "nextButton" on "pspPage"
  And I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  #And I should see page number "2" of total on "pspPage"
  And I should see "headerText" as "Dresses" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  Then I should scroll to "headerText" on "pspPage"
  And I should count and validate "totalBrandCount" on "pspPage"
  And I should count and validate "totalProductCount" on "pspPage"
  And I should count and validate "totalSaveIconCount" on "pspPage"
  And I should see "normal" images

@automatedSanity @preprodSanity @e2e
Scenario: Validate the merch set and seo content should not exist on page 2 of on women dresses psp
  Then I should not see "seoContent" on "pspPage"
  And I should not see "merchSetSection" on "pspPage"
  And I should not see "merchSetProducts" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (low-high) on women's dresses psp page number 2
  When I click on "sortOptionPriceLowHighAus" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*min_price"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  Then I should scroll to "headerText" on "pspPage"
  And I should count and validate "totalBrandCount" on "pspPage"
  And I should count and validate "totalProductCount" on "pspPage"
  And I should count and validate "totalSaveIconCount" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the user is on page number 1 after sorting result appears and merch set, seo content and large images should be on page
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "1" of total on "pspPage"
  #And I should see "seoContent" exist on "pspPage"
  And I should not see "merchSetSection" on "pspPage"
  #And I count number of "merchSetProducts" to be "<merchSetProductCount>" on "pspPage"
  #And I should see "large" images

  Examples:
    | merchSetProductCount |
    | 3                    |

@automatedSanity @preprodSanity @e2e
Scenario: Open the filter and apply Occasion -> Evening & Brand -> Debut filter and validate the psp page
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Occasion"  as "filterSubMenuInputList" as "Evening" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Debut" on "pspPage"
  Then I click on "closeIcon" on "pspPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "searchText" as "Debut, Evening" on "pspPage"
  #And I should count and validate "imagesOnScreen" on "pspPage"
  #And I should see "previousButtonState" "disabled" on "pspPage"
  #And I should see "nextButtonState" "enabled" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Choose first two dresses and same under my saved items from above scenario result psp page
  When I am in view of "headerText" on "pspPage"
  Then I store value of first "2" products and select save item on pspPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to saved items from global navigation and validate the page
  When I click on "menuIcon" on "commonPage"
  Then I should see nav menu back option as "Clothing"
  When I click on nav menu back option as "Clothing"
  Then I should see nav menu back option as "Women"
  When I click on nav menu back option as "Women"
  And I "validate & click" mainMenu option "Saved Items" on commonPage smallscreen
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the products are saved and appearing under my saved items page
  Then I validate products are saved on mySavedItemPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to a dress pdp and validate the zoom functionality
  Then I navigate to "testDressPdpURL"
  When I click on "pdpImageToZoom" using jquery on "pdpPage"
  Then I should see "pdpCloseZoom" exist on "pdpPage"
  When I click on "pdpCloseZoom" on "pdpPage"
  Then I should not see "pdpCloseZoom" on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the size guide link  exist and delivery/returs accodion exits
  Then I should see "sizeGuideLink" exist on "pdpPage"
  And I should see "deliveryReturnTextTablet" as "Delivery & Returns" on "pdpPage"
  And I should see "deliveryReturnIntDeliveryTablet" exist on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the product gets added in my when user select add to bag
  Then I add the product to bag and go to my bag page
  And I store details from myBag to validate later
  And I should see "ProductPrice" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"
  And I should see "subtotalValue" exist on "myBagPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payments page with saved address and delivery option as international
  Then I click on "checkoutButton2" on "myBagPage"
  Then I should see "deliveryAddressheaderText" as "WHERE ARE WE DELIVERING TO?" on "homeDeliveryPage"
  And I should not see "checkoutButton" on "basketCheckoutPage"
  Then I click on "useThisAddressButton" on "deliveryOptionPage"
  When I click on "internationalOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page for all accordion and place order button
  #Then I should see "orderSummaryAccordionInt" as "Order summary" on "paymentPage"
  And I should see "promoCodeAccordionInt" as "Do you have a promotional code?" on "paymentPage"
  And I am in view of "creditCardAccordion" on "paymentPage"
  And I should see "creditCardAccordion" exist on "paymentPage"
  And I should see "payPalAccordion" exist on "paymentPage"
  #And I should see "placeOrderButton" exist on "paymentPage"
  And I am in view of "orderSummaryAccordionInt" on "paymentPage"
  Then I should see "deliveryTypeInt" as "international Delivery" on "paymentPage"
