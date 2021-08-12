Feature: Test Debenhams pdp page validation

@manual @DEBD-121
Scenario Outline: Validate the delivery options on different pdp products
  Given I navigate to "testDress2PdpURL"
  When I am in view of "deliveryOptionHeader" on "pdpPage"
  Then I should see "deliveryOptionHeader" as "Delivery options" on "pdpPage"
  And I should see "homeDeliveryText" exist on "pdpPage"
  And I should see "freeReturnsText" exist on "pdpPage"
  And I should not see "clickCollectText" on "pdpPage"
  And I should not see "internationalDeliveryText" on "pdpPage"
  And I should see "homeDeliveryText" as "<Home_Delivery>" on "pdpPage"
  And I should see "freeReturnsText" as "<Free_returns>" on "pdpPage"
  And I should see "freeReturnsText" exist on "pdpPage"
  And I should not see "clickCollectText" as "<Click_Collect>" on "pdpPage"
  And I should not see "internationalDeliveryText" as "<International_Delivery>" on "pdpPage"
  And I should not see the countdown delivery urgency Espot

Examples:
    | Home_Delivery     | Click_Collect   | International_Delivery | Free_returns |
    | Standard Delivery | Click & Collect | International Delivery | Free returns |

@automated @PDP @Fixed @DEBD-111
Scenario Outline: Validate the breadcrumb section and validate navigation to psp page when selected last breadcrump
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I "validate & click" subMenu option "Dresses" under "Women" on commonPage bigscreen
  #Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should see "saveForLaterButton" exist on "pdpPage"
  And I should not see "creditCardValuePoints" on "pdpPage"
  And I should not see "beautyClubValuePoints" on "pdpPage"
  Then I should see "breadcrumbSection" exist on "pdpPage"
  And I should see "firstBreadcrumb" exist on "pdpPage"
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pdpPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pdpPage"
  And I should see "thirdBreadcrumb" as "<breadcrumb_3>" on "pdpPage"
  When I click on "thirdBreadcrumb" on "pdpPage"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "url" contains "/women/dresses"

  Examples:
    | breadcrumb_1 | breadcrumb_2 | breadcrumb_3 |
    | Home         | Women        | Dresses      |

@automated @PDP @Fixed @DEBD-111
Scenario Outline: Validate the breadcrumb section and validate navigation to TCAT/SCAT page when selected second breadcrump
  Given I navigate to "intHomeURL"
  And I "validate & click" subMenu option "Dresses" under "Women" on commonPage bigscreen
  #Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  Then I should validate product name on "pdpPage"
  And I should see "breadcrumbSection" exist on "pdpPage"
  And I should see "firstBreadcrumb" exist on "pdpPage"
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pdpPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pdpPage"
  And I should see "thirdBreadcrumb" as "<breadcrumb_3>" on "pdpPage"
  When I click on "secondBreadcrumb" on "pdpPage"
  Then I should see "pspHeaderText" as "Women’s Clothing" on "pspPage"
  And I should see "url" contains "/women"

  Examples:
    | breadcrumb_1 | breadcrumb_2 | breadcrumb_3 |
    | Home         | Women        | Dresses      |

@automated @PDP @Fixed @DEBD-111
Scenario Outline: Validate the breadcrumb section and validate navigation to homepage when selected home from breadcrump
  When I go back to previous page
  Then I should validate product name on "pdpPage"
  And I should see "breadcrumbSection" exist on "pdpPage"
  And I should see "firstBreadcrumb" exist on "pdpPage"
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pdpPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pdpPage"
  And I should see "thirdBreadcrumb" as "<breadcrumb_3>" on "pdpPage"
  When I click on "firstBreadcrumb" on "pdpPage"
  Then I should see "deliveryOptions" exist on "commonPage"
  And  I should see "termsConditionSection" exist on "commonPage"
  And I should not see "beautyClubValuePoints" on "pdpPage"
  And I should not see "creditCardValuePoints" on "pdpPage"
  And I should not see "financeBanner" on "pdpPage"

  Examples:
    | breadcrumb_1 | breadcrumb_2 | breadcrumb_3 |
    | Home         | Women        | Dresses      |

@automated @PDP @Fixed @DEBD-111
Scenario Outline: Validate the breadcrumb section having 4 breadcrumb options
  Given I navigate to "testShoePdpURL"
  Then I should see "saveForLaterButton" exist on "pdpPage"
  And I should not see "creditCardValuePoints" on "pdpPage"
  And I should not see "beautyClubValuePoints" on "pdpPage"
  And I should see "breadcrumbSection" exist on "pdpPage"
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pdpPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pdpPage"
  And I should see "thirdBreadcrumb" as "<breadcrumb_3>" on "pdpPage"
  And I should see "forthBreadcrumb" as "<breadcrumb_4>" on "pdpPage"
  When I click on "firstBreadcrumb" on "pdpPage"
  Then I should see "deliveryOptions" exist on "commonPage"
  When I go back to previous page
  And I click on "secondBreadcrumb" on "pdpPage"
  Then I should see "pspHeaderText" as "Women’s Clothing" on "pspPage"
  And I should see "url" contains "/women"
  When I go back to previous page
  And I click on "thirdBreadcrumb" on "pdpPage"
  Then I should see "headerText" as "Women's footwear" on "pspPage"
  And I should see "url" contains "/women/shoes-boots"
  When I go back to previous page
  And I click on "forthBreadcrumb" on "pdpPage"
  Then I should see "headerText" as "Women's shoes" on "pspPage"
  And I should see "url" contains "/women/shoes-boots/shoes"

  Examples:
    | breadcrumb_1 | breadcrumb_2 | breadcrumb_3  | breadcrumb_4 |
    | Home         | Women        | Shoes & boots | Shoes        |

