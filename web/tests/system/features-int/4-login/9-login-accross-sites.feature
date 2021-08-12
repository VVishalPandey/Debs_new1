Feature: Test Debenhams Account details/login across stores


@manual @DDAI-327
Scenario Outline: Navigate to Debenhams home page as logged in user and validate if user switch country
  Given I navigate to "loginUrl"
  Then I logged in with correct user
  Then I switch Country as Australia from Country selector link
  Then i should see user as logged in

  Examples:
    | email                 | password |
    | er.sachin.p@gmail.com | Jan@2018 |

@manual @DDAI-327
Scenario Outline: Navigate to Debenhams home page as logged in user and validate if user switch country
  Given I am on Home page of Australia as logged in user
  Then I switch Country as France from Country selector link
  Then i should see user as logged in

  Examples:
    | email                 | password |
    | er.sachin.p@gmail.com | Jan@2018 |

@manual @DDAI-327
Scenario Outline: Navigate to Debenhams home page as logged in user and validate if user switch country
  Given I am on Home page of Australia as logged in user
  Then I switch country as Ireland from Country selector link
  Then I should see user as logged out user

  Examples:
    | email                 | password |
    | er.sachin.p@gmail.com | Jan@2018 |

@manual @DDAI-327
Scenario Outline: Navigate to Debenhams home page as logged in user and validate if user switch country
  Given I am on Home page of Australia as logged in user
  Then I switch country as Ireland from Country selector link
  Then I should see user as logged out user
  Then I switch country as Australia
  Then I should see user as logged in user

  Examples:
    | email                 | password |
    | er.sachin.p@gmail.com | Jan@2018 |
