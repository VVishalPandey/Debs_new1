Feature: Test Debenhams Regression scenarios 8 to 13

@automated @ops-UK @PSP @Sno.-8
Scenario: Validate that the auto suggestion options are appearing and are relevant
  Given I logout
  And I empty mini bag
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  Then I should see "searchIcon" exist on "commonPage"
  And I click on "searchIcon" on "commonPage"
  And I enter "jeans" in "searchField" on "commonPage"
  Then I should see "autoSuggestions" exist on "commonPage"
  Then I should see "autoSuggestions" containing "jeans" on "commonPage"

@automated @ops-UK @PSP @Sno.-8
Scenario: Validate that the search result is relevant
  When I click on "searchApply" on "commonPage"
  Then I should see "url" contains "search/jeans"
  Then I should see "searchText" as "Search results for..." on "pspPage"
  And I should see "headerText" containing "jeans" on "pspPage"

@automated @ops-UK @PSP @Sno.-8
Scenario: Verify that the images, short descriptions, prices & save for later button are displayed and functional for the products
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And I am in view of "saveForLaterButton" on "pspPage"
  When I store value of first "1" products and select save item on pspPage
  # Then I should see "saveForLaterPopUpCloseButton" exist on "pspPage"
  # Then I click on "saveItemContinueShoppingButton" on "pspPage"
  # And I should scroll to "nextButton" on "pspPage"
  Then I click on "backtoTopButton" on "pspPage"
  And I wait for "3000" milliseconds

@automated @ops-UK @PSP @Sno.-8
Scenario: Navigate to the next page of jeans search psp page and validate the pagination and badging 
  When I am in view of "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  #Then I click on "nextButton" on "pspPage"
  #And I should see "pspBadging" exist on "pspPage"

@automated @ops-UK @PSP @Sno.-9
Scenario: Verify the Standard PSP Page(small images) for Mens > Clothing > Tops 
  Given I logout
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Men" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Clothing" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Tops" on "commonPage"
  And I wait for "2000" milliseconds
  And I should see "headerText" containing "Men's Tops" on "pspPage"
  Then I should scroll to "nextButton" on "pspPage"
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "normal" images
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And I am in view of "saveForLaterButton" on "pspPage"
  When I store value of first "1" products and select save item on pspPage
  Then I should not see "saveForLaterPopUpCloseButton" on "pspPage"
  And I am in view of "socialMediaSection" on "commonPage"
  Then I click on "backtoTopButton" on "pspPage"
  And I wait for "3000" milliseconds

@automated @ops-UK @PSP @Sno.-9
Scenario: Navigate to the next page of men's top psp page and validate the pagination and badging 
  When I am in view of "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@automated @ops-UK @PSP @Sno.-9
Scenario: Validate sort by price (high-low) on above psp page with filter applied
  When I click on "sortOptionPriceHighLow" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-price"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"    

@automated @ops-UK @PSP @Sno.-9
Scenario: Open the filter and apply Brand -> Racing Green filter and validate the psp page 
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Men's Tops" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Racing Green" on "pspPage"
  # Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I click on "closeButton" on "pspPage"
  And I should see "url" contains "racing-green"

@automated @ops-UK @PSP @Sno.-9
Scenario: Validate the colomn grid view with products on first page of All bras  
  When I am in view of "filterButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  And I should validate width size of "firstProductImage" in "gridView" on "pspPage"

@automated @ops-UK @PSP @Sno.-10
Scenario: Verify the Standard PSP Page(large iamges) for Womens > Dresses > All Dresses 
  Given I logout
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "All dresses" on "commonPage"
  And I wait for "2000" milliseconds
  #And I should see "headerText" containing "Men's Tops" on "pspPage"
  Then I should scroll to "nextButton" on "pspPage"
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "large" images
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And I am in view of "saveForLaterButton" on "pspPage"
  When I store value of first "1" products and select save item on pspPage
  Then I should not see "saveForLaterPopUpCloseButton" on "pspPage"
  And I wait for "3000" milliseconds
  And I am in view of "socialMediaSection" on "commonPage"
  Then I click on "backtoTopButton" on "pspPage"
  And I wait for "3000" milliseconds

@automated @ops-UK @PSP @Sno.-10
Scenario: Navigate to the next page of Women dresses psp page and validate the pagination and badging 
  When I am in view of "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"
  And I should see "headerText" containing "Dresses" on "pspPage"
    
@automated @ops-UK @PSP @Sno.-10
Scenario: Open the filter and apply Brand -> Phase Eight filter and validate the psp page 
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Phase Eight" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I click on "closeButton" on "pspPage"
  And I should see "url" contains "phase-eight#filter"

