Feature: Test Debenhams Regression scenarios 8 to 13 covering Search PSP Page, Standard PSP Page(small images), Standard PSP Page(Lage images), Simple pick list, Brand Room, Chanel Content Page and the checkout journey-Guest user for OB Product

@automated @ops-INT @Sno.-8
Scenario: Validate that the auto suggestion options are appearing and are relevant
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I should see "searchIcon" exist on "commonPage"
  And I click on "searchIcon" on "commonPage"
  And I enter "Mens jeans" in "searchField" on "commonPage"
  Then I should not see "autoSuggestions" on "commonPage"

@automated @ops-INT @Sno.-8
Scenario: Validate that the search result is relevant
  When I click on "searchApply" on "commonPage"
  Then I should see "url" contains "search/Mens+jeans"
  Then I should see "searchText" as "Search results for..." on "pspPage"
  And I should see "headerText" containing "jeans" on "pspPage"

@automated @ops-INT @Sno.-8
Scenario: Verify that the images, short descriptions, prices & save for later button are displayed and functional for the products
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And I am in view of "saveForLaterButton" on "pspPage"
  When I click on "saveForLaterButton" on "pspPage"
  Then I should see "saveForLaterPopUpCloseButton" exist on "pspPage"
  Then I click on "saveItemContinueShoppingButton" on "pspPage"
  #And I should scroll to "nextButton" on "pspPage"
  And I wait for "3000" milliseconds
  Then I click on "backtoTopButton" on "pspPage"
  And I wait for "3000" milliseconds

@automated @ops-INT @Sno.-8
Scenario: Navigate to the next page of jeans search psp page and validate the pagination and badging 
  When I am in view of "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  # And I should see "pspBadging" exist on "pspPage"

@automated @ops-INT @Sno.-9
Scenario: Verify the Standard PSP Page(small images) for Mens > Clothing > Tops 
  Given I logout
  And I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  #Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Men" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Clothing" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Tops" on "commonPage"
  And I wait for "2000" milliseconds
  And I should see "headerText" containing "Men's t-shirts & vests" on "pspPage"
  Then I should scroll to "nextButton" on "pspPage"
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "normal" images
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And I wait for "3000" milliseconds
  And I am in view of "socialMediaSection" on "commonPage"
  Then I click on "backtoTopButton" on "pspPage"
  And I wait for "3000" milliseconds

@automated @ops-INT @Sno.-9
Scenario: Navigate to the next page of men's top psp page and validate the pagination and badging 
  When I am in view of "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  And I wait for "3000" milliseconds
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@automated @ops-INT @Sno.-9
Scenario: Validate sort by price (high-low) on above psp page with filter applied
  When I click on "sortOptionPriceHighLowAus" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-min_price"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"    

@automated @ops-INT @Sno.-9
Scenario: Open the filter and apply Brand -> Racing Green filter and validate the psp page 
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Men's t-shirts & vests" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Racing Green" on "pspPage"
  And I should see "url" contains "racing-green"

@automated @ops-INT @Sno.-10
Scenario: Verify the Standard PSP Page(large iamges) for Womens > Dresses > All Dresses 
  Given I logout
  And I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "All dresses" on "commonPage"
  And I wait for "2000" milliseconds
  #And I should see "headerText" containing "Men's Tops" on "pspPage"
  Then I should scroll to "nextButton" on "pspPage"
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "normal" images
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And I wait for "3000" milliseconds
  And I am in view of "socialMediaSection" on "commonPage"
  Then I click on "backtoTopButton" on "pspPage"
  And I wait for "3000" milliseconds

@automated @ops-INT @Sno.-10
Scenario: Navigate to the next page of Women dresses psp page and validate the pagination and badging 
  When I am in view of "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  And I wait for "3000" milliseconds
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"
  And I should see "headerText" containing "Dresses" on "pspPage"
    
@automated @ops-INT @Sno.-10
Scenario: Open the filter and apply Brand -> Phase Eight filter and validate the psp page 
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Debut" on "pspPage"
  # Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I click on "closeButton" on "pspPage"
  And I should see "url" contains "debut"

@automated @ops-INT @Sno.-10
Scenario: Validate sort by best dicount on above psp page with filter applied
  When I click on "sortOptionPriceDiscount" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-discount"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should validate "products" exist on "pspPage"  
 
@automated @ops-INT @Sno.-10
Scenario: Verify that the user is able to see more colour options' badging for the products on the PSP page and swatches, size selectors, shop more links on the PDP page for the product having more colour option badging as per opsTC-010 and 10
  Given I logout
  And I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Lingerie" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Bras" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "All bras" on "commonPage"
  And I wait for "2000" milliseconds
  When I am in view of "moreColourOptionBadging" on "pspPage"
  And I should see "moreColourOptionBadging" exist on "pspPage"

