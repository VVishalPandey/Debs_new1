Feature: Validate finance banner on pdp page and pdp furniture page.

@manual @DEBD-97
Scenario Outline: Validate user should see default banner on basket page if user is having basket value >= £10 and no private/recruitment banner is setup
  Given I navigate to "<pdpUrl>"
  When I am in view of "prodDescSection" on "pdpPage"
  And I should see "defaultFinanceBanner" exist on "pdpPage"
  And I should see "checkEligibityButton" exist on "pdpPage"

  Examples:
  | pdpUrl              |
  | testDressPdpURL     |
  | testFurniturePdpURL |

@manual @DEBD-97 @awsManual
Scenario Outline: Validate UI of  default banner on basket page if user is having basket value >= £10 and no private/recruitment banner  is setup.
  Given I navigate to "<pdpUrl>"
  When I am in view of "prodDescSection" on "pdpPage"
  And I should see "defaultFinanceBanner" exist on "pdpPage"
  And I should see "checkEligibityButton" exist on "pdpPage"
  And I should see "defaultFinanceBanner" exist on "myBagPage"
  And I should see "defaultFinanceHeaderText" as "Good Things come to us who join" on "pdpPage"
  And I should see "defaultFinanceHeaderSubText" as "You can save £XXXX this on order today and receive 500 bonus points when you ope a debenhams credit card " on "pdpPage"
  And I should see "checkEligibityButton" exist on banner
  And I should see "termsAndConditions" exist on banner
  And I should see "representativeVariableText" exist on banner
  And I should see "debenhamsCardImage" exist on banner

  Examples:
  | pdpUrl              |
  | testDressPdpURL     |
  | testFurniturePdpURL |


@manual @DEBD-97
Scenario Outline: Validate href of check you eligibility button in  banner.
  Given I navigate to "<pdpUrl>"
  When I am in view of "prodDescSection" on "pdpPage"
  And I should see "defaultFinanceBanner" exist on "pdpPage"
  And I should see "checkEligibityButton" exist on "pdpPage"
  And I verify "href" of "checkEligibityButton" as "financeBannerLink" on "commonPage"

  Examples:
  | pdpUrl              |
  | testDressPdpURL     |
  | testFurniturePdpURL |


@manual @DEBD-97 @awsManual
Scenario Outline: Validate user should see recruitment banner on basket page if user is having basket value >= £10 and date is set for recruitment banner.
  Given I navigate to "<pdpUrl>"
  When I am in view of "prodDescSection" on "pdpPage"
  And I should see "defaultFinanceBanner" exist on "pdpPage"
  And I should see "checkEligibityButton" exist on "pdpPage"
  And I should see "recruitmentBanner" exist on "pdpPage"
  And I should see "defaultFinanceHeaderText" as "Good Things come to us who join" on "pdpPage"
  And I should see "defaultFinanceHeaderSubText" as "You can save £XXXX this on order today and receive 500 bonus points when you ope a debenhams credit card " on "pdpPage"
  And I should see "checkEligibityButton" exist on banner
  And I should see "termsAndConditions" exist on banner
  And I should see "representativeVariableText" exist on banner
  And I should see "debenhamsCardImage" exist on banner
  And I verify "href" of "checkEligibityButton" as "recruitmentBannerLink" on "commonPage"

  Examples:
  | pdpUrl              |
  | testDressPdpURL     |
  | testFurniturePdpURL |


@manual @DEBD-97
Scenario Outline: Validate user should see private sale banner on basket page if user is having basket value >= £10 and date is set for private sale banner.
  Given I navigate to "<pdpUrl>"
  When I am in view of "prodDescSection" on "pdpPage"
  And I should see "defaultFinanceBanner" exist on "pdpPage"
  And I should see "checkEligibityButton" exist on "pdpPage"
  And I should see "privateSaleBanner" exist on "pdpPage"
  And I should see "defaultFinanceHeaderText" as "Good Things come to us who join" on "pdpPage"
  And I should see "defaultFinanceHeaderSubText" as "You can save £XXXX this on order today and receive 500 bonus points when you ope a debenhams credit card " on "pdpPage"
  And I should see "checkEligibityButton" exist on banner
  And I should see "termsAndConditions" exist on banner
  And I should see "representativeVariableText" exist on banner
  And I should see "debenhamsCardImage" exist on banner
  And I verify "href" of "checkEligibityButton" as "recruitmentBannerLink" on "commonPage"

  Examples:
  | pdpUrl              |
  | testDressPdpURL     |
  | testFurniturePdpURL |

@manual @DEBD-97 @awsManual
Scenario Outline: Validate default banner on basket page should contain 10% of final basket count i.e if promotion applied then 10% amount should calculate on the discounted total.
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "<pdpUrl>"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I am in view of "prodDescSection" on "pdpPage"
  And I should see "discountAmount" exist on "myBagPage"

  Examples:
  | pdpUrl              |
  | testDressPdpURL     |
  | testFurniturePdpURL |
