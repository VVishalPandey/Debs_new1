Feature: Test Debenhams home page on Desktop

@automated @DEBD-224 @Fixed
Scenario Outline: Validate the delivery options banner  on homePage
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I am in view of "headerMenuSection" on "commonPage"
  Then I should see "deliverybanner" exist on "commonPage"
  And I count number of "deliverybannerOption" to be "<max_count>" on "commonPage"
  And I should see "standardDel" containing "Standard" on "commonPage"
  And I should see "paypalOption" containing "PayPal" on "commonPage"
  And I should see "standardDelIcon" exist on "commonPage"
  And I should see "paypalOptionIcon" exist on "commonPage"

  Examples:
    | max_count |
    | 2         |

@manual @DEBD-224
Scenario: Validate the HREF of the delivery options  on homePage
  Then I should see "headerMenuSection" exist on "homePage"
  And I verify "href" of "standardDel" as "standardDelLink" on "homePage"
  And I verify "href" of "paypalOption" as "nextDaydelLink" on "homePage"
  When I hover to "standardDel" on "HomePage"
  Then I should see "StandardDelUnderlined" exist on "homePage"
  When I hover to "paypalOption" on "HomePage"
  Then I should see "payldelUnderlined" exist on "homePage"

@automated @DEBD-95 @Fixed
Scenario: Validate the HREF of the delivery options  on homePage
  Then I should see "headerMenuSection" exist on "commonPage"
  And I verify "href" of "standardDel" containing "standardDelLink" on "commonPage"
  And I verify "href" of "paypalOption" containing "paypalOptionLink" on "commonPage"

@manual @DEBD-96
Scenario: Validate homepage against alpha environemnt (on lights on version)
  Given I validate to "intHomeURL"
  Then I validate all "heroBannerImage" with links, image and cta interaction on "homePage"
  Then I validate all "SlimheroBannerImage" with links, image and cta interaction on "homePage"
  Then I validate all 6 offers available in "brandLogoSpotlight" and validate links, image, cta on "homePage"
  Then I validate all 3 visible offers available in "Top Offers" with links, image, cta on "homePage" 
  Then I validate all 6 visible offers available in "Top sale Offers" with links, image,cta on "homePage" 
  Then I validate "View All offers" links are working fine on "homePage"
  Then I validate "giftCardBanner" with link, image and cta interaction on "homePage"
  Then I validate  options under "This Weeks highlight" with links, image and cta interaction on "homePage"
  And I validate "slimContentBanner" with link, image and cta interaction on "homePage"
  And I validate "UberComponent" with link, image and cta interaction on "homePage"
  Then I validate  options under "Beauty Spotlight" with links, image and cta interaction on "homePage"
  And I validate "financeBanner" with link, image and cta interaction on "homePage"
 
@manual @DEBD-96
Scenario: Validate homepage against production environemnt (limited lights on version)
  Given I validate to "intHomeURL"
  Then I validate all "heroBannerImage" with links, image and cta interaction on "homePage"
  Then I validate all "SlimheroBannerImage" with links, image and cta interaction on "homePage"
  Then I validate all 6 offers available in "brandLogoSpotlight" and validate links, image, cta on "homePage"
  Then I validate all 3 visible offers available in "Top Offers" with links, image, cta on "homePage" 
  Then I validate all 6 visible offers available in "Top sale Offers" with links, image,cta on "homePage" 
  Then I validate "View All offers" links are working fine on "homePage"
  Then I validate "giftCardBanner" with link, image and cta interaction on "homePage"
  Then I validate  options under "This Weeks highlight" with links, image and cta interaction on "homePage"
  And I validate "slimContentBanner" with link, image and cta interaction on "homePage"
  And I validate "UberComponent" with link, image and cta interaction on "homePage"
  Then I validate  options under "Beauty Spotlight" with links, image and cta interaction on "homePage"
  And I validate "financeBanner" with link, image and cta interaction on "homePage"
