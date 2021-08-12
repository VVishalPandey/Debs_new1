Feature: Test Debenhams pdp page validation

@automated @PDP @Fixed @DEBD-111
Scenario Outline: Validate the breadcrumb section and validate navigation to psp page when selected last breadcrump
  Given I logout
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  # Given I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Maxi Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should see "saveForLaterButton" exist on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"
  And I should not see "beautyClubValuePoints" on "pdpPage"
  #Given I navigate to "testDress2PdpURL"
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
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  Then I should validate product name on "pdpPage"
  #Given I navigate to "testDress2PdpURL"
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
  #Given I navigate to "testDress2PdpURL"
  And I should see "breadcrumbSection" exist on "pdpPage"
  And I should see "firstBreadcrumb" exist on "pdpPage"
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pdpPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pdpPage"
  And I should see "thirdBreadcrumb" as "<breadcrumb_3>" on "pdpPage"
  When I click on "firstBreadcrumb" on "pdpPage"
  Then I should see "deliveryOptions" exist on "commonPage"

  Examples:
    | breadcrumb_1 | breadcrumb_2 | breadcrumb_3 |
    | Home         | Women        | Dresses      |

@automated @PDP @Fixed @DEBD-111
Scenario Outline: Validate the breadcrumb section having 4 breadcrumb options
  Given I navigate to "testShoePdpURL"
  Then I should see "saveForLaterButton" exist on "pdpPage"
  # And I should see "creditCardValuePoints" exist on "pdpPage"
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

@notAutomated @DEBD-111 @productNotAvailable
Scenario Outline: Validate the breadcrumb section having 5 breadcrumb options
  Given I navigate to "testBeauty5BreadcrumbPdpURL"
  Then I should see "saveForLaterButton" exist on "pdpPage"
  And I should see "beautyClubValuePoints" exist on "pdpPage"
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
  Then I should see "pspHeaderText" as "Beauty" on "pspPage"
  And I should see "url" contains "/beauty"
  When I go back to previous page
  And I click on "thirdBreadcrumb" on "pdpPage"
  Then I should see "headerText" as "Perfume & aftershave" on "pspPage"
  And I should see "url" contains "/beauty/perfume-aftershave"
  When I go back to previous page
  And I click on "forthBreadcrumb" on "pdpPage"
  Then I should see "headerText" as "Perfume" on "pspPage"
  And I should see "url" contains "/beauty/perfume-aftershave/womens-perfume"
  When I go back to previous page
  And I click on "fifthBreadcrumb" on "pdpPage"
  Then I should see "headerText" as "Eau de parfum" on "pspPage"
  And I should see "url" contains "/beauty/perfume-aftershave/womens-perfume/eau-de-parfum"

  Examples:
    | breadcrumb_1 | breadcrumb_2 |     breadcrumb_3     |  breadcrumb_4  | breadcrumb_5  |
    | Home         | Beauty       | Perfume & aftershave | Womens perfume | Eau de parfum |

@automated @PDP @Fixed @DEBD-115
Scenario Outline: Navigate to dress pdp page and validate the shop more tags that appears on the page and validate navigation to psp page when clicked on last tag
  When I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  #Given I navigate to "testDress2PdpURL"
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
  Then I should see "pspHeaderText" as "Women’s Clothing" on "pspPage"
  And I should see "url" contains "/women"

  Examples:
    | tag_name_1 | tag_name_2 |
    | Women      | Dresses    |

@automated @PDP @Fixed @DEBD-115
Scenario Outline: Validate the shop more tags and select tag 3 for Brand The Collection to navigate to psp page
  Given I navigate to "testDressPdpURL"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  When I click on "shopMoreTag3Text" on "pdpPage"
  Then I should see "pspHeader" as "Principles" on "pspPage"
  And I should see "url" contains "/principles"

  Examples:
    | tag_name_1 | tag_name_2 |   tag_name_3   |
    | Women      | Dresses    | Principles     |

