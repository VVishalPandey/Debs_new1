Feature: Test Debenhams Dotie pdp page validation

@manual @DBMTE-671
Scenario: Navigate to dress psp page and validate the brand and product name of first product should match the pdp page
  Given I logout
  And I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"

@manual @DBMTE-671
Scenario Outline: Validate the breadcrumb section and validate navigation to dresses psp page when selected
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

@manual @DBMTE-671
Scenario Outline: Validate on selecting Women from breadcrumb user should navigate to psp page
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should see "breadcrumbSection" exist on "pdpPage"
  And I should see "firstBreadcrumb" exist on "pdpPage"
  And I should see "firstBreadcrumb" as "<breadcrumb_1>" on "pdpPage"
  And I should see "secondBreadcrumb" as "<breadcrumb_2>" on "pdpPage"
  And I should see "thirdBreadcrumb" as "<breadcrumb_3>" on "pdpPage"
  When I click on "secondBreadcrumb" on "pdpPage"
  Then I should see "headerText" as "Women's clothing & accessories" on "pspPage"
  And I should see "url" contains "/women"

  Examples:
    | breadcrumb_1 | breadcrumb_2 | breadcrumb_3 |
    | Home         | Women        | Dresses      |

@manual @DBMTE-671
Scenario: Navigate to dress pdp page from above scenario and validate the shop more tags that appears on the page
  When I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreText" as "Shop more" on "pdpPage"
  And I should see "shopMoreTag1Text" as "Women" on "pdpPage"
  And I should see "shopMoreTag2Text" as "Dresses" on "pdpPage"
  And I should see "shopMoreTag3Text" as Brand Name on "pdpPage"

@manual @DBMTE-671
Scenario Outline: Validate the shop more tags and select tag 2 Dresses to navigate to psp page
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  When I click on "shopMoreTag2Text" on "pdpPage"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "url" contains "/women/dresses"

  Examples:
    | tag_name_1 | tag_name_2 |
    | Women      | Dresses    |

@manual @DBMTE-671
Scenario Outline: Validate the shop more tags and select tag 1 Women to navigate to psp page
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  When I click on "shopMoreTag1Text" on "pdpPage"
  Then I should see "headerText" as "Women's clothing & accessories" on "pspPage"
  And I should see "url" contains "/women"

  Examples:
    | tag_name_1 | tag_name_2 |
    | Women      | Dresses    |

@manual @DBMTE-671
Scenario Outline: Validate the shop more tags and select tag 3 for Brand Mantaray to navigate to psp page
  Given I navigate to "testDressPdpURL"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  When I click on "shopMoreTag3Text" on "pdpPage"
  Then I should see "searchText" as "The Collection" on "pspPage"
  And I should see "url" contains "/the-collection"

  Examples:
    | tag_name_1 | tag_name_2 | tag_name_3     |
    | Women      | Dresses    | The Collection |

@manual @DBMTE-671 @Issue95
Scenario: Navigate to chanel pdp from furniture pdp and validate the recently viewed container is not visible
  When I navigate to "testFurniturePdpURL"
  And I navigate to "testChanelPerfPdpURL"
  Then I should not see "roundRobinSection" on "pdpPage"
  And I should not see "baynoteSection" on "pdpPage"
  And I should see "saveForLaterButton" exist on "pdpPage"
  And I should not see "rewardCardValuePoints" on "pdpPage"
  And I should not see "recentlyViewed" on "pdpPage"
  And I should not see "reviewSection" on "pdpPage"

@manual @DBMTE-671
Scenario: Navigate to dress pdp page after chanel pdp and validate the recently viewed container is visible with the first product as furniture
  When I navigate to "testDressPdpURL"
  Then I should see "saveForLaterButton" exist on "pdpPage"
  And I should see "rewardCardValuePoints" exist on "pdpPage"
  And I am in view of "recentlyViewed" on "pdpPage"
  Then I should see "recentlyViewedText" as "Recently Viewed" on "pdpPage"
  And I verify "href" of "recentlyViewedProduct1" containing "testFurniturePdpHrefURL" on "pdpPage"

@manual @DBMTE-671
Scenario: Validate the financial banner section will not be available on pdp page

@manual @DBMTE-671
Scenario: Validate the review section on the dresses pdp page
  Then I should see "ratingSummaryInHeader" exist on "pdpPage"
  And I should see "reviewSection" exist on "pdpPage"
  When I am in view of "reviewHeaderText" on "pdpPage"
  Then I should see "reviewHeaderText" as "Reviews" on "pdpPage"
  And I should see "reviewSorting" exist on "pdpPage"
  And I should see "reviewWrite" exist on "pdpPage"

@manual @DBMTE-671 @Issue95
Scenario: Navigate to dress pdp page with no reviews and validate the review section
  When I navigate to "testDressPdpNoReview"
  Then I validate the review section with no reviews

