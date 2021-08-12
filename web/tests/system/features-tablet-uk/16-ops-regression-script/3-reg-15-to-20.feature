Feature: Test Debenhams Regression scenarios 15 to 20

@automated @ops-TABLET @PSP @Sno.-15
Scenario: Verify that the TCAT page template works
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  And I empty mini bag
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Men" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Clothing" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "All mens clothing" on "commonPage"
  Then I should see "url" contains "/men"
  Then I should see "tcatHeaderText" as "Men's clothing & accessories" on "pspPage"
  # And I should see "tcatHeroImage" exist on "pspPage"
  # And I should see "tcatShopMoreLink" exist on "pspPage"
  # And I should see "tcatImages" exist on "pspPage"
  # And I should see "tcatfilterMenuList" exist on "pspPage"

@notautomated @ops-not-UK @Sno.-15
Scenario: Verify that the TCAT adspot is clickable and user land so n correct page
  When I click on "tcatHeroImage" on "pspPage"
  # Then I should see "url" contains "/men/jumpers-cardigans"
  And I should see "headerText" as "Hello NEW SEASON: NEW ARRIVALS" on "pspPage"
  Then I go back to previous page
  And I should see "tcatHeaderText" as "Men's clothing & accessories" on "pspPage"
  Then I should see "url" contains "/men"

@automated @ops-TABLET @PSP @Sno.-15
Scenario: Verify that the TCAT filter is clickable and user land on correct page and is able to SFL products
  # Then I "validate & click" option is available in "tcatfilterMenuList" as "Price" on "pspPage"
  And I am in view of "priceFilter" on "pspPage"
  And I click on "priceFilter" on "pspPage"
  And I click on "filterSubMenuPrice2030Option" on "pspPage"
  Then I should see "url" contains "30.0#filter"
  When I store value of first "2" products and select save item on pspPage

@automated @ops-TABLET @PSP @Sno.-16
Scenario:Verify PSP, PSP Pricing, Sort by for the PSP page of Mother of the bride as per opsTC-13
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  And I empty mini bag
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  # Given I "Remove" "all" products from "myBagPage"
  #When I click on "menuIcon" on "commonPage"
  #Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  #Then I "validate & click" option is available in "mainMenuList" as "Weddings" on "commonPage"
  #Then I "validate & click" option is available in "mainMenuList" as "Wedding guest" on "commonPage"
  #Then I "validate & click" option is available in "mainMenuList" as "Mother of the bride" on "commonPage"
  #And I wait for "2000" milliseconds
  When I click on "searchIcon" on "commonPage"
  Then I enter "Mother of bride" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  # Then I should see "contentPageShopMoreLink" exist on "commonPage"
  # Then I should see "url" contains "content/weddings/mother-of-bride-female-guests"
  # When I am in view of "theEdit" on "commonPage"
  # Then I click on "theEdit" on "commonPage"
  # Then I should see "headerText" as "Mother of the bride" on "pspPage"
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  # And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*price"

@automated @ops-TABLET @PSP @Sno.-16
Scenario:Verify add and remove filter functionality on the PSP page for  Weddings > Wedding guest > Mother of the bride as per opsTC-13
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Mother of the bride" on "pspPage"
  And I "validate & click" option is available in "scatfilterMenuList" as "Brand" on "pspPage"
  # And I click on "brandFilter" on "pspPage"
  And I click on "debutFilterOption" on "pspPage"
  # And I "validate & click" option from "scatfilterMenuList" of "Brand"  as "filterSubMenuInputList" as "Debut" on "pspPage"
  # And I "validate & click" option is available in "scatfilterMenuList" as "Brand" on "pspPage"
  And I click on "closeButton" on "pspPage"
  Then I should see "chanelSeachText" as "Debut, Mother of the bride" on "pspPage"
  When I click on "filterButton" on "pspPage"
  # And I should see "filterTitle" as "Mother of the bride" on "pspPage"
  And I "validate & click" option is available in "scatfilterMenuList" as "Brand" on "pspPage"
  # And I click on "brandFilter" on "pspPage"
  And I click on "debutFilterOption" on "pspPage"
  # And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Debut" on "pspPage"
  And I click on "closeButton" on "pspPage"
  # Then I should not see "chanelSeachText" on "pspPage"