@automated @PDP @Fixed @DEBD-123 @DEBD-113
Scenario: Navigate to chanel pdp from furniture pdp and validate the recently viewed container is not visible
  When I navigate to "testFurniturePdpURL"
  And I navigate to "testChanelPerfPdpURL"
  #Then I should not see "roundRobinSection" on "pdpPage"
  #And I should not see "baynoteSection" on "pdpPage"
  And I should see "saveForLaterButton" exist on "pdpPage"
  And I should not see "creditCardValuePoints" on "pdpPage"
  And I should not see "beautyClubValuePoints" on "pdpPage"
  And I should not see "recentlyViewed" on "pdpPage"
  And I should not see "reviewSection" on "pdpPage"

@automated @PDP @Fixed @DEBD-123 @DEBD-113
Scenario: Navigate to dress pdp page after chanel pdp and validate the recently viewed container is visible with the first product as furniture
  When I navigate to "testDressPdpURL"
  Then I should see "saveForLaterButton" exist on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"
  And I should not see "beautyClubValuePoints" on "pdpPage"
  And I am in view of "recentlyViewed" on "pdpPage"
  Then I should see "recentlyViewedText" as "Recently Viewed" on "pdpPage"
  And I verify "href" of "recentlyViewedProduct1" containing "testFurniturePdpHrefURL" on "pdpPage"

@notAutomated @DEBD-123 @DEBD-113
Scenario: Navigate to dress pdp page and validate the recently viewed products in the carousel
  When I navigate to "testDressPdpURL"
  And I am in view of "recentlyViewed" on "pdpPage"
  Then I should see "recentlyViewedText" as "Recently Viewed" on "pdpPage"
  And I should view the arrows on the  "Recently Viewed" carousel on "pdpPage"
  And I click on the arrow
  Then I should view the next set of products displayed

@manual @DEBD-123 @DEBD-113 @awsManual
Scenario: Navigate to dress pdp page and validate the recently viewed carousel
  When I navigate to "testDressPdpURL"
  And I am in view of "recentlyViewed" on "pdpPage"
  And I should see "recentlyViewedText" as "Recently Viewed" on "pdpPage"
  And I should view the 5 products or less than 5
  Then I should not view any arrow on the carousel
  And I should view all the products displayed in the carousel

@automated @PDP @Fixed @DEBD-113
Scenario: Validate the financial banner section and the link for apply button on the dresses pdp page
  When I am in view of "financeBanner" on "pdpPage"
  Then I verify "href" of "financeBannerApply" as "financeBannerLink" on "pdpPage"

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

@automated @PDP @Fixed @DEBD-113 @DEBD-117
Scenario: Validate the product description section having pdf link
  Given I navigate to "pdpDescriptionHavingPdf"
  Then I should see "productDescriptionLink" exist on "pdpPage"
  When I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescHeaderText" as "Product description" on "pdpPage"
  Then I should see "prodDescItemNumber" exist on "pdpPage"
  And I should see "prodGuideLink" exist on "pdpPage"

@notAutomated @DEBD-113 @awsManual
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

@manual @DEBD-113 @awsManual
Scenario: Navigate to pdp page with countdown timer and validate product details and was, then and now price
  When I navigate to "pdpPage"
  Then I validate price was, now, then and save
  And I validate name
  Then I should see "saveForLaterButton" exist on "pdpPage"
  And I should see "creditCardValuePoints" exist on "pdpPage"
  And I validate quantity selector
  Then I validate want it now countdown timer which should be as desktop

@manual @DEBD-113 @awsManual
Scenario: Navigate to pdp page with countdown timer and validate countdown timer is removed when after the time is completed
  Given I navigate to "pdpPage"
  Then I validate want it now countdown timer which should be as desktop
  When the countdown ime is completed
  Then I should not see countdown timer on pdp page

@deScoped @DEBD-122 @DEBD-113 @DEBD-122
Scenario: Navigate to PDP page and validate the sizes available in dropdown with out of stock and low stock message
  Given I navigate to "pdpPagewithSizeasSwatch"
  Then I select "Out of Stock" size from "swatch"
  And I validate "Out of Stock" message from  "swatch" on  "pdpPage"
  Then I should see "addToBagButton" "disabled" on "pdpPage"
  And I select "low stock" size from "swatch"
  And I validate "low stock" message from  "swatch" on  "pdpPage"