@automated @ops-INT @Sno.-10
Scenario: Navigate to the next page of jeans search psp page and validate the pagination and badging 
  When I am in view of "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  And I wait for "2000" milliseconds
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@automated @ops-INT @Sno.-10
Scenario: Open the filter and apply Brand -> Gorgeous DD+ filter and validate the psp page  
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Bras" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Gorgeous DD+" on "pspPage"
  # Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I click on "closeButton" on "pspPage"
  And I should see "url" contains "gorgeous-dd"

@automated @ops-INT @Sno.-10
Scenario: Verify that the page reloads when user changes the colour
  Given I navigate to "braPsp"
  And I click on "moreColourOptionBadging" on "pspPage"
  When I should see "colourSwatches" exist on "pdpPage"
  Then I verify page reload on selecting a different colour swatch

@automated @ops-INT @Sno.-10
Scenario: Verify that user is able to see urgent delivery details, size guide link, stepper and add to cart and also in range  
  Then I should see "sizeGuideLink" exist on "pdpPage"
  Then I verify "href" of "sizeGuideHref" as "sizeGuideLink" on "pdpPage"
  And I select available size from "dropdown"
  And I should see "addToCartButtonDisplayInitially" as "No items in the cart." on "mySavedItemPage"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCloseButton" on "pdpPage"
  When I am in view of "roundRobinSection" on "pdpPage"
  And I should select available size for first product in alsoInRange column
  And I wait for "2000" milliseconds
  When I click on "addToBagFromRoundRobinContainer" on "pdpPage"

@automated @ops-INT @Sno.-10
Scenario: Validate the prodduct description, delivery and return and review accordion
  And I am in view of "prodDescSection" on "pdpPage"
  And I click on "prodDescSection" on "pdpPage"
  Then I should see "prodDescItemNumber" exist on "pdpPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  And I click on "reviewsAccordion" on "pdpPage"

@automated @ops-INT @Sno.-11
Scenario: Verify the Simple pick list for Women > Inspirations > Dress for Less  
  Given I logout
  And I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Men" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Bags & accessories" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Bags" on "commonPage"
  And I wait for "2000" milliseconds
  And I should see "headerText" containing "Men's bags" on "pspPage"
  Then I should scroll to "socialMediaSection" on "commonPage"
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "normal" images
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And I am in view of "saveForLaterButton" on "pspPage"
  When I click on "saveForLaterButton" on "pspPage"
  And I wait for "3000" milliseconds
  And I am in view of "socialMediaSection" on "commonPage"
  Then I click on "backtoTopButton" on "pspPage"
  And I wait for "3000" milliseconds

@notautomated @ops-INT @Sno.-11
Scenario: Navigate to the next page of Women inspiration psp page and validate the pagination and badging 
  When I am in view of "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  And I wait for "3000" milliseconds
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"
    
@automated @ops-INT @Sno.-11
Scenario: Open the filter and apply Style -> All casual dresses filter and validate the psp page 
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Men's bags" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Red Herring" on "pspPage"
  # And I click on "closeButton" on "pspPage"
  And I should see "url" contains "men/bags/red-herring#filter"

@automated @ops-INT @Sno.-11
Scenario: Validate sort by best dicount on above psp page with filter applied
  When I click on "sortOptionName" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*name"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I wait for "3000" milliseconds
  And I should validate "products" exist on "pspPage"

@automated @ops-INT @Sno.-38
Scenario: Checkout Journey OB product Guest User -Add product to Bag
  Given I logout
  Then I navigate to "mantarayProduct"
  Then I select available size from "dropdown"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds

@automated @ops-INT @Sno.-38
Scenario: Navigate to delivery page with delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to international delivery options as guest user
  When I provide Australia address details and navigate to delivery options under it
  Then I should see "internationalOption" exist on "deliveryOptionPage"
  When I click on "internationalOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"

@automated @ops-INT @Sno.-38
Scenario: Navigate to payments page with delivery option as next/nominated day 
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  Then I click on "promoCodeAccordion" on "paymentPage"
  And I enter "PS01" in "promoCodeInputField" on "paymentPage"
  Then I click on "promoCodeApply" on "paymentPage"
  And I should see "promoCodeSuccessMsg" containing "PS01: Applied" on "paymentPage"
  When I am in view of "orderSummaryAccordionInt" on "paymentPage"
  When I "open" "orderSummaryAccordionInt" accordion on "paymentPage"
  When I am in view of "editShoppingBagLink" on "paymentPage"
  Then I click on "editShoppingBagLink" on "paymentPage"
  And I should see "headerText" as "My Bag" on "myBagPage"
  Then I click on "incrementStepper" on "myBagPage"
  Then I should see value of "countInputField" as "2" on "myBagPage"

