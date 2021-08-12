Feature: Test Debenhams end to end journey number 2

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to sign page and login with e2e credentials
  Given I logout
  Then I am on my details page
  And I empty mini bag
  When I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  Then I click on "debenhamsLogo" on "commonPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to women dresses psp page from menu global navigation
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@deScoped @e2e @DEBD-2359
Scenario: Validate the colomn grid view with products on first page of women's dresses
  When I am in view of "filterButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"
  Then I should scroll to "filterButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  Then I am in view of "filterButton" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should count and validate "imagesOnScreen" on "pspPage"
  And I should validate width size of "firstProductImage" in "gridView" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to the next page of women's dresses psp page and validate the pagination
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  When I am in view of "nextButton" on "pspPage"
  When I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (low-high) on women's dresses psp page number 2
  When I click on "sortOptionPriceLowHighRoi" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*min_price"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the user is still on page number 2 after sorting result appears
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "1" of total on "pspPage"
#Then I should scroll to "headerText" on "pspPage"

@automatedSanity @preprodSanity
Scenario: Open the filter and apply Occasion -> Evening & Brand -> Debut filter and validate the psp page
  When I am in view of "headerText" on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Occasion"  as "filterSubMenuInputList" as "Evening" on "pspPage"
  # Then I "validate & click" option is available in "filterMenuList" as "Occasion" on "pspPage"
  And I wait for "2000" milliseconds
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "Phase Eight" on "pspPage"
  # Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I wait for "2000" milliseconds
  And I click on "closeButton" on "pspPage"
  And I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "filterText" as "Phase Eight, Maxi dresses, Evening" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  And I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Choose first two dresses and same under my saved items from above scenario result psp page
  When I am in view of "headerText" on "pspPage"
  And I wait for "2000" milliseconds
  Then I store value of first "2" products and select save item on pspPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to saved items from global navigation and validate the page
  When I click on "menuIcon" on "commonPage"
  Then I should see nav menu back option as "Dresses"
  When I click on nav menu back option as "Dresses"
  And I wait for "2000" milliseconds
  Then I should see nav menu back option as "Women"
  When I click on nav menu back option as "Women"
  And I wait for "2000" milliseconds
  And I "validate & click" mainMenu option "Saved Items" on commonPage smallscreen
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
#And I should see "deliveryReturnClickCollect" exist on "pdpPage"
#And I should see "deliveryReturnIntDelivery" exist on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the product gets added in my when user select add to bag
  Then I navigate to "testDressPdpURL"
  Then I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  And I validate the "banner price"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payments page with saved address and delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as user already loggedIn with IE savedAddress
  # And I should see "deliveryTypeheaderTextInt" as "Choose your delivery option" on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Payment" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page for all accordion and place order button
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordionUk" as "Pay with a Credit or Debit card" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page delivery selected, credit card points as selected by user
  #Then I should see "creditCardPointText" containing "Points by paying with your Debenhams Credit Card." on "paymentPage"
  #And I validate "credit card points" value from mybag
  When I am in view of "headerText" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "Standard Delivery" on "paymentPage"