@notAutomated @DEBD-113 @DEBD-122
Scenario: Navigate to dress pdp page and validation of the pdp incase no size is selected
  When I navigate to "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "sizeselectormessage" as "Please select an option" on "pdpPage"

@notAutomated @DEBD-113
Scenario: Navigate to dress pdp page and validation of the quantity selector when 100 and 99 quantity
  When I navigate to "pdpPage"
  And I enter "100" in "stepperCount" on "pdpPage"
  Then I should see "stepperCount" as "99" on "pdpPage"
  And I enter the quantity 99 on PDP
  When I click on "addToBagButton" on "pdpPage"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "has been added to your bag." on "pdpPage"
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 99"

@notAutomated @DEBD-113 @awsManual
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

@manual @DEBD-113 @awsManual
Scenario: Navigate to dress pdp page and validation of the order of the sizes on pdp
  When I navigate to "pdpPagewithMultipleSizes"
  And I should see the sizes on the Pdp
  Then the sizes should be ordered as XS, S, M,L,XL

@notAutomated  @DEBD-113 @awsManual
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

@manual @DEBD-123 @awsManual
Scenario: Validate the UI and product against desktop production for Recently viewed section (with less than 5 profducts)
  Given I navigate to "pdpPage"
  When I am in view of "recentlyViewed" on "pdpPage"
  And I validate the Ui against style guide
  When there are less than 5 products
  Then I will see no arrows or pips

@notAutomated  @DEBD-113 @awsManual
Scenario: Validate user is navigated to dotcom from dotint site when clicked on product from recently viewed (product to be only available on dotcom)
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

@manual @DEBD-122 @awsManual
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

@notAutomated @DEBD-555 @awsManual
Scenario: Validate PDP redirection when out of stock colour is clicked
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

@automated @PDP @Fixed @DEBD-109
Scenario Outline: Validate multiple variences of Single SKU PDP
   Given I navigate to "<singleSKUPdpURL>"
   Then I should not see "colourSwatch" on "pdpPage"
   Then I should not see "sizeSwatch" on "pdpPage"
   Then I navigate to "<alcoholPdpURL>"
   Then I should see age notifcation anchor link for alocoholic product
   And I validate "Alcohol restriction" espot "alcohol" on "pdpPage"
   Then I navigate to "<electricalsPDPURL>"
   And I validate "WEEE Legislation" espot "electrical" on "pdpPage"
   Then I navigate to "<nonReturnablePDPURL>"
   And I validate "Non returnable item - Food & Drink Gifts" espot "nonreturnable" on "pdpPage"

Examples:
| singleSKUPdpURL |  | alcoholPdpURL |  | electricalsPDPURL |  | nonReturnablePDPURL |
| giftPDPURL      |  | alcoholPDPURL |  | electricalsPDPURL |  | nonReturnablePDPURL |

@manual @DEBD-109
Scenario Outline: Validate multiple variences of Single SKU PDP
   Given I'm on "<single sku product>"
   And I should not see any colour and size swatches
   Then I should see age notifcation for alocoholic product
   And I should see Alcohol restriction espot
   And I should see WEEE Legislation espot for electricals product
   And I should not see returnable notification

Examples:
  | single sku product |
  | skincare gift set  |
  | coffee machine     |
  | pillows            |
  | alcoholic product  |

@automated @PDP @Fixed @DEBD-555
Scenario Outline: Validate PDP redirection when out of stock colour is clicked
   Given I navigate to "<pddURL>"
   Then I should see "pddpColourSwatches" exist on "pdpPage"
   And I should not see "sizeSwatches" on "pdpPage"
   When I select Out of Stock colour from Colourswatches
   And I should see all size swatches are out of Stock

    Examples:
    |     pddURL     |
    | PDPOOSKnitwear |
    | PDPOOSLingerie |

@notAutomated  @DEBD-513
Scenario: Validate that the user should be able to see the countdown delivery urgency Espot and a teal clock icon
    Given I navigate to "dressPdpPage"
    Then I should see the countdown delivery urgency Espot
    And I should see the teal clock icon

