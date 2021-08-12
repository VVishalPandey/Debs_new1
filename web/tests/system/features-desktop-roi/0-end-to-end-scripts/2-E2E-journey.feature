Feature: Test Debenhams end to end journey number 2

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to sign page and login with e2e credentials
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to women Trainers psp page from menu global navigation
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should not see "storeFinderLink" on "commonPage"
#   And I should see "storeFinderLink" exist on "commonPage"
  And I should see "notYouLink" exist on "commonPage"
  And I should see "helloNameLink" exist on "commonPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I should see "signOutLink" exist on "commonPage"
  When I "validate & click" subMenu option "Trainers" under "Women" on commonPage bigscreen
  #When I navigate to "womenTrainersPSPURL"
  Then I should see "headerText" as "Women's trainers" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  And I should count and validate "totalBrandCount" on "pspPage"
  And I should count and validate "totalProductCount" on "pspPage"
  And I should count and validate "totalSaveIconCount" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the merch set, seo content and normal images on women trainers psp page
  When I am in view of "headerText" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  #And I should see "merchSetSection" exist on "pspPage"
  And I should not see "merchSetSection" on "pspPage"
  #And I count number of "merchSetProducts" to be "<merchSetProductCount>" on "pspPage"
  And I should see "normal" images

  Examples:
    | merchSetProductCount |
    | 3                    |

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to the next page of women's trainers psp page and validate the pagination
  Then I should scroll to "nextButton" on "pspPage"
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  When I click on "nextButton" on "pspPage"
  Then I should see "previousButtonState" "enabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "2" of total on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the merch set and seo content should not exist on page 2 of on women dresses psp
  When I am in view of "headerText" on "pspPage"
  Then I should not see "seoContent" on "pspPage"
  And I should not see "merchSetSection" on "pspPage"
  And I should not see "merchSetProducts" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate sort by price (low-high) on women's dresses psp page number 2
  When I click on "sortOptionPriceLowHighIE" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*min_price"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the user is still on page number 2 after sorting result appears
  Then I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"
  And I should see page number "1" of total on "pspPage"

@automatedSanity @preprodSanity @e2e
Scenario: Open the filter and apply Style -> Lace up trainers & Size -> 3 filter and validate the psp page
  When I am in view of "headerText" on "pspPage"
  When I "validate & click" subFilter option "Lace up trainers" under "Style" on commonPage bigscreen
  And I should see "pspHeader" as "Lace up trainers" on "pspPage"
  When I "validate & click" subFilter option "3" under "Size" on commonPage bigscreen
  And I should see "headerText" containing "Women's trainers" on "pspPage"
  And I should see "pspHeader" as "Lace up trainers, size 3" on "pspPage"
  Then I should scroll to "subscribeToNewsletter" on "commonPage"
  And I should count and validate "imagesOnScreen" on "pspPage"
  And I should see "previousButtonState" "disabled" on "pspPage"
  And I should see "nextButtonState" "enabled" on "pspPage"

@automatedSanity @preprodSanity @e2e @issue-1820
Scenario: Choose first two dresses and same under my saved items from above scenario result psp page
  #When I should scroll to "filterButton" on "pspPage"
  When I am in view of "headerText" on "pspPage"
  When I store value of first "2" products and select save item on pspPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to saved items from global navigation and validate the page
  When I click on "savedItemsButton" on "commonPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the products are saved and appearing under my saved items page
  Then I validate products are saved on mySavedItemPage

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to a dress pdp and validate the FAQ & pdf functionality
  Then I navigate to "chocolatePdpURL"
  And I click on "prodGuideLink" on "pdpPage"
  And I switch to the new window for "PDF" validation and verify the title as "pdfGiftFoodTitle"
  Then I navigate to "testDressPdpURL"
  And I click on "seeMoreInfoLinkROI" on "pdpPage"
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
  When I click on "searchIcon" on "commonPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the size guide link  exist and delivery/returs accodion exits
  Then I should see "sizeGuideLink" exist on "pdpPage"
  And I should see "deliveryReturnText" as "Delivery & Returns" on "pdpPage"
  Then I should see "deliveryReturnHomeDelivery" exist on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the product gets added in my when user select add to bag
  When I click on "searchIcon" on "commonPage"
  Then I add the product to bag and go to my bag page
  Then I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  And I validate the "banner price"
  And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payments page with saved address and delivery option as standard
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should not see "homeDeliveryHeaderText" on "deliveryOptionPage"
  And I should not see "clickCollectHeaderText" on "deliveryOptionPage"
  # When I click on "homeDeliveryOption" on "deliveryOptionPage"
  # And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
  # Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderTextInt" as "Choose your delivery option" on "deliveryOptionPage"
  When I am in view of "deliveryTypeheaderTextInt" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should not see "nextNominatedSectionHeaderText" on "deliveryOptionPage"
  And I should not see "daytimeTab" on "deliveryOptionPage"
  And I should not see "eveningTab" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page for all accordion and place order button
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordion" as "Pay with a Credit or Debit card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page delivery selected, credit card points as selected by user
  Then I should see "deliveryType" as "Standard Delivery" on "paymentPage"
