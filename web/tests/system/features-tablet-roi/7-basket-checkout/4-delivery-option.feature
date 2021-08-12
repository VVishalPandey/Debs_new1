Feature: Validate Delivery options available on DOTIE site

@manual @DBMTE-605
Scenario: Navigate to Debenhams delivery page>Validate delivery Page>Validate Delivery - Options selection and interaction for ROI
  When I naviagte to Debenhams delivery options page as guest (and signed in)
  Then I should validate the page with delivery options when user has both options available - add a clothing or beauty product
  When I naviagte to Debenhams delivery options page as guest (and signed in)
  Then I should validate the page with delivery options when user has only home delivery option available - add a Furniture product
  When I naviagte to Debenhams delivery options page as guest (and signed in)
  Then I should validate that both options are clickable if both options are available.
  And I should validate  Home Delivery always available, Click and Collect may not be available. For C&C there is now a link with the ability to 'Return to your shopping bag'

@manual @DBMTE-605
Scenario: Navigate to Debenhams delivery page>Validate delivery Page>Validate Delivery - Options selection and interaction for ROI
  Given I am completing a purchase
  When I click through from my bag to secure checkout
  Then I can see the home delivery or click & collect options with amended prices for DOTIE

@manual @DBMTE-613
Scenario: Navigate to Debenhams delivery page>Click and Collect>Validate text in store field and search stores

@manual @DBMTE-613
Scenario: Navigate to Debenhams delivery page>Click and Collect>Validate top 5 nearest stores and view details

@manual @DBMTE-613
Scenario: Navigate to Debenhams delivery page>Click and Collect>Validate top 5 nearest stores and view details

@manual @DBMTE-613
Scenario: Navigate to Debenhams delivery page>Click and Collect>Validate previously choosen stores>Recent stores option should display
  And I should see recent stores & new search side by side for a registered user

@manual @DBMTE-613
Scenario: Navigate to Debenhams delivery page>Click and Collect>Validate View details section
  And I should see map on store details
  And I should see store details in a drawer

@manual @DBMTE-630
Scenario: Validate Delivery - Standard delivery > New address field (DOTIE)
  Given  AS A customer i want to enter a delivery address SO THAT my purchase can be sent there
  Then I Validate ROI auto-populated as default country in drop down
  Then I Validate ROI address format e.g. 'eircode' field instead of postcode 
  Then I Validate Eircode is not mandatory
  Then I Validate No QAS postcode look up
  Then I Validate NO BFPO link

@manual @DBMTE-630
Scenario: Validate Delivery - Standard delivery > New address field (DOTIE) error Scenarios

@manual @DBMTE-629
Scenario: Validate Delivery - Standard delivery > New address field > next day 

@manual @DBMTE-629
Scenario: Validate Delivery - Standard delivery > New address field > C&C

@manual @DBMTE-629
Scenario: Validate Delivery - Standard delivery > New address field > error scenarios