@automated @PDP @Fixed @DEBD-111
Scenario Outline: Validate the breadcrumb section having 5 breadcrumb options
  Given I navigate to "test5BreadcrtumbPdpURL"
  Then I should see "saveForLaterButton" exist on "pdpPage"
  And I should not see "beautyClubValuePoints" on "pdpPage"
  And I should not see "creditCardValuePoints" on "pdpPage"
  And I should see "breadcrumbSection" exist on "pdpPage"
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pdpPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pdpPage"
  And I should see "thirdBreadcrumb" as "<breadcrumb_3>" on "pdpPage"
  And I should see "forthBreadcrumb" as "<breadcrumb_4>" on "pdpPage"
  And I should see "fifthBreadcrumb" as "<breadcrumb_5>" on "pdpPage"
  When I click on "firstBreadcrumb" on "pdpPage"
  Then I should see "deliveryOptions" exist on "commonPage"
  When I go back to previous page
  And I click on "secondBreadcrumb" on "pdpPage"
  Then I should see "pspHeaderText" as "Home" on "pspPage"
  And I should see "url" contains "/home"
  When I go back to previous page
  And I click on "thirdBreadcrumb" on "pdpPage"
  Then I should see "headerText" as "Home accessories" on "pspPage"
  And I should see "url" contains "/home/home-accessories"
  When I go back to previous page
  And I click on "forthBreadcrumb" on "pdpPage"
  Then I should see "headerText" as "Candles & diffusers" on "pspPage"
  And I should see "url" contains "/home/home-accessories/candles-diffusers"
  When I go back to previous page
  And I click on "fifthBreadcrumb" on "pdpPage"
  Then I should see "headerText" as "Home fragrance & diffusers" on "pspPage"
  And I should see "url" contains "/home/home-accessories/candles-diffusers/home-fragrance-diffusers"

  Examples:
    | breadcrumb_1 | breadcrumb_2 | breadcrumb_3     | breadcrumb_4        | breadcrumb_5               |
    | Home         | Home         | Home accessories | Candles & diffusers | Home fragrance & diffusers |

@automated @PDP @Fixed @DEBD-115
Scenario Outline: Navigate to dress pdp page and validate the shop more tags that appears on the page and validate navigation to psp page when clicked on last tag
  When I navigate to "womenDressesPspUrl"
  Then I should see "headerText" containing "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreText" as "Shop more" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as Brand Name on "pdpPage"
  When I click on "shopMoreTag2Text" on "pdpPage"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "url" contains "/women/dresses"

  Examples:
    | tag_name_1 | tag_name_2 |
    | Women      | Dresses    |

@automated @PDP @Fixed @DEBD-115
Scenario Outline: Validate the shop more tags and select tag 1 Women to navigate to psp page
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  When I click on "shopMoreTag1Text" on "pdpPage"
  Then I should see "pspHeaderText" as "Women's clothing & accessories" on "pspPage"
  And I should see "url" contains "/women"

  Examples:
    | tag_name_1 | tag_name_2 |
    | Women      | Dresses    |

@automated @PDP @Fixed @DEBD-115
Scenario Outline: Validate the shop more tags and select tag 3 for Brand Mantaray to navigate to psp page
  Given I navigate to "testDressPdpURL"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  When I click on "shopMoreTag3Text" on "pdpPage"
  Then I should see "pspHeader" as "Principles" on "pspPage"
  And I should see "url" contains "/principles"

  Examples:
    | tag_name_1 | tag_name_2 | tag_name_3 |
    | Women      | Tops       | Principles |

@automated @PDP @Fixed @DEBD-123 @DEBD-113
Scenario: Navigate to dress pdp page after furniture pdp and validate the recently viewed container is visible with the first product as furniture
  When I navigate to "testHomeProductRecentlyViewed"
  And I navigate to "testDressPdpURL"
  Then I should see "saveForLaterButton" exist on "pdpPage"
  And I should not see "creditCardValuePoints" on "pdpPage"
  And I should not see "beautyClubValuePoints" on "pdpPage"
  And I am in view of "recentlyViewed" on "pdpPage"
  Then I should see "recentlyViewedText" as "Recently Viewed" on "pdpPage"
  And I verify "href" of "recentlyViewedProduct1" containing "testHomePdpHrefURL" on "pdpPage"

