Feature: Validate finance banner on basket page.

@manual @DEBD-1380 @awsManual
Scenario: Validate user should see default banner on basket page if user is having basket value >= £10 and no private/recruitment banner is setup.
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "defaultFinanceBanner" exist on "myBagPage"
  And I should see "checkEligibityButton" exist on "myBagPage"

@manual @DEBD-1380 @awsManual  @DEBD-2133 @DEBD-2611
Scenario: Validate UI of  default banner on basket page if user is having basket value >= £10 and no private/recruitment banner  is setup.
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "defaultFinanceBanner" exist on "myBagPage"
  And I should see "defaultFinanceHeaderText" as "Enjoy up to an extra 20% off" on "myBagPage"
  And I should see "defaultFinanceHeaderSubText" as "You can save £XXXX this on order today and receive 500 bonus points when you ope a debenhams credit card " on "myBagPage"
  And I should see "checkEligibityButton" exist on banner
  And I should see "termsAndConditions" exist on banner
  And I should see "representativeVariableText" exist on banner
  And I should see "debenhamsCardImage" exist on banner

@manual @DEBD-1380 @awsManual
Scenario: Validate heref of check you eligibility button in  banner.
 Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "defaultFinanceBanner" exist on "myBagPage"
  And I should see "checkEligibityButton" exist on "myBagPage"
  And I verify "href" of "checkEligibityButton" as "financeBannerLink" on "commonPage"


@manual @DEBD-1380 @awsManual
Scenario: Validate user should see recruitment banner on basket page if user is having basket value >= £10 and date is set for recruitment banner.
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "recruitmentBanner" exist on "myBagPage"
  And I should see "checkEligibityButton" exist on "myBagPage"
  And I verify "href" of "checkEligibityButton" as "financeBannerLink" on "commonPage"


@manual @DEBD-1380 @awsManual
Scenario: Validate user should see private sale banner on basket page if user is having basket value >= £10 and date is set for recruitment banner.
  Given I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "privateSaleBanner" exist on "myBagPage"
  And I should see "checkEligibityButton" exist on "myBagPage"
  And I verify "href" of "checkEligibityButton" as "financeBannerLink" on "commonPage"

@automated @DEBD-2133 @DEBD-2611
Scenario: Validate Finance banner of Private Sale and cardholder recruitment for the categories excluding Womenware, Mensware, Kids or Homeware
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "knickerPdpUrl"
  And I select available size enter quantity as "3" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I am in view of "financeBanner" on "myBagPage"
  And I validate the "finance banner value"


@automated @DEBD-2133 @DEBD-2611
Scenario: Validate Finance banner of Private Sale and cardholder recruitment for the categories including Womenware, Mensware, Kids or Homeware
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I am in view of "financeBanner" on "myBagPage"
  And I validate the "finance banner value"

@automated @DEBD-2133 @DEBD-2611
Scenario: Validate discount amount on Finance banner for mixed bag
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I navigate to "freeGiftPdpURL"
  And I select available size enter quantity as "3" and add to bag on pdpPage
  When I navigate to "knickerPdpUrl"
  And I select available size enter quantity as "3" and add to bag on pdpPage
  When I navigate to "testDress2PdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I am in view of "financeBanner" on "myBagPage"
  And I validate the "finance banner value"

@automated @DEBD-2133 @DEBD-2611
Scenario Outline: Validate discount amount on Finance banner of Private Sale and cardholder recruitment if the promocode has been applied on top of the basket
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "knickerPdpUrl"
  And I select available size enter quantity as "3" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "myBagPage"
  Then I should see "productDiscountValue" exist on "myBagPage"
  When I am in view of "financeBanner" on "myBagPage"
  And I validate the "finance banner value"

  Examples:
    | promoCode | promoMessage  |
    | PS01      | PS01: Applied |


@automated @DEBD-2611
Scenario: Validate discount amount on Private Finance banner for mixed bag
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I navigate to "freeGiftPdpURL"
  And I select available size enter quantity as "3" and add to bag on pdpPage
  When I navigate to "skinCarePDPUrl"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I navigate to "biscuitPDPUrl"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I am in view of "financeBanner" on "myBagPage"
  And I validate the "finance banner value"


@manual @DEBD-2133 @DEBD-2611
Scenario: Validate payment has been sucessfully done by debenhams credit card if mixed bag  has product discounts and promocode applied
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I navigate to "knickerPdpUrl"
  And I select available size enter quantity as "3" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I enter "<PS01>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "myBagPage"
  When I am in view of "financeBanner" on "myBagPage"
  And I should see "financeBannerHeader" containing "Enjoy up to an extra 20% off*" on "myBagPage"
  And I validate the "finance banner value"
  And I navigate to deivery page
  And I validate payment page and see Debenhams credit card has been applied
  And I validate order subtotal
  And I place an order
  And I should see order confirmation


@manual @DEBD-2133 @DEBD-2611
Scenario: Validate finance banner should not be displayed on ROI and International sites
  Given I navigate to "basketCheckoutUrl"
  And I should not see "financeBanner" exist on "myBagPage"



