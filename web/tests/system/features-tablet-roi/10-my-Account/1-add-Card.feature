Feature: Test Debenhams My Account>My Payment page

@manual @DBMTE-667
Scenario: Navigate to Debenhams ROI site and validate the add new payment card section
  Given I am signed into my account
  And I am on the my payments card page
  When I select add a new payment card
  Then I am taken to the add a new payment card page
  And I can see a card details section
  And I can see a billing address section

@manual @DBMTE-667
Scenario: Navigate to Debenhams ROI site and validate the card type drop down
  Given I am on DOTIE
  When I press the card type drop down
  Then I can only see credit or debit card,reward card,gift card as an available option

@manual @DBMTE-667
Scenario: Navigate to Debenhams ROI site and validate all previously saved address on payment card page
  Given I am on the add a new payment card page
  And I have addresses saved
  When I open the select saved address drop down
  Then I can see all previously saved addresses on my account

@manual @DBMTE-667
Scenario: Navigate to Debenhams ROI site and validate When no saved address on payment card page
  Given I am on DOTIE
  And on the add a new payment card page
  And I have no saved addresses or I'm a guest
  Then I will see the fields title, first name, last name, phone number, country/region


@manual @DBMTE-667
Scenario: Navigate to Debenhams ROI site and validate address displayed based on selected country on payment card page
  Given I am on DOTIE
  And on the add a new payment card page
  When I select a country/region
  Then the remaining address fields for that country will be shown (localised fields by country)
  And clear address link (removes data from address fields)

@manual @DBMTE-667
Scenario: Navigate to Debenhams ROI site and validate address displayed based on selected country on payment card page
  Given I am on the add a new payment card page
  When I have completed all required details (card & billing)
  Then the save payment card CTA will turn from grey to orange
  And I will be able to click the save payment card CTA

@manual @DBMTE-667
Scenario: Navigate to Debenhams ROI site and validate address populated in billing address section on payment card page
  Given I have saved a new payment card
  Then The card details will be linked to the billing address
  And When I select this payment card on the payment page
  Then the linked billing address will populate in the billing address section on the payment page

@manual @DBMTE-667
Scenario: Navigate to Debenhams ROI site  and validate adding new billing address on on payment card page
