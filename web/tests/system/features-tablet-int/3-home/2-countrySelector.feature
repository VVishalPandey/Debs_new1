Feature: Test Debenhams country selector on different pages

@manual @DBMTE-145 @DBMTE-359 @DBMTE-337 @DDAI-922
Scenario: verify country selector overlay on bases of country user in
	Given I am accessing the website from a country that is not the UK or ROI e.g. China or France
	When I go to debenhams.com for the first time (i.e. I have no cookies)
	Then I am presented with the country selector overlay
	And the country is defaulted to the country I am in (by recognizing the IP address) e.g. China or France

@automated  @DBMTE-145 @DBMTE-359 @DBMTE-337 @DDAI-922
Scenario: verify currency And flag update to the new country
	Given I logout
	When I am in view of "countrySelectorLink" on "commonPage"
	Then I click on "countrySelectorLink" on "commonPage"
	Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
	Then I click on "countryAustralia" on "commonPage"
	#And I should see "currencyAustralia" contains "AUD" on "commonPage"
	And I should see "flagAustralia" exist on "commonPage"
	And I should see "rememberMyCountryCheckbox" as "Remember my country" on "commonPage"
	And I should see "goButton" exist on "commonPage"
	And I should see "cancelBtn" exist on "commonPage"
	And I should see "countrySelectorpopupclose" exist on "commonPage"
	Then I click on "goButton" on "commonPage"

@automated  @DBMTE-145 @DBMTE-359 @DDAI-922
Scenario: verify selected country displayed in the footer
	Then I should see "countrySelectedFooter" as "Australia" on "commonPage"
	And I should see "url" contains "/en-au"

@manual @DBMTE-145 @DBMTE-359 @DBMTE-337 @DDAI-922
Scenario: verify that the selected country is displayed as default in the footer even after the user logouts
	Given I logout
	Then I should see "countrySelectedInFooter" as "Australia" on "commonPage"
	And I should see "url" contains "/en-au"

@manual @DBMTE-145 @DBMTE-359
Scenario: verify remember functionality unchecked
	Given the country selector is open
	When remember me is left unchecked
	Then the selection is only retained until the end of the session (And lost When tab is closed or session expires).

@manual @DBMTE-145 @DBMTE-359
Scenario: verify remember functionality checked
	Given the country selector is open
	When remember me is checked
	Then the selection is stored in a cookie And will remain until the cookie expires or is deleted.

@manual @DBMTE-145 @DBMTE-359 @DDAI-922
Scenario: verify country selector cancel
	Given that the country selector is open
	When I close it OR press cancel
	Then the website remains on whatever country it was on

@manual @DBMTE-145 @DBMTE-359 @DDAI-922
Scenario: verify country selector change country to ROI
	Given that the country selector is open
	And I should see flags for all countries
	When I select ROI
	And submit the form
	Then I am taken to debenhams.ie

@manual @DBMTE-145 @DBMTE-359
Scenario: verify change country from PDP of the product which is not available for new country
	Given I am on a PDP
	When I change the country via the country selector
	And the product is NOT available on the new country site
	Then I am taken to the homepage

@manual @DBMTE-145 @DBMTE-359
Scenario: verify change country from PDP of the product which is available for new country
	Given I am on a PDP
	When I change the country via the country selector
	And the product is available on the new country site
	Then I am taken to the same PDP

@manual @DDAI-325
Scenario:verify change country from my bag And validate messaging about the availablity of the product for new country
	Given that I have a product in my bag
	When I click on the country selector (And I am on any page)
	Then I will see the change country overlay plus the items may change messaging

@automated  @DDAI-325
Scenario Outline: Verify that common product for two countries to my bag of an international user is displayed on country change from my bag page.
	Given I "validate & click" country as "United Kingdom" from "countryOptions" on "commonPage"
	Then I navigate to "loginUrl"
	When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
	And I enter "<password>" in "passwordField" on "loginPage"
	And I click on "signInButton" on "loginPage"
	And I navigate to "testDressPdpURL"
	And I wait for "3000" milliseconds
	And I select available size from "dropdown"
	#And I am in view of "sizeSelector" on "pdpPage"
	When I click on "addToBagButton" on "pdpPage"
	And I wait for "2000" milliseconds
	Then I click on "viewBasketCheckoutButton" on "pdpPage"
	And I wait for "2000" milliseconds
	#And I add the product to bag and go to my bag page
	And I should see "testDressProductName" product name exist on myBagPage
	Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
	And I wait for "2000" milliseconds
	And I should see "countrySelectedFooter1" as "Australia" on "commonPage"
	And I wait for "2000" milliseconds
	And I should see "testDressProductName" product name exist on myBagPage

	Examples:
		| email                      | password  |
		| testautomationd2@gmail.com | password2 |
