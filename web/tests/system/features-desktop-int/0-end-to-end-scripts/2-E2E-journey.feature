Feature: Test Debenhams end to end journey number 2

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to sign page and login with e2e credentials
  Given I logout
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I am on my details page
  Then I should not see "tab1" on "loginPage"
  And I should not see "tab2" on "loginPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I should see "signOutLink" exist on "commonPage"
  And I should not see "createAccountLink" on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "notYouLink" exist on "commonPage"
  And I should see "helloNameLink" exist on "commonPage"
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to women dresses psp page from global navigation
  When I "validate & click" subMenu option "Dresses" under "Women" on commonPage bigscreen
  #When I navigate to "womenAllDressesPSPURL"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "url" contains "/women/dresses"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should validate "products" exist on "pspPage"


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
  When I click on "sortOptionPriceLowHighAus" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*min_price"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should validate "products" exist on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the user is still on page number 2 after sorting result appears
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "1" of total on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Open the filter and apply Occasion -> Evening -> Debut filter and validate the psp page
  When I am in view of "headerText" on "pspPage"
  And I should see "appliedFilters" as "Dresses" on "pspPage"
  Then I "validate & click" subFilter option "Evening" under "Occasion" on commonPage bigscreen
  And I should see "pspHeader" as "Evening" on "pspPage"
  And I "validate & click" subFilter option "Principles" under "Brand" on commonPage bigscreen
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "pspHeader" as "Principles, Evening" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should validate "products" exist on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Choose first two dresses and same under my saved items from above scenario result psp page
  When I am in view of "headerText" on "pspPage"
  When I store value of first "2" products and select save item on pspPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to saved items from global navigation and validate the products are saved and appearing
  When I click on "savedItemsButton" on "commonPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  Then I validate products are saved on mySavedItemPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to a dress pdp and validate the zoom functionality
  Then I navigate to "testDressPdpURL"
  When I click on "mainImageContainer" on "pdpPage"
  Then I should see "zoomedImagePopUp" exist on "pdpPage"
  Then I should see "closeIconOnzoomedImagePopUp" exist on "pdpPage"
  When I click on "closeIconOnzoomedImagePopUp" on "pdpPage"
  Then I should not see "zoomedImagePopUp" on "pdpPage"
  Then I should not see "closeIconOnzoomedImagePopUp" on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the size guide link  exist and delivery/returns accodion exits
  Then I should see "sizeGuideLink" exist on "pdpPage"
  And I should see "deliveryReturnText" as "Delivery & Returns" on "pdpPage"


@automatedSanity @preprodSanity @e2e
Scenario: Validate the product gets added in my when user select add to bag
  When I click on "searchIcon" on "commonPage"
  Then I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  And I should see "ProductPrice" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"
  And I should see "subtotalValue" exist on "myBagPage"


@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payments page with saved address and delivery option as international
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I click on "checkoutButton" on "myBagPage"
  Then I should see "internationalDeliveryHeader" as "WHERE ARE WE DELIVERING TO?" on "deliveryOptionPage"
  And I should not see "checkoutButton" on "myBagPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page for all accordion and place order button
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  And I should see "deliveryType" exist on "paymentPage"
  And I should see "deliveryIcon" exist on "paymentPage"
  And I should see "changeDeliveryMethod" exist on "paymentPage"
  And I should see "deliveryAddress" exist on "paymentPage"
  And I should see "deliveryEstimationText" containing "Delivery within" on "paymentPage"
  And I should see "deliveryEstimationText" containing "working days" on "paymentPage"
  And I should see "orderSummaryProductList" exist on "paymentPage"
  And I should see "productNameElements" exist on "paymentPage"
  And I should see "productImageElements" exist on "paymentPage"
  And I should see "productSwatchElements" exist on "paymentPage"
  And I should see "productQuantityElements" exist on "paymentPage"
  And I should see "productPriceElements" exist on "paymentPage"
  And I should see "editShoppingBagLink" exist on "paymentPage"
  And I should see "dutyAndTaxNotification" exist on "paymentPage"
  And I should see "findOutMoreLink" exist on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should not see "beautyCardAccordion" on "paymentPage"
  And I should not see "giftCardAccordion" on "paymentPage"
  And I should see "payPalAccordion" exist on "paymentPage"