@manual @DEBD-123 @DEBD-113
Scenario: Navigate to dress pdp page and validate the recently viewed products in the carousel
  When I navigate to "testDressPdpURL"
  And I am in view of "recentlyViewed" on "pdpPage"
  Then I should see "recentlyViewedText" as "Recently Viewed" on "pdpPage"
  And I should view the arrows on the  "Recently Viewed" carousel on "pdpPage"
  And I click on the arrow
  Then I should view the next set of products displayed

@manual @DEBD-123 @DEBD-113
Scenario: Navigate to dress pdp page and validate the recently viewed carousel
  When I navigate to "testDressPdpURL"
  And I am in view of "recentlyViewed" on "pdpPage"
  And I should see "recentlyViewedText" as "Recently Viewed" on "pdpPage"
  And I should view the 5 products or less than 5
  Then I should not view any arrow on the carousel
  And I should view all the products displayed in the carousel

@notAutomated @DEBD-113
Scenario: Validate the review section on the dresses pdp page
  Then I should see "ratingSummaryInHeader" exist on "pdpPage"
  And I should see "reviewSection" exist on "pdpPage"
  When I am in view of "reviewHeaderText" on "pdpPage"
  Then I should see "reviewHeaderText" as "Reviews" on "pdpPage"
  And I should see "reviewSorting" exist on "pdpPage"
  And I should see "reviewWrite" exist on "pdpPage"

@manual @DEBD-113
Scenario: Navigate to dress pdp page with no reviews and validate the review section
  When I navigate to "testDressPdpNoReview"
  Then I validate the review section with no reviews

@notAutomated @DEBD-113 @DEBD-117
Scenario: Validate the product description section on the dresses pdp page
  Given I navigate to "pdpDescriptionHavingPdf"
  Then I should see "productDescriptionLink" exist on "pdpPage"
  When I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescHeaderText" as "Product description" on the bottom of the "pdpPage"
  Then I should see "prodDescItemNumber" exist on "pdpPage"
  And I should see "pdf" in itemDetails
  Then I verify "href" of "productDescPdfLink" as "PdfLink" on "commonPage"

@notAutomated @DEBD-113
Scenario: Navigate to The Collection V neck cardigan pdp page to validate the color and size swatches
  When I click on "searchIcon" on "commonPage"
  Then I enter "The Collection V neck cardigan" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "The+Collection+V+neck+cardigan"
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I should not see "sizeSwatches" on "pdpPage"
  #When I should see "colourSwatches" exist on "pdpPage"
  #Then I verify page reload on selecting a different colour swatch
  And I wait for "3000" milliseconds
  Then I select available size and add to bag on pdpPage
  When I should see "sizeGuideLink" exist on "pdpPage"
  Then I verify "href" of "sizeGuideHref" as "sizeGuideLink" on "pdpPage"

@manual @DEBD-113
Scenario: Navigate to pdp page with countdown timer and validate product details and was, Then and now price
  When I navigate to "pdpPage"
  Then I validate price was, now, Then and save
  And I validate name
  Then I should see "saveForLaterButton" exist on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"
  And I validate quantity selector
  Then I validate want it now countdown timer which should be as desktop

@manual @DEBD-113
Scenario: Navigate to pdp page with countdown timer and validate countdown timer is not displayed
  Given I navigate to "pdpPage"
  Then I should not see countdown timer on pdp page

@automated @PDP @Fixed @DEBD-122 @DEBD-113 @DEBD-604
Scenario: Navigate to PDP page and validate the sizes available in dropdown with out of stock and low stock message
  Given I navigate to "pdpPagewithsizeasdropdown"
  Then I select "Out of Stock" size from "dropdown"
  And I validate "Out of Stock" message from  "dropdown" on  "pdpPage"
  Then I select "low stock" size from "dropdown"
  And I validate "low stock" message from  "dropdown" on  "pdpPage"

@deScoped @DEBD-122 @DEBD-113 @DEBD-604
Scenario: Navigate to PDP page and validate the sizes available in dropdown with out of stock and low stock message
  Given I navigate to "pdpPagewithSizeasSwatch"
  Then I select "Out of Stock" size from "swatch"
  And I validate "Out of Stock" message from  "swatch" on  "pdpPage"
  And I select "low stock" size from "swatch"
  And I validate "low stock" message from  "swatch" on  "pdpPage"

@notAutomated @DEBD-113
Scenario: Navigate to dress pdp page and validation of the pdp incase no size is selected
  When I navigate to "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "sizeselectormessage" as "Please select an option" on "pdpPage"

@notAutomated @DEBD-113
Scenario: Navigate to dress pdp page and validation of the Quantity selector
  When I navigate to "pdpPage"
  And I enter "100" in "stepperCount" on "pdpPage"
  Then I should see "stepperCount" as "99" on "pdpPage"
  And I enter the quantity 99 on PDP
  When I click on "addToBagButton" on "pdpPage"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "has been added to your bag." on "pdpPage"
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 99"