@manual @DBMTE-51
Scenario Outline: Validate the product description section on the dresses pdp page
  Then I should see "productDescriptionLink" exist on "pdpPage"
  When I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescHeaderText" as "Product description" on "pdpPage"
  And I should see "prodDescItemNumber" as "<prd_number>" on "pdpPage"

  Examples:
    | prd_number |
    | 0540101170 |

@manual @DBMTE-671
Scenario: Validate the add to bag error message when no size selected
  When I am in view of "pdpImageToZoom" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "nothingSelectedErrorMessage" as "Please select an option" on "pdpPage"

@manual @DBMTE-671
Scenario: Validate the zoom and close zoomed section on the dresses pdp page
  When I am in view of "pdpImageSection" on "pdpPage"
  Then I should not see "pdpCloseZoom" on "pdpPage"
  And I should not see "pdpZoomedImage" on "pdpPage"
  When I click on "pdpImageToZoom" using jquery on "pdpPage"
  Then I should see "pdpZoomedImage" exist on "pdpPage"
  And I should see "pdpCloseZoom" exist on "pdpPage"
  When I click on "pdpCloseZoom" on "pdpPage"
  Then I should not see "pdpCloseZoom" on "pdpPage"
  And I should not see "pdpZoomedImage" on "pdpPage"

@manual @DBMTE-671
Scenario: Navigate to dress pdp page and validate the tap to zoom text which appears on top of first image for 2 seconds
  When I navigate to "testDressPdpNoReview"
  Then I validate the tap to zoom text which appears on top of first image for 2 seconds

@manual @DBMTE-671
Scenario: Navigate to pdp page(s) and validate product details as per desktop
  When I navigate to "pdpPage"
  Then I validate price was, now, then and save
  And I validate name
  And I should see "saveForLaterButton" exist on "pdpPage"
  And I validate quantity selector

@manual @DBMTE-671
Scenario: Navigate to pdp page and validate want it now countdown timer
  When I navigate to "pdpPage"
  Then I validate want it now countdown timer which should be as desktop

@manual @DBMTE-671
Scenario: Navigate to PDP page and validate the sizes available in dropdown with out of stock and low stock message
  Given I navigate to PDP page
  Then I validate the sizes available in dropdown with out of stock and low stock message

@manual @DBMTE-671
Scenario: Validate that round robin & cross sell are hiden on the PDP page and only baynote shoudl be visible if exist

@manual @DBMTE-671
Scenario: Validate that on changinging fabric for a furniture(say sofa) on the PDP page the prices and fabric colour are updated.

@manual @DBMTE-671
Scenario: Navigate to men's suite PDP page from LHN and validate the variances from standard PDP

@manual @DBMTE-671
Scenario: Navigate to luggage set PDP page from LHN and validate the variances from standard PDP

@manual @DBMTE-671
Scenario: Validate user is redirected to reward club card page when clicked on reward point id on pdp page
  Given I am on any PDP page
  When I click on the earn reward points message
  Then I am taken to the join reward club page (http://debenhams.ie/content/about-your-rewards-card)

@notAutomated  @DEBD-513
Scenario: Validate that the user should be able to see the countdown delivery urgency Espot and a teal clock icon
    Given I navigate to "pdpPage"
    Then I should see the countdown delivery urgency Espot
    And I should see the teal clock icon


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

@manual @DEBD-2488
Scenario Outline: Valiadte the Global Delivery Banner is not displayed on PDP page in landscape mode
  Given I navigate to "homeURL"
  Then I verify "href" of "standardDelivery" as "standardDeliveryLink" on "commonPage"
  Then I verify "href" of "nextDayClickCollectDelivery" as "nextDayClickCollectDeliveryLink" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I navigate to "<PspPages>"
  Then I verify "href" of "standardDelivery" as "standardDeliveryLink" on "commonPage"
  Then I verify "href" of "nextDayClickCollectDelivery" as "nextDayClickCollectDeliveryLink" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I should not see "standardDelivery" on "commonPage"
  And I should not see "nextDayClickCollectDelivery" on "commonPage"

  Examples:
  | PspPages   |
  |Women dresses |
  |Chanel |
  |WomenTCAT |
  |Beauty-Lipstick |
  |Lingerie TCAT |
  |Bras |
  |Mens Jeans |
  |Mens TCAT |
  |Furniture TCAT |
  |Sofa |
  |Kids dresses |
  |Cooffe Machine |
  |Search -hats|

@automated @Fixed @DEBD-2428
Scenario Outline: Valiadte the selected colour swatch is highlighted in Green except Chanel
  Given I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  Given I navigate to "<Products>"
  Then I select available size and add to bag on pdpPage
  Then I should verify "border-top-color" of "pdpSelectedSwatch" as "pdpSelectedBorderSwatchColor" on "pdpPage"

  Examples:
  | Products    |
  |beautyLipstickPdpUrl |
  |braUrl |
  |pdpKnitWearProduct |

@manual @DEBD-2428
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
Scenario: Validate the size guide will sit underneath the size container for mobile and tablet
  Given I am on a mobile or tablet PDP
  Then the size guide will sit underneath the size container

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
