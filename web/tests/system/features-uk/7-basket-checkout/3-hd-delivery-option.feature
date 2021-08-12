Feature: Test Debenhams add to bag functionality on pdp pages

@automated @DBNHST-144
Scenario: Navigate to delivery daytime / evening option page with dress in bag and validate the page
  Given I logout
  Then I am on my details page
  And I navigate to pdp "dress" and add to bag
  And I navigate to delivery options as already logged in with UK address
  # And I navigate to delivery options as guest user
  # And I select home delivery and provide UK address details and navigate to delivery options under it
  Then I should see "headerText" as "Choose your delivery option" on "deliveryOptionPage"
  And I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"
  And I should see "nextNominatedOptionHeaderText" containing "Next" on "deliveryOptionPage"
  And I should see "nextNominatedOptionText" containing "Get it" on "deliveryOptionPage"
  And I should see "standardOptionHeaderText" containing "Standard UK Delivery" on "deliveryOptionPage"
  And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
  When I click on "nextNominatedOption" on "deliveryOptionPage"
  Then I should see "headerText" as "When would you like to receive your delivery?" on "deliveryOptionPage"
  And I should see "daytimeTab" exist on "deliveryOptionPage"
  And I should see "eveningTab" exist on "deliveryOptionPage"
  And I should see "daytimeTabText" as "Daytime" on "deliveryOptionPage"
  And I should see "eveningTabText" as "Evening" on "deliveryOptionPage"

@automated @DBNHST-143 @DBNHST-373
Scenario: Navigate to daytime / evening option page from above scenario and validate navigation to next page with enable option and no navigation with disable option
  Then I validate all options under daytime
  And I validate first evening and daytime option navigation
  And I should see "deliveryMessage" containing "Your order will arrive on" on "deliveryOptionPage"

@manual @DBNHST-144
Scenario: Navigate to delivery daytime / evening option page with dress in bag and validate the values from desktop
  Given I navigate to delivery option under home delivery as guest with dress in bag
  Then I should see "headerText" as "Choose your delivery option" on "deliveryOptionPage"
  When I click on "nextNominatedOption" on "deliveryOptionPage"
  Then I validate the values from desktop

@automated @DBNHST-143 @DBNHST-373
Scenario: Navigate to delivery option international under home delivery with dress in bag and validate the page (country Australia) and validate navigation to next page
  Given I logout
  Then I am on my details page
  And I navigate to pdp "dress" and add to bag
  And I navigate to delivery options as already logged in with Australia address
  Then I should see "headerText" as "Choose your delivery option" on "deliveryOptionPage"
  And I should see "internationalOption" exist on "deliveryOptionPage"
  And I should not see "standardOption" on "deliveryOptionPage"
  And I should see "internationalOptionHeaderText" containing "International Delivery" on "deliveryOptionPage"
  And I should see "internationalOptionText" containing "Delivery within" on "deliveryOptionPage"
  When I click on "internationalOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" as "Your order will arrive within 5 - 15 working days (excludes public holidays)" on "deliveryOptionPage"

@automated @DBNHST-143 @DBNHST-373 @DBNHST-407 @Issue412Fixed
Scenario: Navigate to delivery options under home delivery with furniture in bag also having dress from above scenario and validate the page and validate nominated option is diabled with return link working
  Given I logout
  Then I am on my details page
  And I navigate to pdp "furniture" and add to bag
  And I navigate to delivery options as already logged in with UK address
  Then I should see "headerText" as "Choose your delivery option" on "deliveryOptionPage"
  And I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"
  And I should see "nextNominatedOptionHeaderText" containing "Next" on "deliveryOptionPage"
  And I should see "nextNominatedOptionText" containing "we are unable to offer this option" on "deliveryOptionPage"
  And I should see "standardOptionHeaderText" containing "Standard UK Delivery" on "deliveryOptionPage"
  And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
  And I should see "returnShoppingBag4mNominatedDay" exist on "deliveryOptionPage"
  When I click on "returnShoppingBag4mNominatedDay" on "deliveryOptionPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"

@automated @DBNHST-143 @DBNHST-373  @DBNHST-407 @Issue412Fixed @Issue413Fixed
Scenario: Navigate to delivery options under home delivery with furniture in bag also having dress from above scenario and validate the page and validate navigation to next page
  When I navigate to delivery options as already logged in with UK address
  Then I should see "headerText" as "Choose your delivery option" on "deliveryOptionPage"
  And I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"
  And I should see "nextNominatedOptionHeaderText" containing "Next" on "deliveryOptionPage"
  And I should see "nextNominatedOptionText" containing "we are unable to offer this option" on "deliveryOptionPage"
  And I should see "standardOptionHeaderText" containing "Standard UK Delivery" on "deliveryOptionPage"
  And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
  And I should see "returnShoppingBag4mNominatedDay" exist on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" as "Your items will be delivered separately." on "deliveryOptionPage"

@manual @DBNHST-407
Scenario: Navigate to deluvery page with guest second time from my bag and validate that user does not see the delivery login page
  When Navigate to deluvery page with guest second time from my bag
  Then I validate that I does not see the delivery login page