@notAutomated @DEBD-113
Scenario: Navigate to dress pdp page and validation of the Quantity selector
  When I navigate to "pdpPage"
  And I validate low of stock product
  And I enter the quantity 99 on PDP
  When I click on "addToBagButton" on "pdpPage"
  Then I should not be able to add more than stock quantity available on pdp

@manual @DEBD-113
Scenario: Navigate to dress pdp page and validation of the order of the sizes on pdp
  When I navigate to "pdpPagewithMultipleSizes"
  And I should see the numeric sizes on the Pdp
  Then the sizes should be ordered numerically

@manual @DEBD-113
Scenario: Navigate to dress pdp page and validation of the order of the sizes on pdp
  When I navigate to "pdpPagewithMultipleSizes"
  And I should see the sizes on the Pdp
  Then the sizes should be ordered as XS, S, M,L,XL

@notAutomated  @DEBD-113
Scenario: Validate that saved product from PDP page is displayed in my saved item and the count of my saved item gets updated
  Given I navigate to "pdpPage"
  And I store name of product and select save item on pdpPage
  When I click on "savedItemsButton" on "commonPage"
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"
  And I validate products are saved on mySavedItemPage
  Then I navigate to "pdpPage"
  And I store name of product and unsave item on pdpPage
  When I click on "savedItemsButton" on "commonPage"
  Then I should not see "headerTextNonSignIn" on "mySavedItemPage"
  And I validate products are removed on mySavedItemPage

@manual  @DEBD-113
Scenario: Validate that the Signin Pop up should not appear on click of SFL on pdpPage if user is already Signin
  Given I am on my details page
  And I navigate to "pdpPage"
  When I click on "saveForLaterButton" on "pdpPage"
  Then I should see the item saved in "Saved for later"
  And SignIn pop up shouldn't appear

@manual  @DEBD-113
Scenario: Validate that the Signin Pop up should appear on click of SFL on pdpPage for guest user for first time and not on second pdp page
  Given I logout
  And I navigate to "pdpPage"
  When I click on "saveForLaterButton" on "pdpPage"
  Then I should see the item saved in "Saved for later"
  And I should be asked whether I want to sign in or continue as guest for first time
  And I choose continue shopping
  And I remain on the PDP
  And the saved items count in the header icon should be updated
  And I navigate to "pdpPage2"
  When I click on "saveForLaterButton" on "pdpPage"
  Then I should see the item saved in "Saved for later"
  And SignIn pop up shouldn't appear

@manual  @DEBD-113
Scenario: Validation of the Signin Page on click of SFL on pdpPage for guest user
  Given the user is logged in as "Guestuser"
  When I click on "Saved item" on "pdpPage"
  Then I should see the item saved in "Saved for later"
  And I should be asked whether I want to sign in or continue as guest for first time
  And I press sign in
  And I should be navigated to the sign in page
  And the saved items count in the header icon should be updated
  And I sign in successfully
  Then I should be navigated back to PDP before being asked to sign in

@manual @DEBD-123
Scenario: Validate the UI and product against desktop production for Recently viewed section
  Given I navigate to "pdpPage"
  When I am in view of "recentlyViewed" on "pdpPage"
  Then I will see arrows and pips
  And I validate the Ui against style guide
  When I click on an arrow
  Then the next set of products will be shown

@manual @DEBD-123
Scenario: Validate the UI and product against desktop production for Recently viewed section (with less than 5 profducts)
  Given I navigate to "pdpPage"
  When I am in view of "recentlyViewed" on "pdpPage"
  And I validate the Ui against style guide
  When there are less than 5 products
  Then I will see no arrows or pips

@notAutomated  @DEBD-113
Scenario: Validate use r is navigated to dotcom from dotint site when clicked on product from recently viewed (product to be only available on dotcom)
  Given I navigate to "testFurniturePdpURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I navigate to "pdpAustraliaDress"
  And I am in view of "recentlyViewed" on "pdpPage"
  Then I should see "recentlyViewedText" as "Recently Viewed" on "pdpPage"
  And I verify "href" of "recentlyViewedProduct1" containing "testFurniturePdpHrefURL" on "pdpPage"
  Then I should match product name of first product "recentlyViewedProduct1" in carousel on "pdpPage"
  And I should see "selectedCountryName" as "United Kingdom" on "commonPage"

@manual @DEBD-122
Scenario: Validate PDP out of stock behavior for swatch
  Given I navigate to "pdpPagewithSizeasSwatch"
  And I see OOS swatches on PDP
  And I should see "Swatches" as "greayed out"
  And I should see "Cross" inside the swatches
  When I click Out of stock swatch
  Then the size swatch will get a red border
  Then I should see "addToBagButton" "disabled" on "pdpPage"
  And I should see quantity selector should be greayed out