@manual  @DEBD-350
Scenario Outline: Validate that the user should be able to see the cuser generated content like videos, photos etc
    Given I navigate to "<pdpPage>"
    Then I should see the user generated content"customerPhotosContainer"
    And I should see the container title  as "Customer Photos"
    And I shoould see the container ID to be changed from 'bv-carousel' to 'bv-carousel-uddebenhams'

    Examples:
    |       pdpPage       |
    | beauty - foundation |
    | women - dresses     |
    | kids - dress        |
    | lingerie - bras     |
    | Men - jeans         |
    | Home - bedding      |

@notAutomated  @DEBD-350
Scenario: Validate that the user should not be able to see the cuser generated content like videos, photos etc on Chanel PDPs
    Given I navigate to "ChanelpdpPage"
    Then I should not see the user generated content"customerPhotosContainer"

@notAutomated  @DEBD-350
Scenario: Validate that the user should not be able to see the cuser generated content like videos, photos etc on bundles PDPs
  Given I navigate to "bundlepdpPage"
  Then I should not see the user generated content"customerPhotosContainer"

@manual @DEBD-118
Scenario: Validate that round robin/cross sell container UI on the basis of product availibilty

@automated @PDP @Fixed @DEBD-561
Scenario Outline: Validate that we are able to see the urgency delivery espot for concession products with CC delivery
  Given I navigate to "<Concession Product>"
  Then I should see "deliveryUrgencyDay" containing "Want it by" on "pdpPage"
  Then I should see "deliveryUrgencyTime" containing "Order within" on "pdpPage"
  Then I should see "deliveryUrgencyTime" containing "h" on "pdpPage"
  Then I should see "nextDayUrgentDelMsg" containing "order before 9pm" on "pdpPage"
  Then I should see "clickCollectUrgencyTime" containing "Click & Collect" on "pdpPage"

  Examples:
  |  Concession Product  |
  | ConcessionWomenswear |
  | ConcessionKidswear   |

@automated @PDP @Fixed @DEBD-561
Scenario Outline: Validate that we are able to see the urgency delivery espot for concession products without CC delivery
  Given I navigate to "<Concession Product>"
  Then I should see "deliveryUrgencyDay" containing "Want it by" on "pdpPage"
  Then I should see "deliveryUrgencyTime" containing "Order within" on "pdpPage"
  Then I should see "deliveryUrgencyTime" containing "h" on "pdpPage"
  Then I should see "nextDayUrgentDelMsg" containing "Next Day delivery" on "pdpPage"
  # Then I should see "disabledClickCollectUrgencyTime" exist on "pdpPage"

  Examples:
  | Concession Product |
  | ConcessionMenswear |
  | ConcessionHome     |

@automated @PDP @Fixed @DEBD-561
Scenario Outline: Validate that we are able to see the urgency delivery espot for ownbought products with CC delivery
  Given I navigate to "<Concession Product>"
  Then I should see "deliveryUrgencyDay" containing "Want it by" on "pdpPage"
  Then I should see "deliveryUrgencyTime" containing "Order within" on "pdpPage"
  Then I should see "deliveryUrgencyTime" containing "h" on "pdpPage"
  Then I should see "nextDayUrgentDelMsg" containing "Next Day delivery (order before 9pm)" on "pdpPage"
  #Then I should see "clickCollectUrgencyTime" containing "order before 9pm" on "pdpPage"

  Examples:
  | Concession Product  |
  | OwnBoughtWomenswear |
  | OwnBoughtBeauty     |

@automated @PDP @Fixed @DEBD-561
Scenario Outline: Validate that we are able to see the urgency delivery espot for ownbought products without CC delivery
  Given I navigate to "<Concession Product>"
  Then I should see "deliveryUrgencyDay" containing "Want it by" on "pdpPage"
  Then I should see "deliveryUrgencyTime" containing "Order within" on "pdpPage"
  Then I should see "deliveryUrgencyTime" containing "h" on "pdpPage"
  Then I should see "nextDayUrgentDelMsg" containing "order before 5pm" on "pdpPage"
  Then I should see "disabledClickCollectUrgencyTime" exist on "pdpPage"

  Examples:
  | Concession Product |
  | OwnBoughtHome      |

@manual @DEBD-561
Scenario: Vaidate the clock is decresing with increase in current time

