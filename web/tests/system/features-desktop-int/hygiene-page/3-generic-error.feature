Feature: Test Debenhams hygiene page for generic 400 error page


@manual @DEBD-914
Scenario: Validate generic error page on the payment page
 Given I am on paymnet page
 And I cleared the cookies of browser
 And I get a response status of 500 error from IBM
 Then I see a generic error page

@manual @DEBD-914
Scenario: Validate components and functionality of generic error page 
 When I am on a generic error page
 And I should see "headerText" as "Oh no, something went wrong" on "genericErrorPage"
 And I should see "copyText" contains "To continue browsing and shopping" on "genericErrorPage"
 And I should see "copyBoldText" as "Thankyou for your patience" on "genericErrorPage"
 And I should see "continueShoppingButton" exist on "genericErrorPage"
 And I click on "continueShoppingButton"
 And I navigate to "dressPspUrl"
 And I should see products and images 
 And I should see no error


@manual @DEBD-914
Scenario: Validate user is able to navigate to paymnet page again without any error 
 When I am on a generic error page
 And I click on "continueShoppingButton"
 And I click on "signIn"
 And I should be redirected to Partial Login page
 And I should be able to Sign in and navigate to Paymnet page
 And I should be able to place order successfully

@manual @DEBD-914
Scenario: Validate UI of 50x error in generic homepage


@manual @DEBD-1025
Scenario: Validate header and footer functionality should work as per the expected behavior in 400 generic error page


 


 
 