@manual @DEBD-122
Scenario: Validate PDP out of stock behavior for dropdown
  Given I navigate to "pdpPagewithSizeasdropdown"
  When I select a size in a drop down that is out of stock
  Then the size dropdown will get a red border
  And  I will see (out of stock) in red next to the size
  Then I should see "addToBagButton" "disabled" on "pdpPage"
  And I should see quantity selector should be greayed out

@manual @DEBD-122
Scenario: Validate PDP Out of stock behaviour on the basis of hourly stock checker
  Given I navigate to "pdpPagewithSizeasdropdown"
  When the stock check has run
  And the stock is no longer available
  When I click on available size.
  Then I validate "Out of Stock" message from  "dropdown" on  "pdpPage"
  Then I should see "addToBagButton" "disabled" on "pdpPage"
  And I should see quantity selector should be greayed out

@notAutomated @DEBD-555
Scenario: Validate PDP redicection when out of stock colour is clicked
   Given I'm on "KnitwearPDP"
   And I should see "Colourswatches" on "PdpPage"
   When I select "Out of Stock" colour from "dropdown"
   Then I should be redirected to OOS pdp page
   And I should see all size swatches are out of Stock

@manual @DEBD-109
Scenario: Validate multiple variences of Single SKU PDP
   Given I'm on 'differentsingleskuPDP'
   And I should not see any colour and size swatches
   Then I should see age notifcation for alocoholic product
   And I should see Alcohol restriction espot
   And I should see WEEE Legislation espot for electricals product
   And I should not see returnable notification

@notautomated @DEBD-562
Scenario: Navigate toBundle  PDP page and validate  out of stock and low stock behavior
  Given I navigate to "BundlePDPatyPDPurl"
  Then I select "Out of Stock" size
  And I validate "Out of Stock" message  on  "pdpPage"
  Then I should see "addToBagButton" "disabled" on "pdpPage"
  And I should see quantity selector should be greayed out
  Then I select "low stock" size
  And I validate "low stock" message on  "pdpPage"
@manual  @DEBD-350
Scenario: Validate that the user should be able to see the cuser generated content like videos, photos etc
    Given I navigate to "pdpPage"
    Then I should see the user generated content"customerPhotosContainer"
    And I should see the container title  as "Customer Photos"
    And I shoould see the container ID to be changed from 'bv-carousel' to 'bv-carousel-uddebenhams'

@notAutomated  @DEBD-350
Scenario: Validate that the user should not be able to see the cuser generated content like videos, photos etc on Chanel PDPs
    Given I navigate to "ChanelpdpPage"
    Then I should not see the user generated content"customerPhotosContainer"

@notAutomated  @DEBD-350
Scenario: Validate that the user should not be able to see the cuser generated content like videos, photos etc on bundles PDPs
    Given I navigate to "bundlepdpPage"
    Then I should not see the user generated content"customerPhotosContainer"

@manual @DEBD-126
Scenario Outline: Validate the price, size, delivery for international site
  Given I navigate to "KnitwearPDP"
  And I validate  localised delivery as per the selectedCountryName
  And I validate localised price as per the selectedCountryName
  And I validate  localised size as per the country selectedCountryName
  And if the sizes having less than 3 charachters
  Then I should see size swatches
  And if the sizes are having more than 3 charachters
  Then I should see size dropdown

  Examples:
   | Women Dresses |
   | Lingerie      |
   | Home   |
   | Mens  |

@manual @DEBD-131
Scenario Outline: Validate the categories not available on International site
   Given I navigate to "Internation site"
   Then I should not see products related to "<categories>" on international site

  Examples:
   |categories|
   |bundles   |
   |Beauty    |
   |Furniture |
   |Electricals|

@automated @dataNA @PDP @DEBD-348
Scenario: Validate that video thumbnail is displayed on PDP page with many product images
  Given I navigate to "manyImageVideoPDP"
  Then I should see "imageCarsoul" exist on "pdpPage"
  And I should see "videoThumbnail" exist on "pdpPage"
  When I click on "videoThumbnail" on "pdpPage"
  Then I should see "videoViewer" exist on "pdpPage"

@manual @DEBD-348
Scenario: validate that the video thumbnail appears outside the image carsoul
  Then I should see a video thumbnail at the bottom of the image
  And I should thumbnails outside of the image thumbnail carousel
  And I should see the thumbnail has a drop shadow
  And I hover or focus on it then the "video" copy will underline
  And I should see the icon turns to a darker shade of green
  And I will be served the most appropriate version of the video based on my bandwidth and viewport

@automated @dataNA @PDP @DEBD-348
Scenario: Validate that video thumbnail is displayed on PDP page with few product images
  Given I navigate to "fewImageVideoPDP"
  Then I should not see "imageCarsoul" on "pdpPage"
  And I should see "videoThumbnail" exist on "pdpPage"
  When I click on "videoThumbnail" on "pdpPage"
  Then I should see "videoViewer" exist on "pdpPage"

