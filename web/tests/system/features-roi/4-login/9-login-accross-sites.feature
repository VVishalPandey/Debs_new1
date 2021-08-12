Feature: Test Debenhams Account details/login across stores

@manual @DDAI-327
Scenario Outline: Navigate to Debenhams home page as logged in user and validate if user switch country
  Given I am on Home page of Ireland as logged in user
  Then I switch country as Australia from Country selector link
  Then I should see user as logged out user
  Then I switch country as Ireland
  Then I should see user as logged in user

  Examples:
    | email           | password  |
    | user1@gmail.com | password1 |

@manual @DDAI-327
Scenario Outline: Navigate to Debenhams home page as logged in user and validate if user switch country
  Given I am on Home page of Ireland as logged in user
  Then I switch country as Australia from Country selector link
  Then I should see user as logged out user
  Then I logged in to the site
  Then I switch country as Ireland from Country selector link
  Then I should see user as logged in user

  Examples:
    | email           | password  |
    | user1@gmail.com | password1 |
