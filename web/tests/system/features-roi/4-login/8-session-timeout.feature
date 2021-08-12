Feature: Test We've logged you out page

@manual @DDAI-174
Scenario Outline: Navigate to Debenhams home page and validate the page after session timeout
  Given I navigate to login page
  When I login with user name and password
  Then I leave system ideal for 30 minutes for session time out
  Then I referesh the page or try to move on some other page
  Then i should see "We've logged you out page" with sign in link.
  Then i click on sign in link
  Then i navigate to login page.

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@manual @DDAI-174
Scenario Outline: Navigate to Debenhams saved Item page and validate the page after session timeout
  Given I navigate to saved item page as login user
  And I leave system ideal for 30 minutes for session time out
  Then I referesh the page or try to move on some other page
  Then i should see "We've logged you out page" with sign in link.
  Then i click on sign in link
  Then i navigate to login page.

  Examples:
    | email                      |
    | testautomationd2@gmail.com |
