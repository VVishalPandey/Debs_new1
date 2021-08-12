Feature: Test Debenhams end to end journey number 2

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to sign page and login with e2e credentials
  Given I logout
  Then I am on my details page
  And I "Remove" product "All" from "myBagPage"
  When I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  Then I click on "debenhamsLogo" on "commonPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to women dresses psp page from menu global navigation
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I "validate" mainMenu option "Saved Items" on commonPage smallscreen
  And I "validate" mainMenu option "Store Finder" on commonPage smallscreen
  And I "validate" mainMenu option "Personal finance" on commonPage smallscreen
  And I "validate" mainMenu option "My Beauty Club" on commonPage smallscreen
  And I "validate" mainMenu option "My Account" on commonPage smallscreen
  And I "validate" mainMenu option "Sign out" on commonPage smallscreen
  And I "validate" mainMenu option "Help & Support" on commonPage smallscreen
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  And I should see "headerText" containing "Maxi Dresses" on "pspPage"
  # Then I should see "headerText" as "Maxi Dresses" on "pspPage"

@deScoped @e2e @DEBD-2359
Scenario: Validate the colomn grid view with products on first page of women's dresses
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  When I am in view of "filterButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"
  And I should validate width size of "firstProductImage" in "gridView" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to the next page of women's dresses psp page and validate the pagination
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  When I am in view of "nextButton" on "pspPage"
  When I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (low-high) on women's dresses psp page number 2
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*price"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the user is still on page number 2 after sorting result appears
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "1" of total on "pspPage"

@automatedSanity @preprodSanity @e2e @issue-1834
Scenario: Open the filter and apply Occasion -> Evening & Brand -> Phase Eight filter and validate the psp page
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Maxi Dresses" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Occasion"  as "filterSubMenuInputList" as "Evening" on "pspPage"
  # Then I "validate & click" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I wait for "2000" milliseconds
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "Dorothy Perkins" on "pspPage"
  # Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I wait for "2000" milliseconds
  And I click on "closeButton" on "pspPage"
  And I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "filterText" as "Dorothy Perkins, Maxi Dresses, Evening" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  And I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Choose first two dresses and same under my saved items from above scenario result psp page
  When I am in view of "headerText" on "pspPage"
  And I wait for "2000" milliseconds
  When I store value of first "2" products and select save item on pspPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to saved items from global navigation and validate the page
  When I click on "menuIcon" on "commonPage"
  And I wait for "2000" milliseconds
  Then I should see nav menu back option as "Dresses"
  When I click on nav menu back option as "Dresses"
  And I wait for "2000" milliseconds
  Then I should see nav menu back option as "Women"
  When I click on nav menu back option as "Women"
  And I wait for "2000" milliseconds
  And I "validate & click" mainMenu option "Saved Items" on commonPage smallscreen
  # And I should see value of position "15" as "Saved Items"
  # When I click on "Saved Items" position "15"
  And I wait for "2000" milliseconds
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
  And I should see "deliveryReturnAccordion" exist on "pdpPage"
  And I should see "deliveryReturnText" as "Delivery / Returns" on "pdpPage"
  When I "open" "deliveryReturnAccordion" accordion on "pdpPage"
  Then I should see "deliveryReturnHomeDelivery" exist on "pdpPage"
  And I should see "deliveryReturnClickCollect" exist on "pdpPage"
  And I should see "deliveryReturnIntDelivery" exist on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the product gets added in my when user select add to bag
  Then I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  # And I validate the "banner price"
  # And I validate the "banner message"
  # And I validate the "total items"
  # And I validate the "total product price"
  # And I validate the "subtotal"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payments page with saved address and delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as already logged in with UK address
  #And I should see "headerTextUk" as "Choose your delivery option" on "deliveryOptionPage"
  #When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Payment" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page for all accordion and place order button
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  Then I should scroll to "promoCodeAccordion" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordionUk" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page delivery selected, credit card points as selected by user
#   Then I should see "creditCardPointText" containing "points by paying with your Debenhams Credit Card." on "paymentPage"
#   And I validate "credit card points" value from mybag
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "Standard Delivery" on "paymentPage"
