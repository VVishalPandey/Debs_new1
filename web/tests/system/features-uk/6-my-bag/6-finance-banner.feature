Feature: Validate finance banner on basket page.

@manual @DDAI-850 @DDAI-1000
Scenario: Validate user should see default banner on basket page if user is having basket value >= £10 and no conditional banner is set.

@manual @DDAI-850 @DDAI-1000
Scenario: Validate user should see recruitment banner on basket page if user is having basket value >= £10 and date is set for recruitment banner.

@manual @DDAI-850 @DDAI-1000
Scenario: Validate user should see private sale banner on basket page if user is having basket value >= £10 and date is set for private sale banner.

@manual @DDAI-850 @DDAI-1000
Scenario: Validate user should navigate to url "http://finance.debenhams.com/credit-card/?sourcecode=3001194AADEBDAG01750" when click on mobile banner.

@manual @DDAI-850 @DDAI-1000
Scenario: Validate user should navigate to url " http://finance.debenhams.com/credit-card/?sourcecode=3001194AADEBDAG04550" when click on tablet banner.

@manual @DDAI-850 @DDAI-1000
Scenario: Validate default banner on basket page should contain 10% of final basket count i.e if promotion applied then 10% amount should calculate on the discounted total.

@manual @DDAI-850 @DDAI-944 @DDAI-1000
Scenario: Validate Private Sale banner copy from "https://debenhams.invisionapp.com/share/4ZKN2XRCS3P" for mobile

@manual @DDAI-850 @DDAI-944 @DDAI-1000
Scenario: Validate default banner copy from "https://debenhams.invisionapp.com/share/4ZKN2XRCS3P" for mobile

@manual @DDAI-850 @DDAI-944 @DDAI-1000
Scenario: Validate recruitment banner copy from "https://debenhams.invisionapp.com/share/4ZKN2XRCS3P" for mobile

@manual @DEBD-2133
Scenario: Validate Finance banner of Private Sale and cardholder recruitment for the categories excluding Womenware, Mensware, Kids or Homeware
  Given I logout
  And I empty mini bag
  And I empty mySavedItemPage
  When I navigate to "knickerPdpUrl"
  And I select available size enter quantity as "3" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I am in view of "financeBanner" on "myBagPage"
  And I validate the "subtotal"
  And I validate the "finance banner value"


@manual @DEBD-2133
Scenario: Validate Finance banner of Private Sale and cardholder recruitment for the categories including Womenware, Mensware, Kids or Homeware
  Given I logout
  And I empty mini bag
  And I empty mySavedItemPage
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I am in view of "financeBanner" on "myBagPage"
  And I validate the "finance banner value"

@manual @DEBD-2133
Scenario: Validate discount amount on Finance banner for mixed bag
  Given I logout
  And I empty mini bag
  And I empty mySavedItemPage
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I navigate to "freeGiftPdpURL"
  And I select available size enter quantity as "3" and add to bag on pdpPage
  When I navigate to "knickerPdpUrl"
  And I select available size enter quantity as "3" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I am in view of "financeBanner" on "myBagPage"
  And I validate the "finance banner value"

@manual @DEBD-2133
Scenario Outline: Validate discount amount on Finance banner of Private Sale and cardholder recruitment if the promocode has been applied on top of the basket
  Given I logout
  And I empty mini bag
  And I empty mySavedItemPage
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


@manual @DEBD-2133
Scenario: Validate payment has been sucessfully done by debenhams credit card if mixed bag  has product discounts and promocode applied
  Given I logout
  And I empty mini bag
  And I empty mySavedItemPage
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

@manual @DEBD-2611
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

@manual @DEBD-2133
Scenario: Validate finance banner should not be displayed on ROI and International sites
  Given I navigate to "basketCheckoutUrl"
  And I should not see "financeBanner" exist on "myBagPage"
