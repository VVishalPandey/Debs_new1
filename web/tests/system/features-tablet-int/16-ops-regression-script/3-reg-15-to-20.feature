Feature: Test Debenhams Regression scenarios 15 to 20 covering Content Pages, Standard PDP page(Dropdown size selection, Swatch size selection, Single SKU), Lingerie PDP, Chanel PDP page(single sku, multi sku) and Checkout Journey Concession Product Guest User

@automated @ops-INT @Sno.-15 @IssueDEBD-1831
Scenario:Verify PSP, PSP Pricing, Sort by for the PSP page of Mother of the bride as per opsTC-13
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Weddings" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Mother of the bride" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "All mother of the bride" on "commonPage"
  And I wait for "3000" milliseconds
  # When I click on "searchIcon" on "commonPage"
  # Then I enter "Mother of bride" in "searchField" on "commonPage"
  # And I click on "searchApply" on "commonPage"
  Then I should see "contentPageShopMoreLink" exist on "commonPage"
  Then I should see "url" contains "content/weddings/mother-of-bride-female-guests"
  When I am in view of "contentPageShopMoreLink" on "commonPage"
  Then I click on "contentPageShopMoreLink" on "commonPage"
  And I wait for "5000" milliseconds
  # Then I should see "headerText" as "Dresses" on "pspPage"
  # Then I should see "pspHeader" as "Mother of the bride" on "pspPage"
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  When I click on "sortOptionPriceHighLowAus" on "pspPage"
  # And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-min_price"


@automated @ops-INT @Sno.-15  @IssueDEBD-1831
Scenario:Verify add and remove filter functionality on the PSP page for  Weddings > Wedding guest > Mother of the bride as per opsTC-13
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Debut" on "pspPage"
  # And I wait for "3000" milliseconds
  # And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  # And I wait for "3000" milliseconds
  # And I click on "closeButton" on "pspPage"
  And I wait for "3000" milliseconds
  And I click on "closeIcon" on "pspPage"
  And I wait for "3000" milliseconds
  # Then I should see "pspHeader" as "Debut, Mother of the bride" on "pspPage"
  When I click on "filterButton" on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Debut" on "pspPage"
  And I wait for "5000" milliseconds
  And I click on "closeIcon" on "pspPage"
  # And I wait for "3000" milliseconds
  # Then I should see "pspHeader" as "Mother of the bride" on "pspPage"


@automated @ops-INT @Sno.-15
Scenario:Verify Price, Size Selector, SFL, Quantity on the PDP page of a product for  Weddings > Wedding guest > Mother of the bride as per opsTC-14
  Then I should validate the name of product no. "1" on "pspPage"
  And I should validate final price of product no. "1" on "pspPage"
  And I click on the image of product no. "1" on pspPage
  Then I should validate the name of product no. "1" on "pdpPage"
  And I should validate final price of product no. "1" on "pdpPage"
  Then I should see "stepperIncrement" "enabled" on "pdpPage"
  And I store name of product and select save item on pdpPage
  And I wait for "2000" milliseconds
  When I click on "menuIcon" on "commonPage"
  And I should see value of position "12" as "Saved Items"
  When I click on "Saved Items" position "12"
  And I wait for "5000" milliseconds
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I validate products are saved on mySavedItemPage


@automated @ops-INT @Sno.-17
Scenario: Search a women dress product and verify the correct products are displayed in the search result
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "1510104205" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "1510104205"
  #Then I should see "url" contains "search/The+collection+v+neck+cardigan+women"

@automated @ops-INT @Sno.-17
Scenario: Select a product and verify zoom functionality of image, Short description and price
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I click on "pdpImageToZoom" using jquery on "pdpPage"
  Then I should see "pdpCloseZoom" exist on "pdpPage"
  And I click on "zoomNextButton" on "pdpPage"
  #Then I should see "zoomImageTitle" as "Show slide 3 of 4" on "pdpPage"
  When I click on "pdpCloseZoom" on "pdpPage"
  Then I should not see "pdpCloseZoom" on "pdpPage"

@automated @ops-INT @Sno.-17
Scenario: Verify the swatches, size selector, size guide, add to bag, reviews
  And I am in view of "sizeGuideLink" on "pdpPage"
  When I should see "sizeGuideLink" exist on "pdpPage"
  Then I verify "href" of "sizeGuideHref" as "womensizeGuideLink" on "pdpPage"
  Then I should see "prodDescSection" exist on "pdpPage"
  When I am in view of "sizeDropDown" on "pdpPage"
  Then I select available size from "dropdown"
  And I click on "stepperIncrement" on "pdpPage"
  Then I click on "addToBagButton" on "pdpPage"
  And I should see "viewBasketCheckoutButton" exist on "pdpPage"

