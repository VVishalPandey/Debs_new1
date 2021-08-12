Feature: Test Debenhams country selector for International

@automated @DEBD-278 @DEBD-305 @Fixed
Scenario:Verify country selector pop -up remains the same  when user  changes the country  from country selectorlink
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I logout
  And I should see "flagCountrySelectedFooter" as "Australia" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  And I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  And I should see "welcomeToDebenhams" exist on "commonPage"
  And I should see "countrySelectorCurrency" as "CURRENCY: ($) AUD" on "commonPage"
  And I should see "goButton" exist on "commonPage"
  And I should see "popUpCancelButton" exist on "commonPage"
  When I click on "countrySelectorpopupclose" on "commonPage"
  Then I should not see "popup" on "commonPage"

@automated @DEBD-278 @DEBD-305 @Fixed
Scenario:Verify country selector pop when user clicks on country selectorlink from header
  When I am in view of "countrySelectorLinkHeader" on "commonPage"
  And I should see "flagCountrySelectedFooter" as "Australia" on "commonPage"
  Then I click on "countrySelectorLinkHeader" on "commonPage"
  And I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  And I should see "welcomeToDebenhams" exist on "commonPage"
  And I should see "countrySelectorCurrency" as "CURRENCY: ($) AUD" on "commonPage"
  And I should see "goButton" exist on "commonPage"
  And I should see "popUpCancelButton" exist on "commonPage"
  When I click on "countrySelectorCancelButton" on "commonPage"
  Then I should not see "popup" on "commonPage"

@automated @DEBD-278 @Fixed
Scenario: verify country, currency And flag update to the new country
  When I "validate & click" country as "New Zealand" from "countryOptions" on "commonPage"
  And I should see "flagCountrySelectedFooter" as "New Zealand" on "commonPage"
	And I should see "url" contains "/en-nz"
  Then I click on "countrySelectorLink" on "commonPage"
	And I should see "countrySelectorCurrency" as "CURRENCY: ($) NZD" on "commonPage"
  When I click on "countrySelectorCancelButton" on "commonPage"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
	And I should see "url" contains "/en-au"
  And I should see "flagCountrySelectedFooter" as "Australia" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
	And I should see "countrySelectorCurrency" as "CURRENCY: ($) AUD" on "commonPage"
  When I click on "countrySelectorCancelButton" on "commonPage"
  Then I should not see "popup" on "commonPage"

@notAutomated @DEBD-132
Scenario: verify change country from PDP of the product which is not available for new country but available for any other country
  Given I navigate to "testDressPdpAusURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I should see "ProductName"  as "ABC"
  And I should see "flagCountrySelectedFooter" as "Australia" on "commonPage"
  And I should see "AddtoBag" "enabled" on "pspPage"
  Then I "validate & click" country as "United Staes" from "countryOptions" on "commonPage"
  And I should see "flagCountrySelectedFooter" as "United Staes" on "commonPage"
  Then I should see "ProductName"  as "ABC"
  And I should see "AddtoBag" "enabled" on "pspPage"

@notAutomated  @DEBD-132
Scenario: verify change country from PDP of the product which is available for new country
  Given I navigate to "pdpDressAvailableInAustralia"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I should see "addToBagButton" exist on "pdpPage"
  When I go back to previous page
  And I "validate" country as "United Kingdom" from "countryOptions" on "commonPage"

@notAutomated @DEBD-132
Scenario: verify change country from PDP of the product which is not available for new country
  Given I navigate to "testBeauty5BreadcrumbPdpURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I should see "deliveryOptions" exist on "commonPage"
  And I should not see "addToBagButton" on "commonPage"  
  When I go back to previous page
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  And I click on "countrySelectorpopupclose" on "commonPage"
  And I "validate" country as "United Kingdom" from "countryOptions" on "commonPage"