@automated @ops-TABLET @PSP @Sno.-16
Scenario:Verify Price, Size Selector, SFL, Quantity on the PDP page of a product for  Weddings > Wedding guest > Mother of the bride as per opsTC-14
  And I wait for "3000" milliseconds
  Then I should validate the name of product no. "1" on "pspPage"
  And I should validate final price of product no. "1" on "pspPage"
  And I click on the image of product no. "1" on pspPage
  Then I should validate the name of product no. "1" on "pdpPage"
  And I should validate final price of product no. "1" on "pdpPage"
  Then I should see "stepperIncrement" "enabled" on "pdpPage"
  And I store name of product and select save item on pdpPage
  And I wait for "2000" milliseconds
  And I am in view of "creditCardValuePoints" on "pdpPage"
  When I click on "menuIcon" on "commonPage"
  And I should see value of position "15" as "Saved Items"
  When I click on "Saved Items" position "15"
  And I wait for "3000" milliseconds
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I validate products are saved on mySavedItemPage

@automated @ops-TABLET @PDP @Sno.-17
Scenario: Search a Kids dress product and verify the correct products are displayed in the search result
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsKidsDressTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "OpsKidsDressTestText"
  #Then I should see "url" contains "search/The+collection+v+neck+cardigan+women"

@automated @ops-TABLET @PDP @Sno.-17
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

@automated @ops-TABLET @PDP @Sno.-17
Scenario: Verify the swatches, size selector, size guide, add to bag, reviews
  And I am in view of "sizeGuideLink" on "pdpPage"
  When I should see "sizeGuideLink" exist on "pdpPage"
  Then I verify "href" of "sizeGuideHref" as "kidsizeGuideLink" on "pdpPage"
  And I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescSection" exist on "pdpPage"
  # And I click on "reviewsAccordion" on "pdpPage"
  When I am in view of "sizeDropDown" on "pdpPage"
  And I click on "stepperIncrement" on "pdpPage"
  When I should see "addToBagButton" exist on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"
  Then I click on "saveForLaterButton" on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-17
Scenario: Verify the add to bag and baynote
  Then I select available size and add to bag on pdpPage
  And I should see "baynoteSection" exist on "pdpPage"
  Then I should see "baynoteHeaderText" as "You may also like" on "pdpPage"
  And I click on "baynoteImage" on "pdpPage"
  Then I should see "url" contains "prod_10701_10001_225020460728_-1"

@automated @ops-TABLET @PDP @Sno.-17
Scenario: Validate the size guide link  exist and delivery/returs accodion exits
  Then I should see "sizeGuideLink" exist on "pdpPage"
  And I should see "deliveryReturnText" exist on "pdpPage"
  And I should see "deliveryReturnText" as "Delivery / Returns" on "pdpPage"
  # When I "open" "deliveryReturnAccordion" accordion on "pdpPage"
  Then I should see "deliveryReturnHomeDelivery" exist on "pdpPage"
  And I should see "deliveryReturnClickCollect" exist on "pdpPage"
  #And I should see "deliveryReturnIntDelivery" exist on "pdpPage"
  And I should see "financeBannerContainer" exist on "pdpPage"
  Then I should see "applyNowLink" exist on "pdpPage"
  Then I verify "href" of "applyNowLink" as "financeBannerApplyNowLink" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-17