@automated @ops-INT @Sno.-17
Scenario: Verify the add to bag and baynote
  And I should see "roundRobinSection" exist on "pdpPage"
  Then I should see "roundRobinHeaderText" as "Also in the range" on "pdpPage"
  And I click on "roundRobinImageTablet" on "pdpPage"
  Then I should see "url" contains "prod_55555_10001_151010421282_-1002"

@automated @ops-INT @Sno.-17
Scenario: Verify the add to bag and round robin
  And I should see "roundRobinSection" exist on "pdpPage"
  Then I should see "roundRobinHeaderText" as "Also in the range" on "pdpPage"
  And I click on "roundRobinImageTablet" on "pdpPage"
  Then I should see "url" contains "prod_55555_10001_151010421282_-1002"


@automated @ops-INT @Sno.-17
Scenario: Validate the size guide link  exist and delivery/returs accodion exits
  Then I should see "sizeGuideLink" exist on "pdpPage"
  And I should see "deliveryReturnText" as "Delivery options" on "pdpPage"
  Then I should see "deliveryReturnDetails" exist on "pdpPage"

@automated @ops-INT @Sno.-17 @IssueDEBD-1831
Scenario Outline: Validate the shop more tags
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  #And I wait for "5000" milliseconds
  When I click on "shopMoreTag3Text" on "pdpPage"
  # Then I should see "pspHeader" as "LOUNGE & SLEEP" on "pspPage"
  And I should see "url" contains "lounge-sleep"

  Examples:
    | tag_name_1 | tag_name_2 | tag_name_3     |
    | Women      | Pyjamas    | Lounge & Sleep |

@automated @ops-INT @Sno.-18
Scenario: Search a Women dress product and verify the correct products are displayed in the search result
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "2370209103" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "2370209103"
  #Then I should see "url" contains "search/The+collection+v+neck+cardigan+women"

@automated @ops-INT @Sno.-18
Scenario: Select a product and verify zoom functionality of image, Short description and price
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I click on "pdpImageToZoom" using jquery on "pdpPage"
  Then I should see "pdpCloseZoom" exist on "pdpPage"
  And I click on "zoomNextButton" on "pdpPage"
  #Then I should see "zoomImageTitle" as "Show slide 3 of 4" on "pdpPage"
  When I click on "pdpCloseZoom" on "pdpPage"
  Then I should not see "pdpCloseZoom" on "pdpPage"

@automated @ops-INT @Sno.-18
Scenario: Verify the swatches, size selector, size guide, add to bag, reviews
  And I am in view of "sizeGuideLink" on "pdpPage"
  When I should see "sizeGuideLink" exist on "pdpPage"
  Then I verify "href" of "sizeGuideHref" as "kidsizeGuideLink" on "pdpPage"
  And I click on "prodDescSection" on "pdpPage"
  Then I should see "prodDescSection" exist on "pdpPage"
  When I am in view of "sizeDropDown" on "pdpPage"
  And I select available size from "dropdown"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "viewBasketCheckoutButton" exist on "pdpPage"

@automated @ops-INT @Sno.-18
Scenario: Verify the  add to bag, round robin
  And I should see "roundRobinSection" exist on "pdpPage"
  Then I should see "roundRobinHeaderText" as "Also in the range" on "pdpPage"
  And I click on "roundRobinImageTablet" on "pdpPage"
  Then I should see "url" contains "prod_55555_10001_237020910363_-1002"

@automated @ops-INT @Sno.-18
Scenario: Validate the size guide link  exist and delivery/returs accodion exits
  Then I should see "sizeGuideLink" exist on "pdpPage"
  And I should see "deliveryReturnText" as "Delivery options" on "pdpPage"
  # When I "open" "deliveryReturnAccordion" accordion on "pdpPage"
  Then I should see "deliveryReturnDetails" exist on "pdpPage"

@automated @ops-INT @Sno.-18 @IssueDEBD-1831
Scenario Outline: Validate the shop more tags
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  #And I wait for "5000" milliseconds
  When I click on "shopMoreTag3Text" on "pdpPage"
  # Then I should see "pspHeader" as "Debenhams" on "pspPage"
  And I should see "url" contains "debenhams"

  Examples:
    | tag_name_1 | tag_name_2        | tag_name_3 |
    | Kids       | Trousers & shorts | Debenhams  |

@automated @ops-INT @Sno.-19
Scenario: Search a Single SKU product and verify the correct products are displayed in the search result
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "0890102046" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "0890102046"
  #Then I should see "url" contains "search/The+collection+v+neck+cardigan+women"

@automated @ops-INT @Sno.-19
Scenario: Select a product and verify zoom functionality of image, Short description and price
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I click on "pdpImageToZoom" using jquery on "pdpPage"
  Then I should see "pdpCloseZoom" exist on "pdpPage"
  And I click on "zoomNextButton" on "pdpPage"
  #Then I should see "zoomImageTitle" as "Show slide 3 of 4" on "pdpPage"
  When I click on "pdpCloseZoom" on "pdpPage"
  Then I should not see "pdpCloseZoom" on "pdpPage"

