Feature: Validate finance banner on home page.

@manual @DEBD-97 @awsManual
Scenario: Validate user should see default banner on basket page if user is having basket value >= £10 and no private/recruitment banner is setup.
  Given I navigate to "homeUrl"
  When I am in view of "financeBannerContainer" on "commonPage"
  And I should see "defaultFinanceBanner" exist on "commonPage"
  And I should see "checkEligibityButton" exist on "commonPage"

@manual @DEBD-97 @awsManual
Scenario: Validate UI of  default banner on basket page if user is having basket value >= £10 and no private/recruitment banner  is setup.
  Given I navigate to "homeUrl"
  When I am in view of "financeBannerContainer" on "commonPage"
  And I should see "defaultFinanceBanner" exist on "myBagPage"
  And I should see "defaultFinanceHeaderText" as "Good Things come to us who join" on "myBagPage"
  And I should see "defaultFinanceHeaderSubText" as "You can save £XXXX this on order today and receive 500 bonus points when you ope a debenhams credit card " on "myBagPage"
  And I should see "checkEligibityButton" exist on banner
  And I should see "termsAndConditions" exist on banner
  And I should see "representativeVariableText" exist on banner
  And I should see "debenhamsCardImage" exist on banner

@manual @DEBD-97 @awsManual
Scenario: Validate heref of check you eligibility button in  banner.
  Given I navigate to "homeUrl"
  When I am in view of "financeBannerContainer" on "commonPage"
  And I verify "href" of "checkEligibityButton" as "financeBannerLink" on "commonPage"


@manual @DEBD-97 @awsManual
Scenario: Validate user should see recruitment banner on basket page if user is having basket value >= £10 and date is set for recruitment banner.
  Given I navigate to "homeUrl"
  When I am in view of "financeBannerContainer" on "commonPage"
  And I should see "recruitmentBanner" exist on "commonPage"
  And I should see "checkEligibityButton" exist on "myBagPage"
  And I verify "href" of "checkEligibityButton" as "financeBannerLink" on "commonPage"


@manual @DEBD-97 @awsManual
Scenario: Validate user should see private sale banner on basket page if user is having basket value >= £10 and date is set for recprivate sale banner.
  Given I navigate to "homeUrl"
  When I am in view of "financeBannerContainer" on "commonPage"
  And I should see "privateSaleBanner" exist on "commonPage"
  And I should see "checkEligibityButton" exist on "myBagPage"
  And I verify "href" of "checkEligibityButton" as "financeBannerLink" on "commonPage"