@manual @DEBD-132
Scenario Outline: Validate that user land on home page if the product is not available in all international countries
  Given I am on the DOTCOM site on a "<PDP>" that is not available on all DOTINT countries
  When I change country to DOTINT
  Then I will land on the homepage
  And WHEN I press the native back button
  Then I am taken back to the original DOTCOM PDP

  Examples:
    | PDP       |
    | Furniture |
    | Beauty    |
    | Mens      |
    |Women-Dress|
    |Chanel     |

@manual @DEBD-132
Scenario Outline: Validate that user land on PDP page if the product is available in even only in one international country
  Given I am on the DOTCOM site on a "<PDP>" that is available on one but not all DOTINT
  When I change country to a DOTINT country that it is not available in e.g. Australia
  Then I will redirect to the PDP for that country
  And I will see the add to bag CTA disabled
  And "Not available for delivery to selected country" error message in red in the delivery options section

  Examples:
    | PDP       |
    | Women Dresses |
    | Lingerie      |
    | Home   |
    | Mens  |

@manual @DEBD-132
Scenario: Validate that user land on PDP page if the product is available in naviagted international country
Given I am on the DOTCOM site on a PDP that is available on DOTINT
When I change country to DOTINT
Then I re-direct to the PDP for that country
And I will see the add to bag CTA enabled
And I click on add to bag CTA
Then I should see the minibag count to be updated
And I press the native back button
Then the country selector opens
And I am taken to the DOTCOM PDP


@toBeMarkedAsAutomatedAfterGenericErrorIsBuild @DEBD-179
Scenario: Validate that the products are removed from my bag when user changes country to ROI/any international country
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I navigate to "productWithAlphabetSizeSwatch"
  # And I select available size enter quantity as "1" and add to bag on pdpPage
  Then I select available size and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "countrySelectorLinkHeader" on "commonPage"
  Then I should see "productsRemovalMessage" as "By changing your country items may change in price or be removed from your bag." on "commonPage"
  And I click on "countrySelectorpopupclose" on "commonPage"
  #And I click on "logoDebenhams" on "commonPage"
  When I go back to previous page
  And I "validate & click" country as "United Kingdom" from "countryOptions" on "commonPage"
  And I click on "miniBagIcon" on "commonPage"
  Then I should not see "productImage" on "myBagPage"
  And I click on "logoDebenhams" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "miniBagIcon" on "commonPage"
  Then I should not see "productImage" on "myBagPage"
  #And I should see "productImage" exist on "myBagPage"

@toBeMarkedAsAutomatedAfterGenericErrorIsBuild @DEBD-179 @UnableToFindProduct
Scenario: Validate that the products are removed from my bag when user changes country from International to another International country where product is available
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I navigate to "pdpProductAvailableAcrossInt"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "countrySelectorLinkHeader" on "commonPage"
  Then I should see "productsRemovalMessage" as "By changing your country items may change in price or be removed from your bag." on "commonPage"
  And I click on "countrySelectorpopupclose" on "commonPage"
  When I go back to previous page
  And I "validate & click" country as "China" from "countryOptions" on "commonPage"
  And I click on "miniBagIcon" on "commonPage"
  Then I should see "productImage" exist on "myBagPage"
  When I go back to previous page
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "miniBagIcon" on "commonPage"
  And I should see "productImage" exist on "myBagPage"

@notAutomated @DEBD-179
Scenario: Validate that the products are removed from my bag when user changes country from International to another International country where product is not available
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I navigate to "productWithRangeSizeDropdown"
  And I select available size enter quantity as "2" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "countrySelectorLinkHeader" on "commonPage"
  Then I should see "productsRemovalMessage" as "By changing your country items may change in price or be removed from your bag." on "commonPage"
  And I click on "countrySelectorpopupclose" on "commonPage"
  When I go back to previous page
  And I "validate & click" country as "China" from "countryOptions" on "commonPage"
  And I click on "miniBagIcon" on "commonPage"
  Then I should not see "productImage" on "myBagPage"
  When I go back to previous page
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "miniBagIcon" on "commonPage"
  And I should not see "productImage" on "myBagPage"