@manual @DEBD-348
Scenario: validate that the video thumbnail appears outside the image carsoul
  Then I should see a video thumbnail at the bottom of the image
  And I should thumbnails outside of the image thumbnail carousel
  And I should see the thumbnail has a drop shadow
  And I hover or focus on it then the "video" copy will underline
  And I should see the icon turns to a darker shade of green

@manual  @DEBD-112
Scenario: Validate that the user should not be able to see "tap to zoom" across the main image for 3seconds
  Given I navigate to "pdpPage"
  Then I validate the tap to zoom text which appears on top of first image for 2 seconds
  And I should not see "tap to zoom" across the main image for 3 seconds

@manual  @DEBD-112
Scenario: Validate that the carousel of smaller thumbnail images to the left of the large container should be displayed on PDP with multiple images
  Given I navigate to "pdpPage" with multiple images
  Then I should see the first product image in a large container
  And I should see a carousel of smaller thumbnail images to the left of the large container
  And I should see the first image in the thumbnails will have a green border

@automated @PDP @Fixed  @DEBD-112
Scenario: Validate that the user should see the thumbnails without carousal arrows on PDP with 4 or less product images
  Given I navigate to "pdpPageWithFewerImages"
  Then I should see "thumbnailImages" exist on "pdpPage"
  And I should not see "thumbnailDownCarousalArrow" on "pdpPage"
  And I should not see "thumbnailUpCarousalArrow" on "pdpPage"

@automated @PDP @Fixed  @DEBD-112
Scenario: Validate that the user should see the thumbnails with carousal arrows on PDP with 5 or more product images
  Given I navigate to "pdpPageWithMoreImages"
  Then I should see "thumbnailImages" exist on "pdpPage"
  Then I should see "thumbnailImages" exist on "pdpPage"
  And I should see "thumbnailDownCarousalArrow" exist on "pdpPage"
  And I should see "thumbnailUpCarousalArrow" exist on "pdpPage"

@manual  @DEBD-112
Scenario: Validate that the user should see thumbnail carousel arrow to be grey when a thumbnail carousel arrow is inactive and thumbnail carousel arrow to be teal when active
  Given I navigate to "pdpPageWithMoreImages"
  And I should see "thumbnailcarousalArrows" on "pdpPage"
  When I navigate to top of the "thumbnailImages" on "pdpPage"
  Then I should see "thumbnailcarousaltopArrow" as grey
  And I should see "thumbnailcarousalbottomArrow" as teal

@manual  @DEBD-112
Scenario: Validate that user should see a grey border when he hovers or focuses on a thumbnail that is not showing in the main image on PDP
  Given I navigate to "pdpPage" with multiple images
  When I hover or focus on a thumbnail that is not showing in the main image
  Then I should see a grey border around the "thumbnailImage"

@manual  @DEBD-112
Scenario: Validate that main image should be updated with the relevant thumbnail when user clicks on each thumbnail on PDP with multiple images
  Given I navigate to "pdpPage" with multiple images
  When I click on "thumbnailImage" on "pdpPage"
  Then I should see the "mainImage" should be updated with relevant image
  And I should see a teal border around selected "thumbnailImage"

@manual  @DEBD-112
Scenario: Validate that main image should be updated with the relevant thumbnail when user clicks on each thumbnail on PDP with 5 or more product images
  Given I navigate to "pdpPage" with 5 or more product images
  When I click on the horizontal arrows on the main image on "pdpPage"
  Then I should see the "mainImage" should be updated with relevant image
  And I should see a teal border around selected "thumbnailImage"

@manual  @DEBD-112
Scenario: Validate that the user should be able to see next set of product image thumbnails when user clicks up or down arrow on PDP with 5 or more product images
  Given I navigate to "pdpPage" with 5 or more product images
  When I click "thumbnailcarousaltopArrow" on "pdpPage"
  Then I should see next set of product image thumbnails
  When I click "thumbnailcarousalbottomArrow" on "pdpPage"
  Then I should see next set of product image thumbnails

@manual  @DEBD-112
Scenario: Validate that the main image container should be slighty smaller than on tablet viewports on PDP
  Given I navigate to "pdpPage"
  Then I should see the "mainImageContainer" as slighty smaller than on tablet viewports on "pdpPage"

@manual  @DEBD-112
Scenario: Validate that the main image container should increase in size to fill the gap on PDP with just one image
  Given I navigate to "pdpPage" with just one image
  Then I should see the "mainImageContainer" as increased size to fill the gap

@manual  @DEBD-112
Scenario: Validate that the image should be zoomed in to the focused area of the main image on PDP
  Given I navigate to "pdpPage"
  When I hover over the "mainImage" on "pdpPage"
  Then I should see the image will zoom in to the area I'm focusing on
  And I should not see "thumbnailcarousalArrows" on "pdpPage"
  When I move my cursor around
  Then I should see the image will remain zoomed in
  And I should see focus on the new location of my cursor

