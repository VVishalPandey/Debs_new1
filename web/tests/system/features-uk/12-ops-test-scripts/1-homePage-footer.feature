Feature: Test Debenhams ops test script journey number 1

@automated @opsTC
Scenario: Verify that the menu options are in correct sequence
  Given I logout
  When I click on "menuIcon" on "commonPage"
  And I should see the value of "menuOptions" in following "menuOptionsSignOut" on "commonPage"
  When I click on "Shop Departments" position "1"
  And I should see the value of "menuOptions" in following "menuOptionsShopDept" on "commonPage"
  Then I click on "closeIcon" on "commonPage"

@automated @opsTC
Scenario Outline: verify that the delivery Options are present
  When I am in view of "deliveryOptions" on "commonPage"
  Then I should see "deliveryOptions" exist on "commonPage"
  When I am in view of "subscribeToNewsletter" on "commonPage"
  Then I enter "<email>" in "subscribeEmail" on "commonPage"
  Then I click on "subscribeButton" on "commonPage"
  And I wait for "5000" milliseconds
  Then I should see "url" contains "http://pages.e.debenhams.com/"
  Then I go back to previous page

  Examples:
    | email         |
    | abc@gmail.com |


@automated @opsTC
Scenario: Verify that the social media links are working
  When I am in view of "socialMediaSection" on "commonPage"
  Then I should see "socialMediaSection" exist on "commonPage"
  Then I verify "href" of "socialMediaFacebook" as "socialMediaLinkFacebook" on "commonPage"
  Then I verify "href" of "socialMediaTwitter" as "socialMediaLinkTwitter" on "commonPage"
  Then I verify "href" of "socialMediaPinterest" as "socialMediaLinkPinterest" on "commonPage"
  Then I verify "href" of "socialMediaInstagram" as "socialMediaLinkInstagram" on "commonPage"
  Then I verify "href" of "socialMediaYoutube" as "socialMediaLinkYoutube" on "commonPage"

@automated @opsTC
Scenario: Verify that the footer menu section option-Customer Service and the href links of the options available under it
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

@automated @opsTC
Scenario: Verify that the footer menu section option-Shopping With Us and the href links of the options available under it
  When I should see "footerMenuShoppingWithUs" as "Shopping with us" on "commonPage"
  Then I click on "footerMenuShoppingWithUs" on "commonPage"
  And I am in view of "ShoppingWithUsSubMenuBookBraFit" on "commonPage"
  Then I verify "href" of "ShoppingWithUsSubMenuStoreFinder" as "ShoppingWithUsSubMenuStoreFinderLink1" on "commonPage"
  Then I verify "href" of "ShoppingWithUsSubMenuStoreServices" as "ShoppingWithUsSubMenuStoreServicesLink2" on "commonPage"
  Then I verify "href" of "ShoppingWithUsSubMenuBeautyClub" as "ShoppingWithUsSubMenuBeautyClubLink3" on "commonPage"
  Then I verify "href" of "ShoppingWithUsSubMenuBuyingGuides" as "ShoppingWithUsSubMenuBuyingGuidesLink4" on "commonPage"
  Then I verify "href" of "ShoppingWithUsSubMenuGiftcards" as "ShoppingWithUsSubMenuGiftcardsLink5" on "commonPage"
  Then I verify "href" of "ShoppingWithUsSubMenuShopByProduct" as "ShoppingWithUsSubMenuShopByProductLink6" on "commonPage"
  Then I verify "href" of "ShoppingWithUsSubMenuPersonalShopper" as "ShoppingWithUsSubMenuPersonalShopperLink7" on "commonPage"
  Then I verify "href" of "ShoppingWithUsSubMenuBookBraFit" as "ShoppingWithUsSubMenuBookBraFitLink8" on "commonPage"
  Then I click on "footerMenuShoppingWithUs" on "commonPage"

@automated @opsTC
Scenario: Verify that the footer menu section option-About Us and the href links of the options available under it
  When I am in view of "footerMenuSection" on "commonPage"
  Then I should see "footerMenuAboutUs" as "About us" on "commonPage"
  Then I click on "footerMenuAboutUs" on "commonPage"
  When I am in view of "AboutUsSubMenuDebenhamsPress" on "commonPage"
  Then I verify "href" of "AboutUsSubMenuAboutDebenhams" as "AboutUsSubMenuAboutDebenhamsLink1" on "commonPage"
  Then I verify "href" of "AboutUsSubMenuModernSlavery" as "AboutUsSubMenuModernSlaveryLink2" on "commonPage"
  Then I verify "href" of "AboutUsSubMenuDebenhamsCorporate" as "AboutUsSubMenuDebenhamsCorporateLink3" on "commonPage"
  Then I verify "href" of "AboutUsSubMenuCareers" as "AboutUsSubMenuCareersLink4" on "commonPage"
  Then I verify "href" of "AboutUsSubMenuDebenhamsSupports" as "AboutUsSubMenuDebenhamsSupportsLink5" on "commonPage"
  Then I verify "href" of "AboutUsSubMenuDebenhamsPress" as "AboutUsSubMenuDebenhamsPressLink6" on "commonPage"
  Then I click on "footerMenuAboutUs" on "commonPage"

@automated @opsTC
Scenario: Verify that the footer menu section option-More From Debenhams and the href links of the options available under it
  When I am in view of "footerMenuSection" on "commonPage"
  Then I should see "footerMenuMoreFromDebenhams" as "More from Debenhams" on "commonPage"
  Then I click on "footerMenuMoreFromDebenhams" on "commonPage"
  When I am in view of "MoreFromDebenhamsSubMenuBlowLTD" on "commonPage"
  Then I verify "href" of "MoreFromDebenhamsSubMenuDebenhamsCards" as "MoreFromDebenhamsSubMenuDebenhamsCardsLink1" on "commonPage"
  Then I verify "href" of "MoreFromDebenhamsSubMenuTravelMoney" as "MoreFromDebenhamsSubMenuTravelMoneyLink2" on "commonPage"
  Then I verify "href" of "MoreFromDebenhamsSubMenuDebenhamsInsurance" as "MoreFromDebenhamsSubMenuDebenhamsInsuranceLink3" on "commonPage"
  Then I verify "href" of "MoreFromDebenhamsSubMenuStyleDebrief" as "MoreFromDebenhamsSubMenuStyleDebriefLink4" on "commonPage"
  Then I verify "href" of "MoreFromDebenhamsSubMenuLetsTalk" as "MoreFromDebenhamsSubMenuLetsTalkLink5" on "commonPage"
  Then I verify "href" of "MoreFromDebenhamsSubMenuDebenhamsBlog" as "MoreFromDebenhamsSubMenuDebenhamsBlogLink6" on "commonPage"
  Then I verify "href" of "MoreFromDebenhamsSubMenuBlowLTD" as "MoreFromDebenhamsSubMenuBlowLTDLink7" on "commonPage"
  Then I click on "footerMenuMoreFromDebenhams" on "commonPage"
