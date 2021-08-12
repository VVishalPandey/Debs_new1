Feature: Test Debenhams Regression scenarios 1 to 7

@automated @ops-TABLET-ROI @HomePage @Sno-1
Scenario: Validate that the mobify tag is loaded on mobile
  Given I navigate to "homeURL" and validate that the mobify tag is present

@automated @ops-TABLET-ROI @HomePage @Sno.-2 @Sno.-3
Scenario: Validate GDPR cookie banner 'click here' and 'Manage cookies' link
  Then I should see "cookieBanner" exist on "commonPage"
  Then I should verify "cookieBanner" "position" as "fixed" on "commonPage"
  Then I should see "cookieClickHereLink" exist on "commonPage"
  Then I verify "href" of "cookieClickHereLink" as "cookieClickHereUrl" on "commonPage"
  Then I should see "manageCookieButton" exist on "commonPage"
  Then I verify "href" of "manageCookieButton" as "manageCookieUrl" on "commonPage"

@automated @ops-TABLET-ROI @HomePage @Sno.-4
Scenario: Validate GDPR cookie banner 'Accept cookie' functionality
  Then I should see "acceptCookieButton" exist on "commonPage"
  When I click on "acceptCookieButton" on "commonPage"
  Then I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  And I click on "countrySelectorpopupclose" on "commonPage"

@automated @ops-TABLET-ROI @HomePage @Sno.-5
Scenario: Validate the HomePage navigation menu, content and footer navigation
  Then I click on "debenhamsLogo" on "commonPage"
  Then I should see "menuIcon" exist on "commonPage"
  Then I should see "searchIcon" exist on "commonPage"
  Then I should see "debenhamsLogo" exist on "commonPage"
  Then I should see "saveForLaterHeader" exist on "commonPage"
  Then I should see "miniBagHeader" exist on "commonPage"

@automated @ops-TABLET-ROI @HomePage @Sno.-5
Scenario: Validate the HomePage delivery options
  # When I am in view of "deliveryOptions" on "commonPage"
  # Then I should see "deliveryOptions" exist on "commonPage"
  Then I verify "href" of "standardDelivery" as "standardDeliveryLink" on "commonPage"
  Then I verify "href" of "nextDayClickCollectDelivery" as "nextDayClickCollectDeliveryLink" on "commonPage"
  # Then I verify "href" of "internationalDelivery" as "internationalDeliveryLink" on "commonPage"

@automated @ops-TABLET-ROI @HomePage @Sno.-5
Scenario: Validate the Global menu options for guest user
  When I click on "menuIcon" on "commonPage"
  And I wait for "3000" milliseconds
  Then I should see nav menu back option as "Dresses"
  When I click on nav menu back option as "Dresses"
  Then I should see nav menu back option as "Women"
  When I click on nav menu back option as "Women"

@automated @ops-TABLET-ROI @HomePage @Sno.-5
Scenario: Validate the Global menu options for guest user
  Then I "validate" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Furniture" on "commonPage"
  And I should see value of position "14" as "Create Account/Sign In"
  And I should see value of position "15" as "Saved Items"
  And I should see value of position "16" as "Store Finder"
  And I should see value of position "17" as "Help & Support"

@automated @ops-TABLET-ROI @HomePage @Sno.-5
Scenario: Validate the Global menu options for signed in user
  When I am on my details page
  Then I click on "menuIcon" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Furniture" on "commonPage"
  And I should see value of position "14" as "My Account"
  And I should see value of position "15" as "Saved Items"
  And I should see value of position "16" as "Store Finder"
  And I should see value of position "17" as "Help & Support"
  And I should see value of position "18" as "Sign Out"
  And I should see "closeIcon" exist on "commonPage"

@automated @ops-TABLET-ROI @HomePage @Sno.-5
Scenario: Validate that all the HomePage content along with finace banner is displayed
  Then I click on "closeIcon" on "commonPage"
  Then I click on "debenhamsLogo" on "commonPage"
  And I should see "heroImageContainer" exist on "homePage"
  #And I verify "src" of "uberComponentImage" as "uberImageSource" on "commonPage"
  And I should see "shopNowLink" exist on "commonPage"
  And I should see "slimBanner" exist on "commonPage"
  #And I should see "twoHeroSpotImage" exist on "commonPage"
  And I should see "offerSaleBanner" exist on "commonPage"
  #And I should see "fourHeroSpotImages" exist on "commonPage"
  And I should see "beautySpotLightContainer" exist on "commonPage"
  And I should see "termsAndConditionLink" exist on "commonPage"

