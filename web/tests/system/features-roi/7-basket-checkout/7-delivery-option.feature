
Feature: Test debenhams delivery options

@manual @DDAI-288
Scenario: Navigate to Debenhams delivery page>Validate delivery lead time for ROI
  Given I am on the delivery confirmation page
  When I have entered my delivery address
  Then I will see a delivery lead time specific to my delivery country
  And the proceed to payment CTA

@manual @DDAI-205
Scenario: Navigate to Debenhams delivery page>Validate delivery Page>Validate Delivery - Options selection and interaction for ROI
  When I naviagte to Debenhams delivery options page as guest (and signed in)
  Then I should validate the page with delivery options when user has both options available - add a clothing or beauty product
  When I naviagte to Debenhams delivery options page as guest (and signed in)
  Then I should validate the page with delivery options when user has only home delivery option available - add a Furniture product
  When I naviagte to Debenhams delivery options page as guest (and signed in)
  Then I should validate that both options are clickable if both options are available.
  And I should validate  Home Delivery always available, Click and Collect may not be available. For C&C there is now a link with the ability to 'Return to your shopping bag'
  Given I am completing a purchase
  When I click through from my bag to secure checkout
  Then I can see the home delivery or click & collect options with amended prices for DOTIE (see screenshot)

@manual @DDAI-319
Scenario: Navigate to Debenhams delivery page>Validate breadcrumbs,options,icon and change link

@manual @DDAI-193
Scenario: Navigate to Debenhams delivery page>Click and Collect>Validate text in store field and search stores

@manual @DDAI-193
Scenario: Navigate to Debenhams delivery page>Click and Collect>Validate top 5 nearest stores and view details

@manual @DDAI-193
Scenario: Navigate to Debenhams delivery page>Click and Collect>Validate top 5 nearest stores and view details

@manual @DDAI-193
Scenario: Navigate to Debenhams delivery page>Click and Collect>Validate previously choosen stores>Recent stores option should display

@manual @DDAI-193
Scenario: Navigate to Debenhams delivery page>Click and Collect>Validate View details section

@manual @DDAI-199
Scenario: Navigate to Debenhams delivery page>Validate Delivery - Standard delivery > New address field (DOTIE)

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
