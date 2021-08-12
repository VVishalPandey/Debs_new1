Feature: Test Debenhams Regression scenarios 1 to 7 covering mobify tag, HomePage, GDPR, Country selector and Store finder

@automated @ops-INT @Sno.-1
Scenario: Validate that the mobify tag is loaded on mobile
  Given I navigate to "intHomeURL" and validate that the mobify tag is present
  And I wait for "12000" milliseconds

@automated @ops-INT @Sno.-3 @Sno.-4
Scenario: Validate GDPR cookie banner 'click here' and 'Manage cookies' link
  Then I should see "cookieBanner" exist on "commonPage"
  Then I should verify "cookieBanner" "position" as "fixed" on "commonPage"
  Then I should see "cookieClickHereLink" exist on "commonPage"
  Then I verify "href" of "cookieClickHereLink" as "cookieClickHereUrl" on "commonPage"
  Then I should see "manageCookieButton" exist on "commonPage"
  Then I verify "href" of "manageCookieButton" as "manageCookieUrl" on "commonPage"

@automated @ops-INT @Sno.-5
Scenario: Validate GDPR cookie banner 'Accept cookie' functionality
  Then I should see "acceptCookieButton" exist on "commonPage"
  When I click on "acceptCookieButton" on "commonPage"
  And I "validate & click" country as "United Kingdom" from "countryOptions" on "commonPage"
  And I wait for "3000" milliseconds
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  And I click on "countrySelectorpopupclose" on "commonPage"

@automated @ops-INT @Sno.-2
Scenario: Validate the HomePage navigation menu, content and footer navigation
  Given I click on "debenhamsLogo" on "commonPage"
  Then I should see "menuIcon" exist on "commonPage"
  Then I should see "searchIcon" exist on "commonPage"
  Then I should see "debenhamsLogo" exist on "commonPage"
  Then I should see "saveForLaterHeader" exist on "commonPage"
  Then I should see "miniBagHeader" exist on "commonPage"

 @automated @ops-INT @Sno.-2
 Scenario: Validate the HomePage delivery options
  Then I click on "debenhamsLogo" on "commonPage"
  Then I verify "href" of "standardDelivery" as "standardDeliveryLink" on "commonPage"
  Then I verify "href" of "refundReturnForPayPalCustomer" as "refundReturnForPayPalCustomerLink" on "commonPage"

 @automated @ops-TABLET @HomePage @Sno.-2
 Scenario: Validate the Global menu options for guest user
  When I click on "menuIcon" on "commonPage"
  And I wait for "3000" milliseconds
  Then I should see nav menu back option as "Dresses"
  When I click on nav menu back option as "Dresses"
  Then I should see nav menu back option as "Women"
  When I click on nav menu back option as "Women"


 @automated @ops-INT @Sno.-2
 Scenario: Validate the Global menu options for guest user
  When I click on "menuIcon" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Weddings" on "commonPage"
  And I should see value of position "11" as "Create Account/Sign In"
  And I should see value of position "12" as "Saved Items"
  And I should see value of position "13" as "Help & Support"
  Then I click on "closeIcon" on "commonPage"


@automated @ops-INT @Sno.-2
 Scenario: Validate the Global menu options for signed in user
  When I am on my details page
  Then I click on "menuIcon" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate" option is available in "mainMenuList" as "Weddings" on "commonPage"
  And I should see value of position "11" as "My Account"
  And I should see value of position "12" as "Saved Items"
  And I should see value of position "13" as "Help & Support"
  And I should see value of position "14" as "Sign out"
  And I should see "closeIcon" exist on "commonPage"
  Then I click on "closeIcon" on "commonPage"

@automated @ops-INT @Sno.-2
 Scenario: Validate that all the HomePage content along with finace banner is displayed
  Then I click on "debenhamsLogo" on "commonPage"
  And I should see "heroImageContainer" exist on "homePage"
  #And I verify "src" of "uberComponentImage" as "uberImageSource" on "commonPage"
  And I should see "shopNowLink" exist on "commonPage"
  #And I should see "slimBanner" exist on "commonPage"
  #And I should see "twoHeroSpotImage" exist on "commonPage"
  And I should see "offerSaleBanner" exist on "commonPage"
  #And I should see "fourHeroSpotImages" exist on "commonPage"
  And I should see "termsAndConditionLink" exist on "commonPage"