@automated @PDP @Fixed  @DEBD-112
Scenario: Validate that the zoomed image should be displayed on clicking on the main Image Container on PDP
  Given I navigate to "pdpPageWithMoreImages"
  When I click on "mainImageContainer" on "pdpPage"
  Then I should see "zoomedImagePopUp" exist on "pdpPage"
  Then I should see "closeIconOnzoomedImagePopUp" exist on "pdpPage"
  When I click on "closeIconOnzoomedImagePopUp" on "pdpPage"
  Then I should not see "zoomedImagePopUp" on "pdpPage"
  Then I should not see "closeIconOnzoomedImagePopUp" on "pdpPage"

@automated @PDP @Fixed  @DEBD-112
Scenario: Validate that the zoomed image should be displayed on clicking on the main Image Container on PDP
  Given I navigate to "pdpPageWithMoreImages"
  When I hover on "mainImageContainer" at position "580" and "360" on "pdpPage"
  Then I should see "zoomImageOnHover" exist on "pdpPage"
  When I mouse hover on "addToBagButton" on "pdpPage"
  Then I should not see "zoomImageOnHover" on "pdpPage"

@manual  @DEBD-458
Scenario: Validate that the zoom pop up overlay should open when user click on the main image
  Given I navigate to "pdpPage"
  When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  And I should see "darkBackground" on "pdpPage"
  And I should see "thumbnailImages" on "zoomPopUpOverlay" on "pdpPage"
  And I should see first "thumbnailImage" with teal border on "zoomPopUpOverlay" on "pdpPage"
  And I should not see "thumbnailcarousalArrows" on "zoomPopUpOverlay" on "pdpPage"
  And I should see "mainImageCarouselArrows" as teal and active on "zoomPopUpOverlay" on "pdpPage"
  And I should see "mainImage" on "zoomPopUpOverlay" on "pdpPage"
  And I should see "closeCTA" on "zoomPopUpOverlay" on "pdpPage"

@manual  @DEBD-458
Scenario: Validate that the thumbnail gets a teal border when selected on zoom pop up overlay on PDP
  Given I navigate to "pdpPage"
  When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  When I click on "thumbnailImage" on "zoomPopUpOverlay" on "pdpPage"
  Then I should see the "thumbnailImage" with teal border on "zoomPopUpOverlay" on "pdpPage"
  Then I should see the "mainImage" should be updated with relevant image on "zoomPopUpOverlay" on "pdpPage"

@manual  @DEBD-458
Scenario: Validate that the main image should update with the next or previous image on zoom pop up overlay on PDP when click on the main image carousel arrows
  Given I navigate to "pdpPage"
  When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  When I click "mainImageCarousal" on "zoomPopUpOverlay" on "pdpPage"
  Then I should see the "mainImage" should be updated with relevant image

@manual  @DEBD-458
Scenario: Validate that the zoom pop up overlay should close when user clicks on the close CTA or out of the overlay
  Given I navigate to "pdpPage"
  When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  When I click "ClseCTA" on "zoomPopUpOverlay" on "pdpPage"
  Then I should see "zoomPopUpOverlay" gets closed
  And I should see the "pdpPage"
  When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  When I click out of the "zoomPopUpOverlay" on "pdpPage"
  Then I should see "zoomPopUpOverlay" gets closed
  And I should see the "pdpPage"

@manual  @DEBD-458
Scenario: Validate that the thumbnail Image carousal on zoom pop up overlay when a product has 8 or more images
  Given I navigate to "pdpPage" with 8 or more product images
   When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  And I should see "thumbnailcarousalArrows" on "zoomPopUpOverlay" on "pdpPage"

@manual  @DEBD-458
Scenario: Validate that the video thumbnail should not show on zoom pop up overlay when a product has video
  Given I navigate to "pdpPage" a video
   When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  And I should not see "videoThumbnail" on "zoomPopUpOverlay" on "pdpPage"

@manual @DEBD-604
Scenario: validate UI of pdppage dropdown
  Given I navigate to "pdpPage" with size and colour dropdown
  When I click on drop down
  Then I should see the border of the dropdown in teal colour
  When a Product is low in stock in dropdown
  Then  I should see the "low in stock" message in the drop down in amber
  When  a product is out of stock
  Then  I should see the "out of stock" message in the drop down in red
  And  prduct sku should be  strike through
  When the prices varies by colour or sizes
  Then I should  see price by the colour/size name
  And I should see colourswtaches inside the dropdown along with the options


@manual @DEBD-604
Scenario: validate UI of chanel pdp dropdown
  Given I'm on Chanel PDP with multi color
  When I on dropdown
  Then I should see the border of the dropdown in black colour


@manual @DEBD-126
Scenario Outline: Verify the size selector on PDP is swatch for country as New Zealand where the sizes are 3 or less characters e.g. New Zealand = 8,10,12 etc.
Given I am on an "<NewZealandPDPSite>"
Then I will see size selectors in circle buttons
And I can select a size
Then I am able to add to bag successfully

Examples:
   | Women Dresses |
   | Lingerie      |
   | Home   |
   | Mens  |

