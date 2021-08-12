Feature: Test Debenhams home page on Desktop

@automated @DEBD-516 @Fixed
Scenario Outline: Validate the delivery options banner  on homePage
  Given I navigate to "homeURL"
  When I am in view of "headerMenuSection" on "commonPage"
  Then I should see "deliveryOptions" exist on "commonPage"
  And I count number of "deliveryOptions" to be "<max_count>" on "commonPage"
  And I should see "standardDel" containing "FREE Standard Delivery on orders" on "commonPage"
  And I should see "nextDayClick" containing "Click & Collect" on "commonPage"
  And I should see "nextDaydelRoi" containing "Next Day Delivery" on "commonPage"
  And I should see "standardDelIcon" exist on "commonPage"
  And I should see "nextDayClickIcon" exist on "commonPage"
  And I should see "nextDayDeliveryIcon" exist on "commonPage"

  Examples:
    | max_count |
    | 3         |

@automated @DEBD-516 @Fixed
Scenario: Validate the HREF of the delivery options  on homePage
  Then I should see "headerMenuSection" exist on "commonPage"
  And I verify "href" of "standardDel" as "standardDelLink" on "commonPage"
  And I verify "href" of "nextDayClick" as "standardDelLink" on "commonPage"
  And I verify "href" of "nextDaydelRoi" as "nextDayDeliveryLink" on "commonPage"


@manual @DEBD-515 
Scenario: Validate the clickable animation when user hover/focus over an image
 Given I validate to "homeURL"
 Then I validate all 3 visible offers available in "Top Offers" with links, image, cta on "homePage"
 Then I validate "View All offers" links are working fine on "homePage"
 Then I validate "giftCardBanner" with link, image and cta interaction on "homePage"

@automated @DEBD-514 @Fixed
Scenario: Validate the *Terms, conditions & exclusions apply below Beauty Spotlight Section
When I am in view of "termsExclusionSection" on "commonPage"
And I verify "href" of "termsExclusion" as "termsExclusionLink" on "commonPage"


@manual @DEBD-514 
Scenario: Validate homepage against alpha environemnt (on lights on version)
  Given I validate to "homeURL"
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

@manual @DEBD-514
Scenario: Validate homepage against production environemnt (limited lights on version)
  Given I validate to "homeURL"
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


