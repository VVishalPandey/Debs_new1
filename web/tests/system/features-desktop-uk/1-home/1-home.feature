Feature: Test Debenhams home page on Desktop

@automated @DEBD-95 @awsManual
Scenario Outline: Validate the delivery options banner  on homePage against production
  Given I navigate to "homeURL"
  When I am in view of "headerMenuSection" on "commonPage"
  Then I should see "deliverybanner" exist on "commonPage"
  And I count number of "deliverybannerOption" to be "<total_count>" on "commonPage"
  And I should see "standardDel" containing "Standard Delivery" on "commonPage"
  And I should see "clickCollectdel" containing "Click & Collect" on "commonPage"
  And I should see "internationalDel" containing "Credit Card and Travel Money" on "commonPage"
  And I should see "standardDelIcon" exist on "commonPage"
  And I should see "clickCollectdelIcon" exist on "commonPage"
  And I should see "internationalDelIcon" exist on "commonPage"

  Examples:
    | total_count |
    | 3           |

@manual @DEBD-95 @awsManual
Scenario: Validate the delivery options banner  on homePage test env setup
  Given I navigate to "homeURL"
  When I am in view of "headerMenuSection" on "homePage"
  Then I should see 1 delivery options avaliable
  And I should see 2 delivery options avaliable
  And I should see 3 delivery options avaliable
  And I should see 4 delivery options avaliable

@automated @DEBD-95
Scenario: Validate the HREF of the delivery options  on homePage
  Then I should see "headerMenuSection" exist on "commonPage"
  And I verify "href" of "standardDel" containing "standardDelLink" on "commonPage"
  And I verify "href" of "clickCollectdel" containing "clickCollectdelLink" on "commonPage"
  And I verify "href" of "internationalDel" containing "creditCardTravelMoneyLink" on "commonPage"

@manual @DEBD-96 @awsManual
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
  And I validate "financeBanner" with link, image and cta interaction on "homePage"

@manual @DEBD-96 @awsManual
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
  And I validate "financeBanner" with link, image and cta interaction on "homePage"