@manual @DEBD-126
Scenario Outline: Verify the size selector on PDP is dropdown for country as China where the sizes are 4+ characters e.g. e.g. China = US 4, US 6 etc.
Given I am on an "chinaPDPSite"
Then I will see size selectors in a drop down
And I can select a size
Then I am able to add to bag successfully

Examples:
   | Women Dresses |
   | Lingerie      |
   | Home   |
   | Mens  |


@automated @PDP @Fixed @DEBD-2488 
Scenario: Valiadte the Global Delivery Banner is not displayed on PDP page in landscape mode
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I should see "deliverybanner" exist on "commonPage"
  And I should see "standardDel" containing "Standard Delivery" on "commonPage"
  And I should see "paypalOption" containing "PayPal" on "commonPage"
  When I "validate & click" subMenu option "All dresses" under "Women" on commonPage bigscreen
  Then I should see "deliverybanner" exist on "commonPage"
  And I should see "standardDel" containing "Standard Delivery" on "commonPage"
  And I should see "paypalOption" containing "PayPal" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I should not see "deliverybanner" on "commonPage"
  And I should not see "standardDel" on "commonPage"
  And I should not see "paypalOption" on "commonPage"

@automated @PDP @Fixed @DEBD-2428
Scenario Outline: Valiadte the selected colour swatch is highlighted in Green except Chanel
Given I navigate to "<Products>"
Then I select available size and add to bag on pdpPage
Then I should verify "border-top-color" of "pdpSelectedSwatch" as "pdpSelectedBorderSwatchColor" on "pdpPage"

  Examples:
  | Products    |
  |braUrl |
  |pdpKnitWearProduct |

@manual @DEBD-2428
Scenario: Validate the low stock message displayed next to colour selected
  Given I am on a non beauty PDP (eg lingere/knitwear)
  When I select a colour swatch that has low stock availability
  Then the (low in stock) message will display next to the colour selected
  And the hurry less the X left message will appear underneath the swatches

@manual @DEBD-2428
Scenario: Validate the out of stock message displayed next to colour selected
Given I am on a non beauty PDP (eg lingere/knitwear)
When I select a colour swatch is out of stock
Then the (out of stock) message will display next to the colour selected
And the hurry less the Sorry - this item is currently out of stock message will appear underneath the swatches
And the size container (where applicable) will have a red border

@manual @DEBD-2428
Scenario: Validate the colour name is displayed on mouse hover on desktop
Given I am on a PDP
When I hoover the mouse over the colour swatches
Then the colour name will display

@manual @DEBD-2428
Scenario: Validate the maximum of 11 colour swatches are displayed per row on desktop
Given I am on a PDP
When I view the colour swatch container
Then I will see a maximum of 11 swatches per row

@manual @DEBD-2429
Scenario: Validate the prompt text is displayed when in view if size selector
  Given I am on a PDP
  When I view the size selector container
  Then the prompt text will read "Select a size"

@manual @DEBD-2429
Scenario: Validate the selected size is displayed within size selector container
  Given I have selected a size
  Then I will see the size within the size selector container

@manual @DEBD-2429
Scenario: Validate the OOS error message is displayed underneath the size container
  Given I am on a PDP
  When I select a size that is out of stock
  Then I will see the "Sorry this item is currently out of stock" underneath the size container
  And against the selected colour
  And the size will have a grey strikethrough
  And the size container will have a red border
  And a white cross inside the swatch

@manual @DEBD-2429
Scenario: Validate the low stock message is displayed underneath the size container
  Given I am on a PDP
  When I select a size that is low in stock
  Then I will see "hurry less than x left" underneath the size container
  And against the selected colour within the colour drop down

@manual @DEBD-2429
Scenario: Validate the size guide will align to the right the size container for desktop
  Given I am on a desktop PDP
  Then the size guide will align to the right the size container

@manual @DEBD-2504
Scenario: Validate the ATB button and quanitity selector are displayed inline
Given I AM on a PDP
Then the ATB button and quanitity selector will be inline

@manual @DEBD-2504
Scenario: Validate the save for later icon will be positioned inline with the Brand
Given I AM on a PDP
Then the save for later icon will be positioned inline with the Brand and Product Title

@manual @DEBD-2360
Scenario: Validate the size and location of Product Brand and Title on PDP
Given I am on a PDP
Then It will be above the product title
And have a reduced font size e.g."Mantaray Blue pattern dress"

@manual @DEBD-2360
Scenario: Validate the new Product description link on the PDP
Given I am on a PDP
When I view the product description link
Then I will see a new{color} icon to the left of the product description CTA
When I click on "productDescriptionLink" the "pdpPage"
Then I should be on the Product description link area on the page


@manual @DEBD-2360
Scenario: Validate the product reviews location in the PDP
Given I am on a PDP
When it has product reviews
Then I will see the review stars and rating underneath the product title
When I click on the review stars or review rating
Then It will anchor me down to the reviews section

@manual @DEBD-2360
Scenario: Validate price per ml for beauty/alochol products under the product price
Given I navigate to "alocholPdp"
Then I should see "priceperml" underneath the product price
