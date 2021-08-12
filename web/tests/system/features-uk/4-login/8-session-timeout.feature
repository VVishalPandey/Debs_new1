Feature: Test We've logged you out page

@manual @DBNHST-1181
Scenario: Navigate to Debenhams home page and validate the page after session timeout
  Given I am on Australia Home Page
  When I navigate to login page
  And I login with user name and password
  Then I leave system ideal for 30 minutes for session time out
  Then I referesh the page or try to move on some other page
  Then i should see "We've logged you out page" with sign in link.
  Then i click on sign in link
  Then i navigate to login page