@automated @ops-UK @PSP @Sno.-10
Scenario: Validate sort by best dicount on above psp page with filter applied
  When I click on "sortOptionPriceDiscount" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-discount"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"  

@automated @ops-UK @PSP @Sno.-10
Scenario: Validate the colomn grid view with products on first page  
  When I am in view of "filterButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  And I should validate width size of "firstProductImage" in "gridView" on "pspPage"  
 
@automated @ops-UK @PSP @Sno.-10
Scenario: Verify that the user is able to see more colour options' badging for the products on the PSP page and swatches, size selectors, shop more links on the PDP page for the product having more colour option badging as per opsTC-010 and 10
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Lingerie" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Bras" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "All bras" on "commonPage"
  And I wait for "2000" milliseconds
  When I am in view of "moreColourOptionBadging" on "pspPage"
  And I should see "moreColourOptionBadging" exist on "pspPage"

@automated @ops-UK @PSP @Sno.-10
Scenario: Validate the colomn grid view with products on first page of All bras  
  When I am in view of "filterButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  And I should validate width size of "firstProductImage" in "gridView" on "pspPage"

@automated @ops-UK @PSP @Sno.-10
Scenario: Navigate to the next page of jeans search psp page and validate the pagination and badging 
  When I am in view of "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@automated @ops-UK @PSP @Sno.-10
Scenario: Open the filter and apply Brand -> Gorgeous DD+ filter and validate the psp page  
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Bras" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Gorgeous DD+" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I click on "closeButton" on "pspPage"
  And I should see "url" contains "gorgeous-dd"

@automated @ops-UK @PSP @Sno.-10
Scenario: Verify that the page reloads when user changes the colour
  And I click on "moreColourOptionBadging" on "pspPage"
  When I should see "colourSwatches" exist on "pdpPage"
  Then I verify page reload on selecting a different colour swatch

@automated @ops-UK @PSP @Sno.-10
Scenario: Verify that user is able to see urgent delivery details, size guide link, stepper and add to cart and also in range
  Then I should see "urgentDeliveryDay" containing "Want it by" on "pdpPage"
  And I should see "countDownTimer" containing "Order within" on "pdpPage"
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

@automated @ops-UK @PSP @Sno.-10
Scenario: Validate the prodduct description, delivery and return and review accordion
  And I am in view of "prodDescSection" on "pdpPage"
  And I click on "prodDescSection" on "pdpPage"
  Then I should see "prodDescItemNumber" exist on "pdpPage"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  Then I click on "deliveryAndReturnsOptions" on "pdpPage"
  And I click on "reviewsAccordion" on "pdpPage"
  Then I am in view of "financeBanner" on "pdpPage"
  And I verify "href" of "applyNowButton" as "applyNowLink" on "pdpPage"

@automated @ops-UK @PSP @Sno.-11
Scenario: Verify the Simple pick list for Women > Inspirations > Dress for Less  
  Given I logout
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Inspirations" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Animal print" on "commonPage"
  And I wait for "2000" milliseconds
  And I should see "headerText" containing "AW18 Trend: Animal Print" on "pspPage"

@automated @ops-UK @PSP @Sno.-11
Scenario: Verify the Simple pick list for Animal print
  Given I logout
  When I navigate to "plpPspPage"
  And I wait for "3000" milliseconds
  And I should see "headerText" containing "AW18 Trend: Animal Print" on "pspPage"
  Then I should scroll to "socialMediaSection" on "commonPage"
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "normal" images
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And I am in view of "saveForLaterButton" on "pspPage"
  When I store value of first "1" products and select save item on pspPage
  Then I should not see "saveForLaterPopUpCloseButton" on "pspPage"
  And I wait for "3000" milliseconds
  And I am in view of "socialMediaSection" on "commonPage"
  Then I click on "backtoTopButton" on "pspPage"
  And I wait for "3000" milliseconds

@notautomated @ops-not-UK @Sno.-11
Scenario: Navigate to the next page of Women inspiration psp page and validate the pagination and badging 
  When I am in view of "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"
    
@automated @ops-UK @PSP @Sno.-11
Scenario: Open the filter and apply Style -> All casual dresses filter and validate the psp page 
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "AW18 Trend: Animal Print" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Style"  as "filterSubMenuInputList" as "All casual dresses" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Style" on "pspPage"
  And I click on "closeButton" on "pspPage"
  And I should see "url" contains "all-casual-dresses#filter"

@automated @ops-UK @PSP @Sno.-11
Scenario: Validate sort by best dicount on above psp page with filter applied
  When I click on "sortOptionName" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*name"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"  

@automated @ops-UK @PSP @Sno.-11
Scenario: Validate the colomn grid view with products on first page  
  When I am in view of "filterButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  And I should validate width size of "firstProductImage" in "gridView" on "pspPage" 

