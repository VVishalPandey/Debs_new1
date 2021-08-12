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
  Then I should see "verifiedByAmexIcon" exist on "commonPage"
  Then I should see "comodoIcon" exist on "commonPage"

@automated @DEBD-3716 @DEBD-3713
Scenario: Verify country selector pop when user clicks on country selectorlink from header
  Given I navigate to "homeURL"
  When I click on "menuIcon" on "commonPage"
  When I am in view of "countrySelectorLink" on "commonPage"
  Then I should see "countryDropdown" exist on "commonPage"
  And I should see "flagCountrySelectedMenu" exist on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  And I should see "countryDropdownOption1Name" as "IE" on "commonPage"
  And I should see "countryDropdownOption1Currency" as "€" on "commonPage"
  And I should see "countryDropdownOption1Flag" exist on "commonPage"
  And I should see "countryDropdownOption2Name" as "UAE" on "commonPage"
  And I should see "countryDropdownOption2Currency" as "د.إ" on "commonPage"
  And I should see "countryDropdownOption2Flag" exist on "commonPage"
  Then I should not see "totalCountryCountText" on "commonPage"
  And I should not see "flagCountrySelectedInMenu" on "commonPage"
  And I should not see "chooseyourcountry" on "commonPage"
  When I click on "closeIcon" using jquery on "commonPage"
  And I should validate "home" page of "UK"

@automated @DEBD-3716 @DEBD-3713
Scenario Outline: Verify country selector after changing country from UK to IE and then revalidate after changing to UK from IE
  Then I "validate & click" country as "<countryOptions>" from "countryOptions" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  And I should see "countryDropdownOption1Name" as "<country list>" on "commonPage"
  And I should see "countryDropdownOption1Currency" as "<currency symbol>" on "commonPage"
  And I should see "<flag>" exist on "commonPage"
  When I click on "closeIcon" using jquery on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should see "url" contains "<url>"
  And I should validate "home" page of "<countryOptions>"

Examples:
|countryOptions|  country list | currency symbol | flag         | url |
| IE |  UK      |  £              | countryDropdownOption1Flag | ie |
| UK |  IE      |  €              | countryDropdownOption2Flag | .com|

@automated @DEBD-3716 @DEBD-3713
Scenario: Verify country selector after changing country from UK to UAE and then revalidate after changing to UK from UAE
  When I click on "menuIcon" on "commonPage"
  When I am in view of "countrySelectorLinkHeader" on "commonPage"
  And I should see "flagCountrySelectedMenu" exist on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I click on "countryDropdownOption2Name" on "commonPage"
  And I should see "url" contains "https://www.debenhams.ae/"
  And I go back to previous page
  Then I should not see "popup" on "commonPage"
  And I should validate "home" page of "UK"

@automated  @DEBD-3716 @DEBD-3713
Scenario Outline: verify change country from PDP/PSP/TCAT/SCAT of the product which is not available for new country
  Given I navigate to "<page>"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should see "url" contains "ie"
  Then I should validate "home" page of "IE"

Examples:
 | page |
 | knickerPdpUrl |
 | womenMaxiPSPURL |
 | womenTcatUrl |
 | beautyScatUrl |

@notAutomated  @DEBD-3716 @DEBD-3713
Scenario Outline: verify change country from PDP/PSP/TCAT/SCAT of the product which is available for new country
  Given I navigate to "<page>"
  When I click on "menuIcon" on "commonPage"
  And I should see "flagCountrySelectedInMenu" as "IE" on "commonPage"
  Then I should see "addToBagButton" exist on "pdpPage"
  Then I "validate & click" country as "UK" from "countryOptions" on "commonPage"
  And I should see "flagCountrySelectedInMenu" as "UK" on "commonPage"
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
  Given I navigate to "alcoholPDPURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should see "url" contains "ie"
  Then I should validate "home" page of "IE"

@automated @DEBD-3716 @DEBD-3713
Scenario: verify change country from My Bag of the product and validate user should be redirected to home page
  Given I navigate to "katVonDBeautyProduct"
  And I select available size enter quantity as "2" and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should see "url" contains "ie"
  And I should not see "myBagPageHeader" on "myBagPage"
  Then I should validate "home" page of "IE"

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

@automated @DEBD-3715
Scenario: Verify cookie value to be displayed as GB when user is browsing in UK site
  Given I navigate to "homeURL"
  And I refresh the page
  And I validate cookie value of "DEB_ShipToCntry" as "GB"
  And I validate cookie value of "DEB_ShipToContext" as "GB"

@manual  @DEBD-3716 @DEBD-3713
Scenario: verify UI of country selector in TABLET
  Given I navigate to "testBeauty5BreadcrumbPdpURL"
  And I click on menu link
  And I should see country selector in hamburger in main menu links as per designs

@manual  @DEBD-3716 @DEBD-3713
Scenario: Validate country selector in header should only be displayed in mainmenu links and not in submenu links
  Given I navigate to "testBeauty5BreadcrumbPdpURL"
  And I click on menu link
  And i go to any of the subenu links
  And I should not see country selector
  And I navigate bak to menu link
  And I should see country selector in hamburger in main menu links as per designs

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
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  Then I should not see "popup" on "commonPage"
  And I should see "url" contains "ie"
  Then I should validate "home" page of "IE"
