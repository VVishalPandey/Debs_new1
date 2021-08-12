Feature: Test Debenhams hygiene page for generic 400 error page



@manual @DEBD-914
Scenario: Validate 402  abd gateway error page
 Given I am on desktop, mobile & tablet
 When I get 402 Bad Request Error
 And I should see the same generic error page as with 50X error 
 And header and footer functionality should work as per the expected behavior in 400 generic error page




 


 
 