@automated @ops-UK @PSP @Sno.-12
Scenario: Verify the Brand Room for Beauty > Shop by brand > Kat Von D  
  Given I logout
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  Then I click on "debenhamsLogo" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Beauty" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Shop by brand" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Kat Von D" on "commonPage"
  And I wait for "2000" milliseconds
  Then I should see "brandRoomHeroImage" exist on "pspPage"
  And I should see "brandRoomFilterConatiner" exist on "pspPage"
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I click on "categoryFilter" on "pspPage"
  And I wait for "3000" milliseconds
  And I click on "makeUpFilterOption" on "pspPage"
  And I click on "closeButton" on "pspPage"
  # And I click on "brandRoomCategoryFilter" on "pspPage"
  # Then I click on "brandRoomMakeUpSelection" on "pspPage"
  And I should see "headerText" containing "Makeup" on "pspPage"
  Then I should scroll to "socialMediaSection" on "commonPage"
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "normal" images
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPrice" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And I am in view of "saveForLaterButton" on "pspPage"
  When I store value of first "1" products and select save item on pspPage
  Then I should not see "saveForLaterPopUpCloseButton" on "pspPage"
  And I am in view of "socialMediaSection" on "commonPage"
  Then I click on "backtoTopButton" on "pspPage"
  And I wait for "3000" milliseconds

@notautomated @ops-UK @PSP @Sno.-12
Scenario: Navigate to the next page of Women inspiration psp page and validate the pagination and badging 
  When I am in view of "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"
    
@automated @ops-UK @PSP @Sno.-12
Scenario: Open the filter and apply Price -> Under £10 filter and validate the psp page 
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Makeup" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Price"  as "filterSubMenuLinkList" as "Under £10" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Price" on "pspPage"
  And I click on "closeButton" on "pspPage"
  And I should see "url" contains "10.0#filter"

@automated @ops-UK @PSP @Sno.-12
Scenario: Validate sort by price (high-low) on above psp page with filter applied
  When I click on "sortOptionPriceHighLow" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-price"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage" 

@automated @ops-UK @PSP @Sno.-12
Scenario: Validate the colomn grid view with products on first page  
  When I am in view of "filterButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  And I should validate width size of "firstProductImage" in "gridView" on "pspPage" 

@automated @ops-UK @PSP @Sno.-13
Scenario: Validate that the auto suggestion options are not appearing for Chanel
  Given I logout
  And I click on "saveForLaterHeader" on "commonPage"
  Then I empty mySavedItemPage
  Then I click on "debenhamsLogo" on "commonPage"
  Then I should see "searchIcon" exist on "commonPage"
  And I click on "searchIcon" on "commonPage"
  And I enter "Chanel" in "searchField" on "commonPage"
  Then I should not see "autoSuggestions" on "commonPage"

@automated @ops-UK @PSP @Sno.-13
Scenario: Validate that the Chanel content page 
  When I click on "searchApply" on "commonPage"
  Then I should see "url" contains "/content/chanel"

@automated @ops-UK @PSP @Sno.-14
Scenario: Validate the Chanel PSP page
  When I should see "chanelMakeUpAdspot" exist on "commonPage"
  Then I click on "chanelMakeUpAdspot" on "commonPage"
  And I should see "chanelComplexionLink" exist on "commonPage"
  Then I click on "chanelComplexionLink" on "commonPage"
  And I should see "headerText" as "Beauty" on "pspPage"
  And I should see "chanelSeachText" as "CHANEL, MAKEUP, COMPLEXION" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should see "totalBrandCount" as "CHANEL" on "pspPage"
  And I should see "products" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And I am in view of "saveForLaterButton" on "pspPage"
  Then I store value of first "1" products and select save item on pspPage

@automated @ops-UK @PSP @Sno.-14
Scenario: Open the filter and apply Range -> Lips filter and validate the psp page 
  When I am in view of "filterButton" on "pspPage"
  Then I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Beauty" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Range" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Range"  as "filterSubMenuLinkList" as "LIPS" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Range" on "pspPage"
  And I click on "closeButton" on "pspPage"
  Then I should see "url" contains "/content/chanel"

@automated @ops-UK @PSP @Sno.-14
Scenario: Validate sort by price (high-low) on above psp page with filter applied
  When I click on "sortOptionPriceHighLow" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=-price"

@automated @ops-UK @PSP @Sno.-14
Scenario: Validate the colomn grid view with products on first page  
  When I am in view of "filterButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "gridView" on "pspPage"
  When I click on "columnGridViewButton" on "pspPage"
  Then I should validate width size of "firstProductImage" in "columnView" on "pspPage"
  And I click on "columnGridViewButton" on "pspPage"
  And I should validate width size of "firstProductImage" in "gridView" on "pspPage"