Scenario Outline: Validate the shop more tags
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  #And I wait for "5000" milliseconds
  When I click on "shopMoreTag3Text" on "pdpPage"
  Then I should see "pspHeader" as "Mantaray" on "pspPage"
  And I should see "url" contains "mantaray"

  Examples:
    | tag_name_1 | tag_name_2      | tag_name_3 |
    | Kids       | Girls dresses   | Mantaray   |

@automated @ops-TABLET @PDP @Sno.-18
Scenario: Search a Women dress product and verify the correct products are displayed in the search result
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsWomenDressTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "OpsWomenDressTestText"
  #Then I should see "url" contains "search/The+collection+v+neck+cardigan+women"

@automated @ops-TABLET @PDP @Sno.-18
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

@automated @ops-TABLET @PDP @Sno.-18
Scenario: Verify the swatches, size selector, size guide, add to bag, reviews
  And I am in view of "sizeGuideLink" on "pdpPage"
  When I should see "sizeGuideLink" exist on "pdpPage"
  Then I verify "href" of "sizeGuideHref" as "womensizeGuideLink" on "pdpPage"
  And I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescSection" exist on "pdpPage"
  When I am in view of "productPrice" on "pdpPage"
  Then I select available size from "swatch"
  And I click on "stepperIncrement" on "pdpPage"
  When I should see "addToBagButton" exist on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"
  Then I click on "saveForLaterButton" on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-18
Scenario: Verify the add to bag, baynote
  Then I select available size and add to bag on pdpPage
  And I should see "baynoteSection" exist on "pdpPage"
  Then I should see "baynoteHeaderText" as "You may also like" on "pdpPage"
  And I click on "baynoteImage" on "pdpPage"
  Then I should see "url" contains "prod_10701_10001_36194+158182024_-1"

@automated @ops-TABLET @PDP @Sno.-18
Scenario: Validate the size guide link  exist and delivery/returs accodion exits
  Then I should see "sizeGuideLink" exist on "pdpPage"
  And I should see "deliveryReturnAccordion" exist on "pdpPage"
  And I should see "deliveryReturnText" as "Delivery / Returns" on "pdpPage"
  # When I "open" "deliveryReturnAccordion" accordion on "pdpPage"
  Then I should see "deliveryReturnHomeDelivery" exist on "pdpPage"
  #And I should see "deliveryReturnClickCollect" exist on "pdpPage"
  #And I should see "deliveryReturnIntDelivery" exist on "pdpPage"
  And I should see "financeBannerContainer" exist on "pdpPage"
  Then I should see "applyNowLink" exist on "pdpPage"
  Then I verify "href" of "applyNowLink" as "financeBannerApplyNowLink" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-18
Scenario Outline: Validate the shop more tags
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  #And I wait for "5000" milliseconds
  When I click on "shopMoreTag3Text" on "pdpPage"
  Then I should see "pspHeader" as "Wallis" on "pspPage"
  And I should see "url" contains "wallis"

  Examples:
    | tag_name_1 | tag_name_2 | tag_name_3 |
    | Women      | Dresses    | Wallis     |

@automated @ops-TABLET @PDP @Sno.-19
Scenario: Search a Single SKU product and verify the correct products are displayed in the search result
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsHandbagsTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "OpsHandbagsTestText"
  #Then I should see "url" contains "search/The+collection+v+neck+cardigan+women"

@automated @ops-TABLET @PDP @Sno.-19
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

@automated @ops-TABLET @PDP @Sno.-19
Scenario: Verify the  Description, add to bag, reviews
  And I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescSection" exist on "pdpPage"
  When I am in view of "stepperIncrement" on "pdpPage"
  And I click on "stepperIncrement" on "pdpPage"
  When I should see "addToBagButton" exist on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"
  Then I click on "saveForLaterButton" on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-19
