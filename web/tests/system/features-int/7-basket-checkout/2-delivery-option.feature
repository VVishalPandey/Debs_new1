Feature: Test Debenhams delivery feature for international


@manual @DDAI-288
Scenario: Navigate to Debenhams delivery page>Validate delivery lead time for Internation Sites(Australia,China)
  Given I am on the delivery confirmation page
  When I have entered my delivery address
  Then I will see a delivery lead time specific to my delivery country
  And the proceed to payment CTA

@manual @DDAI-279
Scenario: Navigate to Debenhams Delivery - Options selection and interaction>Validate home ,Click and Collect delievery option should be hidden for International
  Given I am on DOTINT
  When I click secure checkout from my bag
  Then I am taken to the delivery address entry form
  And there is no option to select delivery method as only international delivery is available
  And Hide delivery selection (home vs click & collect) pages

@manual @DBNHST-1570
Scenario: Navigate to delivery page and validate that the user is able to see the progress bar as per MVT variation-1

@manual @DBNHST-1570
Scenario: Navigate from delivery page to payment page and validate that the user is able to see the progress bar as per MVT variation-1

@manual @DBNHST-1655
Scenario: Navigate back from payment page to delivery page and validate that the user is able to see the already saved delivery option and address as per MVT variation-1

@manual @DBNHST-1666
Scenario: Navigate to delivery page and validate the 2 tabs(Home and CC) are displayed on the delivery page
  Given I am on the Delivery Page
  Then I should see the 2 tabs as "Home delivery" and "Click & collect"

@manual @DBNHST-1666
Scenario: Navigate to delivery page and validate Home delivery tab is selected by default
  When I am on the Delivery Page
  Then I should see the default tabs selected as "Home delivery"

@manual @DBNHST-1666
Scenario: Navigate to delivery page and validate the CC tab is disabled if the product does not qualify for it
  Given I add a product to my bag which is only eligible for "Home delivery"
  Then I move to the Delivery Page
  And I should see the tab2 i.e. "Click & collect" as disabled.

@manual @DBNHST-1666
Scenario: Navigate to delivery page and validate that both tabs are enabled if product qualifies for both HD and CC
  Given I add a product to my bag which is eligible for both "Home delivery" and "Click & collect"
  Then I move to the Delivery Page
  And I should see the both the tabs enabled and user can switch between them.

@manual @DBNHST-1666
Scenario: Navigate to delivery page and validate for 2 different products one qualifies for CC and the other does not, the CC tab is disabled
  Given I add two products(one eligible for both delivery option and other just eligible for "Click & collect") to my bag.
  Then I move to the Delivery Page
  And I should see the tab2 i.e. "Click & collect" as disabled.