@automated @ops-INT @Sno.-19
Scenario: Verify the  Description, add to bag, reviews
  Then I should see "prodDescSection" exist on "pdpPage"
  # When I am in view of "sizeDropDown" on "pdpPage"
  # And I select available size from "dropdown"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should see "viewBasketCheckoutButton" exist on "pdpPage"
  Then I click on "saveForLaterButton" on "pdpPage"

@automated @ops-INT @Sno.-19
Scenario: Verify the  add to bag, round robin
  And I should see "roundRobinSection" exist on "pdpPage"
  Then I should see "roundRobinHeaderText" as "Also in the range" on "pdpPage"
  And I click on "roundRobinImageTablet" on "pdpPage"
  Then I should see "url" contains "prod_55555_10001_089010204643_-1002"

@automated @ops-INT @Sno.-19
Scenario: Verify the  add to bag, round robin
  And I should see "roundRobinSection" exist on "pdpPage"
  Then I should see "roundRobinHeaderText" as "Also in the range" on "pdpPage"
  And I click on "roundRobinImageMobile" on "pdpPage"
  Then I should see "url" contains "prod_55555_10001_089010204660_-1002"

@automated @ops-INT @Sno.-19
Scenario: Validate the size guide link  exist and delivery/returs accodion exits
  And I should see "deliveryReturnText" as "Delivery options" on "pdpPage"
  # When I "open" "deliveryReturnAccordion" accordion on "pdpPage"
  Then I should see "deliveryReturnDetails" exist on "pdpPage"

@automated @ops-INT @Sno.-19 @IssueDEBD-1831
Scenario Outline: Validate the shop more tags
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  #And I wait for "5000" milliseconds
  When I click on "shopMoreTag3Text" on "pdpPage"
  # Then I should see "pspHeader" as "J by Jasper Conran" on "pspPage"
  And I should see "url" contains "j-by-jasper-conran"

  Examples:
    | tag_name_1 | tag_name_2   | tag_name_3         |
    | Women      | Accessories  | J by Jasper Conran |

@automated @ops-INT @Sno.-20
Scenario: Search a Lingerie product with ore colour option badging and verify the correct products are displayed in the search result along with 'more colour options' badging,images, short descriptions & prices as per opsTC-5
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Lingerie" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Bras" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "All bras" on "commonPage"
  And I wait for "2000" milliseconds
  When I am in view of "moreColourOptionBadging" on "pspPage"
  And I should see "moreColourOptionBadging" exist on "pspPage"

@automated @ops-INT @Sno.-20
Scenario: Verify that the page reloads when user changes the colour
  And I click on "moreColourOptionBadging" on "pspPage"
  When I should see "colourSwatches" exist on "pdpPage"
  Then I verify page reload on selecting a different colour swatch

@automated @ops-INT @Sno.-20
Scenario: Verify that user is able to see urgent delivery details, size guide link, stepper and add to cart and also in range
  When I am in view of "sizeGuideLink" on "pdpPage"
  And I should see "sizeGuideLink" exist on "pdpPage"
  Then I verify "href" of "sizeGuideHref" as "sizeGuideLink" on "pdpPage"
  Then I select available size from "dropdown"
  And I click on "stepperIncrement" on "pdpPage"
  #Then I should see "stepperCount" as "2" on "pdpPage"
  And I enter "1" in "stepperCount" on "pdpPage"
  When I am in view of "sizeDropDown" on "pdpPage"
  Then I click on "addToBagButton" on "pdpPage"
  And I should see "viewBasketCheckoutButton" exist on "pdpPage"
  Then I click on "saveForLaterButton" on "pdpPage"



@automated @ops-INT @Sno.-39
Scenario: Checkout Journey - Concession Product -Guest User Journey  -Add product to Bag
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I navigate to "concessionProduct"
  Then I select available size from "dropdown"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds

@automated @ops-INT @Sno.-39
Scenario: Navigate to delivery page with delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to international delivery options as guest user
  # And I should see "headerText" as "WHERE ARE WE DELIVERING TO?" on "deliveryOptionPage"
  When I provide Australia address details and navigate to delivery options under it
  And I wait for "3000" milliseconds
  Then I should see "internationalOption" exist on "deliveryOptionPage"
  When I click on "internationalOption" on "deliveryOptionPage"
  And I wait for "20000" milliseconds
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

@automated @ops-INT @Sno.-39
Scenario: Validate the payment page for all accordion and place order button
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  Then I should scroll to "promoCodeAccordion" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  Then I should see "creditCardAccordion" containing "Pay with a Credit or Debit card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"


@automated @ops-INT @Sno.-39
Scenario: Validate the payment page delivery selected, credit card points as selected by user
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I am in view of "orderSummaryAccordion" on "paymentPage"
  And I wait for "3000" milliseconds
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "International Delivery" on "paymentPage"