@automated @ops-INT @Sno.-2
Scenario: Verify that the social media links are working
  When I am in view of "socialMediaSection" on "commonPage"
  Then I should see "socialMediaSection" exist on "commonPage"
  Then I verify "href" of "socialMediaFacebook" as "socialMediaLinkFacebook" on "commonPage"
  Then I verify "href" of "socialMediaTwitter" as "socialMediaLinkTwitter" on "commonPage"
  Then I verify "href" of "socialMediaPinterest" as "socialMediaLinkPinterest" on "commonPage"
  Then I verify "href" of "socialMediaInstagram" as "socialMediaLinkInstagram" on "commonPage"
  Then I verify "href" of "socialMediaYoutube" as "socialMediaLinkYoutube" on "commonPage"

@automated @ops-INT @Sno.-2
Scenario: Verify that the footer menu section option-Customer Service and the href links of the options available under it
  When I am in view of "footerMenuSection" on "commonPage"
  Then I "validate" option is available in "footerMenuList" as "Customer Service" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Track order & returns" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Returns & refunds" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Delivery information" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Get in touch" on "commonPage"

@automated @ops-INT @Sno.-2
Scenario: Verify that the footer menu section option-About Us and the href links of the options available under it
  Then I "validate & click" option is available in "footerMenuList" as "About us" on "commonPage"
  And I "validate" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Debenhams corporate" on "commonPage"
  And I "validate" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Careers" on "commonPage"

@automated @ops-INT @Sno.-2
Scenario Outline: verify subscribe to news letter
  When I am in view of "subscribeToNewsletter" on "commonPage"
  Then I enter "<email>" in "subscribeEmail" on "commonPage"
  Then I click on "subscribeButton" on "commonPage"
  And I wait for "5000" milliseconds
  Then I should see "url" contains "https://pages.e.debenhams.com/"
  Then I go back to previous page

  Examples:
    | email         |
    | abc@gmail.com |

@automated @ops-INT @Sno.-6
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


@automated @ops-INT @Sno.-53
Scenario: Navigate to Debenhams login page and validate create an account title and header with email field as pre-filled
  Given I logout
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I navigate to "loginUrl"
  When I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  Then I enter email in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  And I should see "headerText" as "Create an account" on "registerPage"
  # Then I should see value of "emailAddressField" as "emailAddressFieldCreateAccount" on "registerPage"

@automated @ops-INT @Sno.-53
Scenario: Navigate to Debenhams create account page and validate the form
  Then I should see "headerText" as "Create an account" on "registerPage"
  And I should see "titlefield" exist on "registerPage"
  And I should see "firstNameField" exist on "registerPage"
  And I should see "lastNamefield" exist on "registerPage"
  And I should see "emailAddressField" exist on "registerPage"
  And I should see "passwordField" exist on "registerPage"
  And I should see "createAccountButton" exist on "registerPage"
  And I should see "receiveEmailCheckbox" exist on "registerPage"

@automated @ops-INT @Sno.-53
Scenario Outline: Navigate to Debenhams create account page and validate correct password scenario
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  When I enter "<password>" in "passwordField" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "check" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "check" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "check" on "registerPage"
  Then I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "continueShoppingButton" exist on "newUserPage"

  Examples:
    | firstName | lastname | password  |
    | Test      | User     | password2 |

@automated @ops-INT @Sno.-37
Scenario: Checkout Journey Beauty product Guest User -Add product to Bag
  Given I logout
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I wait for "3000" milliseconds
  Then I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Lingerie" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Bras" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Balcony bras" on "commonPage"
  And I should see "url" contains "lingerie/bras/balcony-bras"
  And I click on "moreColourOptionBadging" on "pspPage"
  Then I navigate to "braUrl"
  And I select available size from "dropdown"
  And I should see "addToCartButtonDisplayInitially" as "No items in the cart." on "mySavedItemPage"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds

@automated @ops-INT @Sno.-37
Scenario: Navigate to payments page with saved address and delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to international delivery options as guest user
  And I should see "deliveryAddressheaderText" as "WHERE ARE WE DELIVERING TO?" on "homeDeliveryPage"
  When I provide Australia address details and navigate to delivery options under it
  Then I should see "internationalOption" exist on "deliveryOptionPage"
  When I click on "internationalOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I verify "href" of "termConditionLink" as "TermAndConditionLink" on "paymentPage"
  Then I verify "href" of "privacyPolicyLink" as "PrivacyPolicyLink" on "paymentPage"