@automated @ops-TABLET-ROI @HomePage @Sno.-5
Scenario: Verify that the social media links are working
  When I am in view of "socialMediaSection" on "commonPage"
  Then I should see "socialMediaSection" exist on "commonPage"
  Then I verify "href" of "socialMediaFacebook" as "socialMediaLinkFacebook" on "commonPage"
  Then I verify "href" of "socialMediaTwitter" as "socialMediaLinkTwitter" on "commonPage"
  Then I verify "href" of "socialMediaPinterest" as "socialMediaLinkPinterest" on "commonPage"
  Then I verify "href" of "socialMediaInstagram" as "socialMediaLinkInstagram" on "commonPage"
  Then I verify "href" of "socialMediaYoutube" as "socialMediaLinkYoutube" on "commonPage"

@automated @ops-TABLET-ROI @HomePage @Sno.-5
Scenario: Verify that the footer menu section option-Customer Service and the href links of the options available under it
  When I am in view of "footerMenuSection" on "commonPage"
  Then I "validate & click" option is available in "footerMenuList" as "Customer Service" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Track an order" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Returns & refunds" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Delivery information" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Get in touch" on "commonPage"

@automated @ops-TABLET-ROI @HomePage @Sno.-5
Scenario: Verify that the footer menu section option-Shopping With Us and the href links of the options available under it
  Then I "validate & click" option is available in "footerMenuList" as "Shopping with us" on "commonPage"
  And I "validate" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Store Finder" on "commonPage"
  And I "validate" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Giftcards & vouchers" on "commonPage"
  And I "validate" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Personal shopper" on "commonPage"
  #And I "validate" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Black Friday" on "commonPage"

@automated @ops-TABLET-ROI @HomePage @Sno.-5
Scenario: Verify that the footer menu section option-About Us and the href links of the options available under it
  Then I "validate & click" option is available in "footerMenuList" as "About us" on "commonPage"
  And I "validate" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Debenhams corporate" on "commonPage"
  And I "validate" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Careers" on "commonPage"

@automated @ops-TABLET-ROI @HomePage @Sno.-5
Scenario Outline: verify that the delivery Options are present
  When I am in view of "subscribeToNewsletter" on "commonPage"
  Then I enter "<email>" in "subscribeEmail" on "commonPage"
  Then I click on "subscribeButton" on "commonPage"
  And I wait for "5000" milliseconds
  Then I should see "url" contains "https://pages.e.debenhams.com/"
  Then I go back to previous page

  Examples:
    | email         |
    | abc@gmail.com |

@automated @ops-TABLET-ROI @HomePage @Sno.-6
Scenario: Verify the country selector pop up
  When I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  And I click on "countrySelectorpopupclose" on "commonPage"
  Then I should not see "chooseyourcountry" on "commonPage"
  When I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  And I should verify the country flag for "au"
  And I should see "countryCurrency" containing "$" on "commonPage"
  And I should see "goButton" exist on "commonPage"
  And I should see "countrySelectorCancelBtn" exist on "commonPage"
  And I should see "countrySelectorpopupclose" exist on "commonPage"
  Then I click on "countrySelectorCancelBtn" on "commonPage"
  Then I should not see "chooseyourcountry" on "commonPage"

@automated @ops-TABLET-ROI @HomePage @Sno.-7
Scenario Outline: Verify the store finder functionality
  Given I logout
  When I click on "menuIcon" on "commonPage"
  When I click on "Store Finder" position "16"
  Then I should see "url" contains "content/find-a-store"
  And I should see "headerText" as "Store Finder" on "storeFinderPage"
  And I should see "storeFinderField" exist on "storeFinderPage"
  And I should see "storeFinderButton" exist on "storeFinderPage"
  And I should not see "mapImage" on "storeFinderPage"
  When I enter "<storeFinderName>" in "storeFinderField" on "storeFinderPage"
  And I click on "storeFinderButton" on "storeFinderPage"
  Then I should see "storeFinderEnteredText" as "<storeFinderName>" on "storeFinderPage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"

  Examples:
    | storeFinderName | max_count |
    | Limerick        | 5         |

@automated @ops-TABLET-ROI @HomePage @Sno.-7
Scenario Outline: Validate the first store locator details in result area
  Then I should see "firstStoreDetails" as "<firstStoreName>" on "storeFinderPage"
  When I click on "firstStoreDetails" on "storeFinderPage"
  Then I should see "storeDetailName" as "<firstStoreName>" on "storeFinderPage"
  And I should see "headerText" as "Store Finder" on "storeFinderPage"
  And I should see "mapImage" exist on "storeFinderPage"

  Examples:
    | firstStoreName         |
    | LIMERICK               |