@manual @DEBD-561
Scenario: Vaidate the day is changing in the countdown urgency espot

@manual @DEBD-561
Scenario: Vaidate the countdown timer is not displayed after the cut off time

@manual @DEBD-561
Scenario: Validate IBM have changed the cut off times then they will update on the relevant PDPs

@manual @DEBD-561
Scenario: Validate IBM have disabled or enabled then the espot should be disabled or enabled on the relevant PDPs

@manual @DEBD-561
Scenario: Validate IBM have disabled the espot on certain brands then user will not see it on those brand PDPs and will see it on all other PDPs it is enabled

@manual @DEBD-604 @awsManual
Scenario Outline: validate UI of pdppage dropdown
  Given I navigate to "<pdpPage>" with size and colour dropdown
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

  Examples:
  |                  pdpPage                  |
  | Women - Dresses                           |
  | Mens - Jeans                              |
  | Mens - Suite                              |
  | Lingerie -Bras (With more colour badging) |
  | Luggage                                   |
  | Beauty - Lipstics                         |
  | Kids - Dresses                            |

@manual @DEBD-604
Scenario: validate UI of chanel pdp dropdown
  Given I'm on Chanel PDP with multi color
  When I on dropdown
  Then I should see the border of the dropdown in black colour

@automated @PDP @Fixed @DEBD-604
Scenario: Navigate to PDP page and validate the sizes available in dropdown with out of stock and low stock message
  Given I navigate to "pdpPagewithsizeasdropdown"
  Then I select "Out of Stock" size from "dropdown"
  And I validate "Out of Stock" message from  "dropdown" on  "pdpPage"
  Then I select "low stock" size from "dropdown"
  And I validate "low stock" message from  "dropdown" on  "pdpPage"

@deScoped @DEBD-604
Scenario: Navigate to PDP page and validate the swatches available in swatch dropdown with out of stock and low stock message
  Given I navigate to "pdpPagewithSizeasSwatch"
  Then I select "Out of Stock" size from "swatch"
  And I validate "Out of Stock" message from  "swatch" on  "pdpPage"
  Then I select "low stock" size from "swatch"
  And I validate "low stock" message from  "swatch" on  "pdpPage"

@automated @PDP @Fixed @DEBD-2488
Scenario: Valiadte the Global Delivery Banner is not displayed on PDP page in landscape mode
  Given I navigate to "homeURL"
  Then I should see "deliverybanner" exist on "commonPage"
  And I should see "standardDel" containing "Standard Delivery" on "commonPage"
  And I should see "clickCollectdel" containing "Click & Collect" on "commonPage"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I should see "deliverybanner" exist on "commonPage"
  And I should see "standardDel" containing "Standard Delivery" on "commonPage"
  And I should see "clickCollectdel" containing "Click & Collect" on "commonPage"
  And I should see "internationalDel" containing "Debenhams Rewards Credit Card" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I should not see "deliverybanner" on "commonPage"
  And I should not see "standardDel" on "commonPage"
  And I should not see "clickCollectdel" on "commonPage"
  And I should not see "internationalDel" on "commonPage"


@automated @PDP @Fixed @DEBD-2428
Scenario Outline: Valiadte the selected colour swatch is highlighted in Green except Chanel
Given I navigate to "<Products>"
Then I select available size and add to bag on pdpPage
Then I should verify "border-top-color" of "pdpSelectedSwatch" as "pdpSelectedBorderSwatchColor" on "pdpPage"

  Examples:
  | Products    |
  |beautyLipstickPdpUrl |
  |braUrl |
  |pdpKnitWearProduct |

@automated @PDP @Fixed @DEBD-2428
Scenario: Valiadte the selected colour swatch is highlighted in Black for Chanel
Given I navigate to "chanelLipstickPdp"
Then I select available size and add to bag on pdpPage
Then I should verify "border-top-color" of "pdpSelectedSwatch" as "pdpChanelSelectedBorderSwatchColor" on "pdpPage"

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
Given I am on a PDP
Then the ATB button and quanitity selector will be inline

@manual @DEBD-2504
Scenario: Validate the save for later icon will be positioned inline with the Brand
Given I am on a PDP
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


