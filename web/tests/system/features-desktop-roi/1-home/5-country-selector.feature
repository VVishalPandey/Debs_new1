Feature: Test Debenhams country selector on different pages

@automated @DEBD-3716 @DEBD-3713
Scenario: Verify country selector should not be displayed on the footer
  Given I navigate to "homeURL"
  Then I should not see "popup" on "commonPage"
  Then I should not see "totalCountryCountText" on "commonPage"
  And I should not see "flagCountrySelectedFooter" on "commonPage"
  And I should not see "welcomeToDebenhams" on "commonPage"
  And I should not see "chooseyourcountry" on "commonPage"
  And I should not see "countrySelectedNameFooter" on "commonPage"
  And I should not see "countrySelectedTitleFooter" on "commonPage"
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  Then I should see "verifiedByMasterCardIcon" exist on "commonPage"
   And I should not see "verifiedByAmexIcon" on "commonPage"
  Then I should see "comodoIcon" exist on "commonPage"

@automated @DEBD-3716 @DEBD-3713
Scenario: Verify country selector pop when user clicks on country selectorlink from header
  Given I navigate to "homeURL"
  When I am in view of "countrySelectorLink" on "commonPage"
  Then I should see "countryDropdown" exist on "commonPage"
  And I should see "flagCountrySelectedMenu" exist on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  And I should see "countryDropdownOption1Name" as "UK" on "commonPage"
  And I should see "countryDropdownOption1Currency" as "£" on "commonPage"
  And I should see "countryDropdownOption1Flag" exist on "commonPage"
  And I should see "countryDropdownOption2Name" as "UAE" on "commonPage"
  And I should see "countryDropdownOption2Currency" as "د.إ" on "commonPage"
  And I should see "countryDropdownOption2Flag" exist on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should not see "totalCountryCountText" on "commonPage"
  And I should not see "flagCountrySelectedInMenu" on "commonPage"
  And I should not see "chooseyourcountry" on "commonPage"
  And I should validate "home" page of "IE"

@automated @DEBD-3716 @DEBD-3713
Scenario Outline: Verify country selector after changing country from UK to IE and then revalidate after changing to UK from IE
  When I am in view of "countrySelectorLink" on "commonPage"
  And I should see "flagCountrySelectedMenu" exist on "commonPage"
  Then I "validate & click" country as "<countryOptions>" from "countryOptions" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  And I should see "countryDropdownOption1Name" as "<country list>" on "commonPage"
  And I should see "countryDropdownOption1Currency" as "<currency symbol>" on "commonPage"
  And I should see "<flag>" exist on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should see "url" contains "<url>"
  And I should validate "home" page of "<countryOptions>"

Examples:
|countryOptions  |  country list | currency symbol | flag                       | url |
| UK             |  IE           |  €              | countryDropdownOption2Flag | .com|
| IE             |  UK           |  £              | countryDropdownOption1Flag | ie |


@automated @DEBD-3716 @DEBD-3713
Scenario: Verify country selector after changing country from UK to UAE and then revalidate after changing to UK from UAE
  When I am in view of "countrySelectorLinkHeader" on "commonPage"
  And I should see "flagCountrySelectedMenu" exist on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I click on "countryDropdownOption2Name" on "commonPage"
  And I should see "url" contains "https://www.debenhams.ae/"
  And I go back to previous page
  And I should see "flagCountrySelectedHeader" as "IE" on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should validate "home" page of "IE"

@automated  @DEBD-3716 @DEBD-3713
Scenario Outline: verify change country from PDP/PSP/TCAT/SCAT of the product which is not available for new country
  Given I navigate to "<page>"
  Then I "validate & click" country as "UK" from "countryOptions" on "commonPage"
  And I should see "flagCountrySelectedHeader" as "UK" on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should see "url" contains "com"
  Then I should validate "home" page of "UK"

Examples:
 | page |
 | kidsDresspdpUrl |
 | testFurniturePSPURL |
 | scatKidsUrl |
 | womenTcatUrl |

@notAutomated  @DEBD-3716 @DEBD-3713
Scenario Outline: verify change country from PDP/PSP/TCAT/SCAT of the product which is available for new country
  Given I navigate to "<page>"
  And I should see "flagCountrySelectedHeader" as "IE" on "commonPage"
  Then I should see "addToBagButton" exist on "pdpPage"
  Then I "validate & click" country as "UK" from "countryOptions" on "commonPage"
  And I should see "flagCountrySelectedHeader" as "UK" on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should see "url" contains ".com/"
  Then I should validate "home" page of "UK"

Examples:
 | page |
 | irelandPDP |
 | irelandPSP |
 | irelandTCAT |
 | irelandSCAT |

@automated @DEBD-3716 @DEBD-3713
Scenario: verify change country from PDP of the product which is not available for new country
  Given I navigate to "alcoholPdpURL"
  Then I "validate & click" country as "UK" from "countryOptions" on "commonPage"
  And I should see "flagCountrySelectedHeader" as "UK" on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should see "url" contains "com"
  Then I should validate "home" page of "UK"

@automated @DEBD-3716 @DEBD-3713
Scenario: verify change country from My Bag of the product and validate user should be redirected to home page
  Given I navigate to "katVonDBeautyProduct"
  And I select available size enter quantity as "2" and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "flagCountrySelectedHeader" as "IE" on "commonPage"
  Then I "validate & click" country as "UK" from "countryOptions" on "commonPage"
  And I should see "flagCountrySelectedHeader" as "UK" on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should see "url" contains "com"
  And I should not see "myBagPageHeader" on "myBagPage"
  Then I should validate "home" page of "UK"

@manual @DEBD-3713
Scenario: Verify country selector pop up when user access from ROI, Australia, China or France and has no cookies saved
  Given I am connected to VPN of any other country than UK/IE
  And I navigate to "homeUKURL"
  And I browse the UK site
  And I should not see country slector pop up

@manual @DEBD-3713
Scenario: Verify country selector pop up when user access from ROI, Australia, China or France and has cookies saved
  Given I am connected to VPN of any other country than UK/IE
  And I navigate to "homeUKURL"
  And I browse the UK site
  And I should not see country slector pop up

@automated @DEBD-3715 @country
Scenario: Verify cookie value to be displayed as GB when user is browsing in UK site
  Given I navigate to "homeURL"
  And I refresh the page
  And I validate cookie value of "DEB_ShipToCntry" as "IE"
  And I validate cookie value of "DEB_ShipToContext" as "IE"
  And I validate cookie value of "GeoIP" as "IE"

@notAutomated @DEBD-3713
Scenario Outline: Validate user redurects to UK when when enter direct url of any international country
  And I navigate to "<url>"
  And I validate cookie value of "DEB_ShipToContext" as "GB"
  And I should be redirected to home Url of UK
  And I should not see country slector pop up

Examples:
 |url|
 |homeIntAusUrl|
 |homeIntFranUrl|
 |homeIntUSUrl|

@manual @DEBD-3716 @DEBD-3713
Scenario: Verify country slector change on order confirmation page
  Given I navigate to "katVonDBeautyProduct"
  And I select available size enter quantity as "2" and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I place an order
  And I am on order confirmation page
  Then I "validate & click" country as "UK" from "countryOptions" on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should see "url" contains "com"
  Then I should validate "home" page of "UK"