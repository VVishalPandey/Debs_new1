Feature: Test Debenhams login page


@manual @DBMTE-348
Scenario: Verify that if a user logged in for UK navigated to any other country other than ROI ,user should remain logged In

@manual @DBMTE-348
Scenario: Verify that if a user logged in for any country other than ROI navigated to UK ,user should remain logged In

@manual @DBMTE-348
Scenario: Verify that if a user logged in for any country other than ROI navigated to ROI ,user should be logged out

@manual @DDAI-826
Scenario: Validation of the removal of the remember me checkbox on the login page when user navigates on the Main logon Page on mobile and Tablet
  Given the user is not logged in 
  When the user clicks on the Sign in from the left hand menu
  And the user navigates to the login  Page
  Then the user should not see the Remember Me Checkbox on the Login Page

@manual @DDAI-826
Scenario: Validation of the removal of the remember me checkbox on the Checkout Login page on mobile and Tablet
  Given the user is not logged in 
  And the user adds the products to the basket
  When the user clicks on the proceed to checkout button
  And user navigates to the Checkout Login Page
  Then the user should not see the Remember Me Checkbox 

@manual @DDAI-826
Scenario: Validation of the removal of the remember me checkbox on the save for later page on mobile and Tablet
  Given the user is not logged in 
  When the user clicks on the save for later page from the left hand menu
  And the user navigates to the save for later with create Account screen Page
  Then the user should not see the Remember Me Checkbox 

@manual @DDAI-826
Scenario: Validation of the removal of the remember me checkbox on the Beauty club login page on mobile and Tablet
  Given the user is not logged in 
  When the user clicks on the Beauty Club page from the left hand menu
  And the user navigates to the Beauty club login page
  Then the user should not see the Remember Me Checkbox 
