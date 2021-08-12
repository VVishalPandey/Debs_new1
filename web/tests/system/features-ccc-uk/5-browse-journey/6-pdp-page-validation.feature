Feature: Test Debenhams pdp page validation

@automated @DEBD-263
Scenario: Login to CCC site
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"

@automated @PDP @Fixed @DEBD-111
Scenario Outline: Validate the breadcrumb section and validate navigation to psp page when selected last breadcrump
  # Given I logout
  # When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Given I navigate to "womenMaxiPspPage"
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
  Then I should see "pspHeaderText" as "WOMEN'S CLOTHING & ACCESSORIES" on "pspPage"
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

@automated @PDP @Fixed @DEBD-115
Scenario Outline: Validate the shop more tags and select tag 3 for Brand The Collection to navigate to psp page
  Given I navigate to "testDressPdpURL"
  When I am in view of "shopMoreTag1Text" on "pdpPage"
  Then I should see "shopMoreTag1Text" as "<tag_name_1>" on "pdpPage"
  And I should see "shopMoreTag2Text" as "<tag_name_2>" on "pdpPage"
  And I should see "shopMoreTag3Text" as "<tag_name_3>" on "pdpPage"
  When I click on "shopMoreTag3Text" on "pdpPage"
  Then I should see "searchText" as "The Collection" on "pspPage"
  And I should see "url" contains "/the-collection"

  Examples:
    | tag_name_1 | tag_name_2 |   tag_name_3   |
    | Women      | Dresses    | THE COLLECTION |

@automated @PDP @Fixed @DEBD-113 @DEBD-117
Scenario: Validate the product description section having pdf link
  Given I navigate to "testDressPdpURL"
  Then I should see "productDescriptionLink" exist on "pdpPage"
  When I click on "productDescriptionLink" on "pdpPage"
  Then I should see "prodDescHeaderText" as "Product description" on "pdpPage"
  Then I should see "prodDescItemNumber" exist on "pdpPage"
  And I should see "prodGuideLink" exist on "pdpPage"

@automated @PDP @Fixed @DEBD-123 @DEBD-113
Scenario: Navigate to chanel pdp from furniture pdp and validate the recently viewed container is not visible
  When I navigate to "testFurniturePdpURL"
  Then I select available size and add to bag on pdpPage
  And I navigate to "testChanelPerfPdpURL"
  #Then I should not see "roundRobinSection" on "pdpPage"
  #And I should not see "baynoteSection" on "pdpPage"
  And I should see "saveForLaterButton" exist on "pdpPage"
  And I should not see "creditCardValuePoints" on "pdpPage"
  And I should not see "beautyClubValuePoints" on "pdpPage"
  And I should not see "recentlyViewed" on "pdpPage"
  And I should not see "reviewSection" on "pdpPage"

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

@notAutomated @PDP @Fixed @DEBD-109
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








