Feature: Test We've logged you out page

@manual @DDAI-174
Scenario Outline: Navigate to Debenhams home page and validate the page after session timeout
  Given I am on Australia Home Page
  When I navigate to login page
  And I login with user name and password
  Then I leave system ideal for 30 minutes for session time out
  Then I referesh the page or try to move on some other page
  Then i should see "We've logged you out page" with sign in link.
  Then i click on sign in link
  Then i navigate to login page.

  Examples:
    | email                 |
    | er.sachin.p@gmail.com |

@manual @DDAI-174
Scenario Outline: Navigate to Debenhams saved Item page and validate the page after session timeout
  Given I am on Australia Home Page
  When I navigate to login page
  And I login with user name and password
  And I leave system ideal for 30 minutes for session time out
  Then I referesh the page or try to move on some other page
  Then i should see "We've logged you out page" with sign in link.
  Then i click on sign in link
  Then i navigate to login page.

  Examples:
    | email                 |
    | er.sachin.p@gmail.com |

@manual @DDAI-174
Scenario Outline: Navigate to Debenhams home page and validate the page after session timeout
  Given I am on France Home Page
  When I navigate to login page
  And I login with user name and password
  Then I leave system ideal for 30 minutes for session time out
  Then I referesh the page or try to move on some other page
  Then i should see "We've logged you out page" with sign in link.
  Then i click on sign in link
  Then i navigate to login page.

  Examples:
    | email                 |
    | er.sachin.p@gmail.com |

@manual @DDAI-174
Scenario Outline: Navigate to Debenhams saved Item page and validate the page after session timeout
  Given I am on France Home Page
  When I navigate to login page
  And I login with user name and password
  And I leave system ideal for 30 minutes for session time out
  Then I referesh the page or try to move on some other page
  Then i should see "We've logged you out page" with sign in link.
  Then i click on sign in link
  Then i navigate to login page.

  Examples:
    | email                 |
    | er.sachin.p@gmail.com |

@manual @DDAI-174
Scenario Outline: Navigate to Debenhams home page and validate the page after session timeout
  Given I am on US Home Page
  When I navigate to login page
  And I login with user name and password
  Then I leave system ideal for 30 minutes for session time out
  Then I referesh the page or try to move on some other page
  Then i should see "We've logged you out page" with sign in link.
  Then i click on sign in link
  Then i navigate to login page.

  Examples:
    | email                 |
    | er.sachin.p@gmail.com |

@manual @DDAI-174
Scenario Outline: Navigate to Debenhams saved Item page and validate the page after session timeout
  Given I am on US Home Page
  When I navigate to login page
  And I login with user name and password
  And I leave system ideal for 30 minutes for session time out
  Then I referesh the page or try to move on some other page
  Then i should see "We've logged you out page" with sign in link.
  Then i click on sign in link
  Then i navigate to login page.

  Examples:
    | email                 |
    | er.sachin.p@gmail.com |