Scenario: Verify the  add to bag, baynote
  Then I click on "addToBagButton" on "pdpPage"
  And I should see "viewBasketCheckoutButton" exist on "pdpPage"
  Then I click on "viewBasketCloseButton" on "pdpPage"
  And I should see "baynoteSection" exist on "pdpPage"
  Then I should see "baynoteHeaderText" as "You may also like" on "pdpPage"
  And I click on "baynoteImage" on "pdpPage"
  Then I should see "url" contains "prod_10701_10001_093010800360_-1"

@automated @ops-TABLET @PDP @Sno.-19
Scenario: Validate the size guide link  exist and delivery/returs accodion exits
  And I should see "deliveryReturnText" exist on "pdpPage"
  And I should see "deliveryReturnText" as "Delivery / Returns" on "pdpPage"
  # When I "open" "deliveryReturnAccordion" accordion on "pdpPage"
  Then I should see "deliveryReturnHomeDelivery" exist on "pdpPage"
  And I should see "deliveryReturnClickCollect" exist on "pdpPage"
  And I should see "deliveryReturnIntDelivery" exist on "pdpPage"
  And I should see "financeBannerContainer" exist on "pdpPage"
  Then I should see "applyNowLink" exist on "pdpPage"
  Then I verify "href" of "applyNowLink" as "financeBannerApplyNowLink" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-19
Scenario Outline: Validate the shop more tags
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  #And I wait for "5000" milliseconds
  When I click on "shopMoreTag3Text" on "pdpPage"
  Then I should see "pspHeader" as "J by Jasper Conran" on "pspPage"
  And I should see "url" contains "j-by-jasper-conran"

  Examples:
    | tag_name_1 | tag_name_2   | tag_name_3         |
    | Women      | Accessories  | J by Jasper Conran |

@automated @ops-TABLET @PDP @Sno.-20
Scenario: Search a Lingerie product with ore colour option badging and verify the correct products are displayed in the search result along with 'more colour options' badging,images, short descriptions & prices as per opsTC-5
  Given I logout
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Lingerie" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Bras" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "All bras" on "commonPage"
  And I wait for "2000" milliseconds
  When I am in view of "moreColourOptionBadging" on "pspPage"
  And I should see "moreColourOptionBadging" exist on "pspPage"

@automated @ops-TABLET @PDP @Sno.-20
Scenario: Verify that the page reloads when user changes the colour
  And I click on "moreColourOptionBadging" on "pspPage"
  When I should see "colourSwatches" exist on "pdpPage"
  Then I verify page reload on selecting a different colour swatch

@automated @ops-TABLET @PDP @Sno.-20
Scenario: Verify that user is able to see urgent delivery details, size guide link, stepper and add to cart and also in range
  Then I should see "urgentDeliveryDay" containing "Want it by" on "pdpPage"
  And I should see "countDownTimer" containing "Order within" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-20
Scenario: Verify that user is able to see urgent delivery details, size guide link, stepper and add to cart and also in range
  And I should see "sizeGuideLink" exist on "pdpPage"
  Then I verify "href" of "sizeGuideHref" as "sizeGuideLink" on "pdpPage"
  And I click on "stepperIncrement" on "pdpPage"
  #Then I should see "stepperCount" as "2" on "pdpPage"
  And I enter "1" in "stepperCount" on "pdpPage"
  And I am in view of "addToBagButton" on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"
  Then I select available size and add to bag on pdpPage
  And I should see "alsoInRangeOption" exist on "pdpPage"
  # And I should select available size for first product in alsoInRange column
  # Then I click on "addToBagFromAlsoInRangeContainer" on "pdpPage"

@automated @ops-TABLET @PDP @Sno.-20
Scenario: Validate the prodduct description, delivery and return and review accordion
  And I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescSection" exist on "pdpPage"
  # Then I should see "prodDescItemNumber" exist on "pdpPage"
  And I should see "deliveryReturnText" as "Delivery options" on "pdpPage"
  Then I am in view of "financeBanner" on "pdpPage"
  And I verify "href" of "applyNowButton" as "applyNowLink" on "pdpPage"
