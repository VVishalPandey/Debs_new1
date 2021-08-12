Feature: Validate Session timeout on Payment Page

@manual @DDAI-424
Scenario: Navigate to Debenhams Debenhams payment page and validate the page after session timeout
  Given I am on Debenhams Home Page
  When I navigate to login page
  And I login with user name and password
  And I navigate to payment page
  And I leave system ideal for 30 minutes for session time out
  Then I referesh the page
  Then I should see "Welcome back" page
  Then i entered username and password
  And I click on sign in link
  Then I navigate to payment page 

@manual @DDAI-424
Scenario: Navigate to Debenhams Debenhams payment page and validate the page after session timeout
  Given I am on Debenhams Home Page
  When I navigate to login page
  And I login with user name and password
  And I navigate to payment page
  And I leave system ideal for 30 minutes for session time out
  Then I should try to add a new credit card
  Then I should see "Welcome back" page
  Then i entered username and password
  And I click on sign in link
  Then I navigate to payment page 

@manual @DDAI-424
Scenario: Navigate to Debenhams Debenhams payment page and validate the page after session timeout
  Given I am on Debenhams Home Page
  When I navigate to login page
  And I login with user name and password
  And I navigate to payment page
  And I leave system ideal for 30 minutes for session time out
  Then I should try to pay with old credit card
  Then I should see "Welcome back" page
  Then i entered username and password
  And I click on sign in link
  Then I navigate to payment page 

@manual @DDAI-424
Scenario: Navigate to Debenhams Debenhams payment page and validate the page after session timeout
  Given I am on Debenhams Home Page
  When I navigate to login page
  And I login with user name and password
  And I navigate to payment page
  And I leave system ideal for 30 minutes for session time out
  Then I should try to apply promotion code
  Then I should see "Welcome back" page
  Then i entered username and password
  And I click on sign in link
  Then I navigate to payment page 

@manual @DDAI-424
Scenario: Navigate to Debenhams Debenhams payment page and validate the page after session timeout
  Given I am on Debenhams Home Page
  When I navigate to login page
  And I login with user name and password
  And I navigate to payment page
  And I leave system ideal for 30 minutes for session time out
  Then I should try to add new billing address
  Then I should see "Welcome back" page
  Then i entered username and password
  And I click on sign in link
  Then I navigate to payment page 


@manual @DDAI-424
Scenario: Navigate to Debenhams Debenhams payment page and validate the page after session timeout
  Given I am on Debenhams Home Page
  When I navigate to login page
  And I login with user name and password
  And I navigate to payment page
  And I leave system ideal for 30 minutes for session time out
  Then I should try to pay with reward club card
  Then I should see "Welcome back" page
  Then i entered username and password
  And I click on sign in link
  Then I navigate to payment page 

@manual @DDAI-424
Scenario: Navigate to Debenhams payment page and validate the page after session timeout
  Given I am on Debenhams home Page
  When I navigate to login page
  And I login with user name and password
  And I navigate to payment page
  And I leave system ideal for 30 minutes for session time out
  Then I should try to pay with gift card
  Then I should see "Welcome back" page
  Then i entered username and password
  And I click on sign in link
  Then I navigate to payment page 

@manual @DDAI-424
Scenario: Navigate to Debenhams Debenhams payment page and validate the page after session timeout
  Given I am on Debenhams Home Page
  When I navigate to login page
  And I login with user name and password
  And I navigate to payment page
  And I leave system ideal for 30 minutes for session time out
  Then I should try to move back to delivery page
  Then I should see "Welcome back" page
  Then i entered username and password
  And I click on sign in link
  Then I navigate to payment page 

@manual @DDAI-424
Scenario: Navigate to Debenhams payment page and validate the page after session timeout
  Given I am on Debenhams Home Page
  When I navigate to payment page as guest user
  And I leave system ideal for 30 minutes for session time out
  Then I should try to pay with credit card or referesh the page
  Then I should not see session timeout screen and able to proceed further 

@manual @DDAI-791
Scenario: Validation of the Welcome Page when the user is partailly logged out on the Basket Page and on mobile and Tablet
  Given the user is logged in 
  And the user adds the products 
  And navigates to the basket page 
  When the user is inactive for 30min
  Then the user should be taken back to the "Welcome Back" page
  And the user should not be taken to the "we've logged out out page" Screen

@manual @DDAI-791
Scenario: Validation of the Email address on the Welcome Page when the user is partailly logged out and on mobile and Tablet
  Given the user is logged in 
  And the user adds the products 
  And navigates to the basket page 
  When the user is inactive for 30min
  Then the user should be taken back to the "Welcome Back" page
  And the Email address field on the page should not be prepopulated

@manual @DDAI-791
Scenario: Validation of the message on the Welcome Page when the user is partailly logged out and on mobile and Tablet
  Given the user is logged in 
  And the user adds the products 
  And navigates to the basket page 
  When the user is inactive for 30min
  Then the user should be taken back to the "Welcome Back" page
  And the THE MESSAGE on the screen should read, Welcome Back Please re-enter your email address and password to continue.

@manual @DDAI-791
Scenario: Validation of the Welcome Page when the user is partailly logged out on the Delivery Page and on mobile and Tablet
  Given the user is logged in 
  And the user adds the products to the basket page
  When the user is inactive for 30min
  And navigates to the Delivery Page
  Then the user should be taken back to the "Welcome Back" page
  And the user should not be taken to the "we've logged out out page" Screen

@manual @DDAI-791
Scenario: Validation of the Welcome Page when the user is partailly logged out on the Payment Page on clicking on the pay button of the card and on mobile and Tablet
  Given the user is logged in 
  And the user adds the products to the basket page
  And navigates to the Payment Page
  When the user is inactive for 30min
  And user clicks on the Pay button after entering the card details and security pin
  Then the user should be taken back to the "Welcome Back" page
  And the user should not be taken to the "we've logged out out page" Screen

@manual @DDAI-791
Scenario: Validation of the Welcome Page when the user is partailly logged out on the Payment Page and on mobile and Tablet
  Given the user is logged in 
  And the user adds the products to the basket page
  And navigates to the Payment Page
  When the user is inactive for 30min
  And the user clicks on the place order button
  Then the user should be taken back to the "Welcome Back" page
  And the user should not be taken to the "we've logged out out page" Screen

@manual @DDAI-791
Scenario: Validation of the Welcome Page when the user is partailly logged out on the Profile Account Page and on mobile and Tablet
  Given the user is logged in 
  And the user adds the products to the basket page
  And navigates to the Account Page
  When the user is inactive for 30min
  And the user navigates to the add address page
  Then the user should be taken back to the "Welcome Back" page
  And the user should not be taken to the "we've logged out out page" Screen
