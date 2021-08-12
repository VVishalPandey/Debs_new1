Feature: Test Debenhams country selector on different pages

@manual @DDAI-280 @DDAI-922
Scenario: verify country selector overlay on bases of country user in
  Given I am accessing the website from a country that is not the UK or ROI e.g. China or France
  When I go to debenhams.com for the first time (i.e. I have no cookies)
  Then I am presented with the country selector overlay
  And the country is defaulted to the country I am in (by recognizing the IP address) e.g. China or France

@manual @DDAI-280 @DDAI-922
Scenario: verify currency And flag update to the new country
  Given the country selector is open
  When I open country selector drop down i should see all selected country flags
  When I change the country in the drop down
  Then the currency And flag update to the new country

@manual @DDAI-280 @DDAI-922
Scenario: verify selected country displayed in the footer
  Given a country that is not the UK or ROI e.g. France is selected on the country selector
  When I press go
  Then I am redirected to the same page on debenhams.com/en-fr (end of URL is specific to the country)
  And I can see that country displayed in the footer

@manual @DDAI-280 @DDAI-922
Scenario: verify default country displayed in the footer
  Given I am accessing the website from a country that is not the UK or ROI e.g. China or France
  When I am accessing the website not the first time (i.e. I have a cookie for that country on page load)
  Then I am not presented with the country selector overlay
  And the website is defaulted to that country
  And the footer shows that country

@manual @DDAI-280
Scenario: verify remember functionality unchecked
  Given the country selector is open
  When remember me is left unchecked
  Then the selection is only retained until the end of the session (And lost When tab is closed or session expires).

@manual @DDAI-280
Scenario: verify remember functionality checked
  Given the country selector is open
  When remember me is checked
  Then the selection is stored in a cookie And will remain until the cookie expires or is deleted.

@manual @DDAI-280 @DDAI-922
Scenario: verify country selector cancel
  Given that the country selector is open
  When I close it OR press cancel
  Then the website remains on whatever country it was on

@manual @DDAI-280 @DDAI-922
Scenario: verify country selector change country to ROI
  Given that the country selector is open
  When I select ROI
  And submit the form
  Then I am taken to debenhams.ie

@manual @DDAI-280 @DDAI-922
Scenario: verify change country from PDP of the product which is not available for new country
  Given I am on a PDP
  When I change the country via the country selector
  And the product is NOT available on the new country site
  Then I am taken to the homepage

@manual @DDAI-280
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

@manual @DDAI-325
Scenario:verify change country from my bag And availablity of the product for new country
  Given I am on a country specific e.g. UK
  And I have multiple products in my bag
  When I change country to e.g. France, via the country selector (And I am on any page)
  Then if the product is available in the new country it will remain in my bag
  And if the product is not available in the new country it will be removed from my bag (inc any free gifts)
  And the mini bag will update also
