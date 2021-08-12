Feature: Test Debenhams store finder page from click and collect journey

@manual @DBNHST-148
Scenario: Navigate to Debenhams store page from click and collect journey and validate the page with user having no saved store
  Given I am logged in with no saved store
  And I added a product in my bag and selected secure checkout
  When I navigate store page by selecting click and collect
  Then I should see header text as "Which store would you like to collect from?"
  And I see nearestStoreAccordion as "Find your nearest store" is displayed
  And I see findStreButton exist on page
  And storeField exist on page
  And I should not see recentStoreAccordion exist

@manual @DBNHST-148
Scenario: Navigate to Debenhams store page from above scenario and validate error message with invalid postcode
  When I enter "ABCD123456" in storeField
  And I click on findStreButton
  Then I shuld see errorMessage as "The town or postcode you entered was not recognised. Please try again."

@manual @DBNHST-148
Scenario: Navigate to Debenhams store page from click and collect journey and validate the page with user having saved store
  Given I am logged in with saved store
  And I added a product in my bag and selected secure checkout
  When I navigate store page by selecting click and collect
  Then I should see header text as "Which store would you like to collect from?"
  And nearestStoreAccordion exist on page
  And recentStoreAccordion exist on page
  And I see nearestStoreAccordion as "Find your nearest store" is displayed
  And I see recentStoreAccordion as "Recent stores" is displayed
  And I see findStreButton exist on page
  And storeField exist on page

@manual @DBNHST-148
Scenario: Navigate to Debenhams store page from above scenario and validate stores under recent stores from desktop
  Then I validate stores under recent stores from desktop
