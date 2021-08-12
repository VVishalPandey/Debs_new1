Feature: Test Debenhams end to end journey number 2

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to sign page and login with e2e credentials
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to women dresses psp page from menu global navigation
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "notYouLink" exist on "commonPage"
  And I should see "helloNameLink" exist on "commonPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I should see "signOutLink" exist on "commonPage"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  #When I navigate to "womenMaxiPSPURL"
  Then I should see "headerText" as "Maxi dresses" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  And I should count and validate "totalBrandCount" on "pspPage"
  And I should count and validate "totalProductCount" on "pspPage"
  And I should count and validate "totalSaveIconCount" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the merch set, seo content and large images on women dresses psp page
 When I am in view of "headerText" on "pspPage"
 Then I should see "large" images
 And I should see "seoContent" exist on "pspPage"
 #And I should see "merchSetSection” exist on "pspPage"
 And I should not see "merchSetSection" on "pspPage"
 #And I count number of "merchSetProducts" to be "<merchSetProductCount>" on "pspPage"

  Examples:
    | merchSetProductCount |
    |                    3 |

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to the next page of women's dresses psp page and validate the pagination
  Then I should scroll to "nextButton" on "pspPage"
  And I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"
  And I should see "headerText" as "Maxi Dresses" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  And I should count and validate "totalBrandCount" on "pspPage"
  And I should count and validate "totalProductCount" on "pspPage"
  And I should count and validate "totalSaveIconCount" on "pspPage"
  And I should see "large" images

@automatedSanity @preprodSanity @e2e
Scenario: Validate the merch set and seo content should not exist on page 2 of on women dresses psp
  When I am in view of "headerText" on "pspPage"
  Then I should not see "seoContent" on "pspPage"
  And I should not see "merchSetSection" on "pspPage"
  And I should not see "merchSetProducts" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (low-high) on women's dresses psp page number 2
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*price"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  And I should count and validate "totalBrandCount" on "pspPage"
  And I should count and validate "totalProductCount" on "pspPage"
  And I should count and validate "totalSaveIconCount" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the user is on page number 1 after sorting result appears and merch set, seo content and large images should be on page
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "1" of total on "pspPage"
  And I should see "seoContent" exist on "pspPage"
  #And I should see "merchSetSection" exist on "pspPage"
  #And I count number of "merchSetProducts" to be "<merchSetProductCount>" on "pspPage"
  And I should see "large" images

  Examples:
    | merchSetProductCount |
    |                    3 |

@automatedSanity @preprodSanity @e2e
Scenario: Open the filter and apply Occasion -> Evening & Brand -> Phase Eight filter and validate the psp page
  When I "validate & click" subFilter option "Evening" under "Occasion" on commonPage bigscreen
  And I should see "headerText" as "Evening Maxi Dresses" on "pspPage"
  When I "validate & click" subFilter option "Mela London" under "Brand" on commonPage bigscreen
  And I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "pspHeader" as "Mela London, Maxi Dresses, Evening" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should validate "products" exist on "pspPage"
  And I should not see "previousButtonState" "disabled" on "pspPage"
  And I should not see "nextButtonState" "enabled" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Choose first two dresses and same under my saved items from above scenario result psp page
  When I am in view of "headerText" on "pspPage"
  Then I store value of first "2" products and select save item on pspPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to saved items from global navigation and validate the page
  When I click on "savedItemsButton" on "commonPage"

  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the products are saved and appearing under my saved items page
  Then I validate products are saved on mySavedItemPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to a dress pdp and validate the FAQ & pdf functionality
  Then I navigate to "alcoholPDPURL"
  And I click on "prodGuideLink" on "pdpPage"
  And I switch to the new window for "PDF" validation and verify the title as "pdfGiftFoodTitle"
  Then I navigate to "testDressPdpURL"
  And I click on "seeMoreInfoLink" on "pdpPage"
  And I switch to the new window for "FAQ" validation and verify the title as "faqTitle"
  Then I navigate to "testDress2PdpURL"
  And I click on "sizeGuideLink" on "pdpPage"
  And I switch to the new window for "SIZEGUIDE" validation and verify the title as "sizeGuideTitle"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to a dress pdp and validate the zoom functionality
  Then I navigate to "testDressPdpURL"
  When I click on "mainImageContainer" on "pdpPage"
  Then I should see "zoomedImagePopUp" exist on "pdpPage"
  Then I should see "closeIconOnzoomedImagePopUp" exist on "pdpPage"
  When I click on "closeIconOnzoomedImagePopUp" on "pdpPage"
  Then I should not see "zoomedImagePopUp" on "pdpPage"
  Then I should not see "closeIconOnzoomedImagePopUp" on "pdpPage"
  Then I click on "searchIcon" on "commonPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the size guide link  exist and delivery/returs accodion exits
  Then I should see "sizeGuideLink" exist on "pdpPage"
  And I should see "deliveryReturnText" as "Delivery & Returns" on "pdpPage"
  Then I should see "deliveryReturnHomeDelivery" exist on "pdpPage"
  And I should see "deliveryReturnClickCollect" exist on "pdpPage"
  And I should see "deliveryReturnIntDelivery" exist on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the product gets added in my when user select add to bag
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later
#   And I validate the "banner price"
#   And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should see "globalNavMenuOptions" exist on "commonPage"
  And I should not see "myBagDisabled" on "myBagPage"

@automatedSanity @DEBD-4050
Scenario: Validate that the  reduced header is displayed when the mvt is  set to 1
  And I set mvt test for "myBagHeader" as "variation1"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I should see "signOutLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  And I should see "myBagDisabled" exist on "myBagPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payments page with saved address and delivery option as standard
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
  Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  #And I click on "useAddressDropDown" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  When I am in view of "deliveryTypeheaderText" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should not see "nextNominatedSectionHeaderText" on "deliveryOptionPage"
  And I should not see "daytimeTab" on "deliveryOptionPage"
  And I should not see "eveningTab" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within five working days" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page for all accordion and place order button
  #Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page delivery selected, credit card points as selected by user
  #Then I should see "creditCardPointText" containing "Points by paying with your Debenhams Credit Card." on "paymentPage"
  And I validate "credit card points" value from mybag
  And I should see "deliveryType" as "Standard Delivery" on "paymentPage"
