Feature: Test Debenhams footer links on Home Page and Payment Page

@automated  @DDAI-291
Scenario Outline: verify that the delivery Options are present
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I wait for "5000" milliseconds
  #When I am in view of "deliveryOptions" on "commonPage"
  Then I should see "deliveryOptions" exist on "commonPage"
  When I am in view of "subscribeToNewsletter" on "commonPage"
  Then I enter "<email>" in "subscribeEmail" on "commonPage"
  Then I click on "subscribeButton" on "commonPage"
  And I wait for "5000" milliseconds
  Then I should see "url" contains "https://pages.e.debenhams.com/"
  Then I go back to previous page

  Examples:
    | email         |
    | abc@gmail.com |

@automated @DDAI-291
Scenario: Verify that the social media links are working
  Given I navigate to "homeURL"
  When I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  #Then I should select country as "countryIreland"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "countryselectorbtn" on "commonPage"
  When I am in view of "socialMediaSection" on "commonPage"
  #Then I should see "socialMediaSection" exist on "commonPage"
  #Then I verify "href" of "socialMediaFacebook" as "socialMediaLinkFacebook" on "commonPage"
  #Then I verify "href" of "socialMediaTwitter" as "socialMediaLinkTwitter" on "commonPage"
  #Then I verify "href" of "socialMediaPinterest" as "socialMediaLinkPinterest" on "commonPage"
  #Then I verify "href" of "socialMediaInstagram" as "socialMediaLinkInstagram" on "commonPage"
  #Then I verify "href" of "socialMediaYoutube" as "socialMediaLinkYoutube" on "commonPage"

@manual @DDAI-291
Scenario: Navigate to Debenhams PSP page and validate the Verified by visa icons that appear in footer
  Given: I am on Australia PSP Page.
  Then : I Navigate to bottom of the page
  Then : I should see "Verified by visa icons" on the page
  And  : I Should see 3 verified by visa logos
  When : I click on these logos i should navigate to faq page


@automated  @DDAI-265
Scenario: Verify that the footer menu section option-Customer Service and the href links of the options available under it
  Given I navigate to "homeURL"
  When I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "countryselectorbtn" on "commonPage"
  When I am in view of "footerMenuSection" on "commonPage"
  Then I should see "footerMenuCustomerService" as "Customer Service" on "commonPage"
  Then I click on "footerMenuCustomerService" on "commonPage"
  When I am in view of "custSerSubMenuHelp" on "commonPage"
  Then I verify "href" of "custSerSubMenuTrackOrd" as "custSerSubMenuTrackOrdLink1" on "commonPage"
  Then I verify "href" of "custSerSubMenuReturns" as "custSerSubMenuReturnsLink2" on "commonPage"
  Then I verify "href" of "custSerSubMenuDelivery" as "custSerSubMenuDeliveryLink3" on "commonPage"
  Then I verify "href" of "custSerSubMenuMyOrder" as "custSerSubMenuMyOrderLink4" on "commonPage"
  Then I verify "href" of "custSerSubMenuHelp" as "custSerSubMenuHelpLink5" on "commonPage"
  Then I verify "href" of "custSerSubMenuGetInTouch" as "custSerSubMenuGetInTouchLink6" on "commonPage"
  Then I click on "footerMenuCustomerService" on "commonPage"

@automated @DDAI-265
Scenario: Verify that the footer menu section option-Shopping With Us and the href links of the options available under it
  Given I navigate to "homeURL"
  When I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "countryselectorbtn" on "commonPage"
  When I should see "footerMenuShoppingWithUs" as "Shopping with us" on "commonPage"
  Then I click on "footerMenuShoppingWithUs" on "commonPage"
  Then I verify "href" of "ShoppingWithUsSubMenuStoreFinder" as "ShoppingWithUsSubMenuStoreFinderLink1" on "commonPage"
  Then I verify "href" of "ShoppingWithUsSubMenuShopByProductInt" as "ShoppingWithUsSubMenuShopByProductLink6" on "commonPage"
  Then I click on "footerMenuShoppingWithUs" on "commonPage"

@automated @DDAI-265
Scenario: Verify that the footer menu section option-About Us and the href links of the options available under it
  Given I navigate to "homeURL"
  When I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "countryselectorbtn" on "commonPage"
  When I am in view of "footerMenuSection" on "commonPage"
  Then I should see "footerMenuAboutUs" as "About us" on "commonPage"
  Then I click on "footerMenuAboutUs" on "commonPage"
  When I am in view of "footerMenuAboutUs" on "commonPage"
  Then I verify "href" of "AboutUsSubMenuDebenhamsCorporateInt" as "AboutUsSubMenuDebenhamsCorporateLink3" on "commonPage"
  Then I verify "href" of "AboutUsSubMenuCareersInt" as "AboutUsSubMenuCareersLink4" on "commonPage"
  Then I verify "href" of "AboutUsSubMenuDebenhamsPressInt" as "AboutUsSubMenuDebenhamsPressLink6" on "commonPage"
  Then I click on "footerMenuAboutUs" on "commonPage"


@manual @DDAI-41
Scenario: Navigate to Debenhams Payment page and validate the reduced footer options that appear
  Given: I am on Australia Payment Page.
  Then : I Navigate to bottom of the page and check footer links
  Then : I should see footer links on the page

@manual @DDAI-41
Scenario: Navigate to Debenhams Payment page and validate the reduced footer options that appear
  Given: I am on France Payment Page.
  Then : I Navigate to bottom of the page and check footer links
  Then : I should see footer links on the